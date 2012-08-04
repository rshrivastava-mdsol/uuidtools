require File.expand_path("../../spec_helper.rb", __FILE__)

def pending_if_root_required
  if @mac_address == nil
    output = `ifconfig -a 2>&1`
    if output =~ /inet/ &&
        output =~ /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/ &&
        output =~ /Warning: cannot open/
      pending("Cannot get MAC address without root?")
    end
  end
end

describe UUIDTools::UUID, "when obtaining a MAC address" do
  before do
    @mac_address = UUIDTools::UUID.mac_address
  end

  it "should obtain a MAC address" do
    pending_if_root_required()
    @mac_address.should_not be_nil
  end

  it "should cache the MAC address" do
    pending_if_root_required()
    @mac_address.object_id.should == UUIDTools::UUID.mac_address.object_id
  end
end
