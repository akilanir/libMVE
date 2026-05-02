package ch.qos.logback.core.pattern.util;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/util/AlmostAsIsEscapeUtil.class */
public class AlmostAsIsEscapeUtil extends RestrictedEscapeUtil {
    @Override // ch.qos.logback.core.pattern.util.RestrictedEscapeUtil, ch.qos.logback.core.pattern.util.IEscapeUtil
    public void escape(String str, StringBuffer stringBuffer, char c, int i) {
        super.escape("%)", stringBuffer, c, i);
    }
}
