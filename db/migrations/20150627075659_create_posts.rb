Lotus::Model.migration do
  change do
    create_table :posts do
      primary_key :id
      foreign_key :author_id, :users, on_delete: :cascade, null: false

      column :content, String, null: false, size: 160
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
