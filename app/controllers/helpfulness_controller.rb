class HelpfulnessController < ApplicationController

  before_action :prepare_product, only: [:create]

  def create
    begin
      query_db("INSERT INTO Helpfulness (Rating_ID, Username, Score)
          SELECT "+params[:helpfulness][:Rating_ID].to_s+" AS Rating_ID,
          '"+params[:helpfulness][:Username].to_s+"' AS Username,
          "+params[:helpfulness][:Score].to_s+" AS Score")
      redirect_to url_for(:controller => 'products', :action=>'show', :id =>@product_id)
      flash[:success] = "Helpfulness successfully posted."
    rescue Exception => e
      redirect_to :back
      flash[:danger] = e.message
    end
  end

  def update
  end

  private

  def prepare_product
    @rating_id = params[:helpfulness][:Rating_ID]
    @product = query_db("SELECT Product_ID FROM Ratings WHERE rating_id = "+@rating_id+";")
    @product_id = @product.first["Product_ID"]
  end

  end

end
