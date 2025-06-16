class AddPrimaryKeyToTodos < ActiveRecord::Migration[8.0]
  def change
    unless column_exists?(:todos, :id)
      add_column :todos, :id, :primary_key
    end
    
    # Ensure the primary key is set
    execute "ALTER TABLE todos ADD PRIMARY KEY (id)" unless primary_key_exists?(:todos)
  end
  
  private
  
  def primary_key_exists?(table_name)
    connection.primary_key(table_name).present?
  end
end
