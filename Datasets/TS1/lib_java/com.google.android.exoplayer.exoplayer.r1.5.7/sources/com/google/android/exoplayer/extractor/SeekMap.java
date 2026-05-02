package com.google.android.exoplayer.extractor;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/SeekMap.class */
public interface SeekMap {
    public static final SeekMap UNSEEKABLE = new SeekMap() { // from class: com.google.android.exoplayer.extractor.SeekMap.1
        @Override // com.google.android.exoplayer.extractor.SeekMap
        public boolean isSeekable() {
            return false;
        }

        @Override // com.google.android.exoplayer.extractor.SeekMap
        public long getPosition(long timeUs) {
            return 0L;
        }
    };

    boolean isSeekable();

    long getPosition(long j);
}
