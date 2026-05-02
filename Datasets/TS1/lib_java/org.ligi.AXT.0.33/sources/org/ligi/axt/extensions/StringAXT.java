package org.ligi.axt.extensions;

import android.graphics.Color;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/extensions/StringAXT.class */
public class StringAXT<T> {
    private final String string;

    public StringAXT(String string) {
        this.string = string;
    }

    public int parseColor(int defaultValue) {
        if (this.string == null) {
            return defaultValue;
        }
        if (this.string.startsWith("rgb")) {
            return parseColorRGBStyle(this.string, defaultValue);
        }
        if (this.string.startsWith("#")) {
            try {
                return Color.parseColor(this.string);
            } catch (Exception e) {
            }
        }
        return defaultValue;
    }

    private static int parseColorRGBStyle(String color_str, int defaultValue) {
        Pattern pattern = Pattern.compile("rgb *\\( *([0-9]+), *([0-9]+), *([0-9]+) *\\)");
        Matcher matcher = pattern.matcher(color_str);
        if (matcher.matches()) {
            return (-16777216) | (Integer.valueOf(matcher.group(1)).intValue() << 16) | (Integer.valueOf(matcher.group(2)).intValue() << 8) | Integer.valueOf(matcher.group(3)).intValue();
        }
        return defaultValue;
    }
}
