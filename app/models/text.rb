class Text < ApplicationRecord

    def self.to_csv
        text = self.all
        headers = ["list"]
        csv = CSV.generate(headers: true) do |csv|
            csv << headers
            text.each do |text|
                row = []
                row.push(text.list)
                csv << row
            end
         end
    return csv
 end
end