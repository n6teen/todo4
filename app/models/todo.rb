class Todo < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1 }
  validates :status, inclusion: { in: [ true, false ] }

  after_create_commit -> { broadcast_append_to "todos", target: "todos-list" }
  after_update_commit -> { broadcast_replace_to "todos" }
  after_destroy_commit -> { broadcast_remove_to "todos" }
end
