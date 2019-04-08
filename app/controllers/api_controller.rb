require 'net/http'
require 'json'

class ApiController < ApplicationController


	def scrapper_create
		Scrapper.create(name: params[:name],
			email: current_user.email,
			link: params[:link],
			message: params[:message],
			uploaded: "False",
			date: Date.today,
			)
	    redirect_to request.referrer
	end	

	def upload_scrapper
		s = Scrapper.find_by(name: params[:name])
		s.uploaded = "True"
		s.save

		puts "Uploading scarpper..........."

	    begin
	        uri = URI('http://ec2-18-223-126-21.us-east-2.compute.amazonaws.com:4000/')
	        http = Net::HTTP.new(uri.host, uri.port)
	        req = Net::HTTP::Post.new(uri.path)
	        req.set_form_data({Name: s.name, Link: s.link, Do: "add"})
	        res = http.request(req)
	        puts "response #{res.body}"
	    rescue => e
	        puts "failed #{e}"
	    end

	    redirect_to request.referrer

	end	

	def drop_scrapper
		s = Scrapper.find_by(name: params[:name])
		s.uploaded = "False"
		s.save

		puts "Dropping scarpper..........."

	    begin
	        uri = URI('http://ec2-18-223-126-21.us-east-2.compute.amazonaws.com:4000/')
	        http = Net::HTTP.new(uri.host, uri.port)
	        req = Net::HTTP::Post.new(uri.path)
	        req.set_form_data({Name: s.name, Link: s.link, Do: "delete"})
	        res = http.request(req)
	        puts "response #{res.body}"
	    rescue => e
	        puts "failed #{e}"
	    end

	    redirect_to request.referrer
	end	

	def purchase
		s = Scrapper.find_by(name: params[:name])

		puts "Creating API account..........."

	    begin
	        uri = URI('http://ec2-18-223-126-21.us-east-2.compute.amazonaws.com:3000/users')
	        http = Net::HTTP.new(uri.host, uri.port)
	        req = Net::HTTP::Post.new(uri.path)
	        req.set_form_data({name: s.name, username: params[:plan],
	        	email: current_user.email, password: current_user.id.to_str})
	        res = http.request(req)
	        puts "response #{res.body}"
	    rescue => e
	        puts "failed #{e}"
	    end

		puts "Logging In..........."

		json_res = ""

	    begin
	        uri = URI('http://ec2-18-223-126-21.us-east-2.compute.amazonaws.com:3000/auth/login')
	        http = Net::HTTP.new(uri.host, uri.port)
	        req = Net::HTTP::Post.new(uri.path)
	        req.set_form_data({email: current_user.email, password: current_user.id.to_str})
	        res = http.request(req)
	        json_res = JSON.parse(res.body)
	        puts "response #{res.body}"
	    rescue => e
	        puts "failed #{e}"
	    end

	    Payment.create(scrapper: s, plan: params[:plan],
	    	purchase_date: Date.today, expiry_date: json_res["exp"],
	    	token: json_res["token"], email: current_user.email)

		redirect_to "/api/dashboard"
	end	

end
