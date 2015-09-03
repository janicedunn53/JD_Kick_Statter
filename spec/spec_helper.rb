ENV['RAKE_ENV'] = 'test'

require('bundler/setup')
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    Team.all().each() do |team|
      team.destroy()
    end

    Roster.all().each() do |roster|
      roster.destroy()
    end

    Player.all().each() do |player|
      player.destroy()
    end

    Kicker.all().each() do |kicker|
      kicker.destroy()
    end

    Pitcher.all().each() do |pitcher|
      pitcher.destroy()
    end

    Fielder.all().each() do |fielder|
      fielder.destroy()
    end
  end
end
