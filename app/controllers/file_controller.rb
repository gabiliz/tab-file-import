class FileController < ApplicationController
    require 'csv'
    before_action :get_data, only: [:create]
    before_action :set_amounts, only: [:home]

    def index; end

    def create
        service.create_data(data: @data)
    end

    def home; end

    private 

    def get_data
        @data = CSV.open(params[:file], headers: :first_row, col_sep: "\t" ).map(&:to_h)
    end

    def set_amounts
        @last_total_amount = TotalAmount.first.last_total_amount 
        @all_total_amount = TotalAmount.first.all_total_amount
    end
    
    def service
        @service = FileService.new
    end

end
