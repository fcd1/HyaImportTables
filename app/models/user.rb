class User < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  has_many :job_import

end
