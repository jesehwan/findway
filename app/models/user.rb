class User < ActiveRecord::Base
	has_many :surveys
	validates :name, presence: { message: "이름을 입력해 주세요"}
	validates :password, length: { in: 8..20, too_short: "최소 8자 이상 입력해주세요", too_long: "20자 이하로 입력해주세요"}
	validates :phone, numericality: { message: "숫자만 입력해주세요" }
end
