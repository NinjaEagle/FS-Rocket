# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
Alert.destroy_all
Contact.destroy_all

alerts = JSON.parse(File.read('db/alerts.json'))
contacts = JSON.parse(File.read('db/contacts.json'))

alerts.each do |alert|
  Alert.create(alert)
end

contacts.each do |contact|
  Contact.create(contact)
end
