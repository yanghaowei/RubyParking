require '../Src/ParkingBoy'
require '../Src/ParkingException'
require 'minitest/autorun'

class ParkingLotTest < MiniTest::Unit::TestCase 

	
    def setup
		@_sut = ParkingBoy.new
		@_sut.AddParkingLot(ParkingLot.new("1",1))
		@_sut.AddParkingLot(ParkingLot.new("2",1))
	end
	
	def teardown
	end
	
	def test_Dispaly_Parkable_True_Given_Both_ParkingLot_Avaliable
		assert @_sut.Parkable?
	end
	

	
end