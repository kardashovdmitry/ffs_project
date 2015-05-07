class Linked < ActiveRecord::Base
    self.table_name = 'Linked'


    belongs_to :measurement, :class_name => 'Measurement', :foreign_key => :measurementID
    belongs_to :measurementgroup, :class_name => 'MeasurementGroup', :foreign_key => :groupID
end
