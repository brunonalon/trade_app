# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tuscany = Community.create(name: 'Tuscany', city: 'Calgary')
brentwood = Community.create(name: 'Brentwood', city: 'Calgary')
sunnyside = Community.create(name: 'Sunnyside', city: 'Calgary')
downtown = Community.create(name: 'Downtown', city: 'Calgary')
tuscany_loc = Location.create(community_id: tuscany.id, latitude: 51.120330, longitude: -114.243909)
brentwood_loc = Location.create(community_id: brentwood.id, latitude: 51.098267, longitude: -114.132782)
sunnyside_loc = Location.create(community_id: sunnyside.id, latitude: 51.056066, longitude: -114.077691)
downtown_loc = Location.create(community_id: downtown.id, latitude: 51.047834, longitude: -114.059485)
bruno = User.create(name: 'Bruno', email: 'brunonalon2@gmail.com', location_id: brentwood_loc.id )
nalon = User.create(name: 'Nalon', email: 'nalon@gmail.com', location_id: tuscany_loc.id )
amaral = User.create(name: 'Amaral', email: 'amaral@gmail.com', location_id: sunnyside_loc.id )
jorge = User.create(name: 'Jorge', email: 'amaral@gmail.com', location_id: downtown_loc.id )
Item.create(name: 'mouse', description: 'Apple mouse G3...', user_id: bruno.id)
Item.create(name: 'computer', description: 'Something', user_id: bruno.id)
Item.create(name: 'Charger', description: 'Something2', user_id: bruno.id)
