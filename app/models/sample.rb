class Sample < ActiveRecord::Base
    self.table_name = 'Sample'
    self.primary_key = :sampleID

    has_many :measurementgroups, :class_name => 'MeasurementGroup', :foreign_key => :sampleID
end
