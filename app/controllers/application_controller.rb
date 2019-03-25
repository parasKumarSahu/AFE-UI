class ApplicationController < ActionController::Base
	@Price_infos = PriceInfo.all
	before_action :authenticate_user!	
end

