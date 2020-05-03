class HomeController < ApplicationController
  def index
    @data = CoronaDatum.pluck(:country, :confirmed_cases)
  end


  def getData
    file = File.read("corona_data.json")
    file = JSON.parse(file)
    file["Countries"].each do |country| 
      CoronaDatum.create(country: country["Country"], confirmed_cases: country["TotalConfirmed"]) 
    end
  end
end

