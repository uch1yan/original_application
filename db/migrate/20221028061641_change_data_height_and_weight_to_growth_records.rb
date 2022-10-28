class ChangeDataHeightAndWeightToGrowthRecords < ActiveRecord::Migration[6.1]
  def change
    change_column :growth_records, :height, :float
    change_column :growth_records, :weight, :float

  end
end
