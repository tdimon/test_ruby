require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  controller = CompaniesController.new
  it "should be valid" do
    result = controller.loadXlsFromFile?('123.xls')
    expect(result).to be true
  end
end