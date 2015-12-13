class Admin::StatsController < ApplicationController

  before_action :authorize

  def show
    @month_year= params[:month_year]
    @month_name= @month_year.split('_')[0]
    @year= @month_year.split('_')[1]
    @month_id=month_num(@month_name)
    @products = query_db("SELECT * FROM ( SELECT Product_ID, SUM(Quantity) AS amt_sold FROM Order_Items
				WHERE Order_Id IN (SELECT Order_Id FROM Orders
				WHERE MONTH(Order_Date)=#{@month_id} AND YEAR(Order_Date)=#{@year})
				GROUP BY Product_ID) A
inner join Products B
on A.Product_ID = B.Product_ID
Order By A.amt_sold DESC
LIMIT 5;")
  end

end
