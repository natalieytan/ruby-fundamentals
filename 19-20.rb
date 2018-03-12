# *Problem 19*
# Using some part of the HK MTR, write a method that takes one argument, a hash within which there are three keys: 
# two which are strings (an origin station, and a destination station), and one which is an array. 
# Choose part of a line from the MTR (or other rail network) as dummy data for the array. 
# The method should return a hash that contains two keys: an origin index, and a destination index. 
# These keys should be given the value of the index of the string the array if those stations are in the station array, or nil if not.
# # *Problem 20*
# # Using some of the features in the past couple of problems, start thinking about it coding a basic PTV app (like our public transport app, 
# # if you aren't familiar). I'm happy to give hints, or you can get together and help each other. You need to simplify things, so only dummy  up one or at most two lines at first (or at last). 
# # The final product (coded, or just pseudo-coded) would take a user input of an origin station, and a destination station. 
#Start with one train line, represented by an array.
# If you extend it to two lines,  you need to think about how to represent the lines as data, and this might be a complex object. Think through all the options. 
#  You will need some way to carry the user data through the method/s, and some way to represent the MTR. You will likely need several small methods,  and will likely have to employ a full range of data types, such as hashes and arrays (and possibly arrays of arrays). 
#  I am more than happy to help out anyone stuck, particularly if they have a specific question where they are stuck, and have thought about it. 
#  I'm also happy to look through code people would like examined.

TRAIN_LINES = {
    "North South Line"=> {
        line_stations: ["Jurong East", "Bukit Batok", "Bukit Gombak", "Choa Chu Kang", "Yew Tee", "Kranji", "Marsiling", "Woodlands", "Admiralty", "Sembawang", "Canberra", "Yishun", "Khatib", "Yio Chu Kang", "Ang Mo Kio", "Bishan", "Braddell", "Toa Payoh", "Novena", "Newton", "Orchard", "Somerset", "Dhoby Ghaut", "City Hall", "Raffles Place", "Marina Bay", "Marina South Pier"],
        interchanges: ["Jurong East", "Bishan", "Newton", "Dhoby Ghaut", "City Hall", "Raffles Place", "Marina Bay"],
        direction1: "Jurong East",
        direction2: "Marina South Pier",
    },
    "North East Line"=> {
        line_stations: ["HarbourFront", "Outram Park", "Chinatown", "Clarke Quay", "Dhoby Ghaut", "Little India", "Farrer Park", "Boon Keng", "Potong Pasir", "Woodleigh", "Serangoon", "Kovan", "Hougang", "Buangkok", "Sengkang", "Punggol", "Punggol Coast"],
        interchanges: ["HarbourFront", "Outram Park", "Chinatown", "Dhoby Ghaut", "Little India", "Serangoon"],
        direction1: "HarbourFront",
        direction2: "Punggol Coast",
    },
    "Circle Line"=> {
        line_stations: ["Dhoby Ghaut", "Bras Basah", "Esplanade", "Promenade", "Nicoll Highway", "Stadium", "Mountbatten", "Dakota", "Paya Lebar", "MacPherson", "Tai Seng", "Bartley", "Serangoon", "Lorong Chuan", "Bishan", "Marymount", "Caldecott", "Bukit Brown", "Botanic Gardens", "Farrer Road", "Holland Village", "Buona Vista", "one-north", "Kent Ridge", "Haw Par Villa", "Pasir Panjang", "Labrador Park", "Telok Blangah", "HarbourFront"],
        interchanges: ["Dhoby Ghaut", "Promenade", "Paya Lebar", "MacPherson", "Serangoon", "Bishan", "Botanic Gardens", "Buona Vista", "HarbourFront"],
        direction1: "Dhoby Ghaut",
        direction2: "HarbourFront",
    },
    "Circle Extension"=> {
        line_stations: ["Promenade", "Bayfront", "Marina Bay"],
        interchanges: ["Promenade"],
        direction1: "Promenade",
        direction2: "Marina Bay",
    },
    "Downtown Line"=> {
        line_stations: ["Bukit Panjang", "Cashew", "Hillview", "Beauty World", "King Albert Park", "Sixth Avenue", "Tan Kah Kee", "Botanic Gardens", "Stevens", "Newton", "Little India", "Rochor", "Bugis", "Promenade", "Bayfront", "Downtown", "Telok Ayer", "Chinatown", "Fort Canning", "Bencoolen", "Jalan Besar", "Bendemeer", "Geylang Bahru", "Mattar", "MacPherson", "Ubi", "Kaki Bukit", "Bedok North", "Bedok Reservoir", "Tampines West", "Tampines", "Tampines East", "Upper Changi", "Expo", "Xilin", "Sungei Bedok"],
        interchanges: ["Botanic Gardens", "Newton", "Little India", "Bugis", "Promenade", "Bayfront", "Chinatown", "MacPherson", "Tampines", "Expo"],
        direction1: "Bukit Panjang",
        direction2:"Sungei Bedok"
    },
    "East West Line"=> {
        line_stations: ["Pasir Ris", "Tampines", "Simei", "Tanah Merah", "Bedok", "Kembangan", "Eunos", "Paya Lebar", "Aljunied", "Kallang", "Lavender", "Bugis", "City Hall", "Raffles Place", "Tanjong Pagar", "Outram Park", "Tiong Bahru", "Redhill", "Queenstown", "Commonwealth", "Buona Vista", "Dover", "Clementi", "Jurong East", "Chinese Garden", "Lakeside", "Boon Lay", "Pioneer", "Joo Koon", "Gul Circle", "Tuas Crescent", "Tuas West Road", "Tuas Link"],
        interchanges: ["Tampines", "Paya Lebar", "Bugis", "City Hall", "Raffles Place", "Outram Park", "Buona Vista", "Jurong East", "Tanah Merah"],
        direction1: "Pasir Ris",
        direction2: "Tuas Link",
    },
    "Airport Line" => {
        line_stations: ["Tanah Merah", "Expo", "Changi Airport"],
        interchanges: ["Tanah Merah", "Expo"],
        direction1: "Changi Airport",
        direction2: "Tanah Merah"
    }
}

