# require modules here
require 'yaml'
require 'pry'

def load_library(file)
  emoticons = YAML.load_file(file)
  emoticons.each do |key, value|
    emoticons[key] = { :english => value[0], :japanese => value[1] } 
  end
  emoticons
end

def get_english_meaning(file, jmote)
  english_meaning = "Sorry, that emoticon was not found"
  new_emoticons = load_library(file)
    new_emoticons.each do |key,value|
      value.each do |lingo, mote|
        if new_emoticons[key][lingo] == jmote
          english_meaning = key
        end
      end
    end
  english_meaning
end


def get_japanese_emoticon(file, emote)
 translation = "Sorry, that emoticon was not found"
 new_emoticons = load_library(file)
    new_emoticons.each do |key,value|
      value.each do |lingo, mote|
        if new_emoticons[key][lingo] == emote
          translation = new_emoticons[key][:japanese]
      end
    end
  end
  translation
end