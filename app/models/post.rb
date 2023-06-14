class Post < ApplicationRecord
    validates :title, length: { minimum: 2}
    validates :body, length: { minimum: 10}
    has_many :post_comments
    pg_search_scope :search_by_full_post, against: [:title, :body]

end
