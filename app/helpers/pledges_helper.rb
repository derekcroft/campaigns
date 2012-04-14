module PledgesHelper
  def donation_type_text
    params[:donation_type] == 'fixed'? "Fixed Amount" : "Penny Pledge"
  end
end
