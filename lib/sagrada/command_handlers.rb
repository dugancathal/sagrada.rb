require_relative 'domain'

module Sagrada
  module CommandHandlers
    class CreateGameHandler
      attr_reader :game_repo
      def initialize(game_repo)
        @game_repo = game_repo
      end

      def handle(command)
        game = Sagrada::Domain::Game.new
        game_id = game_repo.next_id
        game.start(game_id, command.number_of_players)
        game_repo.save(game)
      end
    end
  end
end