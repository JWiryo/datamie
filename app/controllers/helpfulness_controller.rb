class HelpfulnessController < ApplicationController

  def create
    begin
      query_db("INSERT INTO Helpfulness (Rating_ID, Username, Score)
          SELECT "+params[:helpfulness][:Rating_ID].to_s+" AS Rating_ID,
          '"+params[:helpfulness][:Username].to_s+"' AS Username,
          "+params[:helpfulness][:Score].to_s+" AS Score")
      redirect_to url_for(:controller => 'products', :action=>'show', :id =>"1")
      flash[:success] = "Helpfulness successfully posted."
    rescue Exception => e
      redirect_to :back
      flash[:danger] = e.message
    end
  end

  def update
  end


end
