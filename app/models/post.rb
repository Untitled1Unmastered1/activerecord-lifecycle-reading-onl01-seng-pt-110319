class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 
  before_validation :make_title_case
  before_save :email_author_about__post

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]} #if the first letter of the first word is not capital, add error mess.
      errors.add(:title, "Title must be in title case")
    end
  end

  def email_author_about__post

  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
