require '../Src/ParkingLot'
require '../Src/ParkingException'
require 'minitest/autorun'

class ParkingLotTest < MiniTest::Unit::TestCase 

	TOTAL_COUNT = 2
	PARKING_LOT_ID = "parking_lot_1"
	
    def setup
		@_sut = ParkingLot.new(PARKING_LOT_ID, TOTAL_COUNT)
	end
	
	def teardown
	end
	
	def test_Dispaly_Parkable_True_Given_ParkingLot_Avaliable
		assert @_sut.Parkable?
	end
	
	def test_Dispaly_Parkable_False_Given_ParkingLot_Not_Avaliable
		@_sut = ParkingLot.new("parking_lot_2", 0)
		assert !@_sut.Parkable?
	end
	
	def test_Park_Success_Given_ParkingLot_Avaliable
		refute_nil @_sut.Park Car.new("car1")
	end
	
	def test_Park_Fail_Given_ParkingLot_No_Avaliable_Slot
		refute_nil @_sut.Park Car.new("car1")
		refute_nil @_sut.Park Car.new("car2")
		
		assert_raises ParkingException do
			@_sut.Park Car.new("car3")
		end
	end
	
	def test_ParkingLot_Avaliable_Given_Unpark_Succeed
		refute_nil @_sut.Park Car.new("car1")
		parking_ticket=@_sut.Park Car.new("car2")
		
		assert !@_sut.Parkable?
		
		@_sut.Unpark(parking_ticket)
		
		assert @_sut.Parkable?
	end
	
	def test_Unpark_Fail_Given_Nil_Ticket
		assert_raises ParkingException do
			@_sut.Unpark nil
		end
	end
	
	def test_Unpark_Fail_Given_Fake_Ticket_With_Minus_Slot_Id
		assert_raises ParkingException do
			@_sut.Unpark ParkingTicket.new(@_sut, -1)
		end
	end
	
	def test_Unpark_Fail_Given_Fake_Ticket_With_Over_Large_Slot_Id
		assert_raises ParkingException do
			@_sut.Unpark ParkingTicket.new(@_sut, TOTAL_COUNT + 10)
		end
	end
	
	def test_Unpark_Fail_Given_Fake_Ticket_Not_From_Correct_Parking_Lot
		assert_raises ParkingException do
			@_sut.Unpark ParkingTicket.new(nil, TOTAL_COUNT - 1 )
		end
	end
	
	def test_Unpark_Success_Given_Correct_Ticket
		car = Car.new("car1")
		parking_ticket=@_sut.Park car
		assert_equal car, (@_sut.Unpark parking_ticket)
	end
	
	def test_Unpark_Faile_Given_Correct_Ticket_Used_Twice
		parking_ticket=@_sut.Park Car.new("car1")
		refute_nil @_sut.Unpark parking_ticket
		assert_raises ParkingException do
			@_sut.Unpark parking_ticket
		end
	end
	
end