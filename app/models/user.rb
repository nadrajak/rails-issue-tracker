class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # jakub: User has issues/comments, destroy them if destroying user
  has_many :authored_issues, class_name: "Issue", foreign_key: :author_id, dependent: :destroy
  has_many :assigned_issues, class_name: "Issue", foreign_key: :assignee_id, dependent: :nullify

  has_many :comments, dependent: :destroy

  # jakub: allowlist attributes
  def self.ransackable_attributes(auth_object = nil)
    ["name", "email"]
  end
end
