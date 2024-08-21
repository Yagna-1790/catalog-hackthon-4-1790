require 'securerandom'

# Updated user data
users = {
  "Yagna" => {
    password: "Password@123",
    security_question: "What is your pet's name?",
    security_answer: "TOFU",
    email: "msingh2@gitam.in"
  }
}

# Function to check Level 1 - Basic Password Check
def level1_password_check(username, password, users)
  if users[username] && users[username][:password] == password
    puts "Level 1 Passed: Password is correct!"
    true
  else
    puts "Level 1 Failed: Incorrect password."
    false
  end
end

# Function to check Level 2 - Security Question
def level2_security_question(username, answer, users)
  if users[username] && users[username][:security_answer].downcase == answer.downcase
    puts "Level 2 Passed: Security question answered correctly!"
    true
  else
    puts "Level 2 Failed: Incorrect answer to the security question."
    false
  end
end

# Function to generate and verify Level 3 - OTP
def level3_otp_verification
  otp = SecureRandom.random_number(100000..999999).to_s
  puts "OTP has been sent: #{otp} (For demonstration purposes, we're displaying it)"
  
  print "Enter the OTP: "
  entered_otp = gets.chomp

  if otp == entered_otp
    puts "Level 3 Passed: OTP verified!"
    true
  else
    puts "Level 3 Failed: Incorrect OTP."
    false
  end
end

# Main authentication flow
print "Enter your username: "
username = gets.chomp

print "Enter your password: "
password = gets.chomp

if level1_password_check(username, password, users)
  print users[username][:security_question] + " "
  answer = gets.chomp
  
  if level2_security_question(username, answer, users)
    level3_otp_verification
  end
end