TRAIN_STATIONS = {
    "Jurong East"=> ["North South Line", "East West Line"],
    "Bukit Batok"=> ["North South Line"],
    "Bukit Gombak"=> ["North South Line"],
    "Choa Chu Kang"=> ["North South Line"],
    "Yew Tee"=> ["North South Line"],
    "Kranji"=> ["North South Line"],
    "Marsiling"=> ["North South Line"],
    "Woodlands"=> ["North South Line"],
    "Admiralty"=> ["North South Line"],
    "Sembawang"=> ["North South Line"],
    "Canberra"=> ["North South Line"],
    "Yishun"=> ["North South Line"],
    "Khatib"=> ["North South Line"],
    "Yio Chu Kang"=> ["North South Line"],
    "Ang Mo Kio"=> ["North South Line"],
    "Bishan"=> ["North South Line", "Circle Line"],
    "Braddell"=> ["North South Line"],
    "Toa Payoh"=> ["North South Line"],
    "Novena"=> ["North South Line"],
    "Newton"=> ["North South Line", "Downtown Line"],
    "Orchard"=> ["North South Line"],
    "Somerset"=> ["North South Line"],
    "Dhoby Ghaut"=> ["North South Line", "North East Line", "Circle Line"],
    "City Hall"=> ["North South Line", "East West Line"],
    "Raffles Place"=> ["North South Line", "East West Line"],
    "Marina Bay"=> ["North South Line", "Circle Extension"],
    "Marina South Pier"=> ["North South Line"],
    "HarbourFront"=> ["North East Line", "Circle Line"],
    "Reserved station"=> ["North East Line"],
    "Outram Park"=> ["North East Line", "East West Line"],
    "Chinatown"=> ["North East Line", "Downtown Line"],
    "Clarke Quay"=> ["North East Line"],
    "Little India"=> ["North East Line", "Downtown Line"],
    "Farrer Park"=> ["North East Line"],
    "Boon Keng"=> ["North East Line"],
    "Potong Pasir"=> ["North East Line"],
    "Woodleigh"=> ["North East Line"],
    "Serangoon"=> ["North East Line", "Circle Line"],
    "Kovan"=> ["North East Line"],
    "Hougang"=> ["North East Line"],
    "Buangkok"=> ["North East Line"],
    "Sengkang"=> ["North East Line"],
    "Punggol"=> ["North East Line"],
    "Punggol Coast"=> ["North East Line"],
    "Bras Basah"=> ["Circle Line"],
    "Esplanade"=> ["Circle Line"],
    "Promenade"=> ["Circle Line", "Downtown Line", "Circle Extension"],
    "Nicoll Highway"=> ["Circle Line"],
    "Stadium"=> ["Circle Line"],
    "Mountbatten"=> ["Circle Line"],
    "Dakota"=> ["Circle Line"],
    "Paya Lebar"=> ["Circle Line", "East West Line"],
    "MacPherson"=> ["Circle Line", "Downtown Line"],
    "Tai Seng"=> ["Circle Line"],
    "Bartley"=> ["Circle Line"],
    "Lorong Chuan"=> ["Circle Line"],
    "Marymount"=> ["Circle Line"],
    "Caldecott"=> ["Circle Line"],
    "Bukit Brown"=> ["Circle Line"],
    "Botanic Gardens"=> ["Circle Line", "Downtown Line"],
    "Farrer Road"=> ["Circle Line"],
    "Holland Village"=> ["Circle Line"],
    "Buona Vista"=> ["Circle Line", "East West Line"],
    "one-north"=> ["Circle Line"],
    "Kent Ridge"=> ["Circle Line"],
    "Haw Par Villa"=> ["Circle Line"],
    "Pasir Panjang"=> ["Circle Line"],
    "Labrador Park"=> ["Circle Line"],
    "Telok Blangah"=> ["Circle Line"],
    "Keppel"=> ["Circle Line"],
    "Cantonment"=> ["Circle Line"],
    "Prince Edward"=> ["Circle Line"],
    "Bayfront"=> ["Circle Extension", "Downtown Line"],
    "Bukit Panjang"=> ["Downtown Line"],
    "Cashew"=> ["Downtown Line"],
    "Hillview"=> ["Downtown Line"],
    "Beauty World"=> ["Downtown Line"],
    "King Albert Park"=> ["Downtown Line"],
    "Sixth Avenue"=> ["Downtown Line"],
    "Tan Kah Kee"=> ["Downtown Line"],
    "Stevens"=> ["Downtown Line"],
    "Rochor"=> ["Downtown Line"],
    "Bugis"=> ["Downtown Line", "East West Line"],
    "Downtown"=> ["Downtown Line"],
    "Telok Ayer"=> ["Downtown Line"],
    "Fort Canning"=> ["Downtown Line"],
    "Bencoolen"=> ["Downtown Line"],
    "Jalan Besar"=> ["Downtown Line"],
    "Bendemeer"=> ["Downtown Line"],
    "Geylang Bahru"=> ["Downtown Line"],
    "Mattar"=> ["Downtown Line"],
    "Ubi"=> ["Downtown Line"],
    "Kaki Bukit"=> ["Downtown Line"],
    "Bedok North"=> ["Downtown Line"],
    "Bedok Reservoir"=> ["Downtown Line"],
    "Tampines West"=> ["Downtown Line"],
    "Tampines"=> ["Downtown Line", "East West Line"],
    "Tampines East"=> ["Downtown Line"],
    "Upper Changi"=> ["Downtown Line"],
    "Expo"=> ["Downtown Line", "Airport Line"],
    "Xilin"=> ["Downtown Line"],
    "Sungei Bedok"=> ["Downtown Line"],
    "Pasir Ris"=> ["East West Line"],
    "Simei"=> ["East West Line"],
    "Tanah Merah"=> ["East West Line", "Airport Line"],
    "Bedok"=> ["East West Line"],
    "Kembangan"=> ["East West Line"],
    "Eunos"=> ["East West Line"],
    "Aljunied"=> ["East West Line"],
    "Kallang"=> ["East West Line"],
    "Lavender"=> ["East West Line"],
    "Tanjong Pagar"=> ["East West Line"],
    "Tiong Bahru"=> ["East West Line"],
    "Redhill"=> ["East West Line"],
    "Queenstown"=> ["East West Line"],
    "Commonwealth"=> ["East West Line"],
    "Dover"=> ["East West Line"],
    "Clementi"=> ["East West Line"],
    "Chinese Garden"=> ["East West Line"],
    "Lakeside"=> ["East West Line"],
    "Boon Lay"=> ["East West Line"],
    "Pioneer"=> ["East West Line"],
    "Joo Koon"=> ["East West Line"],
    "Gul Circle"=> ["East West Line"],
    "Tuas Crescent"=> ["East West Line"],
    "Tuas West Road"=> ["East West Line"],
    "Tuas Link"=> ["East West Line"],
    "Changi Airport"=> ["Airport Line"]
}

