require 'lib_xls'

class CompaniesController < ApplicationController
  before_action :authenticate_user!
  def index
    @companies = Company.all
  end

  def load_xls
    file = params['file']
    result = loadXlsFromFile?(file.path)
    render plain: result ? 'OK': 'Error'
  end

  def loadXlsFromFile?(nameFile)
    begin
      libObjXLS = LibXls.new nameFile
      listCompanies = libObjXLS.getListCompanies

      if !listCompanies.empty?
        Company.delete_all
      end

      listCompanies.each { |nameCompany|
        modelCompany = Company.new
        modelCompany.name = nameCompany
        modelCompany.save
      }
      return true
    rescue
      return false
    end
  end
end
