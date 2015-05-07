class Researcher < ActiveRecord::Base
    self.table_name = 'Researcher'
    self.primary_key = :researcherID

    has_many :measurementgroups, :class_name => 'MeasurementGroup', :foreign_key => :researcherID
end
