class PagesController < ApplicationController
  skip_before_action :authenticate_them, only: [:home]

  def home
  end

  def test
    @project = Project.first
    @organization = Organization.find(1)
  end
end
