require "docking_station"

describe DockingStation do

  describe 'initialization' do
    subject {DockingStation.new}
    let (:bike) {Bike.new}
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect {subject.dock(bike)}.to raise_error 'Docking station full'
  end
  end

  describe '#dock' do
    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end
    it 'raises an error when full' do
      subject.capacity.times {subject.dock(Bike.new)}
      expect {subject.dock(Bike.new)}.to raise_error "Docking station full"

    end
  end

  describe '#release_bike' do
    it 'raises an error when no bikes are available' do
      expect{subject.release_bike}.to raise_error "No bikes available"
    end
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end
end
