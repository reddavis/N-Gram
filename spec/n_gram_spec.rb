require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "NGram" do
  
  before do
    @n_gram = NGram.new(text, :n => 2)
  end
  
  describe "All Grams" do
    it "should return true" do
      @n_gram.ngrams_of_all_data.key?(2).should be_true
    end
    
    it "should return 4" do
      @n_gram.ngrams_of_all_data[2]['this is'].should == 4
    end
  end
  
  describe "NGrams for seperate input" do
    it "should return 2" do
      @n_gram.ngrams_of_inputs.size.should == 2
    end
    
    it "should return 2" do
      @n_gram.ngrams_of_inputs[0][2]['this is'].should == 2
    end
    
    it "should return 1" do
      @n_gram.ngrams_of_inputs[1][2]['is hello'].should == 1
    end
  end
    
  private
  
  def text
    [
      "this is a just a sentence nothing else this is a all it is",
      "this is a just a sentence nothing else this is a all it is hello"
    ]
  end
end
