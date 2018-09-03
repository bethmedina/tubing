class ConditionsController < ApplicationController
  def index
    @conditions = ConditionsService.analyze_conditions
  end

  # def get_conditions
  #   @conditions = ConditionsService.analyze_conditions
  # end
end
