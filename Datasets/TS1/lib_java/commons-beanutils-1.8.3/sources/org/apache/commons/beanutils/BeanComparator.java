package org.apache.commons.beanutils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.Comparator;
import org.apache.commons.collections.comparators.ComparableComparator;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/BeanComparator.class */
public class BeanComparator implements Comparator, Serializable {
    private String property;
    private Comparator comparator;

    public BeanComparator() {
        this(null);
    }

    public BeanComparator(String property) {
        this(property, ComparableComparator.getInstance());
    }

    public BeanComparator(String property, Comparator comparator) {
        setProperty(property);
        if (comparator != null) {
            this.comparator = comparator;
        } else {
            this.comparator = ComparableComparator.getInstance();
        }
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getProperty() {
        return this.property;
    }

    public Comparator getComparator() {
        return this.comparator;
    }

    @Override // java.util.Comparator
    public int compare(Object o1, Object o2) {
        if (this.property == null) {
            return this.comparator.compare(o1, o2);
        }
        try {
            Object value1 = PropertyUtils.getProperty(o1, this.property);
            Object value2 = PropertyUtils.getProperty(o2, this.property);
            return this.comparator.compare(value1, value2);
        } catch (IllegalAccessException iae) {
            throw new RuntimeException(new StringBuffer().append("IllegalAccessException: ").append(iae.toString()).toString());
        } catch (NoSuchMethodException nsme) {
            throw new RuntimeException(new StringBuffer().append("NoSuchMethodException: ").append(nsme.toString()).toString());
        } catch (InvocationTargetException ite) {
            throw new RuntimeException(new StringBuffer().append("InvocationTargetException: ").append(ite.toString()).toString());
        }
    }

    @Override // java.util.Comparator
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof BeanComparator)) {
            return false;
        }
        BeanComparator beanComparator = (BeanComparator) o;
        if (!this.comparator.equals(beanComparator.comparator)) {
            return false;
        }
        if (this.property == null) {
            return beanComparator.property == null;
        }
        if (!this.property.equals(beanComparator.property)) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        int result = this.comparator.hashCode();
        return result;
    }
}
