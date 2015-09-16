# imports contents of .env file into ENV
file = File.expand_path("../../.env", __FILE__)
if File.exists?(file)
  File.read(file).split("\n").map {|x| x.split("=") }.each do |k,v|
    if k.match(/^export/)
      STDOUT.puts(k.split(' ').last)
      ENV[k.split(' ').last] = v.strip
    else
      STDOUT.puts(k)
      ENV[k.strip] = v.strip
    end
  end
end
