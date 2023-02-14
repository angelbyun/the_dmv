class VehicleFactory
    attr_reader :factory_vehicles

    def initialize
        @factory_vehicles = []
    end

    def create_vehicles(info)
        info.map do |car|
            new_car = {vin: car[:vin_1_10],
                year: car[:model_year],
                engine: :ev}
            @factory_vehicles << Vehicle.new(new_car)
        end
    end
end
        # [#<Vehicle:0x000000012d3812f0 @engine=:ev, @make="TOYOTA", @model="Prius Plug-in", @plate_type=nil, @registration_date=nil, @vin="JTDKN3DP8D", @year="2013">,
  #<Vehicle:0x000000012d3812a0 @engine=:ev, @make="TOYOTA", @model="Prius Prime", @plate_type=nil, @registration_date=nil, @vin="JTDKARFP9J", @year="2018">,
  #<Vehicle:0x000000012d381200 @engine=:ev, @make="NISSAN", @model="Leaf", @plate_type=nil, @registration_date=nil, @vin="1N4AZ1CP0J", @year="2018">,
  #<Vehicle:0x000000012d381188 @engine=:ev, @make="NISSAN", @model="Leaf", @plate_type=nil, @registration_date=nil, @vin="1N4AZ1CP0J", @year="2018">,
  #<Vehicle:0x000000012d381138 @engine=:ev, @make="NISSAN", @model="Leaf", @plate_type=nil, @registration_date=nil, @vin="1N4AZ1CP0J", @year="2018">,
  # ...]

    #  [{:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
#    :vin_1_10=>"JTDKN3DP8D",
#    :dol_vehicle_id=>"229686908",
#    :model_year=>"2013",
#    :make=>"TOYOTA",
#    :model=>"Prius Plug-in",
#    ...},
#    ...,
#    {:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
#     :vin_1_10=>"1G1RD6E47D",
#     :dol_vehicle_id=>"289314742",
#     :model_year=>"2013",
#     :make=>"CHEVROLET",
#     :model=>"Volt",
#     ...}]