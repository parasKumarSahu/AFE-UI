class ApiController < ApplicationController


	def scrapper_create
		Scrapper.create(name: params[:name],
			email: params[:email],
			link: params[:link],
			message: params[:message],
			uploaded: "False",
			)
	    redirect_to request.referrer
	end	

	def upload_scrapper
		s = Scrapper.find_by(name: params[:name])
		s.uploaded = "True"
		s.save
	    redirect_to request.referrer
	end	

	def drop_scrapper
		s = Scrapper.find_by(name: params[:name])
		s.uploaded = "False"
		s.save
	    redirect_to request.referrer
	end	

end
