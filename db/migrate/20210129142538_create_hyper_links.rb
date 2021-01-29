class CreateHyperLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :hyper_links do |t|
      t.string :link
      t.timestamps
    end
  end
end
