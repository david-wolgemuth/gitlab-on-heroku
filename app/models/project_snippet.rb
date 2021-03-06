# == Schema Information
#
# Table name: snippets
#
#  id               :integer          not null, primary key
#  title            :string
#  content          :text
#  author_id        :integer          not null
#  project_id       :integer
#  created_at       :datetime
#  updated_at       :datetime
#  file_name        :string
#  type             :string
#  visibility_level :integer          default(0), not null
#

class ProjectSnippet < Snippet
  belongs_to :project
  belongs_to :author, class_name: "User"

  validates :project, presence: true

  # Scopes
  scope :fresh, -> { order("created_at DESC") }

  participant :author, :notes
end
