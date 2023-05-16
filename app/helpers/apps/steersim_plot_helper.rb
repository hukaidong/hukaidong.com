module Apps::SteersimPlotHelper
  def inline_image_tag(data, **options)
    image_type = options.delete(:type) || "image/png"
    image_tag("data:#{image_type};base64,#{Base64.strict_encode64(data)}", **options)
  end
end
