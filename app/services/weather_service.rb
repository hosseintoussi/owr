class WeatherService
  def by_city(city, country=nil)
    Rails.cache.fetch("#{city}-#{country}", expires_in: 5.minutes) do
      current.by_city(city, country)
    end
  end

  def by_random_geocode(longitude=nil, latitude=nil)
    lon = longitude || random_lon
    lat = latitude || random_lat

    current.by_geocode(lon, lat)
  end

  private

  def random_lon
    rand(-180..180)
  end

  def random_lat
    rand(-90..90)
  end

  def current
    Owa::Current
  end
end
