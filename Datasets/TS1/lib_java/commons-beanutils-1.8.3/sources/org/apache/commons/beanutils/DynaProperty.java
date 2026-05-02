package org.apache.commons.beanutils;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.io.StreamCorruptedException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/DynaProperty.class */
public class DynaProperty implements Serializable {
    private static final int BOOLEAN_TYPE = 1;
    private static final int BYTE_TYPE = 2;
    private static final int CHAR_TYPE = 3;
    private static final int DOUBLE_TYPE = 4;
    private static final int FLOAT_TYPE = 5;
    private static final int INT_TYPE = 6;
    private static final int LONG_TYPE = 7;
    private static final int SHORT_TYPE = 8;
    protected String name;
    protected transient Class type;
    protected transient Class contentType;
    static Class class$java$lang$Object;
    static Class class$java$util$List;
    static Class class$java$util$Map;

    /* JADX WARN: Illegal instructions before constructor call */
    public DynaProperty(String name) {
        Class cls;
        if (class$java$lang$Object == null) {
            cls = class$("java.lang.Object");
            class$java$lang$Object = cls;
        } else {
            cls = class$java$lang$Object;
        }
        this(name, cls);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public DynaProperty(String name, Class type) {
        this.name = null;
        this.type = null;
        this.name = name;
        this.type = type;
        if (type != null && type.isArray()) {
            this.contentType = type.getComponentType();
        }
    }

    public DynaProperty(String name, Class type, Class contentType) {
        this.name = null;
        this.type = null;
        this.name = name;
        this.type = type;
        this.contentType = contentType;
    }

    public String getName() {
        return this.name;
    }

    public Class getType() {
        return this.type;
    }

    public Class getContentType() {
        return this.contentType;
    }

    public boolean isIndexed() {
        Class cls;
        if (this.type == null) {
            return false;
        }
        if (this.type.isArray()) {
            return true;
        }
        if (class$java$util$List == null) {
            cls = class$("java.util.List");
            class$java$util$List = cls;
        } else {
            cls = class$java$util$List;
        }
        if (cls.isAssignableFrom(this.type)) {
            return true;
        }
        return false;
    }

    public boolean isMapped() {
        Class cls;
        if (this.type == null) {
            return false;
        }
        if (class$java$util$Map == null) {
            cls = class$("java.util.Map");
            class$java$util$Map = cls;
        } else {
            cls = class$java$util$Map;
        }
        return cls.isAssignableFrom(this.type);
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x007e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean equals(java.lang.Object r4) {
        /*
            r3 = this;
            r0 = 0
            r5 = r0
            r0 = r4
            r1 = r3
            if (r0 != r1) goto Lb
            r0 = 1
            goto Lc
        Lb:
            r0 = 0
        Lc:
            r5 = r0
            r0 = r5
            if (r0 != 0) goto L80
            r0 = r4
            boolean r0 = r0 instanceof org.apache.commons.beanutils.DynaProperty
            if (r0 == 0) goto L80
            r0 = r4
            org.apache.commons.beanutils.DynaProperty r0 = (org.apache.commons.beanutils.DynaProperty) r0
            r6 = r0
            r0 = r3
            java.lang.String r0 = r0.name
            if (r0 != 0) goto L2e
            r0 = r6
            java.lang.String r0 = r0.name
            if (r0 != 0) goto L7e
            goto L3c
        L2e:
            r0 = r3
            java.lang.String r0 = r0.name
            r1 = r6
            java.lang.String r1 = r1.name
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L7e
        L3c:
            r0 = r3
            java.lang.Class r0 = r0.type
            if (r0 != 0) goto L4d
            r0 = r6
            java.lang.Class r0 = r0.type
            if (r0 != 0) goto L7e
            goto L5b
        L4d:
            r0 = r3
            java.lang.Class r0 = r0.type
            r1 = r6
            java.lang.Class r1 = r1.type
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L7e
        L5b:
            r0 = r3
            java.lang.Class r0 = r0.contentType
            if (r0 != 0) goto L6c
            r0 = r6
            java.lang.Class r0 = r0.contentType
            if (r0 != 0) goto L7e
            goto L7a
        L6c:
            r0 = r3
            java.lang.Class r0 = r0.contentType
            r1 = r6
            java.lang.Class r1 = r1.contentType
            boolean r0 = r0.equals(r1)
            if (r0 == 0) goto L7e
        L7a:
            r0 = 1
            goto L7f
        L7e:
            r0 = 0
        L7f:
            r5 = r0
        L80:
            r0 = r5
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.commons.beanutils.DynaProperty.equals(java.lang.Object):boolean");
    }

    public int hashCode() {
        int result = (BOOLEAN_TYPE * 31) + (this.name == null ? 0 : this.name.hashCode());
        return (((result * 31) + (this.type == null ? 0 : this.type.hashCode())) * 31) + (this.contentType == null ? 0 : this.contentType.hashCode());
    }

    public String toString() {
        StringBuffer sb = new StringBuffer("DynaProperty[name=");
        sb.append(this.name);
        sb.append(",type=");
        sb.append(this.type);
        if (isMapped() || isIndexed()) {
            sb.append(" <").append(this.contentType).append(">");
        }
        sb.append("]");
        return sb.toString();
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        writeAnyClass(this.type, out);
        if (isMapped() || isIndexed()) {
            writeAnyClass(this.contentType, out);
        }
        out.defaultWriteObject();
    }

    private void writeAnyClass(Class clazz, ObjectOutputStream out) throws IOException {
        int primitiveType = 0;
        if (Boolean.TYPE.equals(clazz)) {
            primitiveType = BOOLEAN_TYPE;
        } else if (Byte.TYPE.equals(clazz)) {
            primitiveType = BYTE_TYPE;
        } else if (Character.TYPE.equals(clazz)) {
            primitiveType = CHAR_TYPE;
        } else if (Double.TYPE.equals(clazz)) {
            primitiveType = DOUBLE_TYPE;
        } else if (Float.TYPE.equals(clazz)) {
            primitiveType = FLOAT_TYPE;
        } else if (Integer.TYPE.equals(clazz)) {
            primitiveType = INT_TYPE;
        } else if (Long.TYPE.equals(clazz)) {
            primitiveType = LONG_TYPE;
        } else if (Short.TYPE.equals(clazz)) {
            primitiveType = SHORT_TYPE;
        }
        if (primitiveType == 0) {
            out.writeBoolean(false);
            out.writeObject(clazz);
        } else {
            out.writeBoolean(true);
            out.writeInt(primitiveType);
        }
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        this.type = readAnyClass(in);
        if (isMapped() || isIndexed()) {
            this.contentType = readAnyClass(in);
        }
        in.defaultReadObject();
    }

    private Class readAnyClass(ObjectInputStream in) throws IOException, ClassNotFoundException {
        if (in.readBoolean()) {
            switch (in.readInt()) {
                case BOOLEAN_TYPE /* 1 */:
                    return Boolean.TYPE;
                case BYTE_TYPE /* 2 */:
                    return Byte.TYPE;
                case CHAR_TYPE /* 3 */:
                    return Character.TYPE;
                case DOUBLE_TYPE /* 4 */:
                    return Double.TYPE;
                case FLOAT_TYPE /* 5 */:
                    return Float.TYPE;
                case INT_TYPE /* 6 */:
                    return Integer.TYPE;
                case LONG_TYPE /* 7 */:
                    return Long.TYPE;
                case SHORT_TYPE /* 8 */:
                    return Short.TYPE;
                default:
                    throw new StreamCorruptedException("Invalid primitive type. Check version of beanutils used to serialize is compatible.");
            }
        }
        return (Class) in.readObject();
    }
}
