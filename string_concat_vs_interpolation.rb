require 'benchmark/ips'

str1 = "hello"
str2 = "world"

Benchmark.ips do |x|
  x.report("concatenation") { str1 + " " + str2 }
  x.report("interpolation") { "#{str1} #{str2}" }
  x.compare!
end

# Warming up --------------------------------------
#        concatenation   566.617k i/100ms
#        interpolation   697.713k i/100ms
# Calculating -------------------------------------
#        concatenation      5.630M (± 0.4%) i/s -     28.331M in   5.032153s
#        interpolation      6.904M (± 0.2%) i/s -     34.886M in   5.053201s

# Comparison:
#        interpolation:  6903704.0 i/s
#        concatenation:  5630069.6 i/s - 1.23x  (± 0.00) slower
