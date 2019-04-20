class Payment
  include Mongoid::Document
  field :email, type: String
  field :plan, type: String
  field :token, type: String
  field :purchase_date, type: Date
  field :expiry_date, type: Date
  belongs_to :scrapper, foreign_key: :scrapper_id
end
