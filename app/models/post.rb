class Post < ApplicationRecord
  has_one  :picture, :as => :pictureable
  validates_presence_of :content
end
