class AddIngredientToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :ingredient, :string
  end
end
