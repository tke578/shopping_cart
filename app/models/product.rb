class Product < ActiveRecord::Base
	validates :description, :image_url, presence: true
	validates :title, :presence => {:message => "Title can't be blank." }, :uniqueness => {:message => "has already been taken"}, presence: true
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	validate :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG or PNG image.'
	}
end
