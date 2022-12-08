require 'benchmark/ips'

test_object = "hello"

Benchmark.ips do |x|
  x.report('nil') { test_object.nil? }
  x.report('bang') { !test_object }
  x.compare!
end

# Warming up --------------------------------------
#                  nil     1.217M i/100ms
#                 bang     1.220M i/100ms
# Calculating -------------------------------------
#                  nil     12.279M (± 0.8%) i/s -     62.064M in   5.054924s
#                 bang     12.217M (± 1.0%) i/s -     62.207M in   5.092321s

# Comparison:
#                  nil: 12278711.2 i/s
#                 bang: 12217015.5 i/s - same-ish: difference falls within error
