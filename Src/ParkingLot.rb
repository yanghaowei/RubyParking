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
		raise ParkingException, "Fake ticket" if parking_ticket.nil? || (!parking_ticket.Valid? self)
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
	
	def Empty?
		avaliable_count==total_count
	end
	
	attr_reader:id
end