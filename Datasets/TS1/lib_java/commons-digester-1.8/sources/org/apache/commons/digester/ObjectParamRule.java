package org.apache.commons.digester;

import org.xml.sax.Attributes;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/ObjectParamRule.class */
public class ObjectParamRule extends Rule {
    protected String attributeName;
    protected int paramIndex;
    protected Object param;

    public ObjectParamRule(int paramIndex, Object param) {
        this(paramIndex, null, param);
    }

    public ObjectParamRule(int paramIndex, String attributeName, Object param) {
        this.attributeName = null;
        this.paramIndex = 0;
        this.param = null;
        this.paramIndex = paramIndex;
        this.attributeName = attributeName;
        this.param = param;
    }

    @Override // org.apache.commons.digester.Rule
    public void begin(String namespace, String name, Attributes attributes) throws Exception {
        Object[] parameters = (Object[]) this.digester.peekParams();
        if (this.attributeName != null) {
            Object anAttribute = attributes.getValue(this.attributeName);
            if (anAttribute != null) {
                parameters[this.paramIndex] = this.param;
                return;
            }
            return;
        }
        parameters[this.paramIndex] = this.param;
    }

    public String toString() {
        StringBuffer sb = new StringBuffer("ObjectParamRule[");
        sb.append("paramIndex=");
        sb.append(this.paramIndex);
        sb.append(", attributeName=");
        sb.append(this.attributeName);
        sb.append(", param=");
        sb.append(this.param);
        sb.append("]");
        return sb.toString();
    }
}
