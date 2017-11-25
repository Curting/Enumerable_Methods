require "enumerable_methods"

describe Enumerable do

  let(:array1) { [1, 3, 5] }
  let(:array2) { [3, "hello", "5"] }
  
  describe "#my_each" do

    context "when given a block" do
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

    context "when not given a block" do
      it "returns enumerator" do
        expect(array1.my_each).to be_an(Enumerator)
      end
    end
  end

  describe "#my_each_with_index" do

    context "when given a block" do
      it "returns itself" do
        expect(array1.my_each_with_index { |e, idx| e }).to eq(array1)
      end

      it "accepts a block with element and index as arguments" do
        expect { array1.my_each_with_index { |e, idx| print e + idx } }.to output("147").to_stdout
      end
    end

    context "when not given a block" do
      it "returns enumerator" do
        expect(array1.my_each_with_index).to be_an(Enumerator)
      end
    end
  end

  describe "#my_select" do

    context "when given a block" do
      context "when the block returns true on elements" do
        it "returns an array of those elements" do
          expect(array1.my_select { |e| e > 2 }).to eq([3, 5])
        end
      end

      context "when the block returns false on all elements" do
        it "returns an empty array" do
          expect(array1.my_select { |e| e > 10 }).to eq([])
        end
      end
    end

    context "when not given a block" do
      it "returns enumerator" do
        expect(array1.my_select).to be_an(Enumerator)
      end
    end
  end

  describe "#my_all?" do

    context "when given a block" do
      context "when the block returns true to all elements" do
        it "returns true" do
          expect(array1.my_all? { |e| e < 10 }).to be(true)
        end
      end
      
      context "when the block returns false to any of the elements" do
        it "returns false" do
          expect(array1.my_all? { |e| e > 2 }).to be(false)
        end
      end
    end

    context "when not given a block" do
      it "returns true" do
        expect(array1.my_all?).to be(true)
      end
    end
  end

  describe "#my_any?" do

    context "when given a block" do
      context "when the block returns true to any of the elements" do
        it "returns true" do
          expect(array1.my_any? { |e| e == 1 }).to be(true)
        end
      end

      context "when the block returns false to all elements" do
        it "returns false" do
          expect(array1.my_any? { |e| e > 10 }).to be(false)
        end
      end
    end

    context "when not given a block" do
      it "returns true" do
        expect(array1.my_any?).to be(true)
      end
    end
  end

end