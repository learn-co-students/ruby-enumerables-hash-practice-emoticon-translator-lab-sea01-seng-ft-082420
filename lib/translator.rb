# require modules here
require "yaml"
require 'pry'
emoticon = YAML.load_file('./lib/emoticons.yml')

def load_library(file_path)
  emoticon = YAML.load_file('./lib/emoticons.yml')
  new_hash={}
    emoticon.each do |words, symbols| #=> iterate over "meaning" and "symbols"
    
     symbols = {:english => symbols[0], :japanese =>symbols [1]} # => add new inner key-value pair for the value symbols
     
      h = {words => symbols} #=>create { "happy" =>{:english =>..., :japanese => ...}}
      
      new_hash.merge!(h) #merge h-hash with the new_hash, use ! for destructive merge
     end 
     
  return new_hash
end


def get_japanese_emoticon(emoticon, symbol)
 load_library(emoticon).each do |signs, lang|
    if load_library(emoticon)[signs][:english] == symbol
       return load_library(emoticon)[signs][:japanese]
    end 
 end 
   return "Sorry, that emoticon was not found"
end


def get_english_meaning(emoticon, symbol)
   emoticon_hash= load_library('./lib/emoticons.yml')
    emoticon_hash.each_key do |signs|
      if emoticon_hash[signs][:japanese] == symbol
       return signs
      end 
    end 
  return "Sorry, that emoticon was not found"
end

 


 
