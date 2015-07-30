class PagesController < ApplicationController

	def home
		@appointment = Appointment.new
	end

	def confirmation
	end

end
