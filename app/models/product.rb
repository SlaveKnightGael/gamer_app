class Product < ApplicationRecord
    
    before_destroy :not_referenced_by_any_line_item
    belongs_to :user, optional: true 
    has_many :line_items
    mount_uploader :image, ImageUploader

    validates :title, :price , presence: true
    validates :description, length: { maximum: 500, too_long: "%{count} is the max limit allowed" }
    validates :title, length: { maximum: 50, too_long: "%{count} is the max limit allowed" }
    validates :price, numericality: { only_decimal: true }, length: { maximum: 8 }


    private

    def not_referenced_by_any_line_item
        unless line_items.empty?
            errors.add(:base, "Line items present")
            throw :abort
        end
    end

end
