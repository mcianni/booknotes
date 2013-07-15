class ScreenshotJob < Struct.new(:bookmark, :path)
  def perform
    script = File.expand_path('lib/get_screenshot.js')
   
    # Save a screenshot to the tmp_path, carrierwave will 
    # move it to its final destination 
    tmp_path = Phantomjs.run(script, bookmark.url, path)
    bookmark.screenshot = File.open(path)
    bookmark.save!
  end
end
