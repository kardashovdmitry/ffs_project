class MeasurementGroup < ActiveRecord::Base
    self.table_name = 'MeasurementGroup'
    self.primary_key = :groupID

    belongs_to :device, :class_name => 'Device', :foreign_key => :deviceID
    has_many :rawdata, :class_name => 'RawDatum', :foreign_key => :groupID
    has_many :linkeds, :class_name => 'Linked', :foreign_key => :groupID
    has_many :descriptionformeasurementgroups, :class_name => 'DescriptionForMeasurementGroup', :foreign_key => :groupID
    belongs_to :researcher, :class_name => 'Researcher', :foreign_key => :researcherID
    belongs_to :sample, :class_name => 'Sample', :foreign_key => :sampleID
end
