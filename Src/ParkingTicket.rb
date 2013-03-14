class ParkingTicket
	def initialize parkingLot_id, parkingSlot_id
		@parkingLot_id=parkingLot_id
		@parkingSlot_id=parkingSlot_id
	end
	
	def Valid? parkingLot
		@parkingLot_id==parkingLot.id && (parkingLot.ValidSlotId? @parkingSlot_id)
	end
	
	attr_reader:parkingSlot_id
end