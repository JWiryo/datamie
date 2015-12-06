class Rating < AbstractModels

  attr_accessor :Score, :Description

  validates_presence_of :Score
  validates_presence_of :Description
  validates_numericality_of :Score, only_integer: true, message: "can only be whole number."
  validates_numericality_of :Score, greater_than_or_equal_to: 0, message: "cannot be negative"
  validates_numericality_of :Score, less_than_or_equal_to: 10, message: "cannot be greater than 10"

end
