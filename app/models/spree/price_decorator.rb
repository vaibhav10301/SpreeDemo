Spree::Price.class_eval do
  require 'rest-client'
  after_find :check_api

  def check_api
  	api_end_point = ErpIntegration.find_by(:selected => true)
  	if api_end_point.name == "ERP Application"
  		api_url = api_end_point.url
	  	response = RestClient.get api_url, {params: {'erpCustGuid' => '1714760c-d081-4f74-aa08-9c528b6dc276', 'cutomerId' => 1, 'qty' => 1, 'productId' => self.variant.product.id, 'variantId' => self.variant_id, 'erpShipingId' => '59D66B37-3DA7-4F3C-AEBD-F2306D793122', 'productGuid' => '7516C6B7-1467-475C-A38A-FEAD75BA6D86'}}
	    respone_parse = JSON.parse(response)
		  if respone_parse["Success"]  
		    price = respone_parse["Result"]["CustPrice"]
		    self.amount = respone_parse["Result"]["CustPrice"] if self.variant_id = 2
		  end
	  end
  end
end
