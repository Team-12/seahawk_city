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
# locations = Location.create([
#           {Space Needle},
#           {Russell Investments Center},
#           {Stadium Place Apartments},
#           {Yoga Studio}
#         ])

# Six Events
# events = Event.create([])

# ?? Checkins
# checkins = Checkin.create([])