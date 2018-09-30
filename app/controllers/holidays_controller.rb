class HolidaysController < ApplicationController
	before_action :authenticate_admin!

	def new
	end

	def create
		@holiday = Holiday.new(holiday_params)
        @holiday.admin = current_admin
        if @holiday.save
            # flash[:success] = I18n.t("article.create_success_message")
            redirect_to holidays_path
        else
            flash[:error] = @holiday.errors.full_messages
            render :new
        end
	end

	def index
		@holidays = current_admin.holidays
	end

	def delete
	end

	private

	def holiday_params
		params.require(:holiday).permit(:date, :occasion)
	end
end
