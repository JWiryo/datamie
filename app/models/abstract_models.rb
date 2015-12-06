class AbstractModels

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

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
