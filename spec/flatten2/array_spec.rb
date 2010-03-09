require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Array#flatten2" do
  context "when the array is empty" do
    before { @array = [] }

    it "should return an empty array" do
      @array.flatten2.should == []
    end
  end

  context "when the array is composed of nested, arrays, with no non-array values" do
    before { @array = [[[[[[[[], []]], []]]], [], [[]]]] }

    it "should return an empty array" do
      @array.flatten2.should == []
    end
  end

  context "when the array is already flat" do
    before { @array = [1, 2, 3, 4, 5] }
    
    it "should return an array identical to self when self is already flat" do
      @array.flatten2.should == @array
    end
  end

  context "when the array contains 1 level of nested arrays" do
    before { @array = [1, 2, 3, [4, 5, 6], 7] }
    
    it "should return the flattened version" do
      @array.flatten2.should == [1, 2, 3, 4, 5, 6, 7]
    end
  end
 
  context "when the array contains a large number of nested arrays" do
    before { @array = [1, [2, [3, [4, [5, 6, [7, [[[8], 9]], 10]]]]], 11] }

    it "should return the flattened version" do
      @array.flatten2.should == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    end
  end
end
