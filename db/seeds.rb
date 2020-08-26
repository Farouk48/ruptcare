# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#pundit avec admin à rajouter dans la seed si necessaire admin:true or false
require 'csv'




User.destroy_all
PatientDrug.destroy_all
Patient.destroy_all
Stock.destroy_all
Pharma.destroy_all
User.destroy_all
Drug.destroy_all
Doctor.destroy_all

pharma_1 = Pharma.create!(name:"Pharmacie du 20ème", address:"144 Boulevard de Ménilmontant", city:"75020 Paris")
pharma_2 = Pharma.create!(name:"Pharmacie Oberkampf", address:"58 Rue Neuve Popincourt", city:"75011 Paris")
pharma_3 = Pharma.create!(name:"Pharmacie Des 3 Fleurs", address:"65 Rue Jean-Pierre Timbaud", city:"75011 Paris")
pharma_4 = Pharma.create!(name:"Pharmacie du Monde", address:"38 Avenue Parmentier", city:"75011 Paris")



# puts "#{Pharma.all}"


# user_1 = User.create!(full_name: "RAHMANI Farouk", rpps_number: "10101992104", email:"farouk@gmail.com", password: "123456", pharma: pharma_1)

# puts "#{User.all}"


puts "#{Drug.all}"



filepath = File.join(Rails.root, 'db/drugs.csv')
 csv_options = {
 	col_sep: ',',
 	quote_char: '"'
 }
 CSV.foreach(filepath, csv_options) do |row|
 if row[4] == 'Commercialisée'
  drug = Drug.create!(name: row[1], galenic: row[2], administration: row[3], commercialisation: row[4], drugs_class: row[5], family: row[6], action: row[7], posology: row[8], recommandations: row[9], availability: row[10] )
  puts "#{drug.name} created"
  end
end




stock_1 = Stock.create!(quantity: 0, pharma: pharma_1 , drug: Drug.all.sample)
stock_2 = Stock.create!(quantity: 14, pharma: pharma_1 , drug: Drug.all.sample)
stock_3 = Stock.create!(quantity: 20, pharma: pharma_1 , drug: Drug.all.sample)
stock_4 = Stock.create!(quantity: 2, pharma: pharma_1 , drug: Drug.all.sample)
stock_5 = Stock.create!(quantity: 6, pharma: pharma_1 , drug: Drug.all.sample)
stock_6 = Stock.create!(quantity: 10, pharma: pharma_1 , drug: Drug.all.sample)



puts "#{Stock.all}"

doctor_1 = Doctor.create!(full_name: "BOLTA Victor", rpps_number:"10004000856" , speciality: "Psychiatre")
doctor_2 = Doctor.create!(full_name: "TAIRI Walid", rpps_number:"10003231205" , speciality: "Généraliste")

puts "#{Doctor.all}"


patient_1 = Patient.create!(first_name: "Véronique", last_name: "DUBOIS" ,address: " 16 rue de Gaudelet" , age: 37, city: " 75011 Paris", chronic_disease: "Dépression", doctor: doctor_1, pharma: pharma_1)
patient_2 = Patient.create!(first_name: "Victor", last_name: "BERGEAUD" ,address: "11 rue Vaucouleurs" , age: 28, city: "75011 Paris" , chronic_disease: "Aucune" , doctor: doctor_2, pharma: pharma_1)

puts "#{Patient.all}"



patient_drugs_1 = PatientDrug.create!(drug: Drug.all.sample, patient: patient_1 , disease:"Depression")


