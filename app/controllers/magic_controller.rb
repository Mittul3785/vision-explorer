class MagicController < ApplicationController
 def text_form

    render({:template => "text/form.html.erb"})
 end

 def text_results
   # params.fetch("zebra")
   # Parameters: {"vscodeBrowserReqId"=>"1637979480643"}
   # Parameters: {"zebra"=>#<ActionDispatch::Http::UploadedFile:0x00007f7389684d50 @tempfile=#<Tempfile:/tmp/RackMultipart20211127-1995-nktpqu.jpg>, @original_filename="pid exa (2).jpg", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"zebra\"; filename=\"pid exa (2).jpg\"\r\nContent-Type: image/jpeg\r\n">}


    require "google/cloud/vision"
  
    image_annotator = Google::Cloud::Vision::ImageAnnotator.new
    
    uploaded_data = params.fetch("zebra")
  
    a_file = File.open(uploaded_data)
  
    vision_api_results = image_annotator.text_detection({ :image => a_file })
  
    @responses = vision_api_results.responses
  
    @first_result = vision_api_results.responses.at(0)

   # @parsed_data = JSON.parse(@first_result)

    # .class = Google::Protobuf::RepeatedField
    # JSON.parse("")
    # CSV.parse("")


   render({:template => "text/results.html.erb"})
 end

end