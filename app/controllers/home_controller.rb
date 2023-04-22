class HomeController < ApplicationController
  def main; end

  def search
    # Get the search term from the query string
    @search_term = params[:query] || ''

    case @search_term
    when '', 'home'
      redirect_to root_path
    when 'about'
      redirect_to about_path
    when 'contact'
      redirect_to contact_path
    when 'development_log'
      redirect_to development_log_path
    when 'production_log'
      redirect_to production_log_path
    when 'test_log'
      redirect_to test_log_path
    end

    # If the search term is not one of the above, render the search page
  end
end
