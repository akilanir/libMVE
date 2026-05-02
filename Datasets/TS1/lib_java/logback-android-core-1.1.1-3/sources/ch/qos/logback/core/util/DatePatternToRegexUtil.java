package ch.qos.logback.core.util;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/DatePatternToRegexUtil.class */
public class DatePatternToRegexUtil {
    final String datePattern;
    final int datePatternLength;
    final CharSequenceToRegexMapper regexMapper = new CharSequenceToRegexMapper();

    public DatePatternToRegexUtil(String str) {
        this.datePattern = str;
        this.datePatternLength = str.length();
    }

    public String toRegex() {
        List<CharSequenceState> list = tokenize();
        StringBuilder sb = new StringBuilder();
        Iterator<CharSequenceState> it = list.iterator();
        while (it.hasNext()) {
            sb.append(this.regexMapper.toRegex(it.next()));
        }
        return sb.toString();
    }

    private List<CharSequenceState> tokenize() {
        ArrayList arrayList = new ArrayList();
        CharSequenceState charSequenceState = null;
        for (int i = 0; i < this.datePatternLength; i++) {
            char charAt = this.datePattern.charAt(i);
            if (charSequenceState == null || charSequenceState.c != charAt) {
                charSequenceState = new CharSequenceState(charAt);
                arrayList.add(charSequenceState);
            } else {
                charSequenceState.incrementOccurrences();
            }
        }
        return arrayList;
    }
}