STATION_SLUGS = {:jurongeast=>"Jurong East", :bukitbatok=>"Bukit Batok", :bukitgombak=>"Bukit Gombak", :choachukang=>"Choa Chu Kang", :yewtee=>"Yew Tee", :kranji=>"Kranji", :marsiling=>"Marsiling", :woodlands=>"Woodlands", :admiralty=>"Admiralty", :sembawang=>"Sembawang", :canberra=>"Canberra", :yishun=>"Yishun", :khatib=>"Khatib", :yiochukang=>"Yio Chu Kang", :angmokio=>"Ang Mo Kio", :bishan=>"Bishan", :braddell=>"Braddell", :toapayoh=>"Toa Payoh", :novena=>"Novena", :newton=>"Newton", :orchard=>"Orchard", :somerset=>"Somerset", :dhobyghaut=>"Dhoby Ghaut", :cityhall=>"City Hall", :rafflesplace=>"Raffles Place", :marinabay=>"Marina Bay", :marinasouthpier=>"Marina South Pier", :harbourfront=>"HarbourFront", :reservedstation=>"Reserved station", :outrampark=>"Outram Park", :chinatown=>"Chinatown", :clarkequay=>"Clarke Quay", :littleindia=>"Little India", :farrerpark=>"Farrer Park", :boonkeng=>"Boon Keng", :potongpasir=>"Potong Pasir", :woodleigh=>"Woodleigh", :serangoon=>"Serangoon", :kovan=>"Kovan", :hougang=>"Hougang", :buangkok=>"Buangkok", :sengkang=>"Sengkang", :punggol=>"Punggol", :punggolcoast=>"Punggol Coast", :brasbasah=>"Bras Basah", :esplanade=>"Esplanade", :promenade=>"Promenade", :nicollhighway=>"Nicoll Highway", :stadium=>"Stadium", :mountbatten=>"Mountbatten", :dakota=>"Dakota", :payalebar=>"Paya Lebar", :macpherson=>"MacPherson", :taiseng=>"Tai Seng", :bartley=>"Bartley", :lorongchuan=>"Lorong Chuan", :marymount=>"Marymount", :caldecott=>"Caldecott", :bukitbrown=>"Bukit Brown", :botanicgardens=>"Botanic Gardens", :farrerroad=>"Farrer Road", :hollandvillage=>"Holland Village", :buonavista=>"Buona Vista", :"one-north"=>"one-north", :kentridge=>"Kent Ridge", :hawparvilla=>"Haw Par Villa", :pasirpanjang=>"Pasir Panjang", :labradorpark=>"Labrador Park", :telokblangah=>"Telok Blangah", :keppel=>"Keppel", :cantonment=>"Cantonment", :princeedward=>"Prince Edward", :bayfront=>"Bayfront", :bukitpanjang=>"Bukit Panjang", :cashew=>"Cashew", :hillview=>"Hillview", :beautyworld=>"Beauty World", :kingalbertpark=>"King Albert Park", :sixthavenue=>"Sixth Avenue", :tankahkee=>"Tan Kah Kee", :stevens=>"Stevens", :rochor=>"Rochor", :bugis=>"Bugis", :downtown=>"Downtown", :telokayer=>"Telok Ayer", :fortcanning=>"Fort Canning", :bencoolen=>"Bencoolen", :jalanbesar=>"Jalan Besar", :bendemeer=>"Bendemeer", :geylangbahru=>"Geylang Bahru", :mattar=>"Mattar", :ubi=>"Ubi", :kakibukit=>"Kaki Bukit", :bedoknorth=>"Bedok North", :bedokreservoir=>"Bedok Reservoir", :tampineswest=>"Tampines West", :tampines=>"Tampines", :tampineseast=>"Tampines East", :upperchangi=>"Upper Changi", :expo=>"Expo", :xilin=>"Xilin", :sungeibedok=>"Sungei Bedok", :pasirris=>"Pasir Ris", :simei=>"Simei", :tanahmerah=>"Tanah Merah", :bedok=>"Bedok", :kembangan=>"Kembangan", :eunos=>"Eunos", :aljunied=>"Aljunied", :kallang=>"Kallang", :lavender=>"Lavender", :tanjongpagar=>"Tanjong Pagar", :tiongbahru=>"Tiong Bahru", :redhill=>"Redhill", :queenstown=>"Queenstown", :commonwealth=>"Commonwealth", :dover=>"Dover", :clementi=>"Clementi", :chinesegarden=>"Chinese Garden", :lakeside=>"Lakeside", :boonlay=>"Boon Lay", :pioneer=>"Pioneer", :jookoon=>"Joo Koon", :gulcircle=>"Gul Circle", :tuascrescent=>"Tuas Crescent", :tuaswestroad=>"Tuas West Road", :tuaslink=>"Tuas Link", :changiairport=>"Changi Airport"}

