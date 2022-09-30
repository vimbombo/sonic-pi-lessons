notes = (ring :c4, :e4, :g4, :e4, :c4)
notes = chord(:a4, :major)

use_bpm 80

live_loop :arp do
  use_synth :tb303
  play notes.pick(3).tick, attack: 0.2, release: 0.4, cutoff: rrand(70, 80), amp: 0.2
  sleep 0.125
end

live_loop :test_cymbal2 do
  sleep 0.5
  #sample :drum_snare_soft, start: 0.1, attack: 0.01, amp: rrand(1, 1.5), sustain: 0.06, release: 0.05
  sample :drum_snare_hard, attack: 0.05, amp: 2, sustain: 0.1, release: 0.2
  sleep 0.5
end

live_loop :test_cymbal3 do
  sample :drum_bass_soft, attack: 0.01, amp: 2, sustain: 0.1, release: 0.1
  sleep 0.5
  #sample :drum_bass_soft, attack: 0.01, amp: 4, sustain: 0.2

  sample :drum_bass_soft, attack: 0.01, amp: 2, sustain: 0.1, release: 0.1
  sleep 0.15
  sample :drum_bass_soft, attack: 0.01, amp: 2, sustain: 0.1, release: 0.1
  sleep 0.35
  #sleep 0.5
  #sample :drum_bass_soft, attack: 0.01, amp: 4, sustain: 0.2
  #sleep 0.5
  #sample :drum_bass_soft, attack: 0.01, amp: 4, sustain: 0.2
end
