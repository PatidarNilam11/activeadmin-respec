class Student < ApplicationRecord
    validates :name, presence: true
    validates :roll_no, presence: true

    before_save :student_saved

    def student_saved
        self.name = name.upcase
    end
    
    belongs_to :school
    
   scope :actives, -> {where(age: 21)}
end
