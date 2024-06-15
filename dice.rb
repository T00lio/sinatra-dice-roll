require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!("0.0.0.0/0.0.0.0")

get("/") do
  erb(:elephant)
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_six, { layout: :wrapper })
end

get("/dice/2/10") do
  @die = rand(1..20)

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  erb(:two_ten)
end

get("/dice/1/20") do
  first_die = rand(1..20)

  @outcome = "You rolled a #{first_die}."

  erb(:one_twenty, { layout: :wrapper })
end

get("/dice/5/4") do
  rolls = []
  sum = 0

  5.times do
    roll = rand(1..4)
    rolls << roll
    sum += roll
  end

  @outcome = "You rolled #{rolls.join(", ")} for a total of #{sum}."
  erb(:five_four, { layout: :wrapper })
end

get("/dice/3/8") do
  rolls = []
  sum = 0

  3.times do
    roll = rand(1..8)
    rolls << roll
    sum += roll
  end

  @outcome = "You rolled #{rolls.join(", ")} for a total of #{sum}."
  erb(:three_eight, { layout: :wrapper })
end
