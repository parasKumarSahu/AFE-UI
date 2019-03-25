class BillingInfo
  include Mongoid::Document
  field :email, type: String
  field :api, type: String
  field :plan, type: String
end
