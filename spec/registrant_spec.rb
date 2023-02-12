require 'rspec'
require 'spec_helper'
require './lib/registrant'

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true )
        @registrant_2 = Registrant.new('Penny', 15 )
        @registrant_3 = Registrant.new('Tucker', 15 )    
    end

    describe '#initialize' do
        it 'can initialize' do
            expect(@registrant_1.name).to eq('Bruce')
            expect(@registrant_1.age).to eq(18)
            expect(@registrant_1.permit?).to eq(true)
            expect(@registrant_2.name).to eq('Penny')
            expect(@registrant_2.age).to eq(15)
            expect(@registrant_2.permit?).to eq(false)
            # expect(@registrant_3.name).to eq('Tucker')
            # expect(@registrant_3.age).to eq(15)
            # expect(@registrant_3.permit?).to eq(false)
        end
    end

    describe '#license data' do
        it 'can add license data' do
            expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
            expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
            expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        end
    end

    describe '#earn permit' do
        it 'can earn a permit' do
            expect(@registrant_2.earn_permit).to eq(true)
        end
    end

end