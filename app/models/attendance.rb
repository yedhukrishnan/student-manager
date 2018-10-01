class Attendance < ApplicationRecord
	belongs_to :student

	# before_save :generate

	# private

	def generate admin
		holidays = admin
					.holidays.where(date: [self.start_date .. self.end_date])
					.map(&:date)
					.collect { |d| d.strftime('%A').downcase }
		weekdays = (self.start_date.to_date .. self.end_date.to_date).select(&:on_weekday?).collect { |d| d.strftime('%A').downcase }
		subjects = admin.subjects.map(&:name).collect { |s| s.downcase }
		extra_working_days = admin.working_days
					.where(date: [self.start_date .. self.end_date])
					.map(&:weekday).map(&:to_s)
		leaves = self.student.leaves
					.where(date: [self.start_date .. self.end_date])
					.map(&:date).collect { |d| d.strftime('%A').downcase }
		table = admin.time_table.table

		self.total_hours = total_hours_in_given_range table, subjects, weekdays, holidays, extra_working_days
		self.student_hours = subtract_hours table, total_hours, leaves
		self.percentage = percentage_hours self.total_hours, self. student_hours
	end

	def add_hours table, hours, days
		days.inject(hours) { |total, day| total.merge(table[day]) { |_,x,y| x + y }}
	end

	def subtract_hours table, hours, days
		days.inject(hours) { |total, day| total.merge(table[day]) { |_,x,y| x - y }}
	end

	def percentage_hours total_hours, student_hours
		student_hours.merge(total_hours) { |_,x,y| ((x * 100.0) / y).round(2) }
	end

	def total_hours_in_given_range table, subjects, weekdays, holidays, extra_working_days

		hours = Hash[subjects.zip(Array.new(subjects.size, 0))]
		# Add working day hours
		hours = add_hours table, hours, weekdays # weekdays.inject(hours) { |total, day| total.merge(table[day]) { |_,x,y| x + y }}
		# Subtract holiday day hours
		hours = subtract_hours table, hours, holidays # holidays.inject(hours) { |total, day| total.merge(table[day]) { |_,x,y| x - y }}
		# Add extra working days
		hours = add_hours table, hours, extra_working_days

		hours
	end
end
