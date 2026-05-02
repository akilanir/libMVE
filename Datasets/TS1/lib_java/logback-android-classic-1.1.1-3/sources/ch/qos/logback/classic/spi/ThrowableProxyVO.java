package ch.qos.logback.classic.spi;

import java.io.Serializable;
import java.util.Arrays;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/spi/ThrowableProxyVO.class */
public class ThrowableProxyVO implements IThrowableProxy, Serializable {
    private static final long serialVersionUID = -773438177285807139L;
    private String className;
    private String message;
    private int commonFramesCount;
    private StackTraceElementProxy[] stackTraceElementProxyArray;
    private IThrowableProxy cause;
    private IThrowableProxy[] suppressed;

    @Override // ch.qos.logback.classic.spi.IThrowableProxy
    public String getMessage() {
        return this.message;
    }

    @Override // ch.qos.logback.classic.spi.IThrowableProxy
    public String getClassName() {
        return this.className;
    }

    @Override // ch.qos.logback.classic.spi.IThrowableProxy
    public int getCommonFrames() {
        return this.commonFramesCount;
    }

    @Override // ch.qos.logback.classic.spi.IThrowableProxy
    public IThrowableProxy getCause() {
        return this.cause;
    }

    @Override // ch.qos.logback.classic.spi.IThrowableProxy
    public StackTraceElementProxy[] getStackTraceElementProxyArray() {
        return this.stackTraceElementProxyArray;
    }

    @Override // ch.qos.logback.classic.spi.IThrowableProxy
    public IThrowableProxy[] getSuppressed() {
        return this.suppressed;
    }

    public int hashCode() {
        return (31 * 1) + (this.className == null ? 0 : this.className.hashCode());
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        ThrowableProxyVO throwableProxyVO = (ThrowableProxyVO) obj;
        if (this.className == null) {
            if (throwableProxyVO.className != null) {
                return false;
            }
        } else if (!this.className.equals(throwableProxyVO.className)) {
            return false;
        }
        if (Arrays.equals(this.stackTraceElementProxyArray, throwableProxyVO.stackTraceElementProxyArray) && Arrays.equals(this.suppressed, throwableProxyVO.suppressed)) {
            return this.cause == null ? throwableProxyVO.cause == null : this.cause.equals(throwableProxyVO.cause);
        }
        return false;
    }

    public static ThrowableProxyVO build(IThrowableProxy iThrowableProxy) {
        if (iThrowableProxy == null) {
            return null;
        }
        ThrowableProxyVO throwableProxyVO = new ThrowableProxyVO();
        throwableProxyVO.className = iThrowableProxy.getClassName();
        throwableProxyVO.message = iThrowableProxy.getMessage();
        throwableProxyVO.commonFramesCount = iThrowableProxy.getCommonFrames();
        throwableProxyVO.stackTraceElementProxyArray = iThrowableProxy.getStackTraceElementProxyArray();
        IThrowableProxy cause = iThrowableProxy.getCause();
        if (cause != null) {
            throwableProxyVO.cause = build(cause);
        }
        IThrowableProxy[] suppressed = iThrowableProxy.getSuppressed();
        if (suppressed != null) {
            throwableProxyVO.suppressed = new IThrowableProxy[suppressed.length];
            for (int i = 0; i < suppressed.length; i++) {
                throwableProxyVO.suppressed[i] = build(suppressed[i]);
            }
        }
        return throwableProxyVO;
    }
}
