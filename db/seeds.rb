# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do

    @first_name = Faker::Name.first_name
    @last_name = Faker::Name.last_name
    @dob = Faker::Date
    @email_address = Faker::Internet
    @account_number = Faker::Number.number(10)
    @drivers_license_number = Faker::Number.number(11)
    @date_of_death = Faker::Date
    @gender = "female"
    @ethnicity = Faker::StarWars.specie
    @address = "400 NW 26th st."
    @primary_provider_id = "123456789"
    @phones = Faker::PhoneNumber.phone_number
    @insurance_profiles = "United Healthcare"

    patient = Patient.create(first_name: @first_name, last_name: @last_name, dob: @dob, email_address: @email_address, account_number: @account_number, drivers_license_number: @drivers_license_number, date_of_death: @date_of_death, gender: @gender, ethnicity: @ethnicity, address: @address, primary_provider_id: @primary_provider_id, phones: @phones, insurance_profiles: @insurance_profiles)
    patient.save!
end
