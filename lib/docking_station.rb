require_relative 'bike'

class DockingStation
  DEFAULT_CAPICITY = 20
  attr_reader :bike, :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end
  private
  def full?
  @bikes.length >= DEFAULT_CAPICITY ? true : false
  end

  def empty?
    @bikes.empty?
  end
end
