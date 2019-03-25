class PriceInfo
  include Mongoid::Document
  field :api_name, type: String
  field :price_1, type: String
  field :price_2, type: String
  field :price_3, type:String


end



