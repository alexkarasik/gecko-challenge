class Customer < ApplicationRecord
  def self.import(file)
    first_line = true
    headers = []

    # read file content
    file = File.open(file.path)

    file.each do |line|
      row = {}

      # first line will be csv header
      unless first_line
        # split to get each column value seperated
        parts = line.split(',')

        # create the row hash with key as csv header and value as current row's content'
        row[headers[0]] = parts[0]
        row[headers[1]] = parts[1]
        row[headers[2]] = parts[2]
        # all after first 3 columns are of JSON
        indexes_arr = [3, parts.length]
        range = Range.new(*indexes_arr)
        puts "amal debugging ---------------"
	puts parts[range].join ","
        row[headers[3]] = JSON.parse(parts[range].join ",")

        puts row

        Customer.create!(
          object_id: row['object_id'],
          object_type: row['object_type'],
          object_timestamp: row['timestamp'],
          object_changes: row['object_changes']
        )
      else
        first_line = false
        # lets save csv header names to create row hash. The row hash index is csv header name
        headers = line.strip.split(',')
      end
    end
  end
end
