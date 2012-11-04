require "active_record"
require "stored_attribute/version"

module StoredAttribute

  extend ActiveSupport::Concern

  included do

    class_attribute :type_casted_attributes

  end

  module ClassMethods

    def attribute(key, options)
      self.type_casted_attributes ||= {}
      self.type_casted_attributes[key] = options

      getter    = "#{key}"
      setter    = "#{getter}="
      get_alias = "original_#{getter}"
      set_alias = "#{get_alias}="

      # Rename old methods to keep them accessible
      alias_method get_alias, getter
      alias_method set_alias, setter

      column = ActiveRecord::ConnectionAdapters::Column.new(key, options[:default], options[:type].to_s)

      define_method(getter) do
        value = send(get_alias)
        value.nil? ? column.default : column.type_cast(value)
      end

      define_method(setter) do |value|
        send(set_alias, column.type_cast(value))
      end

      # Set default values
      if ! options[:default].nil?
        after_initialize "set_default_#{getter}"

        define_method("set_default_#{getter}") do
          self.send(setter, options[:default]) if self.send(get_alias).nil?
        end
      end
    end

  end

end

ActiveRecord::Base.send(:include, StoredAttribute)