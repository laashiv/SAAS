def get_command_line_argument
  # ARGV is an array that Ruby defines for us,
  # which contains all the arguments we passed to it
  # when invoking the script from the command line.
  # https://docs.ruby-lang.org/en/2.4.0/ARGF.html
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument

# File.readlines reads a file and returns an
# array of string, where each element is a line
# https://www.rubydoc.info/stdlib/core/IO:readlines
dns_raw = File.readlines("zone")

#parse_dns returns a hash containing record type as key and destination
def parse_dns(dns_raw)
  dns_records = {}
  dns_raw.reject { |record_line| record_line.empty? }
         .reject { |record_line| record_line[0] == "#" }
         .each do |record_line|
    record_column = record_line.strip.split(", ")
    dns_records[record_column[1]] = { record_column[0] => record_column[2] }
  end
  dns_records
end

#resolve updates the lookup chain with the domain details
def resolve(dns_records, lookup_chain, domain)
  record_pick = dns_records[domain]
  if (!record_pick)
    lookup_chain += ["Error: record not found for #{domain}"]
  else
    record_pick.each do |record_type, destination|
      if (record_type == "A")
        lookup_chain += [destination]
      elsif (record_type == "CNAME")
        lookup_chain += [destination]
        lookup_chain = resolve(dns_records, lookup_chain, destination)
      end
    end
  end
  lookup_chain
end

# To complete the assignment, implement `parse_dns` and `resolve`.
# Remember to implement them above this line since in Ruby
# you can invoke a function only after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
