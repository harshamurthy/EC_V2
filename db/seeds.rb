# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Exercise.destroy_all
Client.destroy_all

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


