use_bpm 50

_cuto = 60

_main_note = :C2

live_loop :test_cymbal do
  sample :drum_cymbal_open, attack: 0.01, sustain: 0, amp: rrand(0.1, 0.25), release: 0.03
  sleep 0.125
end

live_loop :test_cymbal2 do
  sample :drum_snare_hard, start: 0.1, attack: 0.03, amp: rrand(1, 1.5), sustain: 0.03, release: 0.05
  sleep 1
end

live_loop :test_cymbal3 do
  sleep 0.5
  sample :drum_bass_soft, attack: 0.01, amp: 4, sustain: 0.2
  sleep 0.5
end

live_loop :try_em do
  _main_note = :C2
  sleep 8
  _main_note = :E2
  sleep 8
  _main_note = :G2
  sleep 8
  _main_note = :G2
  sleep 8
end

live_loop :test_chipbass do
  _cuto = _cuto + 1
  with_synth :dpulse do
    play _main_note, attack: rrand(0.01, 0.15), amp: 1.5, cutoff: _cuto, release: rrand(0.02, 0.2)
    sleep 0.25
  end



  if _cuto > 100
    _cuto = 60
  end
end
