package org.apache.commons.digester;

import java.beans.PropertyDescriptor;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.DynaBean;
import org.apache.commons.beanutils.DynaProperty;
import org.apache.commons.beanutils.PropertyUtils;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/BeanPropertySetterRule.class */
public class BeanPropertySetterRule extends Rule {
    protected String propertyName;
    protected String bodyText;

    public BeanPropertySetterRule(Digester digester, String propertyName) {
        this(propertyName);
    }

    public BeanPropertySetterRule(Digester digester) {
        this();
    }

    public BeanPropertySetterRule(String propertyName) {
        this.propertyName = null;
        this.bodyText = null;
        this.propertyName = propertyName;
    }

    public BeanPropertySetterRule() {
        this((String) null);
    }

    @Override // org.apache.commons.digester.Rule
    public void body(String namespace, String name, String text) throws Exception {
        if (this.digester.log.isDebugEnabled()) {
            this.digester.log.debug(new StringBuffer().append("[BeanPropertySetterRule]{").append(this.digester.match).append("} Called with text '").append(text).append("'").toString());
        }
        this.bodyText = text.trim();
    }

    @Override // org.apache.commons.digester.Rule
    public void end(String namespace, String name) throws Exception {
        String property = this.propertyName;
        if (property == null) {
            property = name;
        }
        Object top = this.digester.peek();
        if (this.digester.log.isDebugEnabled()) {
            this.digester.log.debug(new StringBuffer().append("[BeanPropertySetterRule]{").append(this.digester.match).append("} Set ").append(top.getClass().getName()).append(" property ").append(property).append(" with text ").append(this.bodyText).toString());
        }
        if (top instanceof DynaBean) {
            DynaProperty desc = ((DynaBean) top).getDynaClass().getDynaProperty(property);
            if (desc == null) {
                throw new NoSuchMethodException(new StringBuffer().append("Bean has no property named ").append(property).toString());
            }
        } else {
            PropertyDescriptor desc2 = PropertyUtils.getPropertyDescriptor(top, property);
            if (desc2 == null) {
                throw new NoSuchMethodException(new StringBuffer().append("Bean has no property named ").append(property).toString());
            }
        }
        BeanUtils.setProperty(top, property, this.bodyText);
    }

    @Override // org.apache.commons.digester.Rule
    public void finish() throws Exception {
        this.bodyText = null;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer("BeanPropertySetterRule[");
        sb.append("propertyName=");
        sb.append(this.propertyName);
        sb.append("]");
        return sb.toString();
    }
}
