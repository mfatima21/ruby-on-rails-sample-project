class CreateApiLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :api_logs do |t|
      t.string :method
      t.string :route
      t.json :req

      t.timestamps
    end
  end
end
