module Sagrada
  module Commands
    class CreateGame
      attr_reader :number_of_players
      def initialize(number_of_players)
        @number_of_players = number_of_players
      end
    end
  end
end