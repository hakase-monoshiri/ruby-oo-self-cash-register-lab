require 'pry'

class CashRegister
 
    attr_accessor  :total, :items
    attr_reader :discount

    def initialize(employee_discount =  0)
        @total = 0
        @discount = employee_discount
        @items = []
        @price_list = []
    end

    def add_item(title, price, quantity = 1)
        @quantity = quantity
        previous_total = @total 
        @total += price * quantity
        quantity.times do 
            @items << title
            @price_list << price
        end 
    end

    def apply_discount
        if @discount > 0
            discount_mult = 100 - @discount
            new_total = @total * ".#{discount_mult}".to_f
            @total = new_total
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @quantity.times do
            @items.pop
            voided_transaction = @price_list.pop
            @total -= voided_transaction
        end

        if @items.length < 1
            @total = 0.0
        end
    end


end
