require 'spec_helper'
require_relative 'support/in_memory_game_repo'

RSpec.describe 'Sagrada' do
  it 'saves a game given a number of players' do
    repo = InMemoryGameRepo.new
    handler = Sagrada::CommandHandlers::CreateGameHandler.new(repo)

    handler.handle(Sagrada::Commands::CreateGame.new(3))

    games = repo.all

    expect(games.size).to eq 1
    expect(games[0].players.size).to eq 3
  end

  it 'requires that games have at least 2 players' do
    repo = InMemoryGameRepo.new
    handler = Sagrada::CommandHandlers::CreateGameHandler.new(repo)

    expect {
      handler.handle(Sagrada::Commands::CreateGame.new(1))
    }.to raise_error(Sagrada::Domain::ArgumentError)

    expect {
      handler.handle(Sagrada::Commands::CreateGame.new(2))
    }.to_not raise_error
  end
end