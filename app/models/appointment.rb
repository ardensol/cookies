class Appointment < ActiveRecord::Base

  attr_accessor :card_token, :amount

  def find_or_create_stripe_customer(appointment_params)
    
    customer = Stripe::Customer.create(description: appointment_params[:email], email: appointment_params[:email], card: appointment_params[:card_token])
   
    stripe_token = customer.id

    if amount != nil
    	charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => amount*100,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd',
      :capture     => false ##ONLY AUTHORIZZING CHARRGE
	  )
	end

  end

  def api_customer
    Stripe::Customer.retrieve(stripe_token)
  end
  

end
