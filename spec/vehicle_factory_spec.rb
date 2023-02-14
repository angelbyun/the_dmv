require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new 
        @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    end

    describe '#initialize' do
        it 'exists' do
         expect(@factory).to be_an_instance_of(VehicleFactory)
        end
    end

    describe '#create vehicles' do
        it 'create vehicles' do
        @factory.create_vehicles(@wa_ev_registrations)

        expect(@wa_ev_registrations).to be_an_instance_of(Array)
        #require 'pry'; binding.pry
        end
    end

end