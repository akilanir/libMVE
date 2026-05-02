package ch.qos.logback.classic.spi;

import java.io.Serializable;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/spi/StackTraceElementProxy.class */
public class StackTraceElementProxy implements Serializable {
    private static final long serialVersionUID = -2374374378980555982L;
    final StackTraceElement ste;
    private transient String steAsString;
    private ClassPackagingData cpd;

    public StackTraceElementProxy(StackTraceElement stackTraceElement) {
        if (stackTraceElement == null) {
            throw new IllegalArgumentException("ste cannot be null");
        }
        this.ste = stackTraceElement;
    }

    public String getSTEAsString() {
        if (this.steAsString == null) {
            this.steAsString = "at " + this.ste.toString();
        }
        return this.steAsString;
    }

    public StackTraceElement getStackTraceElement() {
        return this.ste;
    }

    public void setClassPackagingData(ClassPackagingData classPackagingData) {
        if (this.cpd != null) {
            throw new IllegalStateException("Packaging data has been already set");
        }
        this.cpd = classPackagingData;
    }

    public ClassPackagingData getClassPackagingData() {
        return this.cpd;
    }

    public int hashCode() {
        return this.ste.hashCode();
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        StackTraceElementProxy stackTraceElementProxy = (StackTraceElementProxy) obj;
        if (this.ste.equals(stackTraceElementProxy.ste)) {
            return this.cpd == null ? stackTraceElementProxy.cpd == null : this.cpd.equals(stackTraceElementProxy.cpd);
        }
        return false;
    }

    public String toString() {
        return getSTEAsString();
    }
}
