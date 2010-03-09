class Flatten2
  module Array
    def flatten2
      flattened = []
      self.each do |entry|
        if entry.is_a? Array # could do entry.respond_to?(:flatten2), but then you get weird behavior if the class' implementation of flatten is intended for something else
          flattened += entry.flatten2
        else
          flattened << entry
        end
      end
      # this could be an implicit return, but I prefer explicit returns for methods longer than 1 line, just to make it explicit that the value is expected by clients
      return flattened
    end
  end
end
