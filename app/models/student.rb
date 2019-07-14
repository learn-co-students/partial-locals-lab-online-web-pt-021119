# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(search)
    if search
      name = Student.all.collect {|s| s if s.name.downcase.include?(search.downcase)}.compact
      name.empty? ? self.all : name
    else
      self.all
    end
  end
end
