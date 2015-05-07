class Device < ActiveRecord::Base
    self.table_name = 'Device'
    self.primary_key = :deviceID

    has_many :measurementgroups, :class_name => 'MeasurementGroup', :foreign_key => :deviceID
end
