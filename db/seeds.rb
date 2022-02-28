require "open-uri"

p "Deleting data..."

Place.destroy_all
User.destroy_all
Trip.destroy_all
Subscription.destroy_all
Availability.destroy_all
PlaceProposal.destroy_all
Task.destroy_all
Message.destroy_all

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
trip1 = Trip.create(start_at: "2022-4-4", end_at: "2022-4-10", place: paris.city, duration: 7)
trip2 = Trip.create(start_at: "2021-9-20", end_at: "2021-9-26", place: rome.city, duration: 7)
trip3 = Trip.create(start_at: "2021-2-4", end_at: "2021-2-14", place: copenhague.city, duration: 11)
p "Trips seed done !"

#subscriptions
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
p "Subscriptions seed done !"

# availabilities
# availability1 = Availability.create(start_at: "2022-3-14", end_at: "2022-4-10", user: simon, trip: trip1)
# availability2 = Availability.create(start_at: "2022-3-28", end_at: "2022-4-10", user: valentin, trip: trip1)
# availability3 = Availability.create(start_at: "2022-3-21", end_at: "2022-4-3", user: herve, trip: trip1)
# availability4 = Availability.create(start_at: "2022-4-4", end_at: "2022-4-25", user: fabien, trip: trip1)
# p "Availabilities seed done !"

# place_proposals
# place_proposal1 = PlaceProposal.create(place: copenhague, trip: trip1)
# place_proposal2 = PlaceProposal.create(place: paris, trip: trip1)
# place_proposal3 = PlaceProposal.create(place: rome, trip: trip1)
# place_proposal4 = PlaceProposal.create(place: paris, trip: trip1)
# p "Place proposals seed done !"

# tasks
# task1 = Task.create(name: "Réserve ton billet d'avion", user: simon, trip: trip1)
# task2 = Task.create(name: "Réserve ton billet d'avion", user: fabien, trip: trip1)
# task3 = Task.create(name: "Réserve ton billet d'avion", user: herve, trip: trip1)
# task4 = Task.create(name: "Réserve ton billet d'avion", user: valentin, trip: trip1)
# task5 = Task.create(name: "Réserver le logement", user: simon, trip: trip1)
# task6 = Task.create(name: "Réserver le logement", user: fabien, trip: trip1)
# task7 = Task.create(name: "Réserver le logement", user: herve, trip: trip1)
# task8 = Task.create(name: "Réserver le logement", user: valentin, trip: trip1)
# p "Tasks seed done !"

# messages
# message1 = Message.create(content: "Tous prêts ?", user: simon, trip: trip1)
# message2 = Message.create(content: "Tu as bien pris ton maillot Hervé ?", user: valentin, trip: trip1)
# message3 = Message.create(content: "J'espère que tu y as pensé !", user: fabien, trip: trip1)
# message4 = Message.create(content: "J'ai pris ma combinaison !", user: herve, trip: trip1)
# p "Messages seed done !"



p "ALL SEEDS DONE !"
