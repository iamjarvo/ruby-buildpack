# imports contents of .env file into ENV
file = File.expand_path("../../.env", __FILE__)
if File.exists?(file)
  File.read(file).split("\n").map {|x| x.split("=") }.each do |k,v|
    if k.match(/^export/)
      k.split(' ').last
    else
      ENV[k.strip] = v.strip
    end
  end
end
