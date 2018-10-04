class AttendanceController < ApplicationController
	before_action :authenticate_admin!

	def index
		students = current_admin.students
		@subjects = current_admin.subjects

		@attendances = students.collect do |student|
			attendance = Attendance.new(attendance_params)
			attendance.student = student
			attendance.generate current_admin
			attendance
		end
		# attendance = Attendance.new(attendance_params)
		# attendance.student = student

		# attendance.generate current_admin

		puts @attendances.last.total_hours
		puts @attendances.last.student_hours
		puts @attendances.last.percentage
	end

	def new
		@students_present = current_admin.students.present?
		puts @students_present
	end

	private

	def attendance_params
		params.require(:attendance).permit(:start_date, :end_date)
	end
end
