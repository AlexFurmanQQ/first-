class Post < ApplicationRecord
    validates :title, length: { minimum: 2}
    validates :body, length: { minimum: 10}

end
