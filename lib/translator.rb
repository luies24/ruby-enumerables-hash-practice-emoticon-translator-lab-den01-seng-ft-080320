require "yaml"
require 'pry'

def load_library(data)
  data = YAML.load_file(data)
  result = {}
  data.each_pair do |key, value|
    result[key] = {:english => value[0], 
                    :japanese => value[1]} 
  end
  result
end

def get_japanese_emoticon(file, w_emot)
  data = load_library(file)
  
  data.each do |key, value|
    data[key].each do |lang, emot|
      if w_emot == data[key][:english]
        return data[key][:japanese]
      end
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, jap_emot)
  data = load_library(file)
  
  data.each do |key, value|
    if data[key][:japanese] == jap_emot
      return key
    end
    #binding.pry
  end
  return "Sorry, that emoticon was not found"
end