function octave = GetOctave( image, levels )

    octave = [];
    octave{1} = image;
    for level = 2:levels
        octave{level} = imgaussfilt(octave{level - 1}, 1.6);
    end;

end

