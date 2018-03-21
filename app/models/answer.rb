# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  description :text
#  vote        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#

class Answer < ApplicationRecord
  belongs_to :question
end
