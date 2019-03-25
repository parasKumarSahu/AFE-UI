
PriceInfo.destroy_all
PriceInfo.create(api_name: "Birth_Days",price_1: "1500",price_2: "2000",price_3:"2500")
PriceInfo.create(api_name:"Author",price_1:"1500",price_2:"1500",price_3:"1500")
PriceInfo.create(api_name: "Birth",price_1: "1500",price_2: "2000",price_3:"2500")
PriceInfo.create(api_name:"Quotes",price_1:"1500",price_2:"1500",price_3:"1500")

BillingInfo.destroy_all
BillingInfo.create(email: "2015csb1031@iitrpr.ac.in",api: "Birthdays",plan: "2000")



		