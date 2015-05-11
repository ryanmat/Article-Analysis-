class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
    	t.string :title
    	t.string :author
    	t.string :web_url
    	t.string :comments
    	t.integer :user_id

    	t.timestamps
    end
  end
end
 