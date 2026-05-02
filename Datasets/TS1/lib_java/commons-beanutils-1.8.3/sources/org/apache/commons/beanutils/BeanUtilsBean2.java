package org.apache.commons.beanutils;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/BeanUtilsBean2.class */
public class BeanUtilsBean2 extends BeanUtilsBean {
    public BeanUtilsBean2() {
        super(new ConvertUtilsBean2());
    }

    @Override // org.apache.commons.beanutils.BeanUtilsBean
    protected Object convert(Object value, Class type) {
        return getConvertUtils().convert(value, type);
    }
}
