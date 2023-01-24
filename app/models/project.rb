class Project < ApplicationRecord
    has_many :tasks#, depedent: :destroy
    #getting while uncommeting above line
end
