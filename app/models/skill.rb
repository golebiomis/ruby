class Skill < ActiveRecord::Base

has_and_belongs_to_many :employers, dependent: :destroy

validates :name, presence: true, length: {minimum: 3}

def to_s
"#{name} "
end

def text(s)
  s.description(/\n/, '<br>')
end

end
