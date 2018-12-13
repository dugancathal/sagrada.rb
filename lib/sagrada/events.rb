module Sagrada
  module Events
    class CreateGameEvent
      attr_reader :game_id, :number_of_players

      def initialize(game_id, number_of_players)
        @game_id, @number_of_players = game_id, number_of_players
      end
    end
  end
end