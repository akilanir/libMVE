package org.dmfs.ngrams;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Pattern;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/ngrams/NGramGenerator.class */
public final class NGramGenerator {
    private static final Pattern SEPARATOR_PATTERN = Pattern.compile("[^\\p{L}\\p{M}\\d]+");
    private static final Pattern SEPARATOR_PATTERN_NO_NUMBERS = Pattern.compile("[^\\p{L}\\p{M}]+");
    private final int mN;
    private final int mMinWordLen;
    private boolean mAllLowercase;
    private boolean mReturnNumbers;
    private boolean mAddSpaceInFront;
    private Locale mLocale;
    private char[] mTempArray;

    public NGramGenerator(int i) {
        this(i, 1);
    }

    public NGramGenerator(int i, int i2) {
        this.mAllLowercase = true;
        this.mReturnNumbers = true;
        this.mAddSpaceInFront = false;
        this.mLocale = Locale.getDefault();
        this.mN = i;
        this.mMinWordLen = i2;
        this.mTempArray = new char[i];
        this.mTempArray[0] = ' ';
    }

    public NGramGenerator setAllLowercase(boolean z) {
        this.mAllLowercase = z;
        return this;
    }

    public NGramGenerator setAddSpaceInFront(boolean z) {
        this.mAddSpaceInFront = z;
        return this;
    }

    public NGramGenerator setLocale(Locale locale) {
        this.mLocale = locale;
        return this;
    }

    public Set<String> getNgrams(String str) {
        return getNgrams(new HashSet(128), str);
    }

    public Set<String> getNgrams(Set<String> set, String str) {
        if (this.mAllLowercase) {
            str = str.toLowerCase(this.mLocale);
        }
        String[] split = this.mReturnNumbers ? SEPARATOR_PATTERN.split(str) : SEPARATOR_PATTERN_NO_NUMBERS.split(str);
        if (set == null) {
            set = new HashSet(128);
        }
        for (String str2 : split) {
            getNgrams(str2, set);
        }
        return set;
    }

    public void getNgrams(String str, Set<String> set) {
        int length = str.length();
        if (length < this.mMinWordLen) {
            return;
        }
        int i = this.mN;
        int max = Math.max(1, (length - i) + 1);
        for (int i2 = 0; i2 < max; i2++) {
            set.add(str.substring(i2, Math.min(i2 + i, length)));
        }
        if (this.mAddSpaceInFront) {
            char[] cArr = this.mTempArray;
            int min = Math.min(length, i - 1);
            for (int i3 = 0; i3 < min; i3++) {
                cArr[i3 + 1] = str.charAt(i3);
            }
            set.add(new String(cArr));
        }
    }
}
