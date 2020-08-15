require 'pry'
require 'yaml'

def load_library(library)
  library_hash = YAML.load_file(library)
  emoticon_hash = {}
  library_hash.each do |expression_keys, emoticon_arrays|
    emoticon_arrays.each do |codes|
      emoticon_hash[expression_keys] ||= {
        "english": emoticon_arrays[0],
        "japanese": emoticon_arrays[1]
      }
      end
    end
    emoticon_hash
end
#expression_keys are the library_hash :keys, their values point to an array, we are calling
#emoticon_array is a value of the key known as expression_keys, it is an array that holds
#codes, the items in the emoticon_arrays pointed to by their expression_keys.
#
def get_japanese_emoticon(library, emoticon)
  load_library(library)
  # code goes here
end

def get_english_meaning(library_path, emoticon)
  # code goes here
end
