# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :text
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  def as_json(options={})
    {
      id: self.id,
      name: self.name,
      content: self.content
    }
  end

end
