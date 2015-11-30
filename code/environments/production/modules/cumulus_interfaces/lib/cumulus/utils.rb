# module for validating array and integers
module Cumulus
  # module for utils
  module Utils
    # helps set parameter type to integer`
    def munge_integer(value)
      Integer(value)
    rescue ArgumentError
      raise('munge_integer only takes integers')
    end

    def munge_array(value)
      return_value = value
      msg = 'should be array not comma separated string'
      if value.class == String
        fail ArgumentError msg if value.include?(',')
        return_value = [value]
      end
      fail ArgumentError 'should be array' if return_value.class != Array
      return_value
    end
  end
end
