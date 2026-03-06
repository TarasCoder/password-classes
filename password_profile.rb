class Profile
  attr_accessor :password
  def initialize(user, password)
    @user = user
    @password = password
  end
end

class Secure_Profile < Profile
  def initialize(name, password)
    @attempts = 0
    @max_attempts = 3
    super(name, password)
  end
  def password
    p "This is secret information!!!"
  end
  def reset_counter
    num1 = rand(10)
    num2 = rand(10)
    sum = num1 + num2
    print "To reset counter solve this quiz: #{num1} + #{num2} = "
    if sum == gets.chomp.to_i
      @attempts = 0
      puts "The counter is set to 0 again."
    else
      puts "Wrong! Counter is not reset!"
    end
  end
  def password=(new_password)
    while (@attempts < @max_attempts)
      print "Enter your old password: "
      oldPassword = gets.chomp
      if (oldPassword == @password)
          @password = new_password
          puts "Correct! The password was changed to '#{new_password}'"
          @attempts = 0
          return
        else
          @attempts += 1
          puts "Wrong password! You used #{@attempts} from #{@max_attempts}"
      end
    end

    print "Do you want to reset counter?(y/n) "
    if gets.chomp == "y"
      reset_counter
    else
      puts "No problems, the password is the same!"
    end

  end
end