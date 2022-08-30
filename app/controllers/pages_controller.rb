class PagesController < ApplicationController
  skip_before_action :authenticate_them, only: [:home]

  def home
  end
end
