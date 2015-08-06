require 'thor'
require 'sequel'
require File.expand_path('config/environment.rb')

class ImportCategory < Thor
 DB = Sequel.connect('postgres://deployer:ed9ea158e9b617647087@archive.connectica.no/connectica_categories')

  desc 'import', "import database"
  def import
    DB[:english].each do |record|
      if record[:parent_id] == 0
        page = Page.new
        page.name = record[:name]
        page.id = record[:id]
        page.save
      else 
        page = Page.new
        page.name = record[:name]
        page.parent_id = record[:parent_id]
        page.id = record[:id]
        page.save
      end
    end
  end
end
