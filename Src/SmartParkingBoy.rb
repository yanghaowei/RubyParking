require '../Src/ParkingLot'
require '../Src/ParkingException'
require '../Src/ParkingBoy'

class SmartParkingBoy < ParkingBoy
    
	def Park car
		maxCount = 0
		candidateParkingLot = ParkingLot.new("nil",0)
		@parkingLots.each {|parkingLot| if parkingLot.avaliable_count > maxCount then candidateParkingLot = parkingLot end}
		candidateParkingLot.Park car
	end
	
end