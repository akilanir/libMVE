package org.msgpack.template.builder.beans;

import java.lang.reflect.Array;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;
import org.apache.harmony.beans.BeansUtils;
import org.apache.harmony.beans.internal.nls.Messages;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/beans/Statement.class */
public class Statement {
    private Object target;
    private String methodName;
    private Object[] arguments;
    private static WeakHashMap<Class<?>, Method[]> classMethodsCache = new WeakHashMap<>();
    private static final String[][] pdConstructorSignatures = {new String[]{"java.lang.Class", BeansUtils.NEW, "java.lang.Boolean", "", "", ""}, new String[]{"java.lang.Class", BeansUtils.NEW, "java.lang.Byte", "", "", ""}, new String[]{"java.lang.Class", BeansUtils.NEW, "java.lang.Character", "", "", ""}, new String[]{"java.lang.Class", BeansUtils.NEW, "java.lang.Double", "", "", ""}, new String[]{"java.lang.Class", BeansUtils.NEW, "java.lang.Float", "", "", ""}, new String[]{"java.lang.Class", BeansUtils.NEW, "java.lang.Integer", "", "", ""}, new String[]{"java.lang.Class", BeansUtils.NEW, "java.lang.Long", "", "", ""}, new String[]{"java.lang.Class", BeansUtils.NEW, "java.lang.Short", "", "", ""}, new String[]{"java.lang.Class", BeansUtils.NEW, "java.lang.String", "", "", ""}, new String[]{"java.lang.Class", BeansUtils.FORNAME, "java.lang.String", "", "", ""}, new String[]{"java.lang.Class", BeansUtils.NEWINSTANCE, "java.lang.Class", "java.lang.Integer", "", ""}, new String[]{"java.lang.reflect.Field", BeansUtils.GET, BeansUtils.NULL, "", "", ""}, new String[]{"java.lang.Class", BeansUtils.FORNAME, "java.lang.String", "", "", ""}};

    public Statement(Object target, String methodName, Object[] arguments) {
        this.target = target;
        this.methodName = methodName;
        this.arguments = arguments == null ? BeansUtils.EMPTY_OBJECT_ARRAY : arguments;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (this.target == null) {
            sb.append(BeansUtils.NULL);
        } else {
            Class<?> clazz = this.target.getClass();
            sb.append(clazz == String.class ? BeansUtils.QUOTE : BeansUtils.idOfClass(clazz));
        }
        sb.append('.' + this.methodName + '(');
        if (this.arguments != null) {
            for (int index = 0; index < this.arguments.length; index++) {
                if (index > 0) {
                    sb.append(", ");
                }
                if (this.arguments[index] == null) {
                    sb.append(BeansUtils.NULL);
                } else {
                    Class<?> clazz2 = this.arguments[index].getClass();
                    sb.append(clazz2 == String.class ? '\"' + ((String) this.arguments[index]) + '\"' : BeansUtils.idOfClass(clazz2));
                }
            }
        }
        sb.append(')');
        sb.append(';');
        return sb.toString();
    }

    public String getMethodName() {
        return this.methodName;
    }

    public Object[] getArguments() {
        return this.arguments;
    }

    public Object getTarget() {
        return this.target;
    }

    public void execute() throws Exception {
        invokeMethod();
    }

