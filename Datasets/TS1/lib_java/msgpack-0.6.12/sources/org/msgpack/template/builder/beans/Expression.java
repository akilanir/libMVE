package org.msgpack.template.builder.beans;

import org.apache.harmony.beans.BeansUtils;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/beans/Expression.class */
public class Expression extends Statement {
    boolean valueIsDefined;
    Object value;

    public Expression(Object value, Object target, String methodName, Object[] arguments) {
        super(target, methodName, arguments);
        this.valueIsDefined = false;
        this.value = value;
        this.valueIsDefined = true;
    }

    public Expression(Object target, String methodName, Object[] arguments) {
        super(target, methodName, arguments);
        this.valueIsDefined = false;
        this.value = null;
        this.valueIsDefined = false;
    }

    @Override // org.msgpack.template.builder.beans.Statement
    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (!this.valueIsDefined) {
            sb.append("<unbound>");
        } else if (this.value == null) {
            sb.append(BeansUtils.NULL);
        } else {
            Class<?> clazz = this.value.getClass();
            sb.append(clazz == String.class ? BeansUtils.QUOTE : BeansUtils.idOfClass(clazz));
        }
        sb.append('=');
        sb.append(super.toString());
        return sb.toString();
    }

    public void setValue(Object value) {
        this.value = value;
        this.valueIsDefined = true;
    }

    public Object getValue() throws Exception {
        if (!this.valueIsDefined) {
            this.value = invokeMethod();
            this.valueIsDefined = true;
        }
        return this.value;
    }
}
