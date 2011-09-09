class JackScript
  def initialize
    @ops = create_ops
    @tape = Array.new(1024,0)
    @tp = 0
    @code = []
    @cp = 0
  end

  def compile c
    c.gsub(/\s/, "").split("").each_slice(44) do |o|
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
      "All work and no play makes Jack a dull boy. " => -> { @tp = (@tp == @tape.size - 1 ? 0 : @tp + 1) },
      "All WORK and no PLAY makes Jack a DULL boy. " => -> { @tp = (@tp == 0 ? @tape.size - 1 : @tp - 1) },
      "ALL work and NO play makes Jack a dull boy. " => -> { @tape[@tp] += 1 },
      "ALL WORK and NO PLAY makes Jack a dull boy. " => -> { @tape[@tp] -= 1 },
      "All work AND no play MAKES Jack a dull boy. " => -> { print @tape[@tp].chr if @tape[@tp] },
      "ALL WORK AND NO PLAY makes Jack a dull boy. " => -> { get_input },
      "All work and no play MAKES JACK A DULL BOY. " => -> { jump_to_close if @tape[@tp] == 0 },
      "ALL WORK AND NO PLAY MAKES JACK A DULL BOY. " => -> { jump_to_open unless @tape[@tp] == 0 }
    }
  end

  def jump_to_close
    level = 1
    while @cp < @code.size
      @cp += 1
      if @code[@cp] == 'All work and no play MAKES JACK A DULL BOY. '
        level += 1
      elsif @code[@cp] == 'ALL WORK AND NO PLAY MAKES JACK A DULL BOY. '
        level -= 1
      end
      break if level == 0
    end
  end

  def jump_to_open
    level = 1
    while @cp >= 0
      @cp -= 1
      if @code[@cp] == 'ALL WORK AND NO PLAY MAKES JACK A DULL BOY. '
        level += 1
      elsif @code[@cp] == 'All work and no play MAKES JACK A DULL BOY. '
        level -= 1
      end
      break if level == 0
    end
  end
end
