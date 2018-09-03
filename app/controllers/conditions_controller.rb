class ConditionsController < ApplicationController
  def index
    @conditions = get_conditions
  end

  def get_conditions
    @conditions = ConditionsService.analyze_conditions
  end
end
