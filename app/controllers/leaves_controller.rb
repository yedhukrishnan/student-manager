class LeavesController < ApplicationController
	before_action :authenticate_admin!
	
	def new
		@students = current_admin.students
	end

	def create
		@leaves = Leave.new(leave_params)
        date = leave_params[:date].to_date
        if date.on_weekday?
            @leaves.weekday = date.strftime('%A').downcase.to_sym
        else
            working_days = WorkingDay.where(date: date)
            if working_days.empty?
                flash[:error] = 'Given day is added as working day'
                render :new
                return
            end
            @leaves.weekday = working_days.first.weekday
        end
		if @leaves.save
            # flash[:success] = I18n.t("article.create_success_message")
            redirect_to leaves_path
        else
        	flash[:error] = @leaves.errors.full_messages
        	render :new
        end
    end

    def index
    	@leaves = current_admin.students.first.leaves.preload(:student)
    end

    def delete
    end

    private

    def leave_params
    	params.require(:leave).permit(:reason, :date, :student_id)
    end
end
