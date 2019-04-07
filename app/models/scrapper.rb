class Scrapper
  include Mongoid::Document
  field :name, type: String
  field :link, type: String
  field :email, type: String
  field :message, type: String
  field :price1, type: String
  field :price2, type: String
  field :price3, type: String
  field :uploaded, type: String
end
