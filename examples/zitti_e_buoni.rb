#Zitti e buoni
use_bpm 103

live_loop :metro do
  sleep 1
end

live_loop :bar, sync: :metro do
  sleep 4
end

live_loop :main, sync: :bar do

  4.times do
    sample :drum_bass_hard
    sleep 1
  end
end

live_loop :bass, sync: :bar do

  use_synth :piano
  use_synth_defaults release: 0.05, attack: 0.07, sustain: 0.15
  norm_rels = 0.05
  notes = (ring :E2, :E2, :D3, :E2, :D3, :E3)
  durs = (ring 0.5, 0.25, 0.25, 0.5, 0.25, 0.25)
  rels = (ring norm_rels, norm_rels, norm_rels, 0.02, norm_rels, norm_rels)

  #with_fx :gverb, room: 100 do
  4.times do
    with_synth :tb303 do
      3.times do
        kplay notes, durs, rels
      end


      notes2 = [:C3, :C3, :B2, :B2]
      durs2 = [0.5, 0.5, 0.5, 0.5]
      kplay notes2, durs2
    end
  end
  #end

  notes = (ring :E2, :B2, :B2, :E3, :E2, :B2, :B2, :G2,
           :E2, :B2, :B2, :E3, :G2, :G2, :A2, :A2)
  durs = (ring 0.5, 0.5, 0.25, 0.75, 0.5, 0.5, 0.25, 0.75,
          0.5, 0.5, 0.25, 0.75, 0.5, 0.5, 0.5, 0.5)

  with_fx :flanger, phase: 0.15 do
    with_synth :blade do
      4.times do
        kplay notes, durs, rels
      end
    end
  end

end



live_loop :test, sync: :bar do

  sample :bd_808, beat_stretch: 4, amp: 2
  sleep 16
end

live_loop :hihat, sync: :bar do

  16.times do
    sample :drum_cymbal_closed, amp: rrand(0.05, 0.7)
    sleep 0.25
  end
end

live_loop :snare, sync: :bar do

  16.times do
    sleep 0.75
    sample :drum_snare_soft, amp: rrand(0.35, 0.9)
    sleep 0.25
  end
end


define :kplay do |notes, durs, rels = [0.2]|
  puts "ciao"
  notes.length().times do |x|
    play notes[x], attack: 0.1, sustain: 0.08, release: rels[x]
    sleep durs[x]
    puts x
  end
end
