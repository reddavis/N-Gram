class NGram
  def initialize(data, options={})
    @ns = options[:n].is_a?(Array) ? options[:n] : [options[:n]]
    @data = data
    
    @bucket_holder = []
    @all_ngram = template_hash
    
    process
  end
  
  # Provides an ngram for each item in the data array
  def ngrams_of_inputs
    @bucket_holder
  end
  
  # Provides an ngram of all the data
  def ngrams_of_all_data
    @all_ngram
  end
  
  private
  
  def process
    @data.each do |string|
      bucket = template_hash
      
      words = string.split(' ')
      
      (words.size - 1).times do |index|
        @ns.each do |n|
          bucket[n][words[index,n].join(' ')] += 1
          @all_ngram[n][words[index,n].join(' ')] += 1
        end
      end
      
      @bucket_holder << bucket
    end
  end
  
  def template_hash
    Hash.new do |hash, key| 
      hash[key] = Hash.new {|hash, key| hash[key] = 0}
    end
  end
  
end