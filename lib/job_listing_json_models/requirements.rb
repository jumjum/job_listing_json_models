module JobListingJsonModels
  
  class Requirements
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend  ActiveModel::Naming
    include JsonModel
    include JsonModel::ValidationHelper
  
    attribute :drivers_license, DriversLicense, :default => DriversLicense.new
    attribute :education,       Education
    attribute :experience,      Experience
  
    attribute :own_car, Boolean # Specifies if the applicants needs to be able utilize a self-owned car.
    attribute :misc,    String  # A description of the required work experience.
  
    validates :drivers_license, :presence => true
  
    def initialize(attrs = {})
      super(attrs)

      self.drivers_license ||= DriversLicense.new
      self.education       ||= Education.new
      self.experience      ||= Experience.new      

      self
    end

  end

end
