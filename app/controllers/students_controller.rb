class StudentsController < ApplicationController
    before_action :authenticate_admin!

    def create
        @student = Student.new(student_params)
        @student.admin = current_admin
        if @student.save
            redirect_to students_path
        else
            flash[:error] = @student.errors.full_messages
            render :new
        end
    end

    def new
    end

    def edit
    end

    def destroy
        student = Student.find(params[:id])
        if student.admin == current_admin && student.destroy
            flash[:success] ='Student deleted successfully'
        else
            flash[:danger] ='Student deletion failed'
        end
        redirect_to students_url
    end

    def index
        @students = current_admin.students
    end

    private

    def student_params
        params.require(:student).permit(:name, :roll_no, :admission_no, :ktu_id)
    end
end
