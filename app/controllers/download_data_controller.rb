class DownloadDataController < ApplicationController
    def download_data

        d = Disaster.all
        respond_to do |format|
            format.html
            format.csv { send_data d.to_csv, filename: "Disaster_as_of-#{Date.today}.csv" }
            # format.xls
            #format.json { render :show, status: :ok }
        end
    end
end
