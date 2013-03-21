require '../Src/ParkingBoy'
require '../Src/ParkingException'
require 'minitest/autorun'

class ParkingLotTest < MiniTest::Unit::TestCase 

    def setup
		@_sut = ParkingBoy.new
		@_parkingLot_avaliable=ParkingLot.new("parkinglot_avaliable",1)
		@_parkingLot_unavaliable=ParkingLot.new("parkinglot_unavaliable",0)
		@_car=Car.new("car1")
	end
	
	def teardown
	end
	
	def test_Dispaly_Parkable_False_Given_No_ParkingLot_Avaliable
		assert !@_sut.Parkable?
	end
	
	def test_Dispaly_Parkable_True_Given_ParkingLot_Avaliable
	    @_sut.AddParkingLot(@_parkingLot_avaliable)
		assert @_sut.Parkable?
	end
	
	def test_Dispaly_Parkable_False_Given_ParkingLot_Unavaliable
	    @_sut.AddParkingLot(@_parkingLot_unavaliable)
		assert !@_sut.Parkable?
	end
	
	def test_Park_Success_Given_ParkingLot_Avaliable
	    @_sut.AddParkingLot(@_parkingLot_avaliable)
		refute_nil @_sut.Park @_car
		assert !@_sut.Parkable?
	end
	
	def test_Park_Fail_Given_ParkingLot_Unavaliable
	    @_sut.AddParkingLot(@_parkingLot_unavaliable)
		assert_nil @_sut.Park @_car
	end
	
	def test_Unpark_Success_Given_Parking_Success
	    @_sut.AddParkingLot(@_parkingLot_avaliable)
		parkingTicket=@_sut.Park @_car
		refute_nil parkingTicket
		assert_equal @_car, @_sut.Unpark(parkingTicket)
	end
	
	def test_Unpark_Success_Given_Nil_Ticket
		assert_nil @_sut.Unpark nil
	end
	
	def test_Unpark_Success_Given_Wrong_Ticket
		assert_nil @_sut.Unpark ParkingTicket.new("wrong_parkingLot_id", "wrong_parking_slot_id")
	end
	
	
	
end