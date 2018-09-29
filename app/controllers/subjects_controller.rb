class SubjectsController < ApplicationController
	before_action :authenticate_admin!

	def new
	end

	def create
		@subject = Subject.new(subject_params)
		@subject.admin = current_admin
		if @subject.save
            # flash[:success] = I18n.t("article.create_success_message")
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

    private

    def subject_params
        params.require(:subject).permit(:name, :code)
    end
end
