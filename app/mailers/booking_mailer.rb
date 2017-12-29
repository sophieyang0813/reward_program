class BookingMailer < ApplicationMailer
  default from: 'missterio2018@gmail.com'

  #   def booking_email(user)
  #     @user = user
  #     mail(to: 'sophieyang0813@gmail.com', 
  #          subject: 'New booking from Missterio')

  # end

  def partner_booking_email(customer, partner, booking)
      @customer = customer 
      @partner = partner
      @booking = booking
      @url = 'http://localhost:3000/'

      mail(to: @partner.email, 
           subject: 'New booking from Missterio')
  end

    def customer_booking_email(customer, partner, booking)
      @customer = customer 
      @partner = partner
      @booking = booking
      @url = 'http://localhost:3000/'

      mail(to: @customer.email, 
           subject: 'Booked successfully with Missterio')
  end



end
