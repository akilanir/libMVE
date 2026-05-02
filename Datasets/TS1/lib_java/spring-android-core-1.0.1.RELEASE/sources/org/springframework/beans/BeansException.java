package org.springframework.beans;

import org.springframework.core.NestedRuntimeException;
import org.springframework.util.ObjectUtils;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/beans/BeansException.class */
public abstract class BeansException extends NestedRuntimeException {
    private static final long serialVersionUID = 1;

    public BeansException(String msg) {
        super(msg);
    }

    public BeansException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof BeansException)) {
            return false;
        }
        BeansException otherBe = (BeansException) other;
        return getMessage().equals(otherBe.getMessage()) && ObjectUtils.nullSafeEquals(getCause(), otherBe.getCause());
    }

    public int hashCode() {
        return getMessage().hashCode();
    }
}
