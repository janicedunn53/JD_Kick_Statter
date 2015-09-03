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

get("/player/:id") do
  player_id = params.fetch("id").to_i()
  @player = Player.find(player_id)
  erb(:player)
end

get("/player/:id/stats") do
  @player = Player.find(params.fetch("id").to_i)
  erb(:add_stats)
end

post("/player/:id") do
  @player = Player.find(params.fetch("id").to_i())
  k_hits = params.fetch("k_hits")
  at_bats = params.fetch("at_bats")
  singles = params.fetch("singles")
  doubles = params.fetch("doubles")
  triples = params.fetch("triples")
  k_home_runs = params.fetch("k_home_runs")
  k_runs = params.fetch("k_runs")
  rbi = params.fetch("rbi")
  k_walks = params.fetch("k_walks")
  k_strikeouts = params.fetch("k_strikeouts")
  @player.kickers.create(:hits => k_hits, :at_bats => at_bats, :singles => singles, :doubles => doubles, :triples => triples, :home_runs => k_home_runs, :runs => k_runs, :rbi => rbi, :walks => k_walks, :strikeouts => k_strikeouts)
  redirect("player/#{@player.id}")
end

# post("/player/:id") do
#   @player = Player.find(params.fetch("id").to_i)
#   batters_faced = params.fetch("batters_faced")
#   wins = params.fetch("wins")
#   losses = params.fetch("losses")
#   earned_runs = params.fetch("earned_runs")
#   p_runs = params.fetch("p_runs")
#   p_hits = params.fetch("p_hits")
#   p_home_runs = params.fetch("p_home_runs")
#   p_walks = params.fetch("p_walks")
#   p_strikeouts = params.fetch("p_strikeouts")
#   wild_pitch = params.fetch("wild_pitch")
#   saves = params.fetch("saves")
#   strikes = params.fetch("strikes")
#   balls = params.fetch("balls")
#   @player.pitchers.create(:batters_faced => batters_faced, :wins => wins, :losses => losses, :earned_runs => earned_runs, :runs => p_runs, :hits => p_hits, :home_runs => p_home_runs, :walks => p_walks, :strikeouts => p_strikeouts, :wild_pitch => wild_pitch, :saves => saves, :strikes => strikes, :balls => balls, :pitches => pitches)
#   redirect("player/#{@player.id}")
# end

# post("/player/:id") do
#   @player = Player.find(params.fetch("id").to_i())
#   innings_played = params.fetch("innings_played")
#   put_outs = params.fetch("put_outs")
#   fielding_errors = params.fetch("fielding_errors")
#   throwing_errors = params.fetch("throwing_errors")
#   @player.fielders.create(:innings_played => innings_played, :put_outs => put_outs, :fielding_errors => fielding_errors, :throwing_errors => throwing_errors)
#   redirect("player/#{@player.id}")
# end
