require 'csv'
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.to_csv
    records = all
    CSV.generate do |csv|
      csv << column_names
      records.each do |record|
        csv << record.attributes.values_at(*column_names)
      end
    end
  end
end
