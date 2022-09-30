def framartino
  2.times do
    play_pattern_timed [:c, :d, :e, :c], [0.5]
  end

  2.times do
    play_pattern_timed [:e, :f, :g], [0.5, 0.5, 1]
  end

  2.times do
    play_pattern_timed [:g, :a, :g, :f], [0.25]
    play_pattern_timed [:e, :c], [0.5]
  end

  2.times do
    play_pattern_timed [:c, :g3, :c], [0.5, 0.5, 1]
  end
end

#orchestra
in_thread do
  use_synth :piano
  framartino
end

in_thread do
  use_synth :bass_foundation
  sleep 2
  framartino
end

in_thread do
  use_synth :dpulse
  sleep 4
  framartino
end

#in_thread do
#  use_synth :prophet
#  play chord(:c, :maj), amp: 2.5, release: 4
#  sleep 4
#end


#drums
in_thread do
  4.times do
    sample :drum_bass_soft
    sleep 1
    sample :drum_snare_soft
    sleep 1
    2.times do
      sample :drum_bass_soft
      sleep 0.5
    end
    sample :drum_snare_soft
    sleep 1
  end
end
