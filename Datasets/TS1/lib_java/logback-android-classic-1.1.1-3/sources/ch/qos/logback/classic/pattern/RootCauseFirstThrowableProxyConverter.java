package ch.qos.logback.classic.pattern;

import ch.qos.logback.classic.spi.IThrowableProxy;
import ch.qos.logback.classic.spi.ThrowableProxyUtil;
import ch.qos.logback.core.CoreConstants;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/pattern/RootCauseFirstThrowableProxyConverter.class */
public class RootCauseFirstThrowableProxyConverter extends ExtendedThrowableProxyConverter {
    @Override // ch.qos.logback.classic.pattern.ThrowableProxyConverter
    protected String throwableProxyToString(IThrowableProxy iThrowableProxy) {
        StringBuilder sb = new StringBuilder(2048);
        recursiveAppendRootCauseFirst(sb, null, 1, iThrowableProxy);
        return sb.toString();
    }

    protected void recursiveAppendRootCauseFirst(StringBuilder sb, String str, int i, IThrowableProxy iThrowableProxy) {
        if (iThrowableProxy.getCause() != null) {
            recursiveAppendRootCauseFirst(sb, str, i, iThrowableProxy.getCause());
            str = null;
        }
        ThrowableProxyUtil.indent(sb, i - 1);
        if (str != null) {
            sb.append(str);
        }
        ThrowableProxyUtil.subjoinFirstLineRootCauseFirst(sb, iThrowableProxy);
        sb.append(CoreConstants.LINE_SEPARATOR);
        subjoinSTEPArray(sb, i, iThrowableProxy);
        IThrowableProxy[] suppressed = iThrowableProxy.getSuppressed();
        if (suppressed != null) {
            for (IThrowableProxy iThrowableProxy2 : suppressed) {
                recursiveAppendRootCauseFirst(sb, "Suppressed: ", i + 1, iThrowableProxy2);
            }
        }
    }
}