    /* JADX WARN: Removed duplicated region for block: B:57:0x018e A[Catch: InvocationTargetException -> 0x0236, TryCatch #1 {InvocationTargetException -> 0x0236, blocks: (B:3:0x0002, B:5:0x0020, B:6:0x0050, B:10:0x0060, B:11:0x0078, B:13:0x0081, B:23:0x00d4, B:25:0x00dd, B:26:0x00e6, B:28:0x00ee, B:34:0x0109, B:36:0x0113, B:38:0x011d, B:39:0x0129, B:40:0x012a, B:31:0x00fa, B:41:0x0130, B:43:0x0141, B:44:0x0150, B:47:0x015d, B:52:0x016e, B:57:0x018e, B:59:0x0197, B:61:0x019e, B:63:0x01a8, B:65:0x01b8, B:66:0x01cd, B:68:0x01e4, B:70:0x01eb, B:72:0x0206, B:74:0x0219, B:15:0x008a, B:17:0x0091, B:18:0x00a8, B:20:0x00b1, B:21:0x00bc, B:22:0x00bd), top: B:88:0x0002, inners: #0 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    java.lang.Object invokeMethod() throws java.lang.Exception {
        /*
            Method dump skipped, instructions count: 594
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.msgpack.template.builder.beans.Statement.invokeMethod():java.lang.Object");
    }

    private void arrayCopy(Class<?> type, Object[] src, Object dest, int length) {
        if (type == Boolean.TYPE) {
            boolean[] destination = (boolean[]) dest;
            for (int index = 0; index < length; index++) {
                destination[index] = ((Boolean) src[index]).booleanValue();
            }
            return;
        }
        if (type == Short.TYPE) {
            short[] destination2 = (short[]) dest;
            for (int index2 = 0; index2 < length; index2++) {
                destination2[index2] = ((Short) src[index2]).shortValue();
            }
            return;
        }
        if (type == Byte.TYPE) {
            byte[] destination3 = (byte[]) dest;
            for (int index3 = 0; index3 < length; index3++) {
                destination3[index3] = ((Byte) src[index3]).byteValue();
            }
            return;
        }
        if (type == Character.TYPE) {
            char[] destination4 = (char[]) dest;
            for (int index4 = 0; index4 < length; index4++) {
                destination4[index4] = ((Character) src[index4]).charValue();
            }
            return;
        }
        if (type == Integer.TYPE) {
            int[] destination5 = (int[]) dest;
            for (int index5 = 0; index5 < length; index5++) {
                destination5[index5] = ((Integer) src[index5]).intValue();
            }
            return;
        }
        if (type == Long.TYPE) {
            long[] destination6 = (long[]) dest;
            for (int index6 = 0; index6 < length; index6++) {
                destination6[index6] = ((Long) src[index6]).longValue();
            }
            return;
        }
        if (type == Float.TYPE) {
            float[] destination7 = (float[]) dest;
            for (int index7 = 0; index7 < length; index7++) {
                destination7[index7] = ((Float) src[index7]).floatValue();
            }
            return;
        }
        if (type == Double.TYPE) {
            double[] destination8 = (double[]) dest;
            for (int index8 = 0; index8 < length; index8++) {
                destination8[index8] = ((Double) src[index8]).doubleValue();
            }
        }
    }

    private Method findArrayMethod(String methodName, Object[] args) throws NoSuchMethodException {
        boolean isGet = BeansUtils.GET.equals(methodName);
        boolean isSet = BeansUtils.SET.equals(methodName);
        if (!isGet && !isSet) {
            throw new NoSuchMethodException(Messages.getString("custom.beans.3C"));
        }
        if (args.length > 0 && args[0].getClass() != Integer.class) {
            throw new ClassCastException(Messages.getString("custom.beans.3D"));
        }
        if (isGet && args.length != 1) {
            throw new ArrayIndexOutOfBoundsException(Messages.getString("custom.beans.3E"));
        }
        if (isSet && args.length != 2) {
            throw new ArrayIndexOutOfBoundsException(Messages.getString("custom.beans.3F"));
        }
        Class<?>[] paraTypes = isGet ? new Class[]{Object.class, Integer.TYPE} : new Class[]{Object.class, Integer.TYPE, Object.class};
        return Array.class.getMethod(methodName, paraTypes);
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0075 A[PHI: r12
      0x0075: PHI (r12v3 'isAssignable' boolean) = (r12v1 'isAssignable' boolean), (r12v6 'isAssignable' boolean) binds: [B:14:0x0059, B:16:0x006f] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.lang.reflect.Constructor<?> findConstructor(java.lang.Class<?> r6, java.lang.Object[] r7) throws java.lang.NoSuchMethodException {
        /*
            r5 = this;
            r0 = r7
            java.lang.Class[] r0 = getTypes(r0)
            r8 = r0
            r0 = 0
            r11 = r0
            r0 = r6
            java.lang.reflect.Constructor[] r0 = r0.getConstructors()
            r13 = r0
            r0 = r13
            int r0 = r0.length
            r14 = r0
            r0 = 0
            r15 = r0
        L16:
            r0 = r15
            r1 = r14
            if (r0 >= r1) goto Laa
            r0 = r13
            r1 = r15
            r0 = r0[r1]
            r16 = r0
            r0 = r16
            java.lang.Class[] r0 = r0.getParameterTypes()
            r9 = r0
            r0 = r8
            r1 = r9
            boolean r0 = match(r0, r1)
            if (r0 == 0) goto La4
            r0 = r11
            if (r0 != 0) goto L40
            r0 = r16
            r11 = r0
            goto La4
        L40:
            r0 = r11
            java.lang.Class[] r0 = r0.getParameterTypes()
            r10 = r0
            r0 = 1
            r12 = r0
            r0 = 0
            r17 = r0
        L4d:
            r0 = r17
            r1 = r9
            int r1 = r1.length
            if (r0 >= r1) goto L9b
            r0 = r8
            r1 = r17
            r0 = r0[r1]
            if (r0 == 0) goto L75
            r0 = r12
            r1 = r10
            r2 = r17
            r1 = r1[r2]
            r2 = r9
            r3 = r17
            r2 = r2[r3]
            boolean r1 = r1.isAssignableFrom(r2)
            r0 = r0 & r1
            r1 = r0
            r12 = r1
            if (r0 != 0) goto L75
            goto L9b
        L75:
            r0 = r8
            r1 = r17
            r0 = r0[r1]
            if (r0 != 0) goto L95
            r0 = r12
            r1 = r9
            r2 = r17
            r1 = r1[r2]
            r2 = r10
            r3 = r17
            r2 = r2[r3]
            boolean r1 = r1.isAssignableFrom(r2)
            r0 = r0 & r1
            r1 = r0
            r12 = r1
            if (r0 != 0) goto L95
            goto L9b
        L95:
            int r17 = r17 + 1
            goto L4d
        L9b:
            r0 = r12
            if (r0 == 0) goto La4
            r0 = r16
            r11 = r0
        La4:
            int r15 = r15 + 1
            goto L16
        Laa:
            r0 = r11
            if (r0 != 0) goto Lc0
            java.lang.NoSuchMethodException r0 = new java.lang.NoSuchMethodException
            r1 = r0
            java.lang.String r2 = "custom.beans.40"
            r3 = r6
            java.lang.String r3 = r3.getName()
            java.lang.String r2 = org.apache.harmony.beans.internal.nls.Messages.getString(r2, r3)
            r1.<init>(r2)
            throw r0
        Lc0:
            r0 = r11
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.msgpack.template.builder.beans.Statement.findConstructor(java.lang.Class, java.lang.Object[]):java.lang.reflect.Constructor");
    }

    static Method findMethod(Class<?> clazz, String methodName, Object[] args, boolean isStatic) throws NoSuchMethodException {
        Method[] methods;
        Class<?>[] argTypes = getTypes(args);
        if (classMethodsCache.containsKey(clazz)) {
            methods = classMethodsCache.get(clazz);
        } else {
            methods = clazz.getMethods();
            classMethodsCache.put(clazz, methods);
        }
        ArrayList<Method> fitMethods = new ArrayList<>();
        Method[] arr$ = methods;
        for (Method method : arr$) {
            if (methodName.equals(method.getName()) && ((!isStatic || Modifier.isStatic(method.getModifiers())) && match(argTypes, method.getParameterTypes()))) {
                fitMethods.add(method);
            }
        }
        int fitSize = fitMethods.size();
        if (fitSize == 0) {
            throw new NoSuchMethodException(Messages.getString("custom.beans.41", methodName));
        }
        if (fitSize == 1) {
            return fitMethods.get(0);
        }
        MethodComparator comparator = new MethodComparator(methodName, argTypes);
        Method[] fitMethodArray = (Method[]) fitMethods.toArray(new Method[fitSize]);
        Method onlyMethod = fitMethodArray[0];
        for (int i = 1; i < fitMethodArray.length; i++) {
            int difference = comparator.compare(onlyMethod, fitMethodArray[i]);
            if (difference == 0) {
                Class<?> onlyReturnType = onlyMethod.getReturnType();
                Class<?> fitReturnType = fitMethodArray[i].getReturnType();
                if (onlyReturnType == fitReturnType) {
                    throw new NoSuchMethodException(Messages.getString("custom.beans.62", methodName));
                }
                if (onlyReturnType.isAssignableFrom(fitReturnType)) {
                    onlyMethod = fitMethodArray[i];
                }
            }
            if (difference > 0) {
                onlyMethod = fitMethodArray[i];
            }
        }
        return onlyMethod;
    }

    private static boolean match(Class<?>[] argTypes, Class<?>[] paraTypes) {
        if (paraTypes.length != argTypes.length) {
            return false;
        }
        for (int index = 0; index < paraTypes.length; index++) {
            if (argTypes[index] != null && !paraTypes[index].isAssignableFrom(argTypes[index]) && !BeansUtils.isPrimitiveWrapper(argTypes[index], paraTypes[index])) {
                return false;
            }
        }
        return true;
    }

    static boolean isStaticMethodCall(Statement stmt) {
        Object target = stmt.getTarget();
        String methodName = stmt.getMethodName();
        if (!(target instanceof Class)) {
            return false;
        }
        try {
            findMethod((Class) target, methodName, stmt.getArguments(), true);
            return true;
        } catch (NoSuchMethodException e) {
            return false;
        }
    }

    static boolean isPDConstructor(Statement stmt) {
        Object target = stmt.getTarget();
        String methodName = stmt.getMethodName();
        Object[] args = stmt.getArguments();
        String[] sig = new String[pdConstructorSignatures[0].length];
        if (target == null || methodName == null || args == null || args.length == 0) {
            return false;
        }
        sig[0] = target.getClass().getName();
        sig[1] = methodName;
        for (int i = 2; i < sig.length; i++) {
            if (args.length > i - 2) {
                sig[i] = args[i - 2] != null ? args[i - 2].getClass().getName() : BeansUtils.NULL;
            } else {
                sig[i] = "";
            }
        }
        String[][] arr$ = pdConstructorSignatures;
        for (String[] element : arr$) {
            if (Arrays.equals(sig, element)) {
                return true;
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Class<?> getPrimitiveWrapper(Class<?> base) {
        Class<?> res = null;
        if (base == Boolean.TYPE) {
            res = Boolean.class;
        } else if (base == Byte.TYPE) {
            res = Byte.class;
        } else if (base == Character.TYPE) {
            res = Character.class;
        } else if (base == Short.TYPE) {
            res = Short.class;
        } else if (base == Integer.TYPE) {
            res = Integer.class;
        } else if (base == Long.TYPE) {
            res = Long.class;
        } else if (base == Float.TYPE) {
            res = Float.class;
        } else if (base == Double.TYPE) {
            res = Double.class;
        }
        return res;
    }

    private static Class<?>[] getTypes(Object[] arguments) {
        Class<?>[] types = new Class[arguments.length];
        for (int index = 0; index < arguments.length; index++) {
            types[index] = arguments[index] == null ? null : arguments[index].getClass();
        }
        return types;
    }

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/beans/Statement$MethodComparator.class */
    static class MethodComparator implements Comparator<Method> {
        static int INFINITY = Integer.MAX_VALUE;
        private String referenceMethodName;
        private Class<?>[] referenceMethodArgumentTypes;
        private final Map<Method, Integer> cache = new HashMap();

