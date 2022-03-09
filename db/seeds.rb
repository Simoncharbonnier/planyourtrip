require "open-uri"

p "Deleting data..."

Subscription.destroy_all
Availability.destroy_all
Vote.destroy_all
PlaceProposal.destroy_all
Place.destroy_all
UserTask.destroy_all
Task.destroy_all
Message.destroy_all
Trip.destroy_all
TripAvailability.destroy_all
User.destroy_all
Vote.destroy_all

p "Finished !"

p "Creating all seeds..."

# places
rome_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/rome_fb1mq0.jpg')
rome = Place.create!(city: "Rome", country: "Italie", pint_cost: "3.5€", temperature: "28°C", plane_cost: "67€", lodging_cost: "47€")
rome.photo.attach(io: rome_url, filename: 'Rome.jpg', content_type: 'jpg')
rome.save!

paris_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/paris_cuqo7v.jpg')
paris = Place.create!(city: "Paris", country: "France", pint_cost: "8€", temperature: "22°C", plane_cost: "46€", lodging_cost: "82€")
paris.photo.attach(io: paris_url, filename: 'Paris.jpg', content_type: 'jpg')
paris.save!

londres_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/london_ogfqnr.jpg')
londres = Place.create!(city: "Londres", country: "Royaume-Uni", pint_cost: "6€", temperature: "19°C", plane_cost: "89€", lodging_cost: "74€")
londres.photo.attach(io: londres_url, filename: 'Londres.jpg', content_type: 'jpg')
londres.save!

amsterdam_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/amsterdam_xykrxh.jpg')
amsterdam = Place.create!(city: "Amsterdam", country: "Pays-Bas", pint_cost: "4€", temperature: "18°C", plane_cost: "45€", lodging_cost: "43€")
amsterdam.photo.attach(io: amsterdam_url, filename: 'Amsterdam.jpg', content_type: 'jpg')
amsterdam.save!

berlin_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/berlin_mjn5om.jpg')
berlin = Place.create!(city: "Berlin", country: "Allemagne", pint_cost: "4.5€", temperature: "20°C", plane_cost: "69€", lodging_cost: "51€")
berlin.photo.attach(io: berlin_url, filename: 'Berlin.jpg', content_type: 'jpg')
berlin.save!

madrid_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/madrid_ewghhk.jpg')
madrid = Place.create!(city: "Madrid", country: "Espagne", pint_cost: "3€", temperature: "31°C", plane_cost: "44€", lodging_cost: "39€")
madrid.photo.attach(io: madrid_url, filename: 'Madrid.jpg', content_type: 'jpg')
madrid.save!

lisbonne_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/lisbonne_m23aax.jpg')
lisbonne = Place.create!(city: "Lisbonne", country: "Portugal", pint_cost: "3€", temperature: "29°C", plane_cost: "41€", lodging_cost: "55€")
lisbonne.photo.attach(io: lisbonne_url, filename: 'Lisbonne.jpg', content_type: 'jpg')
lisbonne.save!

vienne_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/vienne_ekeaom.jpg')
vienne = Place.create!(city: "Vienne", country: "Autriche", pint_cost: "4.5€", temperature: "25°C", plane_cost: "69€", lodging_cost: "60€")
vienne.photo.attach(io: vienne_url, filename: 'Vienne.jpg', content_type: 'jpg')
vienne.save!

athenes_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394981/Planyourtrip/athenes_pfwftt.jpg')
athenes = Place.create!(city: "Athènes", country: "Grèce", pint_cost: "3.5€", temperature: "36°C", plane_cost: "92€", lodging_cost: "53€")
athenes.photo.attach(io: athenes_url, filename: 'Athenes.jpg', content_type: 'jpg')
athenes.save!

copenhague_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394981/Planyourtrip/copenhagen_ypnsu9.jpg')
copenhague = Place.create!(city: "Copenhague", country: "Danemark", pint_cost: "4€", temperature: "16°C", plane_cost: "58€", lodging_cost: "90€")
copenhague.photo.attach(io: copenhague_url, filename: 'Copenhague.jpg', content_type: 'jpg')
copenhague.save!
p "Places seed done !"

# users
simon = User.create!(username: "simon", email: "simon.charbonnier@gmail.com", ghname: "simoncharbonnier", password: "secret")
valentin = User.create!(username: "valentin", email: "valentin.derrien@gmail.com", ghname: "valdrn", password: "secret")
herve = User.create!(username: "hervé", email: "herve.criaud@gmail.com", ghname: "criaudh", password: "secret")
fabien = User.create!(username: "fabien", email: "fabien.alexandre@gmail.com", ghname: "drptitlu", password: "secret")
p "Users seed done !"

# trips
trip1 = Trip.create!(name: "Weekend aux Pays-Bas", user: simon, month: 9, status: "confirmed", time_span: "Weekend")
trip2 = Trip.create!(name: "Aout chez les Grecs", user: valentin, month: 8, status: "confirmed", time_span: "Semaine")
# trip3 = Trip.create!(name: "Voyage entre potes", user: fabien, month: 8, status: "voting", time_span: "Week")
trip4 = Trip.create!(name: "Avril 2022", user: fabien, month: 4, status: "voting", time_span: "Weekend")

p "Trips seed done !"

