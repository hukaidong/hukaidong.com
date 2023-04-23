class HomeController < ApplicationController
  def main; end

  def about
    base_path = Rails.root.join('public', 'uploads', 'kaidong_resume.pdf')
    @my_resume_path = "/uploads/kaidong_resume.pdf" if File.exist?(base_path)
  end


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
      redirect_to private_dlog_path
    when 'production_log'
      redirect_to private_plog_path
    when 'test_log'
      redirect_to private_tlog_path
    end

    # If the search term is not one of the above, render the search page
  end
end
