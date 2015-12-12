class Admin::ProductsController < ApplicationController

  before_action :authorize

  def index
    @products = query_db("SELECT * FROM Products;")
  end

  def new
  end

  def create
    begin
      query_db("INSERT INTO Products (Product_Name, Stock_Qty, Price, Date_Added)
        VALUES('"+ params[:products][:name].to_s+ "',
          '" +params[:products][:qty].to_s+ "',
          '" +params[:products][:price].to_s+ "',
          '" +Time.now.strftime("%Y-%m-%d %H:%M:%S")+ "' );")
      redirect_to url_for(:controller => 'admin/products', :action=>'index')
      flash[:success] = "New product successfully added."
    rescue Exception => e
      redirect_to :back
      flash[:danger] = e.message
    end
  end

  def edit
    @edit_product = query_db("SELECT Product_Name, Stock_Qty, Price FROM Products WHERE Product_ID = '" + params[:id] + "' ; " ).each(:as => :array)
    @edit_name = @edit_product[0][0]
    @edit_qty = @edit_product[0][1]
    @edit_price = @edit_product[0][2]
  end

  def update
    begin
      @new_name = params[:products][:name]
      @new_qty = params[:products][:qty]
      @new_price = params[:products][:price]
      query_db("UPDATE Products SET
        Product_Name='#{@new_name}',
        Stock_Qty='#{@new_qty}',
        Price='#{@new_price}'
        WHERE Product_ID='#{params[:id]}';")
      redirect_to url_for(:controller => 'admin/products', :action=>'index')
      flash[:success] = "New Product Successfully Added"
    rescue Exception => e
      redirect_to :back
      flash[:danger] = e.message
    end
  end

end
