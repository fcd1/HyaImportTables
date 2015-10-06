class CreateDigitalObjectImports < ActiveRecord::Migration

  def change

    create_table :digital_object_imports do |t|

      t.text :digital_object_data
      t.integer :status, null: false
      t.references :import_job, null: false, index: true, foreign_key: true

      t.timestamps null: false

    end

  end

end
