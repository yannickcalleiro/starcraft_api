# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.create(name: "Franco Viola") #ID 3
Player.create(name: "Andrew Ettinger") #ID 4
Player.create(name: "Fabiano") #ID 5
Player.create(name: "Edward") #ID 6

Match.create(winner_faction: "Zerg", loser_faction: "Terrans", winner_id: 2, loser_id: 6, duration: 4, date: Date.new)
Match.create(winner_faction: "Terrans", loser_faction: "Zerg", winner_id: 6, loser_id: 3, duration: 7, date: Date.new)
Match.create(winner_faction: "Zerg", loser_faction: "Protoss", winner_id: 6, loser_id: 4, duration: 3, date: Date.new)
Match.create(winner_faction: "Protoss", loser_faction: "Zerg", winner_id: 3, loser_id: 5, duration: 8, date: Date.new)
Match.create(winner_faction: "Zerg", loser_faction: "Terrans", winner_id: 4, loser_id: 3, duration: 6, date: Date.new)
