class RawDatum < ActiveRecord::Base
    self.table_name = 'RawData'
    self.primary_key = :rdID

    has_many :measurements, :class_name => 'Measurement'
    has_many :descriptionforrds, :class_name => 'DescriptionForRd', :foreign_key => :rdID
    belongs_to :measurementgroup, :class_name => 'MeasurementGroup', :foreign_key => :groupID
end
