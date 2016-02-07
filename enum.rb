#!/usr/bin/env ruby


files = Dir['./mixer/SoundEffects/*\.mp3'].map{|f| File.basename(f) }
line_generator = proc {|filename| "        SoundEffect(name: \"#{filename.split(".")[0]}\", filename: \"#{filename}\")," }

string = <<"EOS"
    let soundEffects: [SoundEffect] = [
        #{files.map(&line_generator).join("\n")}
    ]
EOS

print string
