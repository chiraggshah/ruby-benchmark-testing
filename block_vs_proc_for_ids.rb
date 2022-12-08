require 'benchmark/ips'

class Record
  attr_accessor :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end
end

records = [
  Record.new(1, "Sam"),
  Record.new(2, "Eve"),
  Record.new(3, "Max"),
]


Benchmark.ips do |x|
  x.report("map proc") { records.map(&:id) }
  x.report("inject  ") { records.inject([]) {|w,a| w.push(a.id)} }
  x.report("collect ") { records.collect {|w| w.id} }
  x.report("map     ") { records.map {|w| w.id} }
  x.compare!
end

# Warming up --------------------------------------
#             map proc   202.115k i/100ms
#             inject      61.746k i/100ms
#             collect    195.494k i/100ms
#             map        175.330k i/100ms
# Calculating -------------------------------------
#             map proc      1.919M (±25.7%) i/s -      9.095M in   5.087992s
#             inject      926.920k (±25.3%) i/s -      4.322M in   5.059227s
#             collect       1.872M (±26.5%) i/s -      8.797M in   5.095000s
#             map           1.864M (±31.3%) i/s -      8.416M in   5.062380s

# Comparison:
#             map proc:  1918896.4 i/s
#             collect :  1871517.3 i/s - same-ish: difference falls within error
#             map     :  1864104.9 i/s - same-ish: difference falls within error
#             inject  :   926920.5 i/s - 2.07x  (± 0.00) slower
