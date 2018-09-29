class StudentsController < ApplicationController
    before_action :authenticate_admin!

    def create
        @student = Student.new(student_params)
        @student.admin = current_admin
        if @student.save
            # flash[:success] = I18n.t("article.create_success_message")
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

    def delete
    end

    def index
        @students = current_admin.students
    end

    private

    def student_params
        params.require(:student).permit(:name, :roll_no, :admission_no, :ktu_id)
    end
end
