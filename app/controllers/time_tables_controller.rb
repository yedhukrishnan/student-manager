class TimeTablesController < ApplicationController
	before_action :authenticate_admin!

	def new
		@subjects = current_admin.subjects
		@weekdays = WorkingDay.weekdays
		@time_table = TimeTable.new(table: {
			monday: { project: 0, seminar: 0, dvp: 0, hpc: 0 },
			tuesday: { project: 0, seminar: 0, dvp: 0, hpc: 0 },
			weekday: { project: 0, seminar: 0, dvp: 0, hpc: 0 },
			thursday: { project: 0, seminar: 0, dvp: 0, hpc: 0 },
			friday: { project: 0, seminar: 0, dvp: 0, hpc: 0 }
		})
		puts @time_table.table['monday']['dvp']
	end

	def create
		@time_table = TimeTable.new
		# Close your eyes if you don't wanna see hacks!
		w = WorkingDay.weekdays.keys
		s = current_admin.subjects.map(&:name).map(&:downcase)
		t = time_table_params[:table_string].split
		z = w.zip(t)
		@time_table.table = Hash[z.collect { |k, v| [k, Hash[s.zip(v.split(',').map(&:to_i))]] }]
		@time_table.admin = current_admin
		if @time_table.save
			render :index
		end
	end

	def index
		@subjects = current_admin.subjects.map(&:name)
		@weekdays = WorkingDay.weekdays.keys.map(&:to_s)
		@time_table = current_admin.time_table.table
		puts @subjects
		puts @weekdays
	end

	private

	def time_table_params
		params.require(:time_table).permit(:table_string)
	end
end
