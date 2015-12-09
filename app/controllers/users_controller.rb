class UsersController < ApplicationController

  def index
    @client = Mysql2::Client.new(:database => "datamie", :host => "localhost", :username => "datamie", :password => "")
    @users = @client.query("SELECT * FROM users")
  end

  def show
  end

  def signupform
  end

  def signup
  	@signup_username = params[:users][:username]
	@signup_password = params[:users][:password]
	@signup_fullname = params[:users][:fullname]
	@signup_email = params[:users][:email]
	@signup_gender = params[:users][:gender]
	@signup_age = params[:users][:age]
	@signup_contactnum = params[:users][:contactnum]
	@signup_nationality = params[:users][:nationality]
	@signup_isadmin = params[:users][:isadmin]
	begin
      query_db("INSERT INTO users (Username, Password, Full_Name, Email, Gender, Age, Contact_No, Nationality, Is_Admin)
      	VALUES ('"+ @signup_username.to_s() +"', 
      		'" + @signup_password.to_s() + "', 
      		'" + @signup_fullname.to_s() + "', 
      		'" + @signup_email.to_s() + "', 
      		'" + @signup_gender.to_s() + "', 
      		'" + @signup_age.to_s() + "', 
      		'" + @signup_contactnum.to_s() + "', 
      		'" + @signup_nationality.to_s() + "', 
      		'" + @signup_isadmin.to_s() + "' );" )
      # query_db("INSERT INTO users (Username, Password, Full_Name, Email, Gender, Age, Contact_No, Nationality)
      # 	VALUES ("+ @signup_username +", 
      # 		" + @signup_password + ", 
      # 		" + @signup_fullname + ", 
      # 		" + @signup_email + ", 
      # 		" + @signup_gender + ", 
      # 		" + @signup_age + ", 
      # 		" + @signup_contactnum + ", 
      # 		" + @signup_nationality + " );" )

      redirect_to root_url
      flash[:success] = "Registration Successful! Please Login to Start Shopping"
    rescue Exception => e
      redirect_to :back
      flash[:danger] = e.message
    end
  end

end
