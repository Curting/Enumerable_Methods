require "enumerable_methods"

describe Enumerable do

  let(:array1) { [1, 3, 5] }
  let(:array2) { [3, "hello", "5"] }
  
  describe "#my_each" do

    context "with a block" do
      it "returns itself" do
        expect(array1.my_each { |e| e }).to eq(array1)
      end

      it "prints its elements" do
        expect { array1.my_each { |e| print e } }.to output("135").to_stdout
      end

      it "prints integers and strings alike" do
        expect { array2.my_each { |e| print e } }.to output("3hello5").to_stdout
      end
    end

    context "without a block" do
      it "returns enumerator" do
        expect(array1.my_each).to be_an(Enumerator)
      end
    end
  end

  describe "#my_each_with_index" do

    context "with a block" do
      it "returns itself" do
        expect(array1.my_each_with_index { |e, idx| e }).to eq(array1)
      end

      it "accepts a block with element and index as arguments" do
        expect { array1.my_each_with_index { |e, idx| print e + idx } }.to output("147").to_stdout
      end
    end

    context "without a block" do
      it "returns enumerator" do
        expect(array1.my_each_with_index).to be_an(Enumerator)
      end
    end
  end

  describe "#my_select" do

    context "with a block" do
      it "returns an array of elements for which the block returns true" do
        expect(array1.my_select { |e| e > 2 }).to eq([3, 5])
      end
    end

    context "without a block" do
      it "returns enumerator" do
        expect(array1.my_select).to be_an(Enumerator)
      end
    end
  end

end