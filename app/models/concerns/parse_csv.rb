require 'csv'

CSV::HeaderConverters[:rename_headers] = lambda do |header|
  return :first_name if header == 'fname'
  return :last_name if header == 'lname'
  return :zip_code if header == 'zip'
  header.to_sym
end

module ParseCSV
  extend ActiveSupport::Concern

  module ClassMethods

    def from_csv csv_path
      customers = []
      CSV.foreach(csv_path, headers: true, header_converters: :rename_headers) do |line|
        customers.push line.to_hash
      end

      customers
    end

  end
end
