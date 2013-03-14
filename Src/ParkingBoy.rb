require '../Src/ParkingLot'
require '../Src/ParkingException'


class ParkingBoy
    
	def initialize()
		@parkinglots=Array.new
	end
	
	def AddParkingLot(lot)
		@parkinglots[@parkinglots.length]=lot
	end
	
	def Parkable?
		@parkinglots.length>0
	end

end