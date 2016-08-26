class LeaderboardController < ApplicationController

  def index
    @employees = Employee.for_leaderboard
  end

end
