package org.apache.commons.digester;

import org.xml.sax.Attributes;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/CallMethodRule.class */
public class CallMethodRule extends Rule {
    protected String bodyText;
    private int targetOffset;
    protected String methodName;
    protected int paramCount;
    protected Class[] paramTypes;
    private String[] paramClassNames;
    protected boolean useExactMatch;
    static Class class$java$lang$String;

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public CallMethodRule(Digester digester, String methodName, int paramCount) {
        this(methodName, paramCount);
    }

    public CallMethodRule(Digester digester, String methodName, int paramCount, String[] paramTypes) {
        this(methodName, paramCount, paramTypes);
    }

    public CallMethodRule(Digester digester, String methodName, int paramCount, Class[] paramTypes) {
        this(methodName, paramCount, paramTypes);
    }

    public CallMethodRule(String methodName, int paramCount) {
        this(0, methodName, paramCount);
    }

    public CallMethodRule(int targetOffset, String methodName, int paramCount) {
        Class cls;
        Class cls2;
        this.bodyText = null;
        this.targetOffset = 0;
        this.methodName = null;
        this.paramCount = 0;
        this.paramTypes = null;
        this.paramClassNames = null;
        this.useExactMatch = false;
        this.targetOffset = targetOffset;
        this.methodName = methodName;
        this.paramCount = paramCount;
        if (paramCount == 0) {
            Class[] clsArr = new Class[1];
            if (class$java$lang$String == null) {
                cls2 = class$("java.lang.String");
                class$java$lang$String = cls2;
            } else {
                cls2 = class$java$lang$String;
            }
            clsArr[0] = cls2;
            this.paramTypes = clsArr;
            return;
        }
        this.paramTypes = new Class[paramCount];
        for (int i = 0; i < this.paramTypes.length; i++) {
            Class[] clsArr2 = this.paramTypes;
            int i2 = i;
            if (class$java$lang$String == null) {
                cls = class$("java.lang.String");
                class$java$lang$String = cls;
            } else {
                cls = class$java$lang$String;
            }
            clsArr2[i2] = cls;
        }
    }

    public CallMethodRule(String methodName) {
        this(0, methodName, 0, (Class[]) null);
    }

    public CallMethodRule(int targetOffset, String methodName) {
        this(targetOffset, methodName, 0, (Class[]) null);
    }

    public CallMethodRule(String methodName, int paramCount, String[] paramTypes) {
        this(0, methodName, paramCount, paramTypes);
    }

    public CallMethodRule(int targetOffset, String methodName, int paramCount, String[] paramTypes) {
        Class cls;
        this.bodyText = null;
        this.targetOffset = 0;
        this.methodName = null;
        this.paramCount = 0;
        this.paramTypes = null;
        this.paramClassNames = null;
        this.useExactMatch = false;
        this.targetOffset = targetOffset;
        this.methodName = methodName;
        this.paramCount = paramCount;
        if (paramTypes == null) {
            this.paramTypes = new Class[paramCount];
            for (int i = 0; i < this.paramTypes.length; i++) {
                Class[] clsArr = this.paramTypes;
                int i2 = i;
                if (class$java$lang$String == null) {
                    cls = class$("java.lang.String");
                    class$java$lang$String = cls;
                } else {
                    cls = class$java$lang$String;
                }
                clsArr[i2] = cls;
            }
            return;
        }
        this.paramClassNames = new String[paramTypes.length];
        for (int i3 = 0; i3 < this.paramClassNames.length; i3++) {
            this.paramClassNames[i3] = paramTypes[i3];
        }
    }

    public CallMethodRule(String methodName, int paramCount, Class[] paramTypes) {
        this(0, methodName, paramCount, paramTypes);
    }

    public CallMethodRule(int targetOffset, String methodName, int paramCount, Class[] paramTypes) {
        Class cls;
        this.bodyText = null;
        this.targetOffset = 0;
        this.methodName = null;
        this.paramCount = 0;
        this.paramTypes = null;
        this.paramClassNames = null;
        this.useExactMatch = false;
        this.targetOffset = targetOffset;
        this.methodName = methodName;
        this.paramCount = paramCount;
        if (paramTypes == null) {
            this.paramTypes = new Class[paramCount];
            for (int i = 0; i < this.paramTypes.length; i++) {
                Class[] clsArr = this.paramTypes;
                int i2 = i;
                if (class$java$lang$String == null) {
                    cls = class$("java.lang.String");
                    class$java$lang$String = cls;
                } else {
                    cls = class$java$lang$String;
                }
                clsArr[i2] = cls;
            }
            return;
        }
        this.paramTypes = new Class[paramTypes.length];
        for (int i3 = 0; i3 < this.paramTypes.length; i3++) {
            this.paramTypes[i3] = paramTypes[i3];
        }
    }

    public boolean getUseExactMatch() {
        return this.useExactMatch;
    }

    public void setUseExactMatch(boolean useExactMatch) {
        this.useExactMatch = useExactMatch;
    }

    @Override // org.apache.commons.digester.Rule
    public void setDigester(Digester digester) {
        super.setDigester(digester);
        if (this.paramClassNames != null) {
            this.paramTypes = new Class[this.paramClassNames.length];
            for (int i = 0; i < this.paramClassNames.length; i++) {
                try {
                    this.paramTypes[i] = digester.getClassLoader().loadClass(this.paramClassNames[i]);
                } catch (ClassNotFoundException e) {
                    digester.getLogger().error(new StringBuffer().append("(CallMethodRule) Cannot load class ").append(this.paramClassNames[i]).toString(), e);
                    this.paramTypes[i] = null;
                }
            }
        }
    }

    @Override // org.apache.commons.digester.Rule
    public void begin(Attributes attributes) throws Exception {
        if (this.paramCount > 0) {
            Object[] parameters = new Object[this.paramCount];
            for (int i = 0; i < parameters.length; i++) {
                parameters[i] = null;
            }
            this.digester.pushParams(parameters);
        }
    }

    @Override // org.apache.commons.digester.Rule
    public void body(String bodyText) throws Exception {
        if (this.paramCount == 0) {
            this.bodyText = bodyText.trim();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x00f8  */
    @Override // org.apache.commons.digester.Rule
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void end() throws java.lang.Exception {
        /*
            Method dump skipped, instructions count: 703
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.digester.CallMethodRule.end():void");
    }

    @Override // org.apache.commons.digester.Rule
    public void finish() throws Exception {
        this.bodyText = null;
    }

    protected void processMethodCallResult(Object result) {
    }

    public String toString() {
        StringBuffer sb = new StringBuffer("CallMethodRule[");
        sb.append("methodName=");
        sb.append(this.methodName);
        sb.append(", paramCount=");
        sb.append(this.paramCount);
        sb.append(", paramTypes={");
        if (this.paramTypes != null) {
            for (int i = 0; i < this.paramTypes.length; i++) {
                if (i > 0) {
                    sb.append(", ");
                }
                sb.append(this.paramTypes[i].getName());
            }
        }
        sb.append("}");
        sb.append("]");
        return sb.toString();
    }
}
