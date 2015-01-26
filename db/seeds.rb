# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Six Users
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

# Six Locations
locations = Location.create([
          { 
            # latitude: nil,
            # longitude: nil, 
            latitude: 47.6204,
            longitude: 122.3491, 
            name: "Space Needle",
            desc: "Iconic Seattle Landmark",
            address_street: "400 Broad Street",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98109",
            address_country: "USA",
          },
          { 
            # latitude: nil,
            # longitude: nil, 
            latitude: 47.6073,
            longitude: 122.3371,
            name: "Russell Investments Center",
            desc: "No relation to the quarterback (we think)",
            address_street: "1301 2nd Avenue",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "980101",
            address_country: "USA",
          },
          { latitude: nil,
            longitude: nil, 
            name: "Stadium Place Apartments",
            desc: "Close to the CLink",
            address_street: "201 S KING ST",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98104",
            address_country: "USA",
          },
          { latitude: nil,
            longitude: nil, 
            name: "Ripple Yoga Studio",
            desc: "Right next door!",
            address_street: "1311 Republican St",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98108",
            address_country: "USA",
          }
        ])

# Six Events
# events = Event.create([])

# ?? Checkins
# checkins = Checkin.create([])



# { latitude: 47.6204,
#   longitude: 122.3491, 
#   name: "Space Needle",
#   desc: "Iconic Seattle Landmark",
#   address_street: "400 Broad Street",
#   address_city: "Seattle",
#   address_state: "WA",
#   address_zip: "98109",
#   address_country: "USA",
# },
# { latitude: 47.6073,
#   longitude: 122.3371, 
#   name: "Russell Investments Center",
#   desc: "No relation to the quarterback (we think)",
#   address_street: "1301 2nd Avenue",
#   address_city: "Seattle",
#   address_state: "WA",
#   address_zip: "980101",
#   address_country: "USA",
# }