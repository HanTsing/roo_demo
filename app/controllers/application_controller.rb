#encoding: utf-8
require 'roo'
class ApplicationController < ActionController::Base
  protect_from_forgery

  START_COLUMN_NUMBER = 4

  def import_excle(file)
    result = { status: true, valid_project: [], invalid_project: [] }
    spreadsheet = open_spreadsheet(file)
    return if spreadsheet == false

    (START_COLUMN_NUMBER..spreadsheet.last_row).each do |i|
      if valid_row?(spreadsheet.row(i))
        number  = format_project_number(spreadsheet.cell(i,'A'))
        project = Project.save_project_from_external(spreadsheet.row(i), number)
        project.published? ? result[:valid_project] << project : result[:invalid_project] << project
      end
    end
    result[:invalid_project].reject!{|project| project.name.blank? }
    result
  end

  private

  def format_project_number(number)
    number.kind_of?(Float) ? number.to_i.to_s : number
  end

  def valid_row?(row)
    row[0].present? || row[1].present?
  end

  def open_spreadsheet(file)
    return false  if file.blank?
    case File.extname(file.original_filename)
    when ".csv"  then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls"  then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else 
      false
    end
  end

end
