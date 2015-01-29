# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Six Users
p "--- Creating Users"
users = User.create([
          { user_name: "SaintPete",
            email: "pete@seahawks.com",
            password: "123",
            password_confirmation: "123"
          },
          { user_name: "JustRussell",
            email: "russell@seahawks.com",
            password: "123",
            password_confirmation: "123"
          },
          { user_name: "BeastMode",
            email: "marshawn@seahawks.com",
            password: "123",
            password_confirmation: "123"
          },
          { user_name: "OptimusPrime",
            email: "rsherman@seahawks.com",
            password: "123",
            password_confirmation: "123"
          },
          { user_name: "BamBamKam",
            email: "kam@seahawks.com",
            password: "123",
            password_confirmation: "123"
          },
          { user_name: "TheWillverine",
            email: "luke@seahawks.com",
            password: "123",
            password_confirmation: "123"
          }
        ])
p "--- Created " + User.all.count.to_s + " users."

# Locations
p "--- Creating Locations"
locations = Location.create([
          { user_id: 1,
            latitude: "47.6204",
            longitude: "-122.3491",
            name: "Space Needle",
            desc: "Iconic Seattle Landmark",
            address_street: "400 Broad St",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98109",
            address_country: "USA"
          },
          { user_id: 1,
            latitude: "47.6073",
            longitude: "-122.3491",
            name: "Russell Investments Center",
            desc: "No relation to the quarterback (we think)",
            address_street: nil,
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98101",
            address_country: "USA"
          },
          { latitude: "47.597893",
            longitude: "-122.332876",
            name: "Stadium Place Apartments",
            desc: "Close to the CLink",
            address_street: "521 Stadium Place South",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98104",
            address_country: "USA"
          },
          { latitude: "47.623284",
            longitude: "-122.329997",
            name: "Ripple Yoga Studio",
            desc: "Right next door!",
            address_street: "1311 Republican Street",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98109",
            address_country: "USA"
          },
          { latitude: "47.620035",
            longitude: "-122.329631",
            name: "REI",
            desc: "Sporting & Outdoors",
            address_street: "222 Yale Avenue North",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98109",
            address_country: "USA"
          },
          { user_id: nil,
            latitude: "47.613455",
            longitude: "-122.331670",
            name: "Paramount Theatre",
            desc: nil,
            address_street: "911 Pine Street",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98101",
            website: "stgpresents.org",
            phone_num: "(206) 682-1414"
          },
          {
            user_id: nil,
            latitude: "47.612096",
            longitude: "-122.334270",
            name: "The Roosevelt Hotel",
            desc: nil,
            address_street: "1531 7th Avenue",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98101",
            website: "roosevelthotel.com",
            phone_num: "(206) 621-1200"
          },
          {
            user_id: nil,
            latitude: "47.617435",
            longitude: "-122.344443",
            name: "City University of Seattle",
            desc: nil,
            address_street: "521 Wall Street",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98121",
            website: "cityu.edu",
            phone_num: "(888) 422-4898"
          },
          {
            user_id: nil,
            latitude: "47.607452",
            longitude: "-122.342975",
            name: "Seattle Aquarium",
            desc: nil,
            address_street: "1483 Alaskan Way",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98101",
            website: "seattleaquarium.org",
            phone_num: "(206) 386-4300"
          },
          {
            user_id: nil,
            latitude: "47.608246",
            longitude: "-122.339727",
            name: "The Pike Brewing Company",
            desc: nil,
            address_street: "1415 1st Avenue",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98101",
            website: "pikebrewing.com"
          },
          {
            user_id: nil,
            latitude: "47.608110",
            longitude: "-122.336965",
            name: "Benaroya Hall",
            desc: nil,
            address_street: "200 University Street",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98101",
            website: "benaroyahall.org",
            phone_num: "(206) 215-4800"
          },
          {
            user_id: nil,
            latitude: "47.593294",
            longitude: "-122.333651",
            name: "The Hawks Nest",
            desc: nil,
            address_street: "1028 1st Avenue South",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98134",
            website: "hawksnestbar.com",
            phone_num: "(206) 381-8630"
          },
          {
            user_id: nil,
            latitude: "47.621629",
            longitude: "-122.348246",
            name: "EMP Museum",
            desc: nil,
            address_street: "325 5th Avenue North",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98109",
            website: "empmuseum.org",
            phone_num: "(206) 770-2700"
          },
          {
            user_id: nil,
            latitude: "47.676174",
            longitude: "-122.317592",
            name: "Rain City Burgers",
            desc: nil,
            address_street: "6501 Roosevelt Way Northeast",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98115",
            website: "raincityburgers.com",
            phone_num: "(206) 525-3542"
          },
          {
            user_id: nil,
            latitude: "47.576827",
            longitude: "-122.167585",
            name: "T-Mobile Headquarters",
            desc: nil,
            address_street: "12920 SE 38th Street",
            address_city: "Bellevue",
            address_state: "WA",
            address_zip: "98006",
            website: "t-mobile.com",
            phone_num: "(800) 318-9270"
          },
          {
            user_id: nil,
            latitude: "47.603734",
            longitude: "-122.323103",
            name: "Harborview Medical Center",
            desc: nil,
            address_street: "325 9th Avenue",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98104",
            website: "uwmedicine.washington.edu",
            phone_num: "(206) 744-3000"
          },
          {
            user_id: nil,
            latitude: "47.606313",
            longitude: "-122.341926",
            name: "The Seattle Great Wheel",
            desc: nil,
            address_street: "1301 Alaskan Way",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98101",
            website: "seattlegreatwheel.com",
            phone_num: "(206) 623-8607"
          },
          {
            user_id: nil,
            latitude: "47.580945",
            longitude: "-122.335935",
            name: "Starbucks Headquarters",
            desc: nil,
            address_street: "2401 Utah Avenue South",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98134",
            website: "starbucks.com",
            phone_num: "(206) 624-9496"
          },
          {
            user_id: nil,
            latitude: "47.649534",
            longitude: "-122.352026",
            name: "Allen Institute for Brain Science",
            desc: nil,
            address_street: "551 North 34th Street #200",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98103",
            website: "alleninstitute.org",
            phone_num: "(206) 548-7000"
          },
          {
            user_id: nil,
            latitude: "47.568323",
            longitude: "-122.364321",
            name: "Metropolitan Market Retail Support Center",
            desc: nil,
            address_street: "4025 Delridge Way Southwest #100",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98106",
            website: "metropolitan-market.com",
            phone_num: "(206) 923-0740"
          },
          {
            user_id: nil,
            latitude: "47.602060",
            longitude: "-122.331770",
            name: "Smith Tower",
            desc: nil,
            address_street: "506 2nd Avenue",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98104",
            website: "smithtower.com",
            phone_num: "(206) 622-4004"
          }            
        ])
