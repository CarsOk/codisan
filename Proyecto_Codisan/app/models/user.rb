class User < ApplicationRecord

  mount_uploader :avatar, AvatarUploader
  validates_presence_of :avatar

  rolify
  after_create :assign_default_role

  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  

 
  
 
  
  private 

    def must_have_a_role
      unless roles.any?
        errors.add(:roles, "debe tener por lo menos 1 rol")
      end 
    end

    def assign_default_role
      self.add_role(:student) if self.roles.blank?
    end

    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end


end
