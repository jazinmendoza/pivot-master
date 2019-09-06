module Pivot
  class Tracker

    def initialize
      
    end

    def self.count(items)
      return items.length
    end

    def self.item_for(items, assignee)
      for item in items do        
        if item[:assignee] === assignee
          found = item
        end
      end
      return found
    end

    def self.pivoted?(items, assignee)
      found = false
      for item in items do        
        if item[:assignee] === assignee
          found = true
        end
      end
      return found
    end

    def self.total_points(items, pivoted=nil)
      total_points = 0
      unique_assignees = unique_assignees(items)
      if pivoted==nil
        for assignee in unique_assignees
          item = item_for(items, assignee)
          total_points += item[:points]
        end
      else
        for item in items do
          if item[:assignee]=== pivoted[:assignee]
            total_points += item[:points]
          end
        end  
      end
      return total_points
    end

    def self.unique_assignees(items)
      unique_assignees = Array.new
      for item in items do          
        if !unique_assignees.include? item[:assignee]
          unique_assignees << item[:assignee]
        end
      end
      return unique_assignees
    end

  end
end