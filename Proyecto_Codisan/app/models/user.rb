class User < ApplicationRecord

  HUMANIZED_ATTRIBUTES = {
    document: " El documento",
    first_name: "Primer Nombre",
    first_last_name: "Primer Apellido",
    second_last_name: "Segundo Apellido",
    password: "La contraseña"

  }

  def self.human_attribute_name(attr, options = {})

    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
    
  end


  validates :document,:first_name,:first_last_name,:second_last_name, presence:{ message: 'es requerido.' }, confirmation: true

  mount_uploader:avatar, AvatarUploader
  rolify

  has_and_belongs_to_many :courses

  has_one :observers

  has_many :notes
  has_many :matters, through: :notes

 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable
        
  has_one_attached :avatar  

  after_create :assign_default_role

  validate :must_have_a_role, on: :update

  private 

  def must_have_a_role
    unless roles.any?
      errors.add(:roles, "debe tener por lo menos 1 rol")
    end 
  end

  def assign_default_role
    self.add_role(:admin) if self.roles.blank?
  end
end
