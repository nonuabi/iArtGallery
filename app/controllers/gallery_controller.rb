class GalleryController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @gallery = Store.all
  end
  def checkout
    if request.post?
      amount = session[:amount]
      ActiveMerchant::Billing::Base.mode = :test

      # Create a new credit card object
      credit_card = ActiveMerchant::Billing::CreditCard.new(
        :number     => params[:number],
        :month      => params[:month],
        :year       => params[:year],
        :first_name => params[:first_name],
        :last_name  => params[:last_name],
        :verification_value  => params[:verification_value]
      )

      if credit_card.valid?
        # Create a gateway object to the TrustCommerce service
        gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
          :login    => 'TestMerchant',
          :password => 'password'
        )

        # Authorize for $10 dollars (1000 cents)
        response = gateway.authorize(amount.to_i, credit_card)

        if response.success?
          # Capture the money
          session[:cart] = nil
          gateway.capture(amount.to_i, response.authorization)
          redirect_to :action => :purchase_complete
        else
          flash[:notice] = "Invalid credit cart details. Give the correct inputs!"
          render :action => :checkout
        end
      end
    end
  end
end
