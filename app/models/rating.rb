class Rating
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :Score, :Description

  validates_presence_of :Score
  validates_presence_of :Description
  validates_numericality_of :Score, only_integer: true, message: "can only be whole number."
  validates_numericality_of :Score, greater_than_or_equal_to: 0, message: "cannot be negative"
  validates_numericality_of :Score, less_than_or_equal_to: 10, message: "cannot be greater than 10"

  def initialize(params = {})
    self.attributes = params unless params.nil? || params.empty?
  end

  def attributes=(params = {})
    params.to_hash.symbolize_keys!
    params.each do |k, v|
      accessor_name = "#{k}="
      if respond_to? accessor_name
        send(accessor_name, v)
      else
        instance_variable_set("@#{k}", v)
      end
    end
  end


  def persisted?
    false
  end
end
