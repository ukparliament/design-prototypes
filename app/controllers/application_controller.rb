class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  	render layout: "pds_template"
  end

  def find_members
  	render layout: "pds_template"
  end

  def search_results
  	render layout: "pds_template"
  end

  def barebones
  	render layout: "pds_template"
  end

end
