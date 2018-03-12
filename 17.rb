# You took a job in Shanghai along with Ruegen working for a financial services company. 
# Your boss is Chinese (obviously), a bit of a madman, and dislikes the way the West has 'taken over'. 
# He wants you to write a currency exchange method, but each currency must only be compared to the Chinese renminbi. 
# Write some methods, each that take a number representing a currency 
# (let's say Thai baht, or Indonesian rupiah, and whatever you like), 
# and converts each into the number of Chinese renminbi. Now write a method that takes a number, and two strings. 
# Using only the methods you have created, code this last method so that you can specify 'from' and 'to' currencies 
# (string arguments), and a number, and have this return the relevant exchange. For example, you could accept 
# 'vnd' (the Viet dong), 'hkd' (Honky dollar), and a number, and gives the correct exchange for that number given 
# those country parameters. Please store I a w-n variable!

def convert_to_renmibi(amount, currency)
    conversion_rate = {
        baht: 4.96,
        rupiah: 2176.96,
        aud: 0.2,
        hkd: 1.24,
        vnd: 3598.63,
    }
    amount / conversion_rate[currency.to_sym]
end

def convert_from_renmibi(amount, currency)
    conversion_rate = {
        baht: 4.96,
        rupiah: 2176.96,
        aud: 0.2,
        hkd: 1.24,
        vnd: 3598.63,
    }
    amount * conversion_rate[currency.to_sym]
end

def convert_to_and_from(amount, from, to)
    convert_from_renmibi(convert_to_renmibi(amount, from), to)
end

puts convert_to_renmibi(1000, :aud)

puts convert_to_and_from(1, :aud, :baht)
