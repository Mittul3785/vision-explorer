class TextController < ApplicationController
    
    def export

        require "google/cloud/vision"
  
        image_annotator = Google::Cloud::Vision::ImageAnnotator.new
        
        uploaded_data = params.fetch("zebra")
      
        a_file = File.open(uploaded_data)
      
        vision_api_results = image_annotator.text_detection({ :image => a_file })
      
        @responses = vision_api_results.responses
      
        @first_result = vision_api_results.responses.at(0)
    
        headers = ["description"]
        csv = CSV.generate(headers: true) do |csv|
            csv << headers
            @first_result.text_annotations.each_with_index do |text_annotation, index| 
             x = text_annotation['description'].to_s
              # text.each do |text|
                row = []
                row.push(x)
                csv << row
            end
         end
    
       # @parsed_data = JSON.parse(@first_result)
    
        # .class = Google::Protobuf::RepeatedField
        # JSON.parse("")
        # CSV.parse("")
    
        respond_to do |format|
          format.html do
            render({:template => "text/results.html.erb"})
          end
          format.csv do
              send_data(csv, { :filename => "text.csv"})
          end
      end
     #  render({:template => "text/results.html.erb"})
     end
end