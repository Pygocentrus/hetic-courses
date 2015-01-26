class RenameCategoryIdTpCategorieId < ActiveRecord::Migration
  def change
    rename_column :courses, :category_id, :categorie_id
  end
end
