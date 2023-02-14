require 'spec_helper'

RSpec.describe Dmv do
    before(:each) do
        @location = DmvFacility.new
        @dmv_facility = DmvFacility.new
        @or_facility = DmvDataService.new.or_dmv_office_locations
        @ny_facility = DmvDataService.new.ny_dmv_office_locations
        @mo_facility = DmvDataService.new.mo_dmv_office_locations
    end

    describe '#initialize' do
        it 'initializes' do
          expect(@location).to be_an_instance_of(DmvFacility) 
        end
    end

    describe '@create facilities' do
        it 'can create facilities' do
            @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
            @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
            @created_facilities = @location.create_facilities_or(@or_facility)
            expect(@created_facilities[0].name).to eq(@facility_1.name)
            expect(@created_facilities[1].name).to eq(@facility_2.name)
            expect(@created_facilities[0].address).to eq(@facility_1.address)
            expect(@created_facilities[1].address).to eq(@facility_2.address)
            expect(@created_facilities[0].phone).to eq(@facility_1.phone)
            expect(@created_facilities[1].phone).to eq(@facility_2.phone)
        end
    end

    describe '@create facilities ny' do
        it 'can create facilities for ny' do
            @facility_1 = Facility.new({name: 'JAMESTOWN', address: '512 WEST 3RD STREET JAMESTOWN NY 14701', phone: '7166618220' })
            @facility_2 = Facility.new({name: 'SARATOGA SPRINGS - WILTON', address: '3065 ROUTE 50 SARATOGA SPRINGS NY 12866', phone: '5185847403' })
            @created_facilities_ny = @location.create_facilities_ny(@ny_facility)
            expect(@created_facilities_ny[0].name).to eq(@facility_1.name)
            expect(@created_facilities_ny[1].name).to eq(@facility_2.name)
            expect(@created_facilities_ny[0].address).to eq(@facility_1.address)
            expect(@created_facilities_ny[1].address).to eq(@facility_2.address)
            expect(@created_facilities_ny[0].phone).to eq(@facility_1.phone)
            expect(@created_facilities_ny[1].phone).to eq(@facility_2.phone)
        end
    end

    describe '@create facilities mo' do
        it 'can create facilities for mo' do
            @facility_1 = Facility.new({name: 'SAINTE GENEVIEVE ', address: '753 STE. GENEVIEVE DR STE GENEVIEVE  MO 63670', phone: '(573) 883-2344' })
            @facility_2 = Facility.new({name: 'OAKVILLE', address: '3164 TELEGRAPH ROAD ST LOUIS MO 63125', phone: '(314) 887-1050' })
            @created_facilities_mo = @location.create_facilities_mo(@mo_facility)
            expect(@created_facilities_mo[0].name).to eq(@facility_1.name)
            expect(@created_facilities_mo[1].name).to eq(@facility_2.name)
            expect(@created_facilities_mo[0].address).to eq(@facility_1.address)
            expect(@created_facilities_mo[1].address).to eq(@facility_2.address)
            expect(@created_facilities_mo[0].phone).to eq(@facility_1.phone)
            expect(@created_facilities_mo[1].phone).to eq(@facility_2.phone)
        end
    end
end

# [{"number":"153","dorregionnumber":"10","type":"1MV","name":"SAINTE GENEVIEVE ","address1":"753 STE. GENEVIEVE DR","city":"STE GENEVIEVE ","state":"MO","zipcode":"63670","county":"Ste. Genevieve","phone":"(573) 883-2344","fax":"(573) 880-5062","size":"1","email":"SAINTEGENEVIEVEAGENTOFFICE@DOR.MO.GOV","agent":"STE. GENEVIEVE CHAMBER OF COMMERCE","officemanager":"KARA GRASS","daysopen":"Monday - Friday - 8:30 to 5:00, Last 4 week days - 8:00 to 5:00","holidaysclosed":"Independence Day (07/04/22), Labor Day (09/05/22), Columbus Day (10/10/22), Veterans Day (11/11/22), Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), Lincoln’s Birthday (02/13/23), President’s Day (02/20/23), Truman’s Birthday (05/08/23), Memorial Day (05/29/23), Independence Day (07/04/23), Labor Day (09/04/23), Columbus Day (10/09/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)","additionaldaysclosed":"8/19/2022,     10/4/2022 (at 10:00 AM),     10/11/2022,     11/25/22,     11/26/22,     12/22/2022,     12/23/2022,    12/23/22,     12/24/22,    12/26/22,     12/27/2022 (open at 8:00 AM ),     12/31/2022,    1/25/2023,   1/30/2023 (at 8:00 AM until 11:00 AM ),   1/30/2023 (open at 11:00 AM ),     11/24/23,     12/22/23,     12/29/23","latlng":{"latitude":"37.968058","longitude":"-90.049637"},"othercontactinfo":"Website: www.stegenchamber.orgPublic E-Mail: sglicenseoffice@gmail.com",":@computed_region_ny2h_ckbz":"303",":@computed_region_c8ar_jsdj":"71",":@computed_region_ikxf_gfzr":"2209"}
# ,{"number":"166","dorregionnumber":"8","type":"1MV","name":"OAKVILLE","address1":"3164 TELEGRAPH ROAD","city":"ST LOUIS","state":"MO","zipcode":"63125","county":"St. Louis County","phone":"(314) 887-1050","fax":"(314) 887-1051","size":"3","email":"OAKVILLEAGENTOFFICE@DOR.MO.GOV","agent":"York Management Group, LLC.","officemanager":"Rita Lahr","daysopen":"Monday-Friday - 9:00 to 5:00, Last Saturday  - 9:00 to 12:00","holidaysclosed":"Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), President’s Day (02/20/23), Memorial Day (05/29/23), Juneteenth (06/19/2023), Independence Day (07/04/23), Labor Day (09/04/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)","additionaldaysclosed":"7/2/22,    9/3/22,    11/25/22,    11/26/22,    11/28/2022 (at 11:45 AM),    12/22/2022 (at 1:30 PM ),    12/31/22,   1/25/2023 (at 9:00 AM until 11:00 AM ),   1/25/2023 (open at 11:00 AM ),  1/30/2023 (at 9:00 AM until 10:00 AM ),  1/30/2023 (open at 10:00 AM ),    5/27/23,    9/2/23,    11/24/23,    11/25/23,    12/30/23","latlng":{"latitude":"38.4981572","longitude":"-90.3001675"},"facebook_url":"https://m.facebook.com/people/Oakville-License-Office/100069096876261/","textingphonenumber":"(314) 730-0606","othercontactinfo":"Public Email: oakville@yorkmanagementgroup.com",":@computed_region_ny2h_ckbz":"248",":@computed_region_c8ar_jsdj":"51",":@computed_region_ikxf_gfzr":"2210"}



