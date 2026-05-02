package org.apache.commons.beanutils;

import java.lang.reflect.InvocationTargetException;
import org.apache.commons.collections.Transformer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/BeanToPropertyValueTransformer.class */
public class BeanToPropertyValueTransformer implements Transformer {
    private final Log log;
    private String propertyName;
    private boolean ignoreNull;

    public BeanToPropertyValueTransformer(String propertyName) {
        this(propertyName, false);
    }

    public BeanToPropertyValueTransformer(String propertyName, boolean ignoreNull) {
        this.log = LogFactory.getLog(getClass());
        if (propertyName != null && propertyName.length() > 0) {
            this.propertyName = propertyName;
            this.ignoreNull = ignoreNull;
            return;
        }
        throw new IllegalArgumentException("propertyName cannot be null or empty");
    }

    public Object transform(Object object) {
        Object propertyValue = null;
        try {
            propertyValue = PropertyUtils.getProperty(object, this.propertyName);
        } catch (IllegalAccessException e) {
            IllegalArgumentException iae = new IllegalArgumentException("Unable to access the property provided.");
            if (!BeanUtils.initCause(iae, e)) {
                this.log.error("Unable to access the property provided.", e);
            }
            throw iae;
        } catch (IllegalArgumentException e2) {
            if (this.ignoreNull) {
                this.log.warn(new StringBuffer().append("WARNING: Problem during transformation. Null value encountered in property path...").append(e2).toString());
            } else {
                IllegalArgumentException iae2 = new IllegalArgumentException("Problem during transformation. Null value encountered in property path...");
                if (!BeanUtils.initCause(iae2, e2)) {
                    this.log.error("Problem during transformation. Null value encountered in property path...", e2);
                }
                throw iae2;
            }
        } catch (NoSuchMethodException e3) {
            String errorMsg = new StringBuffer().append("No property found for name [").append(this.propertyName).append("]").toString();
            IllegalArgumentException iae3 = new IllegalArgumentException(errorMsg);
            if (!BeanUtils.initCause(iae3, e3)) {
                this.log.error(errorMsg, e3);
            }
            throw iae3;
        } catch (InvocationTargetException e4) {
            IllegalArgumentException iae4 = new IllegalArgumentException("Exception occurred in property's getter");
            if (!BeanUtils.initCause(iae4, e4)) {
                this.log.error("Exception occurred in property's getter", e4);
            }
            throw iae4;
        }
        return propertyValue;
    }

    public String getPropertyName() {
        return this.propertyName;
    }

    public boolean isIgnoreNull() {
        return this.ignoreNull;
    }
}
