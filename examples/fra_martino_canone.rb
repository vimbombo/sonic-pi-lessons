use_bpm 120

_do = :c4
_re = :d4
_mi = :e4
_fa = :f4
_sol = :g4
_la = :a4
_solbasso = :g3



live_loop :solista do
  sample '/Users/vimbombo/Downloads/frere.wav', attack: 1, rate: 1, beat_stretch: 12
  sleep 8

  use_synth_defaults amp: 0.5, attack: 0.1, sustain: 0.15, decay: 0.01
  use_synth :piano
  canone
end

live_loop :solista2 do
  use_synth_defaults amp: 3, attack: 0.1, sustain: 0.45, decay: 0.01
  use_synth :kalimba
  sleep 16
  canone
end

live_loop :solista3 do
  use_synth_defaults amp: 3, attack: 0.1, sustain: 0.45, decay: 0.01
  use_synth :kalimba
  sleep 24
  canone
end

live_loop :accordi do
  stop
  use_synth_defaults amp: 0.05, attack: 0.1, sustain: 3, decay: 0.01
  use_synth :saw
  play_chord chord(:c, :maj)
  sleep 4
end

define :canone do
  2.times do
    play_pattern [_do, _re, _mi, _do]
  end

  2.times do
    play_pattern_timed [_mi, _fa, _sol], [1, 1, 2]
  end

  2.times do
    play_pattern_timed [_sol, _la, _sol, _fa], [0.5]
    play_pattern_timed [_mi, _do], [1]
  end

  2.times do
    play_pattern_timed [_re, _solbasso, _do], [1, 1, 2]
  end
end
