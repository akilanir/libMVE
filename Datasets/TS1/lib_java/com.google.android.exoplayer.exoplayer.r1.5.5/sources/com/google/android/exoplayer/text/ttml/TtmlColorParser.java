package com.google.android.exoplayer.text.ttml;

import android.text.TextUtils;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.NalUnitUtil;
import com.google.android.exoplayer.util.Util;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/text/ttml/TtmlColorParser.class */
final class TtmlColorParser {
    private static final String RGB = "rgb";
    private static final String RGBA = "rgba";
    static final int TRANSPARENT = 0;
    static final int BLACK = -16777216;
    static final int SILVER = -4144960;
    static final int GRAY = -8355712;
    static final int WHITE = -1;
    static final int MAROON = -8388608;
    static final int RED = -65536;
    static final int PURPLE = -8388480;
    static final int FUCHSIA = -65281;
    static final int MAGENTA = -65281;
    static final int GREEN = -16744448;
    static final int LIME = -16711936;
    static final int OLIVE = -8355840;
    static final int YELLOW = -256;
    static final int NAVY = -16777088;
    static final int BLUE = -16776961;
    static final int TEAL = -16744320;
    static final int AQUA = 16777215;
    static final int CYAN = -16711681;
    private static final Pattern RGB_PATTERN = Pattern.compile("^rgb\\((\\d{1,3}),(\\d{1,3}),(\\d{1,3})\\)$");
    private static final Pattern RGBA_PATTERN = Pattern.compile("^rgba\\((\\d{1,3}),(\\d{1,3}),(\\d{1,3}),(\\d{1,3})\\)$");
    private static final Map<String, Integer> COLOR_NAME_MAP = new HashMap();

    TtmlColorParser() {
    }

    static {
        COLOR_NAME_MAP.put("transparent", 0);
        COLOR_NAME_MAP.put("black", Integer.valueOf(BLACK));
        COLOR_NAME_MAP.put("silver", Integer.valueOf(SILVER));
        COLOR_NAME_MAP.put("gray", Integer.valueOf(GRAY));
        COLOR_NAME_MAP.put("white", -1);
        COLOR_NAME_MAP.put("maroon", Integer.valueOf(MAROON));
        COLOR_NAME_MAP.put("red", Integer.valueOf(RED));
        COLOR_NAME_MAP.put("purple", Integer.valueOf(PURPLE));
        COLOR_NAME_MAP.put("fuchsia", -65281);
        COLOR_NAME_MAP.put("magenta", -65281);
        COLOR_NAME_MAP.put("green", Integer.valueOf(GREEN));
        COLOR_NAME_MAP.put("lime", Integer.valueOf(LIME));
        COLOR_NAME_MAP.put("olive", Integer.valueOf(OLIVE));
        COLOR_NAME_MAP.put("yellow", Integer.valueOf(YELLOW));
        COLOR_NAME_MAP.put("navy", Integer.valueOf(NAVY));
        COLOR_NAME_MAP.put("blue", Integer.valueOf(BLUE));
        COLOR_NAME_MAP.put("teal", Integer.valueOf(TEAL));
        COLOR_NAME_MAP.put("aqua", Integer.valueOf(AQUA));
        COLOR_NAME_MAP.put("cyan", Integer.valueOf(CYAN));
    }

    public static int parseColor(String colorExpression) {
        int color;
        Assertions.checkArgument(!TextUtils.isEmpty(colorExpression));
        String colorExpression2 = colorExpression.replace(" ", "");
        if (colorExpression2.charAt(0) == '#') {
            int color2 = (int) Long.parseLong(colorExpression2.substring(1), 16);
            if (colorExpression2.length() == 7) {
                color = color2 | BLACK;
            } else if (colorExpression2.length() == 9) {
                color = ((color2 & NalUnitUtil.EXTENDED_SAR) << 24) | (color2 >>> 8);
            } else {
                throw new IllegalArgumentException();
            }
            return color;
        }
        if (colorExpression2.startsWith(RGBA)) {
            Matcher matcher = RGBA_PATTERN.matcher(colorExpression2);
            if (matcher.matches()) {
                return argb(NalUnitUtil.EXTENDED_SAR - Integer.parseInt(matcher.group(4), 10), Integer.parseInt(matcher.group(1), 10), Integer.parseInt(matcher.group(2), 10), Integer.parseInt(matcher.group(3), 10));
            }
        } else if (colorExpression2.startsWith(RGB)) {
            Matcher matcher2 = RGB_PATTERN.matcher(colorExpression2);
            if (matcher2.matches()) {
                return rgb(Integer.parseInt(matcher2.group(1), 10), Integer.parseInt(matcher2.group(2), 10), Integer.parseInt(matcher2.group(3), 10));
            }
        } else {
            Integer color3 = COLOR_NAME_MAP.get(Util.toLowerInvariant(colorExpression2));
            if (color3 != null) {
                return color3.intValue();
            }
        }
        throw new IllegalArgumentException();
    }

    private static int argb(int alpha, int red, int green, int blue) {
        return (alpha << 24) | (red << 16) | (green << 8) | blue;
    }

    private static int rgb(int red, int green, int blue) {
        return argb(NalUnitUtil.EXTENDED_SAR, red, green, blue);
    }
}
