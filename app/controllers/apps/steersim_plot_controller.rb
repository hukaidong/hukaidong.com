class Apps::SteersimPlotController < ApplicationController
  def main
  end

  def upload
    pp params
    unless params[:file]
      raise 'should have a file'
      redirect_to apps_steersim_plot_main_path
      return
    end

    uploaded_file = params[:file].tempfile.open
    data = StringIO.new
    data.set_encoding("ASCII-8BIT")

    steersim_bin = Steersuite::SteersimResult.from_file(uploaded_file)
    @image_data = Dir.mktmpdir do |dir|
      plot_target = File.join(dir, "plot.png")
      Steersuite::SteersimPlot.plot_scenario(steersim_bin, plot_target)
      File.read(plot_target, mode: "rb")
    end

    Thread.current[uploaded_file.hash.to_s] = @image_data
    session[:data] = uploaded_file.hash.to_s

    respond_to do |format|
      format.turbo_stream
      format.json { render json: { content: (render_to_string inline: "<%= inline_image_tag @image_data %>") } }
      format.html { redirect_to apps_steersim_plot_show_path }
    end
  end

  def show
    if session[:data] && Thread.current.key?(session[:data])
      puts "found data"
      @result = Thread.current[session[:data]]
    else
      render plain: "No data found"
    end
  end

end
