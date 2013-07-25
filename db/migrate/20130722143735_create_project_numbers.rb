class CreateProjectNumbers < ActiveRecord::Migration
  def change
    create_table :project_numbers, :options => 'DEFAULT CHARSET=utf8' do |t|
      t.string  :number, null:false, default: "" #项目编号
      t.timestamps
    end
  end
end