def connect_stations(origin, destination)
    original_lines = TRAIN_STATIONS[origin]
    destination_lines = TRAIN_STATIONS[destination]
    if (original_lines & destination_lines).length > 0
        routes = find_direct_train(origin, destination)
        minimum = routes[0][:total]
        routes += change_train(origin, destination, original_lines, destination_lines, minimum)
    elsif change_train(origin, destination, original_lines, destination_lines).length > 0
        routes = change_train(origin, destination, original_lines, destination_lines)
        minimum = routes[0][:total]
        connections = find_connecting_line(origin, destination, original_lines, destination_lines)
        routes += make_connections(origin, destination, original_lines, destination_lines, connections, minimum)
    else
        connections = find_connecting_line(origin, destination, original_lines, destination_lines)
        routes = make_connections(origin, destination, original_lines, destination_lines, connections)
    end
    routes.sort! {|a,b| a[:total] <=> b[:total]}
    routes = routes.select {|route| route[:total] < (routes[0][:total]+10)}
    if routes.empty?
        puts "Could not find you a route between #{orgin} and #{destination}, within 2 line changes"
    else
        show_all_routes(origin, destination, routes)
    end
end

def find_direct_train(origin, destination)
    routes = []
    lines = TRAIN_STATIONS[origin] & TRAIN_STATIONS[destination]
    lines.each do |line|
        difference = difference_stations(origin, destination, line)
        routes.push({type:"direct", origin: origin, destination: destination, line: line, total: abs_difference_stations(origin, destination, line)})
    end
    routes.sort! {|a,b| a[:total] <=> b[:total]}
    return routes      
