class PostComment < ApplicationRecord
    validates :message, length: { minimum: 8}
    belongs_to :post
end
