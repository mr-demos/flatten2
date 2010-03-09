class Flatten2
  require 'flatten2/array'
  ::Array.class_eval do
    include Flatten2::Array
  end
end
