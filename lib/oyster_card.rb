# frozen_string_literal: true

# seems like rubocop wants a comment here?
class Oystercard
  attr_reader :balance

  MAXIMUM_LIMIT = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Exceeds maximum balance limit of #{MAXIMUM_LIMIT}" if (@balance + amount) > MAXIMUM_LIMIT

    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise 'Balance is below minimum required for journey' if @balance < MINIMUM_FARE

    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
  end
  
  private

  def deduct(amount)
    @balance -= amount
  end
end
