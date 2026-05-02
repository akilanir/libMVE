package com.google.android.exoplayer.util;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/util/VerboseLogUtil.class */
public final class VerboseLogUtil {
    private static volatile String[] enabledTags;
    private static volatile boolean enableAllTags;

    private VerboseLogUtil() {
    }

    public static void setEnabledTags(String... tags) {
        enabledTags = tags;
        enableAllTags = false;
    }

    public static void setEnableAllTags(boolean enable) {
        enableAllTags = enable;
    }

    public static boolean isTagEnabled(String tag) {
        if (enableAllTags) {
            return true;
        }
        String[] tags = enabledTags;
        if (tags == null || tags.length == 0) {
            return false;
        }
        for (String str : tags) {
            if (str.equals(tag)) {
                return true;
            }
        }
        return false;
    }

    public static boolean areAllTagsEnabled() {
        return enableAllTags;
    }
}
