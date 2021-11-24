class MagicController < ApplicationController
 def text_form

    render({:template => "text/form.html.erb"})
 end

 def text_results
   # params.fetch("zebra")

    require "google/cloud/vision"
  
    image_annotator = Google::Cloud::Vision::ImageAnnotator.new
    
    uploaded_data = params.fetch("zebra")
  
    a_file = File.open(uploaded_data)
  
    vision_api_results = image_annotator.text_detection({ :image => a_file })
  
    @responses = vision_api_results.responses
  
    @first_result = vision_api_results.responses.at(0)

   render({:template => "text/results.html.erb"})
 end

end