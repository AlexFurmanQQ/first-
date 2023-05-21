class Print < ApplicationController
    def self.p(obj)
        puts "*"*50
        pp obj
        puts "*"*50
    end
end
