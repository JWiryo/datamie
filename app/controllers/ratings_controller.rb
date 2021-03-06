class RatingsController < ApplicationController

  def create
    begin
      query_db("INSERT INTO Ratings (Product_ID, Username, Score, Date_Added, Description)
          SELECT "+params[:rating][:Product_ID].to_s+" AS Product_ID,
          '"+params[:rating][:Username].to_s+"' AS Username,
          "+params[:rating][:Score].to_s+" AS Score,
          '"+Time.now.strftime("%Y-%m-%d %H:%M:%S")+"' AS Date_Added,
          '"+params[:rating][:Description].to_s+"' AS Description;")
      redirect_to url_for(:controller => 'products', :action=>'show', :id => params[:rating][:Product_ID])
      flash[:success] = "Rating successfully posted."
    rescue Exception => e
      redirect_to :back
      flash[:danger] = e.message
    end
  end

  # def update
  #   @ratings = query_db("SELECT * FROM ratings WHERE Rating_ID = "+params[:id].to_s)
  #   if @ratings.any?
  #     query_db("UPDATE Ratings
  #         SET Description = "+params[:Description].to_s+",
  #         Score = "+params[:Score].to_s+",
  #         Date = "+Time.now.to_s+"
  #         WHERE B.Product_ID = "+params[:id].to_s+";")
  #     redirect_to url_for(:controller => 'products', :action=>'show', :id => params[:rating][:Product_ID])
  #     flash[:success] = "Rating successfully edited."
  #   end
  # end

end
