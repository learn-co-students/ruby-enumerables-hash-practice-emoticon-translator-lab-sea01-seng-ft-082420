require 'yaml'
require 'pry' 


def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  new_hash = {}
  
  emoticons.each do |key, value|
    new_hash[key] = {}
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path, eng_emoticon)
  emoticons = load_library(file_path)
  emoticons.each do |key, value|
    if emoticons[key][:english] == eng_emoticon
      return emoticons[key][:japanese]
    end
  end
    return "Sorry, that emoticon was not found"
    
end

def get_english_meaning(file_path, jap_emoticon)
  emoticons = load_library(file_path)
  emoticons.each do |key, value|
    if emoticons[key][:japanese] == jap_emoticon
      return key
    end
  end
    return "Sorry, that emoticon was not found"
end