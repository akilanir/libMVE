package ch.qos.logback.core.pattern.util;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/util/AsIsEscapeUtil.class */
public class AsIsEscapeUtil implements IEscapeUtil {
    @Override // ch.qos.logback.core.pattern.util.IEscapeUtil
    public void escape(String str, StringBuffer stringBuffer, char c, int i) {
        stringBuffer.append("\\");
        stringBuffer.append(c);
    }
}
