live_loop :foo do
  use_synth :dsaw
  play :c2, release: 8, cutoff: rrand(70, 130)
  sleep 8
  play :e2, release: 8, cutoff: rrand(70, 130)
  sleep 8
  play :g2, release: 8, cutoff: rrand(70, 130)
  sleep 8
  play :g2, release: 8, cutoff: rrand(70, 130)
  sleep 8
end

live_loop :bar do
  sample :bd_haus, amp: krnd(1.1,0.39)
  sleep 0.5
  sample :bd_haus, amp: krnd(1.1,0.39)
  sleep 0.125
  sample :bd_haus, amp: krnd(1.1,0.79)
  sleep 0.375
end

live_loop :bar3 do
  sample :drum_cymbal_closed, amp: krnd(1.1,0.09), cutoff: krnd(110, 20)
  sleep 0.125
end

define :krnd_perc do |base, rnd_range_perc=0.5|
  return krnd(base, base*1.0*rnd_range_perc)
end

define :krnd do |base, rnd_range|
  return base+rrand(-rnd_range,rnd_range)
end
