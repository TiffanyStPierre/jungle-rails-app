class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates_confirmation_of :password

  def self.authenticate_with_credentials(email, password)
    # Find the user by email (case-insensitive)
    user = User.find_by('LOWER(email) = ?', email.downcase.strip)

    # Authenticate the user if found and password is correct
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
  
end
