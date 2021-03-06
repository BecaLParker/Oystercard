# frozen_string_literal: true

# rubocop seems to want a comment here?
class Station
  attr_reader :zone, :name

  def initialize(name, zone)
    @name = name
    @zone = zone
  end
end
