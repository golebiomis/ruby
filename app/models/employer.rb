class Employer < ActiveRecord::Base

has_and_belongs_to_many :skills

validates :name, presence: true, length: {minimum: 3}
validates :surname, presence: true, length: {minimum: 2}
validates :phone, presence: true, length: {minimum: 7, maximum: 9}
validates :address,  length: {minimum: 5}
validates :PESEL,  length: {is: 11}


      def to_s
        "#{name} #{surname}"
      end
      def text(s)
        s.description(/\n/, '<br>')
      end
      def self.search(search)
if search
  @employers = Employer.where(["surname LIKE ?","%#{search}%"])
else
all

end

      end

end
