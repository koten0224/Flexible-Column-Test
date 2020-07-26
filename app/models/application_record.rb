class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.flexible_column(*input_columns, **options)
    unless instance_methods.include? column_name
      has_many :columns, class_name: "Attribute", as: :object
    end
    default_value = options[:default]
    data_type = options[:type]
    
    input_columns.each do |column_name|      

      define_method(column_name) do
        value = columns.find_or_create_by(name: column_name) do |column|
          column.value = default_value
        end.value
        value.to_i if data_type == :integer
      end

      define_method(column_name.to_s + '=') do |value|
        columns.find_or_create_by(name: column_name).update(value: value)
      end

    end
  end
end
