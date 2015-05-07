class Measurement < ActiveRecord::Base
    self.table_name = 'Measurement'
    self.primary_key = :measurementID

    has_many :linkeds, :class_name => 'Linked', :foreign_key => :measurementID
    belongs_to :rawdatum, :class_name => 'RawDatum', :foreign_key => :rpID
    has_many :measurementdescriptionformeasurements, :class_name => 'MeasurementDescriptionForMeasurement', :foreign_key => :measurementID
end
