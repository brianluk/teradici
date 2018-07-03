#global variable for hash counter
$results = Hash.new 0

#Function to lowercase word and remove punctuation
def sanitize(word)
  word.downcase.gsub(/[^a-z]/,'')
end

#Function to split each line into words separated by spaces
def break_line(line)
  words = line.split
  words.each do |word|
    result = sanitize(word)
    #increases the value based on the word (hash key)
    $results[result] += 1
  end
  #return value to test against
  $results
end

def topten(hashresults)
  Hash[hashresults.sort_by {|k,v| -v}[0..9]]
end

#Guard so rspec won't run the executable section
if $0 == __FILE__
  if ARGV.length != 1
    puts "Please provide a filename"
    exit;
  end
  filename = ARGV[0]
  file = open filename
  #processes file by line
  file.each do |line|
    break_line(line)
  end
  file.close #closes file

  top = topten($results)
  puts top
end
