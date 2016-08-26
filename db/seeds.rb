# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
em1 = Employee.create([
                          {
                              username: 'alex',
                              email: 'alex@abc.com',
                              first_name: 'Alex',
                              last_name: 'Duan',
                              password: 'alexrules',
                              password_confirmation: 'alexrules',
                              is_admin: true,
                              is_active: true,
                              kudo_balance: 10,
                              kudos_received: 0
                          },
                          {
                              username: 'max',
                              email: 'max@abc.com',
                              first_name: 'Max',
                              last_name: 'Brailovsky',
                              password: 'maximumax',
                              password_confirmation: 'maximumax',
                              is_admin: false,
                              is_active: true,
                              kudo_balance: 10,
                              kudos_received: 0
                          },
                          {
                              username: 'chris',
                              email: 'chris@abc.com',
                              first_name: 'Chris',
                              last_name: 'Sterritt',
                              password: 'letmein',
                              password_confirmation: 'letmein',
                              is_admin: false,
                              is_active: true,
                              kudo_balance: 10,
                              kudos_received: 0
                          }
                      ])
