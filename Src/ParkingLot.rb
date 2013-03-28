require '../Src/ParkingTicket'
require '../Src/ParkingException'
require '../Src/Car'

class ParkingLot
	def initialize(id, count)
		@total_count = count
		@avaliable_count = count
		@id=id
		@slot=Array.new(count)
	end
	
	def Parkable?
		@avaliable_count>0
	end
	
	def Park car
		raise ParkingException, "no avaliable parking slot" if !Parkable?
		
		@slot[@total_count-@avaliable_count]=car
		@avaliable_count -= 1
		ParkingTicket.new(@id, @total_count- @avaliable_count - 1)
	end
	
	def Unpark parking_ticket
		raise ParkingException, "Fake ticket" if parking_ticket.nil? || (!ValidTicket? parking_ticket)
		raise ParkingException, "No car avaliable" if @slot[parking_ticket.parkingSlot_id].nil?
		
		@avaliable_count += 1
		car = @slot[parking_ticket.parkingSlot_id]
		@slot[parking_ticket.parkingSlot_id]=nil
		car
	end
	
	def ValidSlotId? slot_id
		slot_id >= 0 && slot_id < @total_count
		true
	end
	
	def ValidTicket? ticket
		ticket.parkingLot_id==@id && (ValidSlotId? ticket.parkingSlot_id)
	end
	
	attr_reader:id
	attr_reader:avaliable_count
end