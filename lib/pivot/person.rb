module Pivot
  class Person

    attr_accessor :email, :first_name, :last_name, :items 

    def initialize (email:, first_name:, last_name:)
      self.email = email
      self.first_name = first_name
      self.last_name = last_name
    end

    def add_item(item, &block)
      item.assignee = self.email  
      self.items = Array.new
      self.items << item
      block.call if block_given?
    end

  end
end