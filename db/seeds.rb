# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#pundit avec admin à rajouter dans la seed si necessaire admin:true or false

User.destroy_all
Pharma.destroy_all
Drug.destroy_all
Patient.destroy_all
Stock.destroy_all

pharma_user = Pharma.create!(name:"Pharmacie du 20ème", address:"144 Boulevard de Ménilmontant", city:"75020 Paris")

puts "#{Pharma.all}"

farouk = User.create!(full_name: "Rahmani Farouk", rpps_number: "10101992104", email:"farouk@gmail.com", password: "123456", pharma: pharma_user)

puts "#{User.all}"


mirtazapine = Drug.create!(name:"Mirtazapine 15mg", drugs_class: "Anti-dépresseur", family:"", action:"", galenic: "comprimé", posology:"", recommandations:"", availibity:"")
fluoxetine = Drug.create!(name:"Fluoxétine 20mg", drugs_class: "Anti-dépresseur", family:"ISRS", action: "Inhibiteur séléctif de la recapture de la sérotonine", galenic: ["comprimé","gélules"], posology:"20mg/jour", recommandations:"", availibity: 1)
paroxetine = Drug.create!(name:"Paroxétine", drugs_class: "Anti-dépresseur", family:"ISRS", action:"Inhibiteur séléctif de la recapture de la sérotonine", galenic: "comprimé", posology:"", recommandations:"", availibity:"")
sertraline = Drug.create!(name:"Sertraline", drugs_class:"", family:"", action:"", galenic: "comprimé", posology:"", recommandations:"", availibity:"")
escitalopram = Drug.create!(name:"Escitalopram 10mg", drugs_class:"", family:"ISRS", action:"Inhibiteur séléctif de la recapture de la sérotonine", galenic: "comprimé", posology:"", recommandations:"", availibity:"")
venlafaxine = Drug.create!(name:"venlafaxine 37,5 mg", drugs_class:"", family:"", action:"", galenic: "comprimé", posology:"", recommandations:"", availibity:"")

puts "#{Drug.all}"

#Patient.create!()




#puts "#{Drug.all}"

#victor = Doctor.create!(full_name: "Bergeaud Victor", rpps_number:"" , speciality: "Psychiatre")

#puts "#{Doctor.all}"

#dubois = Patient.create!(first_name: "", last_name: "" ,address: , age: , city: , chronic_disease: , doctor: victor, pharma: pharma_1)

#puts "#{Patient.all}"

#Stock.create!(quantity: , pharma: , drug:)
#puts "#{Stock.all}"


