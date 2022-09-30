use_bpm 120

_do = :c3
_re = :d3
_mi = :e3
_fa = :f3
_sol = :g3

use_synth :piano
use_synth_defaults amp: 1

with_fx :reverb, room: 1 do
  with_fx :distortion do
    2.times do
      play_pattern_timed [_mi, _mi, _mi],[1, 1, 2]
    end

    play_pattern_timed [_mi, _sol, _do, _re],[1]

    play_pattern_timed [_mi], [3, 1]

    play_pattern_timed [_fa, _fa, _fa], [1, 1, 2]

    play_pattern_timed [_fa, _mi, _mi], [1, 1, 2]

    play_pattern_timed [_mi, _re, _re, _mi],[1]

    play_pattern_timed [_re, _sol],[2]
  end
end
