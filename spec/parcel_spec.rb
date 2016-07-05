require("rspec")
require("parcel.rb")

describe("Parcel") do
  it("the total volume of the package is < 30, the base price to ship it is 5") do
    test_package = Parcel.new(2,3,4,40,0,0,"true")
    expect(test_package.volume()).to(eq(5))
  end
  it("the total volume of the package between 30 and 100, the base price to ship it is 10") do
    test_package = Parcel.new(5,5,3,200,0,0,"true")
    expect(test_package.volume()).to(eq(10))
  end
  it("the total volume of the package is greater than 100, the base price to ship it is 20") do
    test_package = Parcel.new(10,10,10,4,0,0,"true")
    expect(test_package.volume()).to(eq(20))
  end
  it("determines the price of a package with standard shipping and in the US") do
    test_package = Parcel.new(2,3,4,2,0,0,"true")
    expect(test_package.cost_to_ship()).to(eq("5.00"))
  end
  it("determine the price of a package with express shipping and in the US") do
    test_package = Parcel.new(2,3,4,3,0,20,"true")
    expect(test_package.cost_to_ship()).to(eq("37.50"))
  end
  it("determine the price of a package with express shipping and international") do
    test_package = Parcel.new(2,3,4,2,20,20,"true")
    expect(test_package.cost_to_ship()).to(eq("45.00"))
  end
  it("determine the price of a package that is too large to ship") do
    test_package = Parcel.new(4,30,29,4,20,20,"true")
    expect(test_package.cost_to_ship()).to(eq("your package is too large to ship"))
  end
  it("determine the price of a package if the the measurements are in metric unites") do
    test_package = Parcel.new(8,5,12,2,0,0,"false")
    expect(test_package.cost_to_ship()).to(eq("5.00"))
  end
  it("determine the price of a package if everything is messed up") do
    test_package = Parcel.new(4.3,10.6,11.93,4.53,20,0,"false")
    expect(test_package.cost_to_ship()).to(eq("67.95"))
  end
end
