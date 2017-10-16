class WeatherPresenter
  attr_reader :weather

  def initialize(weather)
    @weather = weather
  end

  def icon_class
    "wi wi-owm-#{weather.weather.first.id}"
  end

  def country
    CountriesService.translate(weather.sys.country)
  end

  def city
    weather.name
  end

  def description
    weather.weather.first.description.capitalize
  end

  def temp
    weather.main.temp
  end

  def humidity
    weather.main.humidity
  end

  def geocode
    "#{weather.coord.lon} #{weather.coord.lat}"
  end
end
