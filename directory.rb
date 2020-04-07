@students = []

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
@students.each_with_index do |student, index|
  indexplusone = index + 1
  puts "#{indexplusone} #{student[:name]} (#{student[:cohort]} cohort)"
end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu
#save_students

#
# def print(students)
#   count = 0
#   until students.length == count.length
#     students.each do |student|
#     puts "#{student[:name]}"
#     count +=1
#   end
# end
# end
# count = 0
# while !students.empty? do
#   students.each do |student|
#   puts "#{student[:name]}"
# count +=1
# break if students.length == count.to_i.length
# end
# end
# end

# students.select do |student|
# # ##only print the students whose name is shorter than 12 characters.
#   puts "#{student[:name]}" if student[:name].length < 12
# end
# end

##print the students whose name begins with a specific letter.
#   puts "#{student[:name]}" if student[:name].start_with?("T")
# end





# students = input_students
# print_header
# print(students)
# print_footer(students)
