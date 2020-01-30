class User < ApplicationRecord
    has_secure_password
    has_many :topics
end

# rails g resource ModelName column_name:datatype column_name2:datatype2 --no-test-framework

