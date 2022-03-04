require "open-uri"

p "Deleting data..."

Subscription.destroy_all
Availability.destroy_all
Vote.destroy_all
PlaceProposal.destroy_all
Place.destroy_all
Task.destroy_all
Message.destroy_all
Trip.destroy_all
TripAvailability.destroy_all
User.destroy_all
Vote.destroy_all

p "Finished !"

p "Creating places, users, trips, subscriptions, availabilities, placeproposals, tasks, and messages..."

# places
rome_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/rome_fb1mq0.jpg')
rome = Place.create!(city: "Rome")
rome.photo.attach(io: rome_url, filename: 'Rome.jpg', content_type: 'jpg')
rome.save!

paris_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/paris_cuqo7v.jpg')
paris = Place.create!(city: "Paris")
paris.photo.attach(io: paris_url, filename: 'Paris.jpg', content_type: 'jpg')
paris.save!

londres_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/london_ogfqnr.jpg')
londres = Place.create!(city: "Londres")
londres.photo.attach(io: londres_url, filename: 'Londres.jpg', content_type: 'jpg')
londres.save!

amsterdam_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/amsterdam_xykrxh.jpg')
amsterdam = Place.create!(city: "Amsterdam")
amsterdam.photo.attach(io: amsterdam_url, filename: 'Amsterdam.jpg', content_type: 'jpg')
amsterdam.save!

berlin_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/berlin_mjn5om.jpg')
berlin = Place.create!(city: "Berlin")
berlin.photo.attach(io: berlin_url, filename: 'Berlin.jpg', content_type: 'jpg')
berlin.save!

madrid_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/madrid_ewghhk.jpg')
madrid = Place.create!(city: "Madrid")
madrid.photo.attach(io: madrid_url, filename: 'Madrid.jpg', content_type: 'jpg')
madrid.save!

lisbonne_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/lisbonne_m23aax.jpg')
lisbonne = Place.create!(city: "Lisbonne")
lisbonne.photo.attach(io: lisbonne_url, filename: 'Lisbonne.jpg', content_type: 'jpg')
lisbonne.save!

vienne_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394982/Planyourtrip/vienne_ekeaom.jpg')
vienne = Place.create!(city: "Vienne")
vienne.photo.attach(io: vienne_url, filename: 'Vienne.jpg', content_type: 'jpg')
vienne.save!

athenes_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394981/Planyourtrip/athenes_pfwftt.jpg')
athenes = Place.create!(city: "Athènes")
athenes.photo.attach(io: athenes_url, filename: 'Athenes.jpg', content_type: 'jpg')
athenes.save!

copenhague_url = URI.open('https://res.cloudinary.com/dtrdvotn4/image/upload/v1646394981/Planyourtrip/copenhagen_ypnsu9.jpg')
copenhague = Place.create!(city: "Copenhague")
copenhague.photo.attach(io: copenhague_url, filename: 'Copenhague.jpg', content_type: 'jpg')
copenhague.save!

p "Places seed done !"

# users
simon = User.create!(username: "simon", email: "simon.charbonnier@gmail.com", ghname: "simoncharbonnier", password: "secret")
valentin = User.create!(username: "valentin", email: "valentin.derrien@gmail.com", ghname: "valdrn",password: "secret")
herve = User.create!(username: "hervé", email: "herve.criaud@gmail.com", ghname: "criaudh", password: "secret")
fabien = User.create!(username: "fabien", email: "fabien.alexandre@gmail.com", ghname: "drptitlu", password: "secret")
p "Users seed done !"

# trips
trip1 = Trip.create!(name: "Voyage confirmé!", user_id: simon, month: 4, status: "confirmed", time_span: "weekend")
# trip2 = Trip.create!(name: "trip 2", user_id: simon, month: 4, status: "passed", time_span: "week")
trip3 = Trip.create!(name: "Weekend des familles", user_id: simon.id, month: 4, status: "created", time_span: "weekend")
trip4 = Trip.create!(name: "Voyage entre potes", user_id: simon.id, month: 4, status: "created", time_span: "week")
p "Trips seed done !"

# subscriptions
subscription1 = Subscription.create!(status: "accepted", user: simon, trip: trip1)
subscription2 = Subscription.create!(status: "accepted", user: valentin, trip: trip1)
subscription3 = Subscription.create!(status: "accepted", user: herve, trip: trip1)
subscription4 = Subscription.create!(status: "accepted", user: fabien, trip: trip1)
# subscription5 = Subscription.create!(status: "accepted", user: simon, trip: trip2)
# subscription6 = Subscription.create!(status: "accepted", user: valentin, trip: trip2)
# subscription7 = Subscription.create!(status: "accepted", user: herve, trip: trip2)
# subscription8 = Subscription.create!(status: "accepted", user: fabien, trip: trip2)
subscription9 = Subscription.create!(status: "accepted", user: simon, trip: trip3)
subscription10 = Subscription.create!(status: "accepted", user: valentin, trip: trip3)
subscription11 = Subscription.create!(status: "accepted", user: herve, trip: trip3)
subscription12 = Subscription.create!(status: "accepted", user: fabien, trip: trip3)
subscription13 = Subscription.create!(status: "accepted", user: simon, trip: trip4)
subscription14 = Subscription.create!(status: "accepted", user: valentin, trip: trip4)
subscription15 = Subscription.create!(status: "accepted", user: herve, trip: trip4)
subscription16 = Subscription.create!(status: "accepted", user: fabien, trip: trip4)
p "Subscriptions seed done !"

