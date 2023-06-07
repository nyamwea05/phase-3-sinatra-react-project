class Task < ActiveRecord::Base
    # Associations
    belongs_to :user

    attribute :password, :string
  end