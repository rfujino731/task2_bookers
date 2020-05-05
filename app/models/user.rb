class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :name, presence: true, length:{in: 2..20}

  #画像投稿ができるようにするための記述
  attachment :profile_image

  has_many :books, dependent: :destroy
  
  def email_required?
    false
  end


  def email_changed?
    false
  end

  
end