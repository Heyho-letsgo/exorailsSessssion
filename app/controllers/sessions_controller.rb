class SessionsController < ApplicationController

    def new
    end
    
    def create
    user = User.find_by(email: params[:email])
        if user && user.authenticate(params:[:password])
            session[:user_id] = user.id
            flash[:succes] = 'Succesfull Logged In !'
            redirect_to '/contacts'
        else
            flash[:warning] = 'Invalid User Name or Password !'
            redirect_to '/login'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:succes] = 'Successfully Logged Out !'
        redirect_to '/login'
    end

end
