class ParkingTicket
	def initialize parkingLot_id, parkingSlot_id
		@parkingLot_id=parkingLot_id
		@parkingSlot_id=parkingSlot_id
	end
	
	attr_reader:parkingLot_id
	attr_reader:parkingSlot_id
end