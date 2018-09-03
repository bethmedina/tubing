class ConditionsService
  def initialize
    @conditions = HTTParty.get('https://boulder-tubing-api.herokuapp.com/conditions').parsed_response
  end

  def analyze_conditions
    temperature = @conditions['temperature_f']
    weather = @conditions['weather_condition']
    flow_rate = @conditions['flow_rate_cfs']

    optimal_temperature(temperature) && optimal_weather(weather) && optimal_flow_rate(flow_rate) ? "yes" : "no"
  end

  def optimal_temperature(temperature)
    temperature.to_i > 85
  end

  def optimal_weather(weather)
    good_weather = %w(cloudy mostly\ cloudy partly\ cloudy clear sunny fair hot)
    good_weather.include?(weather)
  end

  def optimal_flow_rate(flow_rate)
    flow_rate >= 40 && flow_rate <= 300
  end
end
