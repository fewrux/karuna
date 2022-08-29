class AddNameAndAddressAndCountryAndWebsiteToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :name, :string
    add_column :organizations, :address, :string
    add_column :organizations, :country, :string
    add_column :organizations, :website, :string
  end
end
