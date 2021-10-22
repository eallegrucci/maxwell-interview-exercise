#!/usr/bin/env ruby

def price(item)
    prints item
end

def total
    price(item)
end

def calculate_total
    prices = {"apple" => 0.89, "banana" => 0.99, "bread" => 2.17, "milk" => 3.97}
    puts "Welcome to Emma's Market"
    puts "Here are the items for sale today"
    puts "Item\tUnit price\tSale price"
    puts "-------------------------------------"
    prices.each do |key, value|
        if key == "milk"
            puts "#{key}\t$#{value}\t\t2 for $5.00"
        elsif key == "bread"
            puts "#{key}\t$#{value}\t\t3 for $6.00"
        else
            puts "#{key}\t$#{value}"
        end
    end
    puts "Please enter all the items purchased seperated by a comma"
    result = gets
    items = result.split(",")
    print(items)
end

calculate_total