end

def show_all_routes(origin, destination, routes)
    system("clear")
    puts "Showing you routes from #{origin} to #{destination}"
    routes.each_with_index do |route, index|
        puts "Option # #{index+1}"
        if route[:type] == "direct"
            show_direct_route(origin, destination, route)
        elsif route[:type] == "change"
            show_change_route(origin, destination, route)
        elsif route[:type] == "connecting"
            show_connecting_route(origin, destination, route)
        end
        puts ""
    end
end

def show_direct_route(origin, destination, route)
    puts "#{origin} --#{route[:line]}--> #{destination}. (Total Stops: #{route[:total]} | Direct Line)"
    direct_train(origin, destination, route[:line])
end

def show_change_route(origin, destination, route)
    puts "#{origin} --#{route[:origin_line]}--> #{route[:interchange]} --#{route[:destination_line]}--> #{destination}. (Total Stops: #{route[:total]} | Line Changes: 1)"
    direct_train(origin, route[:interchange], route[:origin_line])
    direct_train(route[:interchange], destination, route[:destination_line])
end

def show_connecting_route(origin, destination, route)
    puts "#{origin} --#{route[:origin_line]}--> #{route[:origin_interchange]} --#{route[:connecting_line]}--> #{route[:destination_interchange]} --#{route[:destination_line]}--> #{destination}. (Total Stops: #{route[:total]} | Line Changes: 2)"
    direct_train(origin, route[:origin_interchange], route[:origin_line])
    direct_train(route[:origin_interchange], route[:destination_interchange], route[:connecting_line])
    direct_train(route[:destination_interchange], destination, route[:destination_line])
end

def direct_train(origin, destination, line)
    difference = difference_stations(origin, destination, line)
    puts "- From #{origin} to #{destination} (#{difference[:stations_apart].abs} stations apart): travel on the #{line} towards #{difference[:direction]}."   
end

