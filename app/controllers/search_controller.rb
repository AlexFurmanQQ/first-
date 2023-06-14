class SearchController < ApplicationController
    def find
        query = params["query"]
        @posts = Post.where(title: query)
        Print.p(@posts)
        render template: "posts/index"
    end
    def find_like
        query_like = params["query"]
        @posts = Post.where("lower(title) like ?", "%#{query_like.downcase}%")
        render template: "posts/index"
    end
    def search_pg
        query_pg = params["query"]
        @posts = Post.search_by_full_post(query_pg)
        render template: "posts/index"
    end

end