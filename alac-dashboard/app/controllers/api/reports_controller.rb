module Api
  class ReportsController  < ApplicationController
    include MainHelper
    
    def index
      reports_quantity = get_index_reports.count

      return render json: {quantity: reports_quantity}
    end
  end
end