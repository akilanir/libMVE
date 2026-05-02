package com.google.android.exoplayer.text.tx3g;

import com.google.android.exoplayer.text.Cue;
import com.google.android.exoplayer.text.Subtitle;
import com.google.android.exoplayer.text.SubtitleParser;
import com.google.android.exoplayer.util.MimeTypes;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/text/tx3g/Tx3gParser.class */
public final class Tx3gParser implements SubtitleParser {
    @Override // com.google.android.exoplayer.text.SubtitleParser
    public boolean canParse(String mimeType) {
        return MimeTypes.APPLICATION_TX3G.equals(mimeType);
    }

    @Override // com.google.android.exoplayer.text.SubtitleParser
    public Subtitle parse(byte[] bytes, int offset, int length) {
        String cueText = new String(bytes, offset, length);
        return new Tx3gSubtitle(new Cue(cueText));
    }
}
