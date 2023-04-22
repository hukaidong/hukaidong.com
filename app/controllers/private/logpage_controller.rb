class Private::LogpageController < ApplicationController
  def production
    fill_log_attrs('Production', 'production.log')
    render 'log-page'
  end

  def development
    fill_log_attrs('Development', 'development.log')
    render 'log-page'
  end

  def test
    fill_log_attrs('Test', 'test.log')
    render 'log-page'
  end

  private

  def fill_log_attrs(logclass, logfile)
    @logclass = logclass
    @content = `aha --no-header -f #{Rails.root.join('log', logfile)}`.strip
    @content = 'No log file found' if @content.empty?
  rescue Errno::ENOENT => e
    @content = e.full_message.gsub(/\e\[([;\d]+)?m/, '') # remove color codes
  end
end
