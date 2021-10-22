#!/usr/bin/env ruby

# prints a welcome message to the user
def print_welcome(prices)
    puts "Welcome to Emma's Market"
    puts
    puts "Here are the items for sale today"
    puts
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
    puts
end

# Receives the user's input and parses it into an array of strings
def parse_input
    puts "Please enter all the items purchased seperated by a comma"
    result = gets
    items = result.split(",")
    return items
end

# inputs an array of items and adds the count to the groceries hash
def count_items(items, groceries)
    items.each do |item|
        if item.include? "apple"
            groceries["apple"] += 1
        elsif item.include? "banana"
            groceries["banana"] += 1
        elsif item.include? "bread"
            groceries["bread"] += 1
        elsif item.include? "milk"
            groceries["milk"] += 1
        end
    end
end

# Prints the receipt for the purchase including the total cost and amount saved
def print_results(itemCost, groceries, total, saved)
    puts
    puts "Item\tQuantity\tPrice"
    puts "-------------------------------------"
    itemCost.each do |key, value|
        puts "#{key}\t#{groceries[key]}\t\t$#{value}"
    end
    puts
    puts "Total price : $#{total.round(2)}"
    puts "You saved $#{saved.round(2)} today."
    puts
end

def prices_calculator
    prices = {"apple" => 0.89, "banana" => 0.99, "bread" => 2.17, "milk" => 3.97}
    groceries = {"apple" => 0, "banana" => 0, "bread" => 0, "milk" => 0}
    itemCost = {}

    # Outputting a welcome message and the items for sale
    print_welcome(prices)

    # Parsing the users input into an array of strings
    items = parse_input

    # Counting the total number of items and adding them to the groceries hash
    count_items(items, groceries)

    saved = 0
    total = 0
    # Calculating the total price and the amount saved
    groceries.each do |key, value|
        if value > 0
            if key == "bread"
                n = value/3
                m = value%3
                itemCost[key] = (prices[key] * m) + (6 * n)
                saved += (prices[key] * value) - itemCost[key]
            elsif key == "milk"
                n = value/2
                m = value%2
                itemCost[key] = (prices[key] * m) + (5 * n)
                saved += (prices[key] * value) - itemCost[key]
            else
                itemCost[key] = prices[key] * value
            end
            total += itemCost[key]
        end
    end

    # Outputting the results
    print_results(itemCost, groceries, total, saved)
end

prices_calculator