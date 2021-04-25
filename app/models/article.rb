class Article < ApplicationRecord
    validates :title ,presence:true, length:{minimum:0 ,maximum:30}
    validates :description ,presence:true, length:{minimum:0 ,maximum:30}
end
