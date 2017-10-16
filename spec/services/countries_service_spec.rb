require "rails_helper"

RSpec.describe CountriesService do
  before do
    allow(ISO3166::Country).to receive(:translations).and_return({de: "germany"})
  end

  describe ".translations" do
    it "calls translations on the countries gem" do
      expect(described_class.translations).to eq({de: "germany"})
    end
  end

  describe ".translate" do
    it "returns the country name" do
      expect(described_class.translate(:de)).to eq("germany")
    end
  end
end
