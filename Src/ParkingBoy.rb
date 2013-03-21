require '../Src/ParkingLot'
require '../Src/ParkingException'


class ParkingBoy
    
	def initialize()
		@parkingLots=Array.new
	end
	
	def AddParkingLot(lot)
		@parkingLots[@parkingLots.length]=lot
	end
	
	def Parkable?
		@parkingLots.each {|parkingLot| if parkingLot.Parkable? then return true end}
		false
	end
	
	def Park car
		@parkingLots.each {|parkingLot| if parkingLot.Parkable? then return parkingLot.Park car end}
		nil
	end
	
	def Unpark ticket
		@parkingLots.each {|parkingLot| if ticket.Valid? parkingLot then return parkingLot.Unpark ticket end}
		nil
	end

end