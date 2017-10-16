class WeatherController < ApplicationController
  before_action :set_countries

  def index
    weather = WeatherService.new.by_random_geocode
    @weather = WeatherPresenter.new(weather)
  end

  def search
    begin
      weather = WeatherService
        .new.by_city(params["city"], params["country"]["name"])

      @weather = WeatherPresenter.new(weather)
    rescue Owa::OwaErrors => e
      flash.now[:error] = e.message
    end

    render :index
  end

  private

  def set_countries
    @countries = CountriesService.translations
  end
end
