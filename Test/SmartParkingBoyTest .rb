require '../Src/SmartParkingBoy'
require '../Src/ParkingException'
require 'minitest/autorun'

class SmartParkingBoyTest < MiniTest::Unit::TestCase 

    def setup
		@_sut = SmartParkingBoy.new
		@_parkingLot_2 = ParkingLot.new("parkinglot_3",2)
		@_parkingLot_3 = ParkingLot.new("parkinglot_3",3)
		@_sut.AddParkingLot(@_parkingLot_2)
		@_sut.AddParkingLot(@_parkingLot_3)
		@_car_1=Car.new("car1")
		@_car_2=Car.new("car2")
	end
	
	def teardown
	end
	
	def test_park_successfully_On_lot_with_bigger_capacity_given_two_parkinglots
	    ticket = @_sut.Park @_car_1
		assert @_parkingLot_3.ValidTicket? ticket
	end
	
	def test_park_successfully_On_first_lot_given_two_parkinglots_with_same_capacity
	    @_sut.Park @_car_1
		ticket = @_sut.Park @_car_2
		@_parkingLot_2.ValidTicket? ticket
	end
	
end