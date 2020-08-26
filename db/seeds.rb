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



puts "#{Pharma.all}"


user_1 = User.create!(full_name: "RAHMANI Farouk", rpps_number: "10101992104", email:"farouk@gmail.com", password: "123456", pharma: pharma_1)

puts "#{User.all}"


drug_1 = Drug.create!(name:"Mirtazapine 15mg", drugs_class: "Anti-dépresseur", family:"Antagoniste α2 présynaptique d'action central", action:"antagoniste α2 présynaptique d’action centrale qui augmente la neurotransmission noradrénergique et sérotoninergique centrale", galenic: "comprimés", posology:"La dose journalière efficace est habituellement comprise entre 15 et 45 mg ; la dose de départ est de 15 ou 30 mg.", recommandations:"Les patients présentant une dépression doivent être traités pendant une période suffisante d’au moins 6 mois pour assurer la disparition complète des symptômes.
Il est recommandé d’arrêter le traitement par la mirtazapine progressivement afin d’éviter les symptômes de sevrage ", availibity: 1)
drug_2 = Drug.create!(name:"Fluoxétine 20mg", drugs_class: "Anti-dépresseur", family:"ISRS", action: "Inhibiteur séléctif de la recapture de la sérotonine", galenic: ["comprimés dispersibles sécables","gélules"], posology:"La posologie recommandée est de 20 mg/jour. Elle sera revue et adaptée si nécessaire au cours des 3 à 4 premières semaines du traitement et par la suite si cela est cliniquement justifié", recommandations:"Les adaptations posologiques seront faites avec prudence et de façon individuelle, afin de maintenir les patients à la dose minimale efficace", availibity: 1)
drug_3 = Drug.create!(name:"Paroxétine 20mg", drugs_class: "Anti-dépresseur", family:"ISRS", action:"Inhibiteur séléctif de la recapture de la sérotonine", galenic: "comprimés", posology:"La posologie recommandée est de 20 mg par jour", recommandations:"", availibity: 1)
drug_4 = Drug.create!(name:"Sertraline 25mg", drugs_class:"Anti-dépresseur", family:"ISRS", action:"Inhibiteur séléctif de la recapture de la sérotonine", galenic: "gélules", posology:"La dose efficace habituelle est de 50 mg/jour. La dose quotidienne peut être augmentée par tranches de 50 mg sur une période de plusieurs semaines. La dose maximale recommandée est de 200 mg/jour.", recommandations:"", availibity: 1)
drug_5 = Drug.create!(name:"Escitalopram 10mg", drugs_class:"Anti-dépresseur", family:"ISRS", action:"Inhibiteur séléctif de la recapture de la sérotonine", galenic: "comprimés", posology:"", recommandations:"", availibity: 1)
drug_6 = Drug.create!(name:"Venlafaxine 37,5 mg", drugs_class:"Anti-dépresseur", family:"IRSN", action:"Inhibiteur de la recapture de la sérotonine et de la noradrénaline", galenic: "comprimé", posology:"", recommandations:"", availibity: 1)

puts "#{Drug.all}"



filepath = File.join(Rails.root, 'db/drugs.csv')
 CSV.foreach(filepath) do |row|
 if :row[4] == "commercialisée"
   Drug.create!(name: :row[1], galenic: :row[2], administration: :row[3], commercialisation: :row[4], drugs_class: :row[5], family: :row[6], action: :row[7], posology: :row[8], recommandations: :row[9], availability: :row[10] )
 else

 end
end




stock_1 = Stock.create!(quantity: 0, pharma: pharma_1 , drug: drug_1)
stock_2 = Stock.create!(quantity: 14, pharma: pharma_1 , drug: drug_2)
stock_3 = Stock.create!(quantity: 20, pharma: pharma_1 , drug: drug_3)
stock_4 = Stock.create!(quantity: 2, pharma: pharma_1 , drug: drug_4)
stock_5 = Stock.create!(quantity: 6, pharma: pharma_1 , drug: drug_5)
stock_6 = Stock.create!(quantity: 10, pharma: pharma_1 , drug: drug_6)



puts "#{Stock.all}"

doctor_1 = Doctor.create!(full_name: "BOLTA Victor", rpps_number:"10004000856" , speciality: "Psychiatre")
doctor_2 = Doctor.create!(full_name: "TAIRI Walid", rpps_number:"10003231205" , speciality: "Généraliste")

puts "#{Doctor.all}"


patient_1 = Patient.create!(first_name: "Véronique", last_name: "DUBOIS" ,address: " 16 rue de Gaudelet" , age: 37, city: " 75011 Paris", chronic_disease: "Dépression", doctor: doctor_1, pharma: pharma_1)
patient_2 = Patient.create!(first_name: "Victor", last_name: "BERGEAUD" ,address: "11 rue Vaucouleurs" , age: 28, city: "75011 Paris" , chronic_disease: "Aucune" , doctor: doctor_2, pharma: pharma_1)

puts "#{Patient.all}"



patient_drugs_1 = PatientDrug.create!(drug: drug_1, patient: patient_1 , disease:"Depression")


