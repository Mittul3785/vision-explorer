class TextController < ApplicationController
    
    def export
        text = Text.all
        respond_to do |format|
            format.csv do
                send_data(text.to_csv, { :filename => "text.csv"})
            end
        end
    end
end