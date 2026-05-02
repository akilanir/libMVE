package org.springframework.beans;

import java.beans.PropertyChangeEvent;
import org.springframework.core.ErrorCoded;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/beans/PropertyAccessException.class */
public abstract class PropertyAccessException extends BeansException implements ErrorCoded {
    private static final long serialVersionUID = 1;
    private transient PropertyChangeEvent propertyChangeEvent;

    public PropertyAccessException(PropertyChangeEvent propertyChangeEvent, String msg, Throwable cause) {
        super(msg, cause);
        this.propertyChangeEvent = propertyChangeEvent;
    }

    public PropertyAccessException(String msg, Throwable cause) {
        super(msg, cause);
    }

    public PropertyChangeEvent getPropertyChangeEvent() {
        return this.propertyChangeEvent;
    }

    public String getPropertyName() {
        if (this.propertyChangeEvent != null) {
            return this.propertyChangeEvent.getPropertyName();
        }
        return null;
    }

    public Object getValue() {
        if (this.propertyChangeEvent != null) {
            return this.propertyChangeEvent.getNewValue();
        }
        return null;
    }
}
