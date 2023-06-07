# app/models/task.rb
class User < ActiveRecord::Base
    # Associations
    has_many :tasks

    attribute :user_id, :integer
  end