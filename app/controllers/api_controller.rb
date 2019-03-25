class ApiController < ApplicationController
	def index
		@Price_infos = PriceInfo.all	
	end

	def add
		@new_entry=BillingInfo.new(:params);
		@new_entry.save();
	end
	def dashboard
		@Info= BillingInfo.where({email: current_user.email})
	end
end
