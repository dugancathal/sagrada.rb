module Sagrada
  module Domain
    class InvalidOperationError < RuntimeError; end
    class ArgumentError < ArgumentError; end

    class Game
      attr_reader :changes, :id, :players

      def initialize()
        @changes = []
      end

      def loads_from_history(events)
        events.each {|event| apply_change(event, false)}
      end

      def mark_changes_committed
        @changes = []
      end

      def start(id, number_of_players)
        raise ArgumentError.new("need at least 2 players, had: #{number_of_players}") if number_of_players < 2
        apply_change(Sagrada::Events::CreateGameEvent.new(id, number_of_players))
      end

      def apply(event)
        case event
        when Sagrada::Events::CreateGameEvent
          @players = event.number_of_players.times.map { |i| Player.new("Player: #{i}")}
        else
          raise "Unrecognized event: #{event}"
        end
      end

      private

      def apply_change(event, is_new = true)
        apply(event)
        changes << event if is_new
      end
    end

    class Player < Struct.new(:name)

    end
  end
end