#cosa ci possiamo fare

use_bpm 45

live_loop :riff do stop
  use_synth :piano
  riff = (ring :c4, :r, :c4, :c4, :g3, :g3, :r, :r, :a3, :a3, :r, :a3, :f3, :f3, :r, :r)
  note = riff.tick

  if note == :r
  else
    play_chord chord(note, :major), release: 0.6, cutoff: 90, amp: 2
  end
  sleep 0.25
end

live_loop :riffbass do
  use_synth :dsaw
  riff2 = (ring :c3, :g2, :a2, :f2)
  note = riff2.tick

  8.times do
    play note, attack: 0.02, sustain: 0.03, release: 0.04, cutoff: 100, amp: 0.5
    sleep 0.125
  end
end

live_loop :riffbass2 do stop
  use_synth :tb303
  riff2 = (ring :c3, :g0 , :a2 , :f2 )
  note = riff2.tick

  2.times do
    play chord(note, :major).pick, attack: 0.8, sustain: 0.2, release: 0.2, cutoff: 100, amp: 0.5
    sleep 0.5
  end
end

live_loop :test_cymbal do
  sample :drum_cymbal_open, attack: 0.03, sustain: 0.02, amp: rrand(0.1, 0.25), release: 0.01
  sleep 0.125
end

live_loop :test_cymbal2 do

  #sample :drum_snare_soft, start: 0.1, attack: 0.01, amp: rrand(1, 1.5), sustain: 0.06, release: 0.05

  sleep 1
  sample :drum_bass_hard, attack: 0.01, amp: 4, sustain: 0.2
end

live_loop :test_cymbal3 do stop
  sample :drum_bass_hard, attack: 0.04, amp: 4, sustain: 0.2
  sleep 1
  #sample :drum_bass_soft, attack: 0.01, amp: 4, sustain: 0.2


  #sleep 0.5
  #sample :drum_bass_soft, attack: 0.01, amp: 4, sustain: 0.2
  #sleep 0.5
  #sample :drum_bass_soft, attack: 0.01, amp: 4, sustain: 0.2
end
