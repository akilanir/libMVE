package org.apache.commons.digester;

import org.apache.commons.beanutils.MethodUtils;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/SetRootRule.class */
public class SetRootRule extends Rule {
    protected String methodName;
    protected String paramType;
    protected boolean useExactMatch;

    public SetRootRule(Digester digester, String methodName) {
        this(methodName);
    }

    public SetRootRule(Digester digester, String methodName, String paramType) {
        this(methodName, paramType);
    }

    public SetRootRule(String methodName) {
        this(methodName, (String) null);
    }

    public SetRootRule(String methodName, String paramType) {
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
        Object parent = this.digester.root;
        if (this.digester.log.isDebugEnabled()) {
            if (parent == null) {
                this.digester.log.debug(new StringBuffer().append("[SetRootRule]{").append(this.digester.match).append("} Call [NULL ROOT].").append(this.methodName).append("(").append(child).append(")").toString());
            } else {
                this.digester.log.debug(new StringBuffer().append("[SetRootRule]{").append(this.digester.match).append("} Call ").append(parent.getClass().getName()).append(".").append(this.methodName).append("(").append(child).append(")").toString());
            }
        }
        Class[] paramTypes = new Class[1];
        if (this.paramType != null) {
            paramTypes[0] = this.digester.getClassLoader().loadClass(this.paramType);
        } else {
            paramTypes[0] = child.getClass();
        }
        if (this.useExactMatch) {
            MethodUtils.invokeExactMethod(parent, this.methodName, new Object[]{child}, paramTypes);
        } else {
            MethodUtils.invokeMethod(parent, this.methodName, new Object[]{child}, paramTypes);
        }
    }

    public String toString() {
        StringBuffer sb = new StringBuffer("SetRootRule[");
        sb.append("methodName=");
        sb.append(this.methodName);
        sb.append(", paramType=");
        sb.append(this.paramType);
        sb.append("]");
        return sb.toString();
    }
}
