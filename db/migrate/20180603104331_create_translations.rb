class CreateTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :translations do |t|
      t.string :word
      t.json :result

      t.timestamps
    end
  end
end
