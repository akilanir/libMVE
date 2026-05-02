package org.apache.commons.beanutils;

import java.lang.reflect.InvocationTargetException;
import org.apache.commons.collections.Predicate;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/BeanPredicate.class */
public class BeanPredicate implements Predicate {
    private final Log log = LogFactory.getLog(getClass());
    private String propertyName;
    private Predicate predicate;

    public BeanPredicate(String propertyName, Predicate predicate) {
        this.propertyName = propertyName;
        this.predicate = predicate;
    }

    public boolean evaluate(Object object) {
        try {
            Object propValue = PropertyUtils.getProperty(object, this.propertyName);
            boolean evaluation = this.predicate.evaluate(propValue);
            return evaluation;
        } catch (IllegalAccessException e) {
            this.log.error("Unable to access the property provided.", e);
            throw new IllegalArgumentException("Unable to access the property provided.");
        } catch (IllegalArgumentException e2) {
            this.log.error("ERROR: Problem during evaluation.", e2);
            throw e2;
        } catch (NoSuchMethodException e3) {
            this.log.error("Property not found.", e3);
            throw new IllegalArgumentException("Property not found.");
        } catch (InvocationTargetException e4) {
            this.log.error("Exception occurred in property's getter", e4);
            throw new IllegalArgumentException("Exception occurred in property's getter");
        }
    }

    public String getPropertyName() {
        return this.propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public Predicate getPredicate() {
        return this.predicate;
    }

    public void setPredicate(Predicate predicate) {
        this.predicate = predicate;
    }
}
