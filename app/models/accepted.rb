class Accepted < ApplicationRecord
  def self.search(query)
    where("name like ?", "%#{query}%")
  end #sel.search
end
