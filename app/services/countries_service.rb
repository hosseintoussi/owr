class CountriesService
  def self.translations
    ISO3166::Country.translations
  end

  def self.translate(country)
    translations[country]
  end
end

