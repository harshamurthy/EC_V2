# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Exercise.destroy_all
Client.destroy_all

# Test Gym
Client.create(gym_id: 1, first_name: "Zach", last_name: "Zuber", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Harsha", last_name: "Murthy", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Neal", last_name: "Sales-Griffin", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Mike", last_name: "Mcgee", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Jason", last_name: "Fried", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Kobe", last_name: "Bryant", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Rondonumbanine", last_name: "Savage", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Bill", last_name: "Mallers", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Lil", last_name: "Herb", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Lil", last_name: "Bibby", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Richard", last_name: "D", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Mark", last_name: "Something", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Bobby", last_name: "Fischer", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Troy", last_name: "Henikoff", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Michael", last_name: "Jordan", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Lil", last_name: "Durk", email: "example@example.com", machine_code: 474093)

Exercise.create( name: "Triceps", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, gym_ids: [1], category: "Arms")
Exercise.create( name: "Precore Pull Over", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, gym_ids: [1], category: "Shoulders")
Exercise.create( name: "Biceps", weight: true, percentage: false, reps: true, time: true, seat: true, foot: false, foot_stool: true, degrees: false, back: false, pin: true, gym_ids: [1], category: "Arms")
Exercise.create( name: "Arm Cross", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, pin: true, arm: true, gym_ids: [1], category: "Chest")
Exercise.create( name: "Overhead Press", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, backpad: true, gym_ids: [1], category: "Shoulders")
Exercise.create( name: "Narrow Grip Pulldown", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, seatbelt: true, gym_ids: [1], category: "Back")
Exercise.create( name: "Leg Curl", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, seatbelt: true, leg: true, gym_ids: [1], category: "Legs")
Exercise.create( name: "Leg Extension", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, seatbelt: true, leg: true, gym_ids: [1], category: "Legs")
Exercise.create( name: "Leg Press", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, gym_ids: [1], category: "Legs")
Exercise.create( name: "Neck Extension", weight: true, percentage: false, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, gym_ids: [1], category: "Other")
Exercise.create( name: "Abs", weight: true, percentage: false, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, foot_stool: true, gym_ids: [1], category: "Abs")
Exercise.create( name: "Lower Back", weight: true, percentage: false, reps: true, time: true, seat: false, foot: true, degrees: false, back: true, knee: true, seatbelt: true, gym_ids: [1], category: "Back")
Exercise.create( name: "Rotations", weight: true, percentage: false, reps: true, time: true, seat: false, foot: true, degrees: false, back: true, gym_ids: [1], category:"Abs")
Exercise.create( name: "Rowing Torso", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, seatpad: true, chestpad: true, gym_ids: [1], category: "Back")
Exercise.create( name: "Adduction", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, hips: true, gym_ids: [1], category: "Legs")
Exercise.create( name: "Abduction", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, gym_ids: [1], category: "Legs")
Exercise.create( name: "Power Tower Abs", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: true, back: false, gym_ids: [1], category: "Abs")
Exercise.create( name: "Power Tower Leg Press", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: true, back: false, gym_ids: [1], category: "Legs")
Exercise.create( name: "Ab Core", weight: true, percentage: false, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, gym_ids: [1], category: "Abs")

# Wilmette
Client.create(gym_id: 5, first_name: "Harsha", last_name: "Murthy", email: "harsha@example.com", machine_code: 72893)
Client.create(gym_id: 5, first_name: "Dave", last_name: "Mauro", email: "dave@example.com", machine_code: 123456)

# Legs
Exercise.create(gym_ids: [5], name: "Leg Extension", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, foot_stool: false, pin: false, arm: false, seatbelt: true, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: true, category: "Legs")
Exercise.create(gym_ids: [5], name: "Leg Curl", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, foot_stool: false, pin: false, arm: false, seatbelt: true, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: true, category: "Legs")
Exercise.create(gym_ids: [5], name: "Leg Press", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Legs")
Exercise.create(gym_ids: [5], name: "Abduction", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Legs")
Exercise.create(gym_ids: [5], name: "Adduction", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: true, leg: false, category: "Legs")
Exercise.create(gym_ids: [5], name: "Power Tower Squat", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: true, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Legs")
Exercise.create(gym_ids: [5], name: "Power Tower Static Squat", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: true, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Legs")

# Chest
Exercise.create(gym_ids: [5], name: "Chest Press", weight: false, percentage: true, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Chest")
Exercise.create(gym_ids: [5], name: "Narrow Grip Chest Press", weight: false, percentage: true, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Chest")
Exercise.create(gym_ids: [5], name: "Tuffstuff Chest Fly", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: true, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Chest")

# Back
Exercise.create(gym_ids: [5], name: "Narrow Grip Row", weight: false, percentage: true, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create(gym_ids: [5], name: "Wide Grip Row", weight: false, percentage: true, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create(gym_ids: [5], name: "Narrow Grip Pulldown", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: true, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create(gym_ids: [5], name: "Wide Grip Pulldown", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: true, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create(gym_ids: [5], name: "Power Tower Pullover", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create(gym_ids: [5], name: "Power Tower Pullup", weight: false, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create(gym_ids: [5], name: "Lower Back", weight: true, percentage: false, reps: true, time: true, seat: true, foot: true, degrees: false, back: true, foot_stool: false, pin: false, arm: false, seatbelt: true, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create(gym_ids: [5], name: "Tuffstuff Back Fly", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: true, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")
Exercise.create(gym_ids: [5], name: "Tuffstuff Pullover", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: true, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Back")

# Shoulders
Exercise.create(gym_ids: [5], name: "Overhead Press", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: true, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Shoulders")
Exercise.create(gym_ids: [5], name: "Narrow Grip Overhead Press", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: true, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Shoulders")
Exercise.create(gym_ids: [5], name: "Tuffstuff Shrug", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: true, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Shoulders")

# Abs
Exercise.create(gym_ids: [5], name: "Abs", weight: true, percentage: false, reps: true, time: true, seat: true, foot: true, degrees: false, back: true, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Abs")
Exercise.create(gym_ids: [5], name: "Power Tower Torso Flexion", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: true, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Abs")
Exercise.create(gym_ids: [5], name: "Tuffstuff Rotation", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: true, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Abs")
Exercise.create(gym_ids: [5], name: "Tuffstuff Side Bend", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: true, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Abs")

# Arms
Exercise.create(gym_ids: [5], name: "Biceps", weight: true, percentage: false, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, foot_stool: true, pin: true, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Arms")
Exercise.create(gym_ids: [5], name: "Triceps", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, foot_stool: false, pin: false, arm: false, seatbelt: false, backpad: false, knee: false, seatpad: false, chestpad: false, hips: false, leg: false, category: "Arms")
