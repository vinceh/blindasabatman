class AdminsController < ApplicationController
	protect_from_forgery

	before_filter :authed, :except => :login

	def login

		if session[:admin]
			redirect_to :action => :controlpanel
		end

		if request.post?
			admin = Admin.where(:username => params[:admin][:username]).first

			if admin != nil && check_password(admin, params[:admin][:password])
				session[:admin] = admin.username
				redirect_to :action => :controlpanel
			else
				redirect_to :controller => :main
			end
		end
	end

	def logout

		reset_session
		redirect_to :controller => :main
	end

	def controlpanel

		@images = Batimage.all
	end

	def show

		bat = Batimage.find_by_id(params[:id])
		bat.show = true
		bat.save

		redirect_to :action => :controlpanel
	end

	def hide
		bat = Batimage.find_by_id(params[:id])
		bat.show = false
		bat.save

		redirect_to :action => :controlpanel
	end

	protected

	def check_password(admin, password)
		return admin.hashed_password == Admin.encrypt(password, admin.salt)
	end
end
