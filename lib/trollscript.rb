class TrollScript
  def initialize
    @ops = create_ops
    @tape = Array.new(1024,0)
    @tp = 0
    @code = []
    @cp = 0
  end

  def compile c
    c.gsub(/\s/, "").split("").each_slice(3) do |o|
      o = o.join.downcase
      if @ops.has_key? o
        @code << o
      end
    end
    self
  end

  def run
    while @cp < @code.size
      run_op @code[@cp]
    end
    @cp = 0
  end

  private

  def run_op op
    @ops[op].call
    @cp += 1
  end

  def get_input
    @tape[@tp] = STDIN.gets.getbyte(0)
    @tape[@tp] = 0 unless @tape[@tp]
  end

  def create_ops
    {
      "All work and no play makes Jack a dull boy" => -> {},
      "ALL WORK AND NO PLAY MAKES JACK A DULL BOY" => -> { @tp = (@tp == @tape.size - 1 ? 0 : @tp + 1) },
      "alL worK anD nO plaY makeS jacK A dulL boY" => -> { @tp = (@tp == 0 ? @tape.size - 1 : @tp - 1) },
      "All Work And No Play Makes Jack A Dull Boy" => -> { @tape[@tp] += 1 },
      "Allworkandnoplaymakesjackadullboy" => -> { @tape[@tp] -= 1 },
      "ALl WORk ANd No PLAy MAKEs JACk a DULl BOy" => -> { print @tape[@tp].chr if @tape[@tp] },
      "Alll workk andd noo playy makess Jackk aa Dulll Boyy" => -> { get_input },
      "all work and no play makes jack a dull boy" => -> { jump_to_close if @tape[@tp] == 0 },
      "boy dull a jack makes play no and work all" => -> { jump_to_open unless @tape[@tp] == 0 },
      "AllWorkAndNoPlayMakesJackADullBoy" => -> {}
    }
  end

  def jump_to_close
    level = 1
    while @cp < @code.size
      @cp += 1
      if @code[@cp] == 'all work and no play makes jack a dull boy'
        level += 1
      elsif @code[@cp] == 'boy dull a jack makes play no and work all'
        level -= 1
      end
      break if level == 0
    end
  end

  def jump_to_open
    level = 1
    while @cp >= 0
      @cp -= 1
      if @code[@cp] == 'boy dull a jack makes play no and work all'
        level += 1
      elsif @code[@cp] == 'all work and no play makes jack a dull boy'
        level -= 1
      end
      break if level == 0
    end
  end
end
