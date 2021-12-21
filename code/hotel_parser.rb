require 'yaml'

class HotelParser
  # Implement a method to parse the contents of a YAML file and return
  # an object whose values are accessible using the [] operator or method calls
  #
  # Note: Use of the YAML library is fine (encouraged, even) but please don't
  #       use any third-party gems that enable the required functionality.
  def self.parse(filename)
    new_filename = filename
    hash = YAML.load_file(filename)
    hotel_obj = Struct.new(:hotels).new(hotel_traversal(hash["hotels"]))
    return hotel_obj
  end

  def self.hotel_traversal(hotel_hash)
    hotels_arr = Array.new
    hotel_hash.each do |val|
      new_hotel = Struct.new(:hotel_name,:rooms).new(val['hotel_name'], room_traversal(val['rooms']))
      hotels_arr << new_hotel
    end  
    return hotels_arr
  end

  def self.room_traversal(rooms)
    rooms_arr = Array.new
    rooms.each do |room|
      new_room = Struct.new(:room_name,:amenities).new(room['room_name'],room['amenities'])
      rooms_arr << new_room
    end
    return rooms_arr
  end
end


