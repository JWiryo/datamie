class UsersController < ApplicationController

  def index
    @client = Mysql2::Client.new(:database => "datamie", :host => "localhost", :username => "datamie", :password => "")
    @users = @client.query("SELECT * FROM users")
  end

  def show
    @edit_profile = query_db("SELECT Full_Name, Email, Gender, Age, Contact_No, Nationality FROM Users WHERE Username = '" +$current_user + "' ; " ).each(:as => :array)
    @edit_fullname = @edit_profile[0][0]
    @edit_email = @edit_profile[0][1]
    @edit_gender = @edit_profile[0][2]
    @edit_age = @edit_profile[0][3]
    @edit_contactnum = @edit_profile[0][4]
    @edit_nationality = @edit_profile[0][5]
  end

  def editprofile
  end

  def edit
  end

  def changepassword
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
      redirect_to root_url
      flash[:success] = "Registration Successful! Please Login to save your journey"
    rescue Exception => e
      redirect_to :back
      flash[:danger] = e.message
    end
  end

end
