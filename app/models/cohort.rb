class Cohort < ActiveRecord::Base
    has_many :students

    def add_student(name, age)
        Student.create(name: name, age: age, email: Faker::Internet.email, cohort_id: self.id)
    end

    def average_age
        self.students.sum(:age).to_f / self.students.size
    end

    def total_students
        self.students.size
    end

    def self.biggest
        self.all.sort_by{|c| c.students.size}.last
    end

    def self.sort_by_mod
        self.all.sort_by{|c| c.current_mod}
    end
  
end