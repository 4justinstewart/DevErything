class CreateCategories < ActiveRecord::Base
  create_table :categories do |t|
    t.string :name

    t.timestamps
  end
end
