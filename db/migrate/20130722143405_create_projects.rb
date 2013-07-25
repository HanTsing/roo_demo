class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects, :options => 'DEFAULT CHARSET=utf8' do |t|
      t.integer  :project_number_id      , null:false, default: ""  #项目编号
      t.string   :name                   , null:false, default: ""  #项目名称
      t.string   :unit                   , default: ""  #单位
      t.decimal  :contact_count          , default: 0   #合同量
      t.decimal  :unit_price             , default: 0   #单价
      t.decimal  :prior_project_count    , default: 0   #至上期累计结算(工程量)
      t.decimal  :prior_price            , default: 0   #至上期累计结算(合价)
      t.decimal  :current_project_count  , default: 0   #本期结算(工程量)
      t.decimal  :current_price          , default: 0   #本期结算(合价)
      t.decimal  :project_count          , default: 0   #至本期累计结算(工程量)
      t.decimal  :project_price          , default: 0   #至本期累计结算(合价)
      t.string   :comment                , default: ""  #备注
      t.integer  :publish_status         , null:false,  default: Project::PUBLISH_STATUS_PUBLISHED
      t.timestamps
    end
  end
end
