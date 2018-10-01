class SubjectsController < ApplicationController
	before_action :authenticate_admin!

	def new
	end

	def create
		@subject = Subject.new(subject_params)
		@subject.admin = current_admin
		if @subject.save
            redirect_to subjects_path
        else
        	flash[:error] = @subject.errors.full_messages
        	render :new
        end
    end

    def edit
    end

    def index
    	@subjects = current_admin.subjects
    end

    def destroy
        subject = Subject.find(params[:id])
        if subject.admin == current_admin && subject.destroy
            flash[:success] ='Subject deleted successfully'
        else
            flash[:danger] ='Subject deletion failed'
        end
        redirect_to subjects_url
    end

    private

    def subject_params
        params.require(:subject).permit(:name, :code)
    end
end
