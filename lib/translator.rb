require 'pry'
require 'yaml'

def load_library(library)
  library_hash = YAML.load_file(library)
  emoticon_hash = {}
  library_hash.each do |expression_keys, emoticon_arrays|
      emoticon_hash[expression_keys] ||= {
        "english": emoticon_arrays[0],
        "japanese": emoticon_arrays[1]
      }
    end
    emoticon_hash
end
#load_library structure
  #emoticon_hash{expression_keys: {languages: emoticons}}

#expression_keys are the library_hash :keys, their values point to an array, we are calling
#emoticon_array is a value of the key known as expression_keys, it is an array that holds
#codes, the items in the emoticon_arrays pointed to by their expression_keys.
#
def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  emoticon = library.keys.find do |key|
    library[key][:english] == emoticon
  end
  emoticon ? library[emoticon][:japanese] : "Sorry, that emoticon was not found"
end

  # code goes here

#with load_library our new pathway file has been organized as above. There will
#be an emoticon_hash with expression_keys as keys, pointing to hashes
#with two keys apiece, english and japanese. Those keys point to strings
#of emoticons
#we want to compare the inputted english emoticon with each value in expression_keys hashes,
#and return the value of the japanese key that shares the english key's value.


def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  emoticon = library.keys.find do |key|
    library[key][:japanese] == emoticon
  end
  emoticon ? emoticon : "Sorry, that emoticon was not found"
  # code goes here
end
#we want to compare the japanese value of the emoticon input, and return the
#