# subscriptions
Subscription.create!(status: "accepted", user: simon, trip: trip1)
Subscription.create!(status: "accepted", user: valentin, trip: trip1)
Subscription.create!(status: "accepted", user: herve, trip: trip1)
Subscription.create!(status: "accepted", user: valentin, trip: trip2)
Subscription.create!(status: "accepted", user: fabien, trip: trip2)
# Subscription.create!(status: "accepted", user: simon, trip: trip3)
# Subscription.create!(status: "accepted", user: valentin, trip: trip3)
# Subscription.create!(status: "accepted", user: herve, trip: trip3)
# Subscription.create!(status: "accepted", user: fabien, trip: trip3)
Subscription.create!(status: "accepted", user: simon, trip: trip4)
Subscription.create!(status: "pending", user: valentin, trip: trip4)
Subscription.create!(status: "accepted", user: herve, trip: trip4)
Subscription.create!(status: "accepted", user: fabien, trip: trip4)
p "Subscriptions seed done !"

# trip_availabilities
trip_availability1 = TripAvailability.create!(trip: trip1, start_at: "2022-9-7", end_at: "2022-9-9")
trip1.trip_availability = trip_availability1
trip1.save!
trip_availability2 = TripAvailability.create!(trip: trip2, start_at: "2022-8-18", end_at: "2022-8-25")
trip2.trip_availability = trip_availability2
trip2.save!

# trip_availability3 = TripAvailability.create!(trip: trip3, start_at: "2022-8-1", end_at: "2022-8-7")
# trip_availability4 = TripAvailability.create!(trip: trip3, start_at: "2022-8-8", end_at: "2022-8-14")
# trip_availability5 = TripAvailability.create!(trip: trip3, start_at: "2022-8-15", end_at: "2022-8-21")
# trip_availability6 = TripAvailability.create!(trip: trip3, start_at: "2022-4-22", end_at: "2022-8-28")

trip_availability7 = TripAvailability.create!(trip: trip4, start_at: "2022-4-22", end_at: "2022-4-24")
trip4.trip_availability = trip_availability7
trip4.save!
p "Trip availabilities seed done !"

# availabilities
# Availability.create!(user: fabien, trip_availability: trip_availability4)
# Availability.create!(user: fabien, trip_availability: trip_availability5)
# Availability.create!(user: fabien, trip_availability: trip_availability6)
# Availability.create!(user: simon, trip_availability: trip_availability3)
# Availability.create!(user: simon, trip_availability: trip_availability5)
# Availability.create!(user: valentin, trip_availability: trip_availability5)
# Availability.create!(user: herve, trip_availability: trip_availability4)

Availability.create!(user: herve, trip_availability: trip_availability7)
Availability.create!(user: fabien, trip_availability: trip_availability7)
Availability.create!(user: simon, trip_availability: trip_availability7)
Availability.create!(user: valentin, trip_availability: trip_availability7)
p "Availabilities seed done !"

# place_proposals
place_proposal1 = PlaceProposal.create!(place: amsterdam, trip: trip1, user: simon)
trip1.place_proposal = place_proposal1
trip1.save!
place_proposal2 = PlaceProposal.create!(place: athenes, trip: trip2, user: valentin)
trip2.place_proposal = place_proposal2
trip2.save!

# place_proposal3 = PlaceProposal.create!(place: berlin, trip: trip3, user: valentin)
# place_proposal4 = PlaceProposal.create!(place: copenhague, trip: trip3, user: simon)
# place_proposal5 = PlaceProposal.create!(place: vienne, trip: trip3, user: fabien)
# place_proposal6 = PlaceProposal.create!(place: rome, trip: trip3, user: herve)

place_proposal7 = PlaceProposal.create!(place: berlin, trip: trip4, user: herve)
place_proposal8 = PlaceProposal.create!(place: lisbonne, trip: trip4, user: simon)
p "Place proposals seed done !"

# votes
# Vote.create!(user: simon, place_proposal: place_proposal4)
# Vote.create!(user: valentin, place_proposal: place_proposal5)
# Vote.create!(user: fabien, place_proposal: place_proposal4)

Vote.create!(user: simon, place_proposal: place_proposal7)
Vote.create!(user: herve, place_proposal: place_proposal7)
Vote.create!(user: fabien, place_proposal: place_proposal7)
p "Votes seed done !"

# tasks
Task.create!(name: "Billet d'avion", trip: trip1)
Task.create!(name: "Logement", trip: trip1)
Task.create!(name: "Billet d'avion", trip: trip2)
Task.create!(name: "Logement", trip: trip2)
# Task.create!(name: "Billet d'avion", trip: trip3)
# Task.create!(name: "Logement", trip: trip3)
Task.create!(name: "Billet d'avion", trip: trip4)
Task.create!(name: "Logement", trip: trip4)
p "Tasks seed done !"

# messages
Message.create!(content: "Ça va être dingue !", user: simon, trip: trip1)
Message.create!(content: "Tu as bien pris ton appareil Hervé ?", user: valentin, trip: trip1)
Message.create!(content: "J'espère que tu y as pensé...", user: fabien, trip: trip1)
Message.create!(content: "Yes c'est ok !", user: herve, trip: trip1)
p "Messages seed done !"



p "ALL SEEDS DONE !"
