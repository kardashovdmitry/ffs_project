class DescriptionForMeasurementGroup < ActiveRecord::Base
    self.table_name = 'DescriptionForMeasurementGroup'
    self.primary_key = :DescriptionForMeasurementGroupID

    belongs_to :measurementgroup, :class_name => 'MeasurementGroup', :foreign_key => :groupID
end
