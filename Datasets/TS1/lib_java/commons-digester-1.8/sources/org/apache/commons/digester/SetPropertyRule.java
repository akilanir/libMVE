package org.apache.commons.digester;

import java.beans.PropertyDescriptor;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.DynaBean;
import org.apache.commons.beanutils.DynaProperty;
import org.apache.commons.beanutils.PropertyUtils;
import org.xml.sax.Attributes;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/SetPropertyRule.class */
public class SetPropertyRule extends Rule {
    protected String name;
    protected String value;

    public SetPropertyRule(Digester digester, String name, String value) {
        this(name, value);
    }

    public SetPropertyRule(String name, String value) {
        this.name = null;
        this.value = null;
        this.name = name;
        this.value = value;
    }

    @Override // org.apache.commons.digester.Rule
    public void begin(Attributes attributes) throws Exception {
        String actualName = null;
        String actualValue = null;
        for (int i = 0; i < attributes.getLength(); i++) {
            String name = attributes.getLocalName(i);
            if ("".equals(name)) {
                name = attributes.getQName(i);
            }
            String value = attributes.getValue(i);
            if (name.equals(this.name)) {
                actualName = value;
            } else if (name.equals(this.value)) {
                actualValue = value;
            }
        }
        Object top = this.digester.peek();
        if (this.digester.log.isDebugEnabled()) {
            this.digester.log.debug(new StringBuffer().append("[SetPropertyRule]{").append(this.digester.match).append("} Set ").append(top.getClass().getName()).append(" property ").append(actualName).append(" to ").append(actualValue).toString());
        }
        if (top instanceof DynaBean) {
            DynaProperty desc = ((DynaBean) top).getDynaClass().getDynaProperty(actualName);
            if (desc == null) {
                throw new NoSuchMethodException(new StringBuffer().append("Bean has no property named ").append(actualName).toString());
            }
        } else {
            PropertyDescriptor desc2 = PropertyUtils.getPropertyDescriptor(top, actualName);
            if (desc2 == null) {
                throw new NoSuchMethodException(new StringBuffer().append("Bean has no property named ").append(actualName).toString());
            }
        }
        BeanUtils.setProperty(top, actualName, actualValue);
    }

    public String toString() {
        StringBuffer sb = new StringBuffer("SetPropertyRule[");
        sb.append("name=");
        sb.append(this.name);
        sb.append(", value=");
        sb.append(this.value);
        sb.append("]");
        return sb.toString();
    }
}
