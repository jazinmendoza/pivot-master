module Pivot
  class Item
    include Enumerable

    attr_accessor :name, :assignee, :points

    def initialize (name:, assignee: nil, points:)
      self.name = name
      self.assignee = assignee
      self.points = points
    end

    def project_code
      project_code = @name.split("-")
      return project_code[0]
    end

    def valid?
      return project_code == "EREC"||project_code == "AZR"
    end

    def +(other)
      return self.points + other.points
    end
  end
end