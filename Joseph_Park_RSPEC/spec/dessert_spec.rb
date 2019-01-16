require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:cake) {Dessert.new("cake", 5, "chef")}

  describe "#initialize" do
    it "sets a type" do 
      expect(cake.type).to eq('cake')
    end
  

    it "sets a quantity" do
      expect(cake.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new("cake", "4", "chef")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do 
        cake.add_ingredient("flour")
        cake.add_ingredient("sugar")
      end
    it "adds an ingredient to the ingredients array" do
      expect(cake.ingredients).to eq(["flour", "sugar"])
    end

  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['flour', "eggs", "milk", "sugar"]

      ingredients.each do |ing|
        cake.add_ingredient(ing)
      end

    
      expect(cake.ingredients).to eq(ingredients)
      cake.mix!
      expect(cake.ingredients).not_to eq(ingredients)
    end
  end

  describe "#eat" do
    before(:each) do
      cake.eat(2)
    end
    it "subtracts an amount from the quantity" do
      expect(cake.quantity).to eq(3)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{cake.eat(20)}.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
    allow(chef).to receive(:titleize).and_return("Joe")
      expect(cake.serve).to eq("Chef has made 5 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
    
    end
  end
end
