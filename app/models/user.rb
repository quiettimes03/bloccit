class User < ActiveRecord::Base
  before_save {self.email = email.downcase if email.present?}
  before_save :capitalize_name

  validates :name, length: {minimum: 1, maximum: 100}, presence: true
  validates :password, length: {minimum: 6}, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 3, maximum: 254}

  has_secure_password

  def capitalize_name
      if name
        name_array = []
        name.split.each do |capp_name|
          name_array << capp_name.capitalize
        end

      self.name = name_array.join(' ')
    end
  end
end
