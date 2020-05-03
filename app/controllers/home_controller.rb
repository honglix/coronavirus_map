class HomeController < ApplicationController
  def index
    @data = CoronaDatum.pluck(:country, :confirmed_cases)
  end

  def receive_data
    data = request.body.read
    data = JSON.parse(data)
    data["Countries"].each do |country|
      CoronaDatum.find_by(country: country["Country"]).update(confirmed_cases: country["TotalConfirmed"])
    end
  end

  def getData
    file = File.read("corona_data.json")
    file = JSON.parse(file)
    file["Countries"].each do |country| 
      CoronaDatum.create(country: country["Country"], confirmed_cases: country["TotalConfirmed"]) 
    end
  end
end

