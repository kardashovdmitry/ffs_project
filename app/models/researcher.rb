class Researcher < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 1 , maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

    self.table_name = 'Researcher'
    self.primary_key = :researcherID

    has_many :measurementgroups, :class_name => 'MeasurementGroup', :foreign_key => :researcherID

end
