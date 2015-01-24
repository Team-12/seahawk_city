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
          { latitude: nil,
            longitude: nil, 
            name: "Space Needle",
            desc: "Iconic Seattle Landmark",
            address_street: nil,
            address_city: nil,
            address_state: nil,
            address_zip: nil,
            address_country: nil,
          },
          { latitude: nil,
            longitude: nil, 
            name: "Russell Investments Center",
            desc: "No relation to the quarterback (we think)",
            address_street: nil,
            address_city: nil,
            address_state: nil,
            address_zip: nil,
            address_country: nil,
          },
          { latitude: nil,
            longitude: nil, 
            name: "Stadium Place Apartments",
            desc: "Close to the CLink",
            address_street: nil,
            address_city: nil,
            address_state: nil,
            address_zip: nil,
            address_country: nil,
          },
          { latitude: nil,
            longitude: nil, 
            name: "Yoga Studio",
            desc: "Right next door!",
            address_street: nil,
            address_city: nil,
            address_state: nil,
            address_zip: nil,
            address_country: nil,
          }
        ])

# Six Events
# events = Event.create([])

# ?? Checkins
# checkins = Checkin.create([])