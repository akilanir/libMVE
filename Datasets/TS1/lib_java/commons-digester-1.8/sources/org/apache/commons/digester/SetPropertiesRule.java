package org.apache.commons.digester;

import java.util.HashMap;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.xml.sax.Attributes;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/SetPropertiesRule.class */
public class SetPropertiesRule extends Rule {
    private String[] attributeNames;
    private String[] propertyNames;
    private boolean ignoreMissingProperty;

    public SetPropertiesRule(Digester digester) {
        this();
    }

    public SetPropertiesRule() {
        this.ignoreMissingProperty = true;
    }

    public SetPropertiesRule(String attributeName, String propertyName) {
        this.ignoreMissingProperty = true;
        this.attributeNames = new String[1];
        this.attributeNames[0] = attributeName;
        this.propertyNames = new String[1];
        this.propertyNames[0] = propertyName;
    }

    public SetPropertiesRule(String[] attributeNames, String[] propertyNames) {
        this.ignoreMissingProperty = true;
        this.attributeNames = new String[attributeNames.length];
        int size = attributeNames.length;
        for (int i = 0; i < size; i++) {
            this.attributeNames[i] = attributeNames[i];
        }
        this.propertyNames = new String[propertyNames.length];
        int size2 = propertyNames.length;
        for (int i2 = 0; i2 < size2; i2++) {
            this.propertyNames[i2] = propertyNames[i2];
        }
    }

    @Override // org.apache.commons.digester.Rule
    public void begin(Attributes attributes) throws Exception {
        HashMap values = new HashMap();
        int attNamesLength = 0;
        if (this.attributeNames != null) {
            attNamesLength = this.attributeNames.length;
        }
        int propNamesLength = 0;
        if (this.propertyNames != null) {
            propNamesLength = this.propertyNames.length;
        }
        for (int i = 0; i < attributes.getLength(); i++) {
            String name = attributes.getLocalName(i);
            if ("".equals(name)) {
                name = attributes.getQName(i);
            }
            String value = attributes.getValue(i);
            int n = 0;
            while (true) {
                if (n >= attNamesLength) {
                    break;
                }
                if (!name.equals(this.attributeNames[n])) {
                    n++;
                } else if (n < propNamesLength) {
                    name = this.propertyNames[n];
                } else {
                    name = null;
                }
            }
            if (this.digester.log.isDebugEnabled()) {
                this.digester.log.debug(new StringBuffer().append("[SetPropertiesRule]{").append(this.digester.match).append("} Setting property '").append(name).append("' to '").append(value).append("'").toString());
            }
            if (!this.ignoreMissingProperty && name != null) {
                boolean test = PropertyUtils.isWriteable(this.digester.peek(), name);
                if (!test) {
                    throw new NoSuchMethodException(new StringBuffer().append("Property ").append(name).append(" can't be set").toString());
                }
            }
            if (name != null) {
                values.put(name, value);
            }
        }
        Object top = this.digester.peek();
        if (this.digester.log.isDebugEnabled()) {
            if (top != null) {
                this.digester.log.debug(new StringBuffer().append("[SetPropertiesRule]{").append(this.digester.match).append("} Set ").append(top.getClass().getName()).append(" properties").toString());
            } else {
                this.digester.log.debug(new StringBuffer().append("[SetPropertiesRule]{").append(this.digester.match).append("} Set NULL properties").toString());
            }
        }
        BeanUtils.populate(top, values);
    }

    public void addAlias(String attributeName, String propertyName) {
        if (this.attributeNames == null) {
            this.attributeNames = new String[1];
            this.attributeNames[0] = attributeName;
            this.propertyNames = new String[1];
            this.propertyNames[0] = propertyName;
            return;
        }
        int length = this.attributeNames.length;
        String[] tempAttributes = new String[length + 1];
        for (int i = 0; i < length; i++) {
            tempAttributes[i] = this.attributeNames[i];
        }
        tempAttributes[length] = attributeName;
        String[] tempProperties = new String[length + 1];
        for (int i2 = 0; i2 < length && i2 < this.propertyNames.length; i2++) {
            tempProperties[i2] = this.propertyNames[i2];
        }
        tempProperties[length] = propertyName;
        this.propertyNames = tempProperties;
        this.attributeNames = tempAttributes;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer("SetPropertiesRule[");
        sb.append("]");
        return sb.toString();
    }

    public boolean isIgnoreMissingProperty() {
        return this.ignoreMissingProperty;
    }

    public void setIgnoreMissingProperty(boolean ignoreMissingProperty) {
        this.ignoreMissingProperty = ignoreMissingProperty;
    }
}
