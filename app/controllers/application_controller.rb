class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout "pds_template"

  def index

  end

  def find_members

  end

  def search_results

  end

  def barebones

  end

end
