class ExportController < ApplicationController
  before_action :admin_access
  def export_db
    Rails.application.eager_load!
    ApplicationRecord.subclasses.each do |model|
      file = "#{Rails.root}/backup/#{model}-#{DateTime.now.strftime("%Y%m%d%H%M")}.csv"
      File.write(file, model.to_csv)
    end
    redirect_to root_url
  end
end
