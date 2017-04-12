# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


author1 = Author.create(email: "email1@email.pl")
author2 = Author.create(email: "email2@email.pl")
author3 = Author.create(email: "email3@email.pl")


til1 = Til.create(description: "Ruby's `present` method checks for being not nil and not empty", author: author1)
til2 = Til.create(description: "This tip includes \n`some really cool markdown!` I wonder \n
# why", author: author2)
til3 = Til.create(description: "Sometimes `markdown` gets me", author: author3)
til4 = Til.create(description: "Did you know 1+1 could equal 2?", author: author3)
