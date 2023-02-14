class DmvFacility
    attr_reader :location,
                :facility_instances

    def initialize
        @location = []
        @facility_instances = []
    end

    def create_facilities(all_locations)
        office_locations.map do |location| 
            if location.has_key?(:state) && location[:state] == ""
            @location << location
            end
        end
    end

    def create_facilities_or(facility_database)
        facility_database.each do |facility|
            
            address_info = facility[:location_1][:human_address]
            correct_address_info = JSON.parse(address_info)
            facility_instances << (Facility.new({name: facility[:title], address: correct_address_info.values.join(" "), phone: facility[:phone_number]}))
            
        end
        facility_instances
    end

    def create_facilities_ny(facility_database)
        facility_database.map do |facility|

        new_facility = {
            name: facility[:office_name],
            address: facility.fetch_values(:street_address_line_1, :city, :state, :zip_code).join(" "),
            phone: facility[:public_phone_number]
        }
        facility_instances << Facility.new(new_facility)
        end
        facility_instances
    end

    def create_facilities_mo(facility_database)
        facility_database.map do |facility|

        new_facility = {
            name: facility[:name],
            address: facility.fetch_values(:address1, :city, :state, :zipcode).join(" "),
            phone: facility[:phone]
        }
        facility_instances << Facility.new(new_facility)
        end
        facility_instances
    end
end

