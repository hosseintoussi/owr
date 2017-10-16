require "rails_helper"

RSpec.describe WeatherService do
  describe "#by_random_geocode" do
    it "sends Owa gem by_geocode message with lon and lat" do
      expect(Owa::Current).to receive(:by_geocode).with(124,50)

      described_class.new.by_random_geocode(124,50)
    end

    it "sends Owa gem by_geocode message without specific lon and lat" do
      expect(Owa::Current).to receive(:by_geocode)

      described_class.new.by_random_geocode
    end
  end
end
