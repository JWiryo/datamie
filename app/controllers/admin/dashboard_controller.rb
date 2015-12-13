class Admin::DashboardController < ApplicationController

  before_action :authorize

  def index
    @months=query_db("SELECT Distinct MONTH(Order_Date) From Orders;")
    @list_of_month_names = []
    @months.each do |m|
      @list_of_month_names << month_name(sprintf('%.2g', m["MONTH(Order_Date)"]))
    end

    @years=query_db("SELECT Distinct YEAR(Order_Date) From Orders;")
    @list_of_years = []
    @years.each do |y|
      @list_of_years << y["YEAR(Order_Date)"]
    end
  end

end
