class Issue < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5, maximum: 40}
  
  belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :assignee, class_name: "User", foreign_key: :assignee_id, optional: true

  has_rich_text :body
  has_one :content, class_name: 'ActionText::RichText', as: :record, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_paper_trail ignore: [:updated_at]


  def self.ransackable_associations(auth_object = nil)
    ["content", "author", "assignee"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title", "body", "status", "priority", "created_at"]
  end


  def self.priority_allowed = ["Low", "Medium", "High"]
  def self.priority_default = priority_allowed[0]

  def self.status_allowed = ["New", "Progress", "Done"]
  def self.status_default = status_allowed[0]
end
