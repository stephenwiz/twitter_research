class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string(:title, :null => false)
      t.timestamps
    end

      create_table(:categories_tweets, id: false) do |t|     # join table alpha order
        t.column(:category_id, :integer, null: false)
        t.column(:tweet_id, :integer, null: false)
    end

    add_index(:categories_tweets, :category_id)
    add_index(:categories_tweets, :tweet_id)


  end
end
