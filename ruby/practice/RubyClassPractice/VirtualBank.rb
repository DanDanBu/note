class Account
    attr_reader :name, :balance
    
    def initialize(name, balance=100)
        @name = name
        @balance = balance
    end
    
    public
    
    def display_balance(pin_number)
        if pin == pin_number
            if @balance <= 0
                puts over_draw
            else
                puts "Balance: $#{@balance}"
            end
        else
            puts pin_error
        end
    end
    
    def deposit(pin_number, amount)
        if pin == pin_number
            @balance += amount
            puts "Deposit #{amount}. New balance: $#{@balance}"
        else
            puts pin_error
        end
    end
    
    def withdraw(pin_number, amount)
        if pin_number == pin
            @balance -= amount
            puts "Withdrew #{amount}. New balance: $#{@balance}"
        else
            puts pin_error
        end
    end
    
    private
    
    def pin
        @pin = 1234
    end
    
    def pin_error
        return "Access denied: incorrect PIN."
    end
    
    def over_draw
        return "Your Account balance is less than 0!"
    end
end

checking_account = Account.new("Dan", 1_000_000)
checking_account.display_balance(1234)
checking_account.withdraw(1234, 50_000)
