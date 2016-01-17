class Note < ActiveRecord::Base
  belongs_to :book

  has_many :notes, dependent :destroy 
end
