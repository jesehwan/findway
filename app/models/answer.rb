class Answer < ActiveRecord::Base
 has_many :surveys
 belongs_to :type
 belongs_to :question
end
