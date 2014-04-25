# TODO: Fixing seeds
# I always use transactions for seeds because if something goes wrong nothing is created
# I also never use fixed ids because they will be diferent if you run a reset instead of dropping the database.

ActiveRecord::Base.transaction do
  Exercise.destroy_all
  Client.destroy_all
  Gym.destroy_all

  # golds_gym = Gym.create!(email: "admin@goldsgym.com", password: "12345678", location: "Venice Beach")

  # puts "Creating clients"
  # Client.create!(gym: golds_gym, first_name: "Zach", last_name: "Zuber", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Harsha", last_name: "Murthy", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Neal", last_name: "Sales-Griffin", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Mike", last_name: "Mcgee", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Jason", last_name: "Fried", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Kobe", last_name: "Bryant", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Rondonumbanine", last_name: "Savage", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Bill", last_name: "Mallers", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Lil", last_name: "Herb", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Lil", last_name: "Bibby", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Richard", last_name: "D", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Mark", last_name: "Something", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Bobby", last_name: "Fischer", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Troy", last_name: "Henikoff", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Michael", last_name: "Jordan", email: "example@example.com", machine_code: 474093)
  # Client.create!(gym: golds_gym, first_name: "Lil", last_name: "Durk", email: "example@example.com", machine_code: 474093)

  # puts "Creating exercises"
  # Exercise.create!( name: "Triceps", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, gym_ids: [golds_gym.id] , category: "Arms")
  # Exercise.create!( name: "Precore Pull Over", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, gym_ids: [golds_gym.id] , category: "Shoulders")
  # Exercise.create!( name: "Biceps", weight: true, percentage: false, reps: true, time: true, seat: true, foot: false, foot_stool: true, degrees: false, back: false, pin: true, gym_ids: [golds_gym.id] , category: "Arms")
  # Exercise.create!( name: "Arm Cross", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, pin: true, arm: true, gym_ids: [golds_gym.id] , category: "Chest")
  # Exercise.create!( name: "Overhead Press", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, backpad: true, gym_ids: [golds_gym.id] , category: "Shoulders")
  # Exercise.create!( name: "Narrow Grip Pulldown", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, seatbelt: true, gym_ids: [golds_gym.id] , category: "Back")
  # Exercise.create!( name: "Leg Curl", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, seatbelt: true, leg: true, gym_ids: [golds_gym.id] , category: "Legs")
  # Exercise.create!( name: "Leg Extension", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, seatbelt: true, leg: true, gym_ids: [golds_gym.id] , category: "Legs")
  # Exercise.create!( name: "Leg Press", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, gym_ids: [golds_gym.id] , category: "Legs")
  # Exercise.create!( name: "Neck Extension", weight: true, percentage: false, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, gym_ids: [golds_gym.id] , category: "Other")
  # Exercise.create!( name: "Abs", weight: true, percentage: false, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, foot_stool: true, gym_ids: [golds_gym.id] , category: "Abs")
  # Exercise.create!( name: "Lower Back", weight: true, percentage: false, reps: true, time: true, seat: false, foot: true, degrees: false, back: true, knee: true, seatbelt: true, gym_ids: [golds_gym.id] , category: "Back")
  # Exercise.create!( name: "Rotations", weight: true, percentage: false, reps: true, time: true, seat: false, foot: true, degrees: false, back: true, gym_ids: [golds_gym.id] , category:"Abs")
  # Exercise.create!( name: "Rowing Torso", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, seatpad: true, chestpad: true, gym_ids: [golds_gym.id] , category: "Back")
  # Exercise.create!( name: "Adduction", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, hips: true, gym_ids: [golds_gym.id] , category: "Legs")
  # Exercise.create!( name: "Abduction", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, gym_ids: [golds_gym.id] , category: "Legs")
  # Exercise.create!( name: "Power Tower Abs", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: true, back: false, gym_ids: [golds_gym.id] , category: "Abs")
  # Exercise.create!( name: "Power Tower Leg Press", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: true, back: false, gym_ids: [golds_gym.id] , category: "Legs")
  # Exercise.create!( name: "Ab Core", weight: true, percentage: false, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, gym_ids: [golds_gym.id] , category: "Abs")

# # Wilmette
puts "Creating Wilmette Exercise Coach location"
wilmette_exercise_coach = Gym.create!(email: "admin@exercisecoach.com", password: "12345678", location: "Wilmette")

puts "Creating clients"
Client.create!(gym: wilmette_exercise_coach, first_name: "Harsha", last_name: "Murthy", email: "harsha@example.com", machine_code: 72893)
Client.create!(gym: wilmette_exercise_coach, first_name: "Dave", last_name: "Mauro", email: "dave@example.com", machine_code: 123456)

puts "Creating exercises"
# Legs
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Leg Extension", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, foot_stool: false, pin: false, arm: false, seatbelt: true, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: true, category: "Legs")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Leg Curl", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, foot_stool: false, pin: false, arm: false, seatbelt: true, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: true, category: "Legs")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Leg Press", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Legs")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Abduction", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Legs")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Adduction", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: true, leg: false, category: "Legs")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Power Tower Squat", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: true, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Legs")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Power Tower Static Squat", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: true, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Legs")

# Chest
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Chest Press", weight: false, percentage: true, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Chest")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Narrow Grip Chest Press", weight: false, percentage: true, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Chest")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Tuffstuff Chest Fly", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: true, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Chest")

# Back
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Narrow Grip Row", weight: false, percentage: true, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Wide Grip Row", weight: false, percentage: true, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Narrow Grip Pulldown", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: true, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Wide Grip Pulldown", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: true, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Power Tower Pullover", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Power Tower Pullup", weight: false, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Lower Back", weight: true, percentage: false, reps: true, time: true, seat: true, foot: true, degrees: false, back: true, foot_stool: false, pin: false, arm: false, seatbelt: true, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Tuffstuff Back Fly", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: true, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Tuffstuff Pullover", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: true, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")

# Shoulders
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Overhead Press", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: true, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Shoulders")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Narrow Grip Overhead Press", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: true, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Shoulders")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Tuffstuff Shrug", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: true, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Shoulders")

# Abs
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Abs", weight: true, percentage: false, reps: true, time: true, seat: true, foot: true, degrees: false, back: true, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Abs")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Power Tower Torso Flexion", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: true, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Abs")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Tuffstuff Rotation", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: true, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Abs")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Tuffstuff Side Bend", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: true, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Abs")

# Arms
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Biceps", weight: true, percentage: false, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, foot_stool: true, pin: true, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Arms")
Exercise.create!(gym_ids: [wilmette_exercise_coach.id], name: "Triceps", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Arms")
end
