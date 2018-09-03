class ConditionsController < ApplicationController
  def index
    @conditions = ConditionsService.analyze_conditions
  end
end
