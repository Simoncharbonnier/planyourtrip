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
User.destroy_all
Vote.destroy_all

p "Finished !"



p "Creating places, users, trips, subscriptions, availabilities, placeproposals, tasks, and messages..."

# places
paris = Place.create(city: "Paris")
londres = Place.create(city: "Londres")
amsterdam = Place.create(city: "Amsterdam")
berlin = Place.create(city: "Berlin")
madrid = Place.create(city: "Madrid")
rome = Place.create(city: "Rome")
lisbonne = Place.create(city: "Lisbonne")
vienne = Place.create(city: "Vienne")
athenes = Place.create(city: "Athènes")
copenhague = Place.create(city: "Copenhague")
p "Places seed done !"

# users
simon = User.create(username: "simon", email: "simon.charbonnier@gmail.com", password: "secret")
valentin = User.create(username: "valentin", email: "valentin.derrien@gmail.com", password: "secret")
herve = User.create(username: "herve", email: "herve.criaud@gmail.com", password: "secret")
fabien = User.create(username: "fabien", email: "fabien.alexandre@gmail.com", password: "secret")
p "Users seed done !"

# trips
trip1 = Trip.create(name: "trip 1", user_id: simon, month: "july", status: "confirmed", time_span: 7)
trip2 = Trip.create(name: "trip 2", user_id: simon, month: "july", status: "passed", time_span: 7)
trip3 = Trip.create(name: "trip 3", user_id: simon, month: "july", status: "passed", time_span: 11)
trip4 = Trip.create(name: "trip 4", user_id: simon, month: "july", status: "voting", time_span: 7)
p "Trips seed done !"

# trip_availabilities
trip_availability_1 = TripAvailability.create(trip_id: 4, start_at: "2022-4-4", end_at: "2022-4-10")
trip_availability_1 = TripAvailability.create(trip_id: 4, start_at: "2021-9-20", end_at: "2021-9-26")
trip_availability_1 = TripAvailability.create(trip_id: 4, start_at: "2021-2-4", end_at: "2021-2-14")
trip_availability_1 = TripAvailability.create(trip_id: 4, start_at: "2022-4-12", end_at: "2022-4-18")

# place_proposals
place_proposal1 = PlaceProposal.create(place_id: copenhague, trip_id: trip1, user_id: simon)
place_proposal2 = PlaceProposal.create(place_id: paris, trip_id: trip2, user_id: fabien)
place_proposal3 = PlaceProposal.create(place_id: rome, trip_id: trip3, user_id: herve)
trip1.place_proposal_id = place_proposal1.id
trip1.save
trip2.place_proposal_id = place_proposal2.id
trip2.save
trip3.place_proposal_id = place_proposal3.id
trip3.save
p "Place proposals seed done !"

# subscriptions
subscription1 = Subscription.create(status: "accepted", user: simon, trip: trip1)
subscription2 = Subscription.create(status: "accepted", user: valentin, trip: trip1)
subscription3 = Subscription.create(status: "accepted", user: herve, trip: trip1)
subscription4 = Subscription.create(status: "accepted", user: fabien, trip: trip1)
subscription5 = Subscription.create(status: "accepted", user: simon, trip: trip2)
subscription6 = Subscription.create(status: "accepted", user: valentin, trip: trip2)
subscription7 = Subscription.create(status: "accepted", user: herve, trip: trip2)
subscription8 = Subscription.create(status: "accepted", user: fabien, trip: trip2)
subscription9 = Subscription.create(status: "accepted", user: simon, trip: trip3)
subscription10 = Subscription.create(status: "accepted", user: valentin, trip: trip3)
subscription11 = Subscription.create(status: "accepted", user: herve, trip: trip3)
subscription12 = Subscription.create(status: "accepted", user: fabien, trip: trip3)
subscription13 = Subscription.create(status: "accepted", user: simon, trip: trip4)
subscription14 = Subscription.create(status: "accepted", user: valentin, trip: trip4)
subscription15 = Subscription.create(status: "accepted", user: herve, trip: trip4)
subscription16 = Subscription.create(status: "accepted", user: fabien, trip: trip4)
p "Subscriptions seed done !"

# tasks
task1 = Task.create(name: "Réserve ton billet d'avion", user: simon, trip: trip1)
task2 = Task.create(name: "Réserve ton billet d'avion", user: fabien, trip: trip1)
task3 = Task.create(name: "Réserve ton billet d'avion", user: herve, trip: trip1)
task4 = Task.create(name: "Réserve ton billet d'avion", user: valentin, trip: trip1)
task5 = Task.create(name: "Réserver le logement", user: simon, trip: trip1)
task6 = Task.create(name: "Réserver le logement", user: fabien, trip: trip1)
task7 = Task.create(name: "Réserver le logement", user: herve, trip: trip1)
task8 = Task.create(name: "Réserver le logement", user: valentin, trip: trip1)
p "Tasks seed done !"

# messages
message1 = Message.create(content: "Tous prêts ?", user: simon, trip: trip1)
message2 = Message.create(content: "Tu as bien pris ton maillot Hervé ?", user: valentin, trip: trip1)
message3 = Message.create(content: "J'espère que tu y as pensé !", user: fabien, trip: trip1)
message4 = Message.create(content: "J'ai pris ma combinaison !", user: herve, trip: trip1)
p "Messages seed done !"


p "ALL SEEDS DONE !"
