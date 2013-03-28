require '../Src/ParkingLot'
require '../Src/ParkingException'
require '../Src/ParkingBoy'

class SmartParkingBoy < ParkingBoy
    
	def Park car
	    parkingLot = getParkingLotWithMaxAvaliableCount
		if parkingLot.Parkable? then parkingLot.Park car else nil end
	end
	
	def getParkingLotWithMaxAvaliableCount
	    #maxCount = 0
		#candidateParkingLot = nil
		#@parkingLots.each {|parkingLot| if parkingLot.avaliable_count > maxCount then candidateParkingLot = parkingLot end}
		#candidateParkingLot
		
		@parkingLots.max{|lhs, rhs| lhs.avaliable_count <=> rhs.avaliable_count}
	end
	
end