        public MethodComparator(String refMethodName, Class<?>[] refArgumentTypes) {
            this.referenceMethodName = refMethodName;
            this.referenceMethodArgumentTypes = refArgumentTypes;
        }

        @Override // java.util.Comparator
        public int compare(Method m1, Method m2) {
            Integer norm1 = this.cache.get(m1);
            Integer norm2 = this.cache.get(m2);
            if (norm1 == null) {
                norm1 = Integer.valueOf(getNorm(m1));
                this.cache.put(m1, norm1);
            }
            if (norm2 == null) {
                norm2 = Integer.valueOf(getNorm(m2));
                this.cache.put(m2, norm2);
            }
            return norm1.intValue() - norm2.intValue();
        }

        private int getNorm(Method m) {
            String methodName = m.getName();
            Class<?>[] argumentTypes = m.getParameterTypes();
            int totalNorm = 0;
            if (!this.referenceMethodName.equals(methodName) || this.referenceMethodArgumentTypes.length != argumentTypes.length) {
                return INFINITY;
            }
            for (int i = 0; i < this.referenceMethodArgumentTypes.length; i++) {
                if (this.referenceMethodArgumentTypes[i] != null) {
                    if (this.referenceMethodArgumentTypes[i].isPrimitive()) {
                        this.referenceMethodArgumentTypes[i] = Statement.getPrimitiveWrapper(this.referenceMethodArgumentTypes[i]);
                    }
                    if (argumentTypes[i].isPrimitive()) {
                        argumentTypes[i] = Statement.getPrimitiveWrapper(argumentTypes[i]);
                    }
                    totalNorm += getDistance(this.referenceMethodArgumentTypes[i], argumentTypes[i]);
                }
            }
            return totalNorm;
        }

        private static int getDistance(Class<?> clz1, Class<?> clz2) {
            int superDist = INFINITY;
            if (!clz2.isAssignableFrom(clz1)) {
                return INFINITY;
            }
            if (clz1.getName().equals(clz2.getName())) {
                return 0;
            }
            Class<?> superClz = clz1.getSuperclass();
            if (superClz != null) {
                superDist = getDistance(superClz, clz2);
            }
            if (!clz2.isInterface()) {
                return superDist != INFINITY ? superDist + 2 : INFINITY;
            }
            Class<?>[] interfaces = clz1.getInterfaces();
            int bestDist = INFINITY;
            for (Class<?> element : interfaces) {
                int curDist = getDistance(element, clz2);
                if (curDist < bestDist) {
                    bestDist = curDist;
                }
            }
            if (superDist < bestDist) {
                bestDist = superDist;
            }
            return bestDist != INFINITY ? bestDist + 1 : INFINITY;
        }
    }
}
