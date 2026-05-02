package com.google.android.exoplayer.extractor.mp4;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.util.MimeTypes;
import com.google.android.exoplayer.util.Util;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/mp4/Track.class */
public final class Track {
    public static final int TYPE_vide = Util.getIntegerCodeForString("vide");
    public static final int TYPE_soun = Util.getIntegerCodeForString("soun");
    public static final int TYPE_text = Util.getIntegerCodeForString(MimeTypes.BASE_TYPE_TEXT);
    public static final int TYPE_sbtl = Util.getIntegerCodeForString("sbtl");
    public static final int TYPE_subt = Util.getIntegerCodeForString("subt");
    public final int id;
    public final int type;
    public final long timescale;
    public final long movieTimescale;
    public final long durationUs;
    public final MediaFormat mediaFormat;
    public final TrackEncryptionBox[] sampleDescriptionEncryptionBoxes;
    public final long[] editListDurations;
    public final long[] editListMediaTimes;
    public final int nalUnitLengthFieldLength;

    public Track(int id, int type, long timescale, long movieTimescale, long durationUs, MediaFormat mediaFormat, TrackEncryptionBox[] sampleDescriptionEncryptionBoxes, int nalUnitLengthFieldLength, long[] editListDurations, long[] editListMediaTimes) {
        this.id = id;
        this.type = type;
        this.timescale = timescale;
        this.movieTimescale = movieTimescale;
        this.durationUs = durationUs;
        this.mediaFormat = mediaFormat;
        this.sampleDescriptionEncryptionBoxes = sampleDescriptionEncryptionBoxes;
        this.nalUnitLengthFieldLength = nalUnitLengthFieldLength;
        this.editListDurations = editListDurations;
        this.editListMediaTimes = editListMediaTimes;
    }
}
