# Implement a group_by_owners function that:
# Accepts a hash containing the file owner name for each file name.
# Returns a hash containing an array of file names for each owner name, in any order.
# For example, for hash {'Input.txt' => 'Randy', 'Code.py' => 'Stan', 'Output.txt' => 'Randy'},
#  the group_by_owners function should return {'Randy' => ['Input.txt', 'Output.txt'], 'Stan' => ['Code.py']}.
module FileOwners

  def self.group_by_owners(files)
    # I chose each_with_object instead of inject since
    # the same accumulator object (mem) is passed in for each iteration
    # inject would set the accumulator to the return value of the block
    # files.inject({}) {|mem, (k, v)| mem[v] = mem[v].to_a << k; mem } => same output
    files.each_with_object({}) {|(k, v), mem| mem[v] = mem[v].to_a << k }
  end

end

files = {
  'Input.txt' => 'Randy',
  'Code.py' => 'Stan',
  'Output.txt' => 'Randy'
}

puts FileOwners.group_by_owners(files)
