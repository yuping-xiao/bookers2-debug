class Relationship < ApplicationRecord

	belongs_to :following, class_name: "User"
	belongs_to :follower, class_name: "User"
	validates :following_id, presence: true
	validates :follower_id, presence: true

	def change
		create_table :relationships do |t|
			t.integer :follower_id
			t.integer :following_id

			t.timestamps null: false
	end

	add_index :relationships, :follower_id
	add_index :relationships, :following_id
	add_index :relationships, [:follower_id, :following_id], unique: true
	
	end

end
