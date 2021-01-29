class AddHyperLinkRefToParameters < ActiveRecord::Migration[6.1]
  def change
    add_reference :parameters, :hyper_link, null: false, foreign_key: true
  end
end