p "--- Created " + Location.all.count.to_s + " locations."

# Six Events
p "--- Creating Events"
events = Event.create([
          { user_id: User.first.id,
            location_id: Location.first.id,
            name: "VIP Super Bowl Party",
            desc: "You WISH you could get in.",
            date: "2015/02/01",
            start_time: "12:00",
            end_time: "8:00",
            photo_url: "http://media.thenewstribune.com/smedia/2014/05/08/23/00/1wC2dn.AuSt.5.jpg"
          }
        ])

# Add Events to about 30% of Locations
locations.each do |loc|
  i = rand(1..4)
  while i == 1  
    Event.create([
          { user_id: nil,
            location_id: loc.id,
            name: "Seahawks Super Bowl Party",
            desc: "A 12th Man Celebration",
            date: "2015/02/" + rand(1...28).to_s,
            start_time: "12:00",
            end_time: "8:00",
            photo_url: "" # Need cloudinary photo ids here...
          }
        ])
    i = rand(1..2) # Increase odds of Location with at least 1 to have others.
  end
end
p "--- Created " + Event.all.count.to_s + " events."

# For each user, create 5-15 checkins for random Locations/Events
p "--- Creating Checkins"
users.each do |user|
  i = rand(5..15)
  count = 1
  while i < 20

    # (2:1 ratio of location checkins to event checkins)
    if rand(1..3) < 3
      checkinable_type = "location"
      checkinable = Location.find_by_id(rand(1..Location.all.length))
    else
      checkinable_type = "event"
      checkinable = Event.find_by_id(rand(1..Event.all.length))
    end

    note = "Test Checkin #" + count.to_s + " for " + user.user_name
    latitude = checkinable_type == "location" ? checkinable.latitude : checkinable.location.latitude
    longitude = checkinable_type == "location" ? checkinable.longitude : checkinable.location.longitude

    # Create the checkin
    user.checkins << checkinable.checkins.create({photo_url: "", note: note, latitude: latitude, longitude: longitude})

    i += 1
    count += 1
  end
end
p "--- Created " + Checkin.all.count.to_s + " checkins."