require "yaml"
require "pry"

def load_library(fpath)
  results = {}
  data = YAML.load_file(fpath)
  data.each() do |k, v|
    results[k] = {}
    results[k][:english] = v[0]
    results[k][:japanese] = v[1]
  end
  return results
end


def get_japanese_emoticon(fpath, usa_emoticon)
  data1 = load_library(fpath)
  data1.each() do |k1, v1|
    if v1[:english] == usa_emoticon
      return v1[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(fpath, j_emoticon)
  data1 = load_library(fpath)
  data1.each() do |k1, v1|
    if v1[:japanese] == j_emoticon
      return k1
    end
  end
  return "Sorry, that emoticon was not found"
end





