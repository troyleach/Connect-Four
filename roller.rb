def roll_dice(n)
  @die = [n]
  @roll_total = 0
  n.times do |i|
    @die[i] = rand(6) + 1
  end

  puts ""
  
  n.times do |i|
    case @die[i]
    when 1
      print "|   | "
    when 2
      print "|*  | "
    when 3
      print "|*  | "
    when 4
      print "|* *| "
    when 5
      print "|* *| "
    when 6
      print "|* *| "
    end
  end

  puts

  n.times do |i|
    case @die[i]
    when 1
      print "| * | "
    when 2
      print "|   | "
    when 3
      print "| * | "
    when 4
      print "|   | "
    when 5
      print "| * | "
    when 6
      print "|* *| "
    end
  end

  puts

  n.times do |i|
    case @die[i]
    when 1
      print "|   | "
    when 2
      print "|  *| "
    when 3
      print "|  *| "
    when 4
      print "|* *| "
    when 5
      print "|* *| "
    when 6
      print "|* *| "
    end
  end

 n.times do |i|
  @face_value = @die[i]
 end
end



