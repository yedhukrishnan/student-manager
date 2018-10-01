class WorkingDaysController < ApplicationController
	before_action :authenticate_admin!

	def new
		# @working_day = WorkingDay.new
		@weekdays = WorkingDay.weekdays
	end

	def create
		@working_day = WorkingDay.new(working_day_params)
		@working_day.admin = current_admin
		if @working_day.save
            redirect_to working_days_path
        else
        	flash[:error] = @working_day.errors.full_messages
        	render :new
        end
    end

    def index
    	@working_days = current_admin.working_days
    end

    def destroy
        working_day = WorkingDay.find(params[:id])
        if working_day.admin == current_admin && working_day.destroy
            flash[:success] ='Working day deleted successfully'
        else
            flash[:danger] ='Working day deletion failed'
        end
        redirect_to working_days_url
    end

    private

    def working_day_params
    	params.require(:working_day).permit(:date, :weekday)
    end 
end
