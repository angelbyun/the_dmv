class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(name, address, phone)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      vehicle.registration_date = Date.today.year
      @registered_vehicles << vehicle
      if vehicle.antique?
        vehicle.plate_type = :antique
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        vehicle.plate_type = :ev
        @collected_fees += 200
      else vehicle.plate_type = :regular
        @collected_fees += 100
      end
      @registered_vehicles
    else
      @registered_vehicles
    end
  end
  
end
