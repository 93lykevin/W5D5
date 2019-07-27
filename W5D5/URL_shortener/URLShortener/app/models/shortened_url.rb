class ShortenedUrl < ApplicationRecord
  validates :user_id,  presence: true
  validates :long_url,  presence: true, uniqueness: true
  validates :short_url,  presence: true

  def self.random_code
    rand_code = SecureRandom.urlsafe_base64
    until !ShortenedUrl.exists?(short_url: rand_code)
      rand_code = SecureRandom.urlsafe_base64
    end 

    return rand_code
  end
  
  def self.long_to_short(user, long_url)
    ShortenedUrl.create(user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_code)
  end 

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User  

  has_many :visit,
    primary_key: :id,
    foreign_key: :shortened_url_id,
    class_name: :Visit
end