require 'benchmark/ips'

arr1 = [1,2,3]
arr2 = [4,5,6]

Benchmark.ips do |x|
  x.report("concat    ") { arr1.concat(arr2) }
  x.report("+ operator") { arr1 + arr2 }
  x.compare!
end

# Warming up --------------------------------------
#           concat         1.042M i/100ms
#           + operator     1.000  i/100ms
# Calculating -------------------------------------
#           concat         10.388M (± 2.2%) i/s -     52.096M in   5.017430s
#           + operator      0.702  (± 0.0%) i/s -      4.000  in   5.756929s

# Comparison:
#           concat    : 10388355.5 i/s
#           + operator:        0.7 i/s - 14796055.70x  (± 0.00) slower
