package ch.qos.logback.classic.spi;

import ch.qos.logback.core.CoreConstants;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/spi/ThrowableProxy.class */
public class ThrowableProxy implements IThrowableProxy {
    private Throwable throwable;
    private String className;
    private String message;
    StackTraceElementProxy[] stackTraceElementProxyArray;
    int commonFrames;
    private ThrowableProxy cause;
    private ThrowableProxy[] suppressed;
    private transient PackagingDataCalculator packagingDataCalculator;
    private boolean calculatedPackageData = false;
    private static final Method GET_SUPPRESSED_METHOD;
    private static final ThrowableProxy[] NO_SUPPRESSED;

    public ThrowableProxy(Throwable th) {
        this.suppressed = NO_SUPPRESSED;
        this.throwable = th;
        this.className = th.getClass().getName();
        this.message = th.getMessage();
        this.stackTraceElementProxyArray = ThrowableProxyUtil.steArrayToStepArray(th.getStackTrace());
        Throwable cause = th.getCause();
        if (cause != null) {
            this.cause = new ThrowableProxy(cause);
            this.cause.commonFrames = ThrowableProxyUtil.findNumberOfCommonFrames(cause.getStackTrace(), this.stackTraceElementProxyArray);
        }
        if (GET_SUPPRESSED_METHOD != null) {
            try {
                Object invoke = GET_SUPPRESSED_METHOD.invoke(th, new Object[0]);
                if (invoke instanceof Throwable[]) {
                    Throwable[] thArr = (Throwable[]) invoke;
                    if (thArr.length > 0) {
                        this.suppressed = new ThrowableProxy[thArr.length];
                        for (int i = 0; i < thArr.length; i++) {
                            this.suppressed[i] = new ThrowableProxy(thArr[i]);
                            this.suppressed[i].commonFrames = ThrowableProxyUtil.findNumberOfCommonFrames(thArr[i].getStackTrace(), this.stackTraceElementProxyArray);
                        }
                    }
                }
            } catch (IllegalAccessException e) {
            } catch (InvocationTargetException e2) {
            }
        }
    }

    public Throwable getThrowable() {
        return this.throwable;
    }

    @Override // ch.qos.logback.classic.spi.IThrowableProxy
    public String getMessage() {
        return this.message;
    }

    @Override // ch.qos.logback.classic.spi.IThrowableProxy
    public String getClassName() {
        return this.className;
    }

    @Override // ch.qos.logback.classic.spi.IThrowableProxy
    public StackTraceElementProxy[] getStackTraceElementProxyArray() {
        return this.stackTraceElementProxyArray;
    }

    @Override // ch.qos.logback.classic.spi.IThrowableProxy
    public int getCommonFrames() {
        return this.commonFrames;
    }

    @Override // ch.qos.logback.classic.spi.IThrowableProxy
    public IThrowableProxy getCause() {
        return this.cause;
    }

    @Override // ch.qos.logback.classic.spi.IThrowableProxy
    public IThrowableProxy[] getSuppressed() {
        return this.suppressed;
    }

    public PackagingDataCalculator getPackagingDataCalculator() {
        if (this.throwable != null && this.packagingDataCalculator == null) {
            this.packagingDataCalculator = new PackagingDataCalculator();
        }
        return this.packagingDataCalculator;
    }

    public void calculatePackagingData() {
        PackagingDataCalculator packagingDataCalculator;
        if (this.calculatedPackageData || (packagingDataCalculator = getPackagingDataCalculator()) == null) {
            return;
        }
        this.calculatedPackageData = true;
        packagingDataCalculator.calculate(this);
    }

    public void fullDump() {
        StringBuilder sb = new StringBuilder();
        for (StackTraceElementProxy stackTraceElementProxy : this.stackTraceElementProxyArray) {
            sb.append('\t').append(stackTraceElementProxy.toString());
            ThrowableProxyUtil.subjoinPackagingData(sb, stackTraceElementProxy);
            sb.append(CoreConstants.LINE_SEPARATOR);
        }
        System.out.println(sb.toString());
    }

    static {
        Method method = null;
        try {
            method = Throwable.class.getMethod("getSuppressed", new Class[0]);
        } catch (NoSuchMethodException e) {
        }
        GET_SUPPRESSED_METHOD = method;
        NO_SUPPRESSED = new ThrowableProxy[0];
    }
}
