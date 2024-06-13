require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  "Hello World"
end



get '/dice/2/6' do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end

get '/dice/2/10' do 
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
  
  "<h1>2d10</h1>
   <p>#{outcome}</p>"
end

get '/dice/1/20' do
  first_die = rand(1..20)

  outcome = "You rolled a #{first_die}."
  
  "<h1>1d20</h1>
   <p>#{outcome}</p>"
end

get '/dice/5/4' do
  rolls = []
  sum = 0

  5.times do
    roll = rand(1..4)
    rolls << roll
    sum += roll
  end
  
  outcome = "You rolled #{rolls.join(', ')} for a total of #{sum}."
  
  "<h1>5d4</h1>
   <p>#{outcome}</p>"
end

get '/dice/3/8' do
  rolls = []
  sum = 0

  3.times do
    roll = rand(1..8)
    rolls << roll
    sum += roll
  end
  
  outcome = "You rolled #{rolls.join(', ')} for a total of #{sum}."
  
  "<h1>3d8</h1>
   <p>#{outcome}</p>"
end
