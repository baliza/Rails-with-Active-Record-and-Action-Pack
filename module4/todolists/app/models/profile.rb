class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: { in: %w(male female),
    message: "%{value} is not a valid gender" }

  validate :first_name_or_last_name_supplied
  validate :sue_is_female

  def first_name_or_last_name_supplied
    if first_name.to_s == '' and last_name.to_s == ''  
      errors.add(:first_name, "either first name or last name supplied!")
    end
  end

  def sue_is_female
    if (gender == 'male' and first_name ==  'Sue')  
      errors.add(:first_name, "Sue cannot be a boy!")
    end
  end

  scope :get_all_profiles, -> (min_birth_year,max_birth_year){ 
    where("birth_year BETWEEN ? and ?", min_birth_year, max_birth_year)
    .order('profiles.birth_year ASC')
  }
  
  #def self.get_all_profiles(min_birth_year,max_birth_year) 
  #  Profile.where("birth_year BETWEEN ? and ?", min_birth_year, max_birth_year)
  #end


end
