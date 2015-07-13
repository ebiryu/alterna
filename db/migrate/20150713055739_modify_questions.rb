class ModifyQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :n_yes, :integer
  	add_column :questions, :n_no, :integer
  end
end
