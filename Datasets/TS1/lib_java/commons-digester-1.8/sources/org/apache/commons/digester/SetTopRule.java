package org.apache.commons.digester;

import org.apache.commons.beanutils.MethodUtils;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/SetTopRule.class */
public class SetTopRule extends Rule {
    protected String methodName;
    protected String paramType;
    protected boolean useExactMatch;

    public SetTopRule(Digester digester, String methodName) {
        this(methodName);
    }

    public SetTopRule(Digester digester, String methodName, String paramType) {
        this(methodName, paramType);
    }

    public SetTopRule(String methodName) {
        this(methodName, (String) null);
    }

    public SetTopRule(String methodName, String paramType) {
        this.methodName = null;
        this.paramType = null;
        this.useExactMatch = false;
        this.methodName = methodName;
        this.paramType = paramType;
    }

    public boolean isExactMatch() {
        return this.useExactMatch;
    }

    public void setExactMatch(boolean useExactMatch) {
        this.useExactMatch = useExactMatch;
    }

    @Override // org.apache.commons.digester.Rule
    public void end() throws Exception {
        Object child = this.digester.peek(0);
        Object parent = this.digester.peek(1);
        if (this.digester.log.isDebugEnabled()) {
            if (child == null) {
                this.digester.log.debug(new StringBuffer().append("[SetTopRule]{").append(this.digester.match).append("} Call [NULL CHILD].").append(this.methodName).append("(").append(parent).append(")").toString());
            } else {
                this.digester.log.debug(new StringBuffer().append("[SetTopRule]{").append(this.digester.match).append("} Call ").append(child.getClass().getName()).append(".").append(this.methodName).append("(").append(parent).append(")").toString());
            }
        }
        Class[] paramTypes = new Class[1];
        if (this.paramType != null) {
            paramTypes[0] = this.digester.getClassLoader().loadClass(this.paramType);
        } else {
            paramTypes[0] = parent.getClass();
        }
        if (this.useExactMatch) {
            MethodUtils.invokeExactMethod(child, this.methodName, new Object[]{parent}, paramTypes);
        } else {
            MethodUtils.invokeMethod(child, this.methodName, new Object[]{parent}, paramTypes);
        }
    }

    public String toString() {
        StringBuffer sb = new StringBuffer("SetTopRule[");
        sb.append("methodName=");
        sb.append(this.methodName);
        sb.append(", paramType=");
        sb.append(this.paramType);
        sb.append("]");
        return sb.toString();
    }
}
