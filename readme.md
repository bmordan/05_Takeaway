#Takeaway
![enter image description here](http://www.pekinghouse.co.uk/images/peking_counter.jpg)

###Implement the following functionality:

 - list of dishes with prices
 - placing the order by giving the list of dishes, their quantities and
   a number that should be the exact total. If the sum is not correct
   the method should raise an error, otherwise the customer is sent a
   text saying that the order was placed successfully and that it will
   be delivered 1 hour from now, e.g. "Thank you! Your order was placed
   and will be delivered before 18:52".
 - The text sending functionality should be implemented using Twilio
   API. You'll need to register for it. It’s free. Use twilio-ruby gem
   to access the API
 - Use a Gemfile to manage your gems
 - Make sure that your Takeaway class is thoroughly tested and that you
   use mocks and/or stubs, as necessary to not to send texts when your
   tests are run
 - However, if your Takeaway class is loaded into IRB and the order is
   placed, the text should actually be sent

A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone

Test in irb

    require_relative './load.rb'

Create a new customer

     bernie = Customer.new(:name => "Bernie")
Look at the menu

    menu = Menu.new
Ready to Order?

    order = Order.new(bernie)

Add to your order like this

    order.items << SubTotal.new( menu.items[0] , 3 )
here SubTotal takes ( the dish , the quantity ). You can create a new dish like this 

    Dish.new("Dish name", price)

 
Check on the total of your order like this

    order.total

Finished? Place your order like this

    bernie.place(order)
     => "Thank you Bernie! Your order was placed and will be delivered before 23:51" 

Wonderful. Your order is confirmed with a text.

![enter image description here](https://pbs.twimg.com/media/Byps43oIcAARnn9.jpg:large)

