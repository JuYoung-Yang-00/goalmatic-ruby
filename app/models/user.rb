class User < ApplicationRecord
  has_secure_password

  # has_many :watched_episodes, dependent: :destroy
  # has_many :episodes, through: :watched_episodes

  # has_many :drama_progresses, dependent: :destroy
  # has_many :dramas, through: :dramas_progresses


  
  def email=(value)
    super(value.downcase)
  end

  
end
