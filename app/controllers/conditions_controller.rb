class ConditionsController < ApplicationController
  def index
    @conditions = get_conditions
  end

  def get_conditions
    @conditions = ConditionsService.new.analyze_conditions
  end
end
