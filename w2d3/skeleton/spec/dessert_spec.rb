require "rspec"
require "dessert"

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Tucker") }
  subject(:cookies) { Dessert.new("cookies", 5, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cookies.type).to eq("cookies")
    end

    it "sets a quantity" do
      expect(cookies.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(cookies.ingredients).to be_an(Array) && be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect do
        Dessert.new("cookies", "five", "Alex")
      end.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cookies.add_ingredient("milk")
      expect(cookies.ingredients).to eq(["milk"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cookies.add_ingredient("milk")
      cookies.add_ingredient("flour")
      cookies.add_ingredient("sugar")
      old_ingredients = cookies.ingredients.dup
      cookies.mix!

      expect(cookies.ingredients).to include("milk", "flour", "sugar")
      expect(cookies.ingredients).not_to eq(old_ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookies.eat(1)
      expect(cookies.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect do
        cookies.eat(cookies.quantity + 1)
      end.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Tucker the Great Baker")
      expect(cookies.serve).to eq("Chef Tucker the Great Baker has made 5 cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookies)
      cookies.make_more
    end
  end
end
