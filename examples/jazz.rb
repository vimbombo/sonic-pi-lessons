# https://www.youtube.com/watch?v=_YRF9dtmA84
# https://github.com/mrbombmusic/sonic_pi_improv

live_loop :prog do
  #chord progression
  8.times do
    use_synth :piano
    use_synth_defaults release: 1.5
    play (ring, chord(:c3, :M7), chord(:a3, :m7), chord(:d3, :m7), chord(:g3, :dom7)).tick, sustain: 1.25
    sleep 2
  end

  with_fx :reverb, room: 0.7 do
    #improvised solo
    use_synth :piano
    use_synth_defaults  release: 0
    s = scale(:d4, :dorian, num_octaves: 2)
    d = [0.125, 0.25, 0.375, 0.5]
    l = [0]
    use_random_seed Time.now.to_i
    100.times do
      if l.inject(:+) < 15.5
        play s.choose, sustain: 2
        dur = d.choose
        sleep dur
        l.push(dur)
        puts l.inject(:+)
      end
    end
    sync :upright
  end
end

#bassline
live_loop :upright do
  with_fx :lpf, cutoff: 60 do
    use_synth :chipbass
    use_synth_defaults release: 0.3, amp: 0.6
    play_pattern_timed chord(:c1, :M7), 0.5
    play_pattern_timed chord(:a1, :m7), 0.5
    play_pattern_timed chord(:d1, :m7), 0.5
    play_pattern_timed chord(:g1, :dom7), 0.5
  end
end
