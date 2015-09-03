require("bundler/setup")
Bundler.require(:default)
require("pry")

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @team = Team.all()
  erb(:index)
end

post("/teams") do
  name = params.fetch('name')
  win = params.fetch('win').to_i()
  loss = params.fetch('loss').to_i()
  draw = params.fetch('draw').to_i()
  Team.create({:name => name})
  redirect("/")
end

get("/team/:id") do
  id = params.fetch('id').to_i()
  @team = Team.find(id)
  @player = @team.players()
  erb(:view_team)
end

post("/team/:id/player") do
  # id = params.fetch('id').to_i()
  @team = Team.find(params.fetch('id').to_i())
  name = params.fetch("name")
  position = params.fetch("position")
  jersey_number = params.fetch("jersey_number")
  @team.players.create(:name => name, :position => position, :jersey_number => jersey_number)
  redirect("/team/#{@team.id()}")
end

patch("/team/:id/record") do
  @team = Team.find(params.fetch('id').to_i())
  win = params.fetch("win")
  loss = params.fetch("loss")
  draw = params.fetch("draw")
  @team.update(:win => win, :loss => loss, :draw => draw)
  redirect("/team/#{@team.id()}")
end
