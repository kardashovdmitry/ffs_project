class DescriptionForRd < ActiveRecord::Base
    self.table_name = 'DescriptionForRD'
    self.primary_key = :DescriptionForRdID

    belongs_to :rawdatum, :class_name => 'RawDatum', :foreign_key => :rdID
end
