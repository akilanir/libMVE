package com.google.android.exoplayer.text.subrip;

import android.text.Html;
import android.text.Spanned;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.exoplayer.text.Cue;
import com.google.android.exoplayer.text.SubtitleParser;
import com.google.android.exoplayer.util.LongArray;
import com.google.android.exoplayer.util.MimeTypes;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/text/subrip/SubripParser.class */
public final class SubripParser implements SubtitleParser {
    private static final String TAG = "SubripParser";
    private static final Pattern SUBRIP_TIMING_LINE = Pattern.compile("(\\S*)\\s*-->\\s*(\\S*)");
    private static final Pattern SUBRIP_TIMESTAMP = Pattern.compile("(?:(\\d+):)?(\\d+):(\\d+),(\\d+)");
    private final StringBuilder textBuilder = new StringBuilder();

    @Override // com.google.android.exoplayer.text.SubtitleParser
    public boolean canParse(String mimeType) {
        return MimeTypes.APPLICATION_SUBRIP.equals(mimeType);
    }

    @Override // com.google.android.exoplayer.text.SubtitleParser
    public SubripSubtitle parse(byte[] bytes, int offset, int length) {
        ArrayList<Cue> cues = new ArrayList<>();
        LongArray cueTimesUs = new LongArray();
        ParsableByteArray subripData = new ParsableByteArray(bytes, offset + length);
        subripData.setPosition(offset);
        while (true) {
            String currentLine = subripData.readLine();
            if (currentLine != null) {
                if (currentLine.length() != 0) {
                    try {
                        Integer.parseInt(currentLine);
                        boolean haveEndTimecode = false;
                        String currentLine2 = subripData.readLine();
                        Matcher matcher = SUBRIP_TIMING_LINE.matcher(currentLine2);
                        if (matcher.find()) {
                            cueTimesUs.add(parseTimecode(matcher.group(1)));
                            String endTimecode = matcher.group(2);
                            if (!TextUtils.isEmpty(endTimecode)) {
                                haveEndTimecode = true;
                                cueTimesUs.add(parseTimecode(matcher.group(2)));
                            }
                            this.textBuilder.setLength(0);
                            while (true) {
                                String currentLine3 = subripData.readLine();
                                if (TextUtils.isEmpty(currentLine3)) {
                                    break;
                                }
                                if (this.textBuilder.length() > 0) {
                                    this.textBuilder.append("<br>");
                                }
                                this.textBuilder.append(currentLine3.trim());
                            }
                            Spanned text = Html.fromHtml(this.textBuilder.toString());
                            cues.add(new Cue(text));
                            if (haveEndTimecode) {
                                cues.add(null);
                            }
                        } else {
                            Log.w(TAG, "Skipping invalid timing: " + currentLine2);
                        }
                    } catch (NumberFormatException e) {
                        Log.w(TAG, "Skipping invalid index: " + currentLine);
                    }
                }
            } else {
                Cue[] cuesArray = new Cue[cues.size()];
                cues.toArray(cuesArray);
                long[] cueTimesUsArray = cueTimesUs.toArray();
                return new SubripSubtitle(cuesArray, cueTimesUsArray);
            }
        }
    }

    private static long parseTimecode(String s) throws NumberFormatException {
        Matcher matcher = SUBRIP_TIMESTAMP.matcher(s);
        if (!matcher.matches()) {
            throw new NumberFormatException("has invalid format");
        }
        long timestampMs = Long.parseLong(matcher.group(1)) * 60 * 60 * 1000;
        return (timestampMs + (Long.parseLong(matcher.group(2)) * 60 * 1000) + (Long.parseLong(matcher.group(3)) * 1000) + Long.parseLong(matcher.group(4))) * 1000;
    }
}
