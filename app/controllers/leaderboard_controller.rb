class LeaderboardController < ApplicationController

  def index
    @employees = Employee.order("kudos_received desc").limit(5).active
  end

end
