package ch.qos.logback.core.pattern.util;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/util/RestrictedEscapeUtil.class */
public class RestrictedEscapeUtil implements IEscapeUtil {
    @Override // ch.qos.logback.core.pattern.util.IEscapeUtil
    public void escape(String str, StringBuffer stringBuffer, char c, int i) {
        if (str.indexOf(c) >= 0) {
            stringBuffer.append(c);
        } else {
            stringBuffer.append("\\");
            stringBuffer.append(c);
        }
    }
}