def make_connections(origin, destination, original_lines, destination_lines, connections, minimum = 100)
    routes = []
    connections.each do |connection|
        combos = connection[:origin_interchange].product(connection[:destination_interchange])
        combos.each do |combo|
            route = {connecting_line: connection[:line], type: "connecting"}
            route[:origin_interchange] = combo[0]
            route[:destination_interchange] = combo[1]
            route[:origin_line] = (TRAIN_STATIONS[combo[0]] & original_lines)[0]
            route[:destination_line] = (TRAIN_STATIONS[combo[1]] & destination_lines)[0]
            route[:total] = abs_difference_stations(origin, route[:origin_interchange], route[:origin_line]) + abs_difference_stations(route[:origin_interchange], route[:destination_interchange], route[:connecting_line]) + abs_difference_stations(route[:destination_interchange], destination, route[:destination_line])
            routes.push(route) if route[:total] < minimum
        end
    end
    routes.sort! {|a,b| a[:total] <=> b[:total]}
    return routes
end

def find_connecting_line(origin, destination, original_lines, destination_lines)
    origin_interchanges = original_lines.flat_map {|line| TRAIN_LINES[line][:interchanges]}
    destination_interchanges = destination_lines.flat_map {|line| TRAIN_LINES[line][:interchanges]}
    connect1 = origin_interchanges.flat_map{|station| TRAIN_STATIONS[station]}
    connect2 = destination_interchanges.flat_map{|station| TRAIN_STATIONS[station]}
    connecting_lines = connect1 & connect2
    if connecting_lines.length > 0
        connections = []
        connecting_lines.each do |connecting_line|
            connection = {line: connecting_line, origin_interchange:[], destination_interchange:[]}
            origin_interchanges.each {|interchange| connection[:origin_interchange].push(interchange) if TRAIN_STATIONS[interchange].include?(connecting_line)}
            destination_interchanges.each {|interchange| connection[:destination_interchange].push(interchange) if TRAIN_STATIONS[interchange].include?(connecting_line)}
            connections.push(connection)
        end
    return connections
    end
end

def change_train(origin, destination, original_lines, destination_lines, minimum=100)
    routes = []
    original_lines.each do |line|
        interchanges = TRAIN_LINES[line][:interchanges]
        interchanges.each do |interchange|
            intersecting_lines = TRAIN_STATIONS[interchange] & destination_lines
            if (intersecting_lines).length > 0
                intersecting_lines.each do |intersecting_line|
                    routes.push({type: "change", origin: origin, destination: destination, origin_line: line, interchange: interchange, destination_line: intersecting_line})
                end
            end
        end
    end
    routes.each do |route|
        diff1 = difference_stations(route[:origin], route[:interchange], route[:origin_line])
        diff2 = difference_stations(route[:interchange], route[:destination], route[:destination_line])
        route[:total] = diff1[:stations_apart].abs + diff2[:stations_apart].abs
    end
    routes.sort! {|a,b| a[:total] <=> b[:total]}
    routes = routes.select {|route| route[:total] < (routes[0][:total]+5) && route[:total] < minimum }
    return routes
end

def abs_difference_stations(origin, destination, line)
    stations_apart = TRAIN_LINES[line][:line_stations].index(origin) - TRAIN_LINES[line][:line_stations].index(destination)
    return stations_apart.abs
end

def difference_stations(origin, destination, line)
    stations_apart = TRAIN_LINES[line][:line_stations].index(origin) - TRAIN_LINES[line][:line_stations].index(destination)
    direction = (stations_apart > 0) ? TRAIN_LINES[line][:direction1] : TRAIN_LINES[line][:direction2]
    return {stations_apart: stations_apart, direction: direction}
end

def main_program
    puts "Welcome to Singapore MRT"
    puts "Which station are you travelling from?"
    origin = validate_user_station
    puts "Where do you wish to travel to?"
    destination = validate_user_station
    connect_stations(origin, destination)
    puts "Plan another journey? 'Y' to try again, any other key to quit"
    user_input = gets.chomp.downcase
    if user_input == 'y'
        system("clear")
        main_program
    else
        exit
    end
end

def validate_user_station
    user_input = gets.strip.downcase.gsub(" ", "").to_sym
    if STATION_SLUGS.include?(user_input)
        return STATION_SLUGS[user_input]
    else
        puts "That is not a valid station. Try again."
        validate_user_station
    end
end

main_program
