package ch.qos.logback.classic.pattern;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/ClassNameOnlyAbbreviator.class */
public class ClassNameOnlyAbbreviator implements Abbreviator {
    @Override // ch.qos.logback.classic.pattern.Abbreviator
    public String abbreviate(String str) {
        int lastIndexOf = str.lastIndexOf(46);
        return lastIndexOf != -1 ? str.substring(lastIndexOf + 1, str.length()) : str;
    }
}
