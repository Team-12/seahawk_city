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
          { latitude: nil,
            longitude: nil,
            name: "Stadium Place Apartments",
            desc: "Close to the CLink",
            address_street: "521 Stadium Place South",
            address_city: "Seattle",
            address_state: "WA",
            address_zip: "98104",
            address_country: "USA"
          },
          { latitude: nil,
            longitude: nil,
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
          }
        ])

# Six Events
events = Event.create([
          { user_id: User.first.id,
            location_id: Location.first.id,
            name: "VIP Super Bowl Party",
            desc: "You WISH you could get in.",
            date: "2015/02/01",
            start_time: "12:00",
            end_time: "8:00",
            photo_url: "http://img.scoop.it/MXyuXr6skFBcOBE45TuYnDl72eJkfbmt4t8yenImKBVvK0kTmF0xjctABnaLJIm9"
          }
        ])

# ?? Checkins
# checkins = Checkin.create([])