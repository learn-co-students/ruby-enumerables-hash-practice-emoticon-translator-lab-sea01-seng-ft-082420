# require modules here
require 'pry'
require "yaml"


def load_library(file_path)
  # code goes here
  lib = YAML.load_file(file_path)
  up_lib = lib.each_with_object({}) do |(key, value), in_prog|
    if !in_prog[key]
      in_prog[key] = {
        :english => value[0],
        :japanese => value[1]
      }
    end
  end
  up_lib
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  tran_emoticon = nil
  apology = nil
  library = load_library(file_path)
  library.each do |key, value|
    value.each do |inner_key, inner_value|
      if value.has_value? emoticon
        tran_emoticon = inner_value
      end
    end
  end
  if tran_emoticon == nil
    return "Sorry, that emoticon was not found"
  else
    tran_emoticon
  end
  # binding.pry
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  tran_emoticon = nil
  apology = nil
  library = load_library(file_path)
  library.each do |key, value|
    value.each do |inner_key, inner_value|
      if value.has_value? emoticon
        tran_emoticon = key
      end
    end
  end
  if tran_emoticon == nil
    return "Sorry, that emoticon was not found"
  else
    tran_emoticon
  end
end