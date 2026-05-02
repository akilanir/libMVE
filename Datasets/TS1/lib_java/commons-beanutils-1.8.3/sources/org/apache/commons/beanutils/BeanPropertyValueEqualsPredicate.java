package org.apache.commons.beanutils;

import java.lang.reflect.InvocationTargetException;
import org.apache.commons.collections.Predicate;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/BeanPropertyValueEqualsPredicate.class */
public class BeanPropertyValueEqualsPredicate implements Predicate {
    private final Log log;
    private String propertyName;
    private Object propertyValue;
    private boolean ignoreNull;

    public BeanPropertyValueEqualsPredicate(String propertyName, Object propertyValue) {
        this(propertyName, propertyValue, false);
    }

    public BeanPropertyValueEqualsPredicate(String propertyName, Object propertyValue, boolean ignoreNull) {
        this.log = LogFactory.getLog(getClass());
        if (propertyName != null && propertyName.length() > 0) {
            this.propertyName = propertyName;
            this.propertyValue = propertyValue;
            this.ignoreNull = ignoreNull;
            return;
        }
        throw new IllegalArgumentException("propertyName cannot be null or empty");
    }

    public boolean evaluate(Object object) {
        boolean evaluation = false;
        try {
            evaluation = evaluateValue(this.propertyValue, PropertyUtils.getProperty(object, this.propertyName));
        } catch (IllegalAccessException e) {
            IllegalArgumentException iae = new IllegalArgumentException("Unable to access the property provided.");
            if (!BeanUtils.initCause(iae, e)) {
                this.log.error("Unable to access the property provided.", e);
            }
            throw iae;
        } catch (IllegalArgumentException e2) {
            if (this.ignoreNull) {
                this.log.warn(new StringBuffer().append("WARNING: Problem during evaluation. Null value encountered in property path...").append(e2).toString());
            } else {
                IllegalArgumentException iae2 = new IllegalArgumentException("Problem during evaluation. Null value encountered in property path...");
                if (!BeanUtils.initCause(iae2, e2)) {
                    this.log.error("Problem during evaluation. Null value encountered in property path...", e2);
                }
                throw iae2;
            }
        } catch (NoSuchMethodException e3) {
            IllegalArgumentException iae3 = new IllegalArgumentException("Property not found.");
            if (!BeanUtils.initCause(iae3, e3)) {
                this.log.error("Property not found.", e3);
            }
            throw iae3;
        } catch (InvocationTargetException e4) {
            IllegalArgumentException iae4 = new IllegalArgumentException("Exception occurred in property's getter");
            if (!BeanUtils.initCause(iae4, e4)) {
                this.log.error("Exception occurred in property's getter", e4);
            }
            throw iae4;
        }
        return evaluation;
    }

    protected boolean evaluateValue(Object expected, Object actual) {
        return expected == actual || (expected != null && expected.equals(actual));
    }

    public String getPropertyName() {
        return this.propertyName;
    }

    public Object getPropertyValue() {
        return this.propertyValue;
    }

    public boolean isIgnoreNull() {
        return this.ignoreNull;
    }
}
