class WorkingDaysController < ApplicationController
	before_action :authenticate_admin!

	def new
		# @working_day = WorkingDay.new
		@weekdays = WorkingDay.weekdays
	end

	def create
		@working_day = WorkingDay.new(working_day_params)
        @working_day.weekday = WorkingDay.weekdays[params[:working_day][:weekday].to_sym]
		@working_day.admin = current_admin
		if @working_day.save
            # flash[:success] = I18n.t("article.create_success_message")
            redirect_to working_days_path
        else
        	flash[:error] = @working_day.errors.full_messages
        	render :new
        end
    end

    def index
    	@working_days = current_admin.working_days
    end

    def delete
    end

    private

    def working_day_params
    	params.require(:working_day).permit(:date, :working_day)
    end
end
