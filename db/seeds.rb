# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Exercise.create( name: "Triceps", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false)
Exercise.create( name: "Precore Pull Over", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false)
Exercise.create( name: "Biceps", weight: true, percentage: false, reps: true, time: true, seat: true, foot: false, foot_stool: true, degrees: false, back: false, pin: true)
Exercise.create( name: "Arm Cross", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, pin: true, arm: true)
Exercise.create( name: "Overhead Press", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, backpad: true)
Exercise.create( name: "Narrow Grip Pulldown", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, seatbelt: true)
Exercise.create( name: "Leg Curl", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, seatbelt: true, leg: true)
Exercise.create( name: "Leg Extension", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, seatbelt: true, leg: true)
Exercise.create( name: "Leg Press", weight: false, percentage: true, reps: true, time: true, seat: false, foot: false, degrees: false, back: false)
Exercise.create( name: "Neck Extension", weight: true, percentage: false, reps: true, time: true, seat: true, foot: false, degrees: false, back: false)
Exercise.create( name: "Abs", weight: true, percentage: false, reps: true, time: true, seat: true, foot: false, degrees: false, back: false, foot_stool: true)
Exercise.create( name: "Lower Back", weight: true, percentage: false, reps: true, time: true, seat: false, foot: true, degrees: false, back: true, knee: true, seatbelt: true)
Exercise.create( name: "Rotations", weight: true, percentage: false, reps: true, time: true, seat: false, foot: true, degrees: false, back: true)
Exercise.create( name: "Rowing Torso", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: false, seatpad: true, chestpad: true)
Exercise.create( name: "Adduction", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: true, hips: true)
Exercise.create( name: "Abduction", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: false, back: true)
Exercise.create( name: "Power Tower Abs", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: true, back: false)
Exercise.create( name: "Power Tower Leg Press", weight: true, percentage: false, reps: true, time: true, seat: false, foot: false, degrees: true, back: false)
Exercise.create( name: "Ab Core", weight: true, percentage: false, reps: true, time: true, seat: true, foot: false, degrees: false, back: false)


Client.create(gym_id: 1, first_name: "Zach", last_name: "Zuber", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Harsha", last_name: "Murthy", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Neal", last_name: "Sales-Griffin", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Mike", last_name: "Mcgee", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Jason", last_name: "Fried", email: "example@example.com", machine_code: 474093)
Client.create(gym_id: 1, first_name: "Kobe", last_name: "Bryant", email: "example@example.com", machine_code: 474093)


