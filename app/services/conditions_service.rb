class ConditionsService
  def self.analyze_conditions
    @conditions = HTTParty.get('https://boulder-tubing-api.herokuapp.com/conditions').parsed_response

    temperature = @conditions['temperature_f']
    weather     = @conditions['weather_condition']
    flow_rate   = @conditions['flow_rate_cfs']

    self.optimal_conditions(temperature, weather, flow_rate) ? "yes" : "no"
  end

  private

  def self.optimal_conditions(temperature, weather, flow_rate)
    self.optimal_temperature(temperature) && self.optimal_weather(weather) && self.optimal_flow_rate(flow_rate)
  end

  def self.optimal_temperature(temperature)
    temperature.to_i > 85
  end

  def self.optimal_weather(weather)
    good_weather = %w(cloudy mostly\ cloudy partly\ cloudy clear sunny fair hot)
    good_weather.include?(weather)
  end

  def self.optimal_flow_rate(flow_rate)
    flow_rate >= 40 && flow_rate <= 300
  end
end
