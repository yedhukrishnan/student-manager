class LeavesController < ApplicationController
	before_action :authenticate_admin!
	
	def new
		@students = current_admin.students
	end

	def create
		@leaves = Leave.new(leave_params)
        date = leave_params[:date].to_date
        if date && date.on_weekday?
            @leaves.weekday = date.strftime('%A').downcase.to_sym
        else
            working_days = WorkingDay.where(date: date)
            if working_days.empty?
                flash[:error] = 'Given day is not added as working day'
                render :new
                return
            end
            @leaves.weekday = working_days.first.weekday
        end
		if @leaves.save
            redirect_to leaves_path
        else
        	flash[:error] = @leaves.errors.full_messages
        	render :new
        end
    end

    def index
        @students = current_admin.students
        @current_student = @students.first
        if params[:student]
            student_id = params[:student][:student_id]
            @current_student = @students.find(student_id)
        end
        @leaves = @current_student.leaves.preload(:student) unless @students.empty?
    end

    def destroy
        leave = Leave.find(params[:id])
        if leave.admin == current_admin && leave.destroy
            flash[:success] ='Leave deleted successfully'
        else
            flash[:danger] ='Leave deletion failed'
        end
        redirect_to leaves_url
    end

    private

    def leave_params
    	params.require(:leave).permit(:reason, :date, :student_id)
    end
end
