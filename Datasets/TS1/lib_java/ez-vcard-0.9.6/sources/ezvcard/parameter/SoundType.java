package ezvcard.parameter;

import java.util.Collection;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/parameter/SoundType.class */
public class SoundType extends MediaTypeParameter {
    private static final MediaTypeCaseClasses<SoundType> enums = new MediaTypeCaseClasses<>(SoundType.class);
    public static final SoundType AAC = new SoundType("AAC", "audio/aac", "aac");
    public static final SoundType MIDI = new SoundType("MIDI", "audio/midi", "mid");
    public static final SoundType MP3 = new SoundType("MP3", "audio/mp3", "mp3");
    public static final SoundType MPEG = new SoundType("MPEG", "audio/mpeg", "mpeg");
    public static final SoundType OGG = new SoundType("OGG", "audio/ogg", "ogg");
    public static final SoundType WAV = new SoundType("WAV", "audio/wav", "wav");

    private SoundType(String value, String mediaType, String extension) {
        super(value, mediaType, extension);
    }

    public static SoundType find(String type, String mediaType, String extension) {
        return enums.find(new String[]{type, mediaType, extension});
    }

    public static SoundType get(String type, String mediaType, String extension) {
        return enums.get(new String[]{type, mediaType, extension});
    }

    public static Collection<SoundType> all() {
        return enums.all();
    }
}
