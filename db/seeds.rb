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
paris = Place.create!(city: "Paris")
londres = Place.create!(city: "Londres")
amsterdam = Place.create!(city: "Amsterdam")
berlin = Place.create!(city: "Berlin")
madrid = Place.create!(city: "Madrid")
rome = Place.create!(city: "Rome")
lisbonne = Place.create!(city: "Lisbonne")
vienne = Place.create!(city: "Vienne")
athenes = Place.create!(city: "Athènes")
copenhague = Place.create!(city: "Copenhague")
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
trip3 = Trip.create!(name: "Weekend des familles", user_id: simon.id, month: 4, status: "voting", time_span: "weekend")
trip4 = Trip.create!(name: "Voyage entre potes", user_id: simon.id, month: 4, status: "voting", time_span: "week")
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
availabilities_5 = Availability.create!(user: fabien, available: "true", trip_availability: trip_availability_4)
availabilities_1 = Availability.create!(user: fabien, available: "false", trip_availability: trip_availability_5)
availabilities_6 = Availability.create!(user: fabien, available: "true", trip_availability: trip_availability_6)
availabilities_2 = Availability.create!(user: valentin, available: "false", trip_availability: trip_availability_5)
availabilities_3 = Availability.create!(user: herve, available: "true", trip_availability: trip_availability_5)
availabilities_4 = Availability.create!(user: herve, available: "true", trip_availability: trip_availability_6)


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
