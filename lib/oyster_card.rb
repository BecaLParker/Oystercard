# frozen_string_literal: true

# seems like rubocop wants a comment here?
class Oystercard
  attr_reader :balance, :entry_station, :journeys

  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise "Exceeds maximum balance limit of #{MAXIMUM_LIMIT}" if (@balance + amount) > MAXIMUM_LIMIT

    @balance += amount
  end

  def in_journey?
    !@entry_station.nil?
  end

  def touch_in(station)
    raise 'Balance is below minimum required for journey' if @balance < MINIMUM_FARE

    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    add_journey(station)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def add_journey(exit_station)
    journeys << { entry_station: @entry_station, exit_station: exit_station }
  end
end
