class LogpageController < ApplicationController
  def production
    @logclass = 'Production'
    @content = `aha --no-header -f #{Rails.root.join('log', 'production.log')}`.strip
    render 'log-page'
  end

  def development
    @logclass = "Development"
    @content = `aha --no-header -f #{Rails.root.join('log', 'development.log')}`.strip
    render 'log-page'
  end

  def test
    @logclass = 'Test'
    @content = `aha --no-header -f #{Rails.root.join('log', 'production.log')}`.strip
    render 'log-page'
  end
end