# trip_availabilities
trip_availability_7 = TripAvailability.create!(trip: trip3, start_at: "2022-4-1", end_at: "2022-4-3")
trip_availability_8 = TripAvailability.create!(trip: trip3, start_at: "2022-4-8", end_at: "2022-4-10")
trip_availability_9 = TripAvailability.create!(trip: trip3, start_at: "2022-4-15", end_at: "2022-4-17")
trip_availability_10 = TripAvailability.create!(trip: trip3, start_at: "2022-4-22", end_at: "2022-4-24")
trip_availability_11 = TripAvailability.create!(trip: trip3, start_at: "2022-4-29", end_at: "2022-5-1")

trip_availability_12 = TripAvailability.create!(trip: trip1, start_at: "2022-4-1", end_at: "2022-4-3")
# trip1.trip_availability = trip_availability_12
# trip1.save!

trip_availability_3 = TripAvailability.create!(trip: trip4, start_at: "2022-4-4", end_at: "2022-4-10")
trip_availability_4 = TripAvailability.create!(trip: trip4, start_at: "2022-4-11", end_at: "2022-4-17")
trip_availability_5 = TripAvailability.create!(trip: trip4, start_at: "2022-4-18", end_at: "2022-4-24")
trip_availability_6 = TripAvailability.create!(trip: trip4, start_at: "2022-4-25", end_at: "2022-5-1")

# availabilities
availabilities_9 = Availability.create!(user: fabien, trip_availability: trip_availability_7)
availabilities_9 = Availability.create!(user: fabien, trip_availability: trip_availability_9)
availabilities_9 = Availability.create!(user: valentin, trip_availability: trip_availability_8)
availabilities_9 = Availability.create!(user: valentin, trip_availability: trip_availability_9)
availabilities_9 = Availability.create!(user: simon, trip_availability: trip_availability_7)
availabilities_9 = Availability.create!(user: simon, trip_availability: trip_availability_10)
availabilities_5 = Availability.create!(user: fabien, trip_availability: trip_availability_4)
availabilities_1 = Availability.create!(user: fabien, trip_availability: trip_availability_5)
availabilities_6 = Availability.create!(user: fabien, trip_availability: trip_availability_6)
availabilities_2 = Availability.create!(user: valentin, trip_availability: trip_availability_5)
availabilities_3 = Availability.create!(user: herve, trip_availability: trip_availability_5)
availabilities_4 = Availability.create!(user: herve, trip_availability: trip_availability_6)
availabilities_3 = Availability.create!(user: simon, trip_availability: trip_availability_3)
availabilities_4 = Availability.create!(user: simon, trip_availability: trip_availability_6)


# availabilities_1 = Availabilities.create!(user_id: fabien , trip_availability_id:)


# place_proposals
place_proposal1 = PlaceProposal.create!(place: copenhague, trip: trip4, user: valentin)
place_proposal2 = PlaceProposal.create!(place: paris, trip: trip4, user: fabien)
place_proposal3 = PlaceProposal.create!(place: rome, trip: trip4, user: herve)
place_proposal4 = PlaceProposal.create!(place: rome, trip: trip4, user: simon)

place_proposal5 = PlaceProposal.create!(place: rome, trip: trip1, user: simon)
trip1.place_proposal = place_proposal5
trip1.save!

# trip1.place_proposal = place_proposal1.id
# trip1.save
# trip2.place_proposal = place_proposal2.id
# trip2.save
# trip3.place_proposal = place_proposal3.id
# trip3.save
p "Place proposals seed done !"

# tasks
task1 = Task.create!(name: "Réserve ton billet d'avion", user: simon, trip: trip4)
task2 = Task.create!(name: "Réserve ton billet d'avion", user: fabien, trip: trip4)
task3 = Task.create!(name: "Réserve ton billet d'avion", user: herve, trip: trip4)
task4 = Task.create!(name: "Réserve ton billet d'avion", user: valentin, trip: trip4)
task5 = Task.create!(name: "Réserver le logement", user: simon, trip: trip4)
task6 = Task.create!(name: "Réserver le logement", user: fabien, trip: trip4)
task7 = Task.create!(name: "Réserver le logement", user: herve, trip: trip4)
task8 = Task.create!(name: "Réserver le logement", user: valentin, trip: trip4)
p "Tasks seed done !"

# messages
message1 = Message.create!(content: "Tous prêts ?", user: simon, trip: trip4)
message2 = Message.create!(content: "Tu as bien pris ton maillot Hervé ?", user: valentin, trip: trip4)
message3 = Message.create!(content: "J'espère que tu y as pensé !", user: fabien, trip: trip4)
message4 = Message.create!(content: "J'ai pris ma combinaison !", user: herve, trip: trip4)
p "Messages seed done !"


p "ALL SEEDS DONE !"
