package freemarker.ext.beans;

import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import java.lang.reflect.Array;
import java.lang.reflect.Member;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* compiled from: OverloadedVarArgMethod.java */
/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/OverloadedVarargMethods.class */
class OverloadedVarargMethods extends OverloadedMethodsSubset {
    private static final Map canoncialArgPackers = new HashMap();
    private final Map argPackers = new HashMap();

    OverloadedVarargMethods() {
    }

    /* compiled from: OverloadedVarArgMethod.java */
    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/OverloadedVarargMethods$ArgumentPacker.class */
    private static class ArgumentPacker {
        private final int argCount;
        private final Class varArgType;

        ArgumentPacker(Class[] argTypes) {
            this.argCount = argTypes.length;
            this.varArgType = argTypes[this.argCount - 1].getComponentType();
        }

        Object[] packArgs(Object[] args, List modelArgs, BeansWrapper w) throws TemplateModelException {
            int actualArgCount = args.length;
            int fixArgCount = this.argCount - 1;
            if (args.length != this.argCount) {
                Object[] newargs = new Object[this.argCount];
                System.arraycopy(args, 0, newargs, 0, fixArgCount);
                Object array = Array.newInstance((Class<?>) this.varArgType, actualArgCount - fixArgCount);
                for (int i = fixArgCount; i < actualArgCount; i++) {
                    Object val = w.unwrapInternal((TemplateModel) modelArgs.get(i), this.varArgType);
                    if (val == BeansWrapper.CAN_NOT_UNWRAP) {
                        return null;
                    }
                    Array.set(array, i - fixArgCount, val);
                }
                newargs[fixArgCount] = array;
                return newargs;
            }
            Object val2 = w.unwrapInternal((TemplateModel) modelArgs.get(fixArgCount), this.varArgType);
            if (val2 == BeansWrapper.CAN_NOT_UNWRAP) {
                return null;
            }
            Object array2 = Array.newInstance((Class<?>) this.varArgType, 1);
            Array.set(array2, 0, val2);
            args[fixArgCount] = array2;
            return args;
        }

        public boolean equals(Object obj) {
            if (obj instanceof ArgumentPacker) {
                ArgumentPacker p = (ArgumentPacker) obj;
                return this.argCount == p.argCount && this.varArgType == p.varArgType;
            }
            return false;
        }

        public int hashCode() {
            return this.argCount ^ this.varArgType.hashCode();
        }
    }

    @Override // freemarker.ext.beans.OverloadedMethodsSubset
    void onAddSignature(Member member, Class[] argTypes) {
        ArgumentPacker argPacker = new ArgumentPacker(argTypes);
        synchronized (canoncialArgPackers) {
            ArgumentPacker canonical = (ArgumentPacker) canoncialArgPackers.get(argPacker);
            if (canonical == null) {
                canoncialArgPackers.put(argPacker, argPacker);
            } else {
                argPacker = canonical;
            }
        }
        this.argPackers.put(member, argPacker);
        componentizeLastType(argTypes);
    }

    @Override // freemarker.ext.beans.OverloadedMethodsSubset
    void updateSignature(int l) {
        Class[] oneLongerTypes;
        Class[][] marshalTypes = getUnwrappingArgTypesByArgCount();
        Class[] newTypes = marshalTypes[l];
        int i = l;
        while (true) {
            int i2 = i;
            i--;
            if (i2 <= 0) {
                break;
            }
            Class[] previousTypes = marshalTypes[i];
            if (previousTypes != null) {
                varArgUpdate(newTypes, previousTypes);
                break;
            }
        }
        if (l + 1 < marshalTypes.length && (oneLongerTypes = marshalTypes[l + 1]) != null) {
            varArgUpdate(newTypes, oneLongerTypes);
        }
    }

    @Override // freemarker.ext.beans.OverloadedMethodsSubset
    void afterSignatureAdded(int l) {
        Class[] oneShorterTypes;
        Class[][] marshalTypes = getUnwrappingArgTypesByArgCount();
        Class[] newTypes = marshalTypes[l];
        for (int i = l + 1; i < marshalTypes.length; i++) {
            Class[] existingTypes = marshalTypes[i];
            if (existingTypes != null) {
                varArgUpdate(existingTypes, newTypes);
            }
        }
        if (l > 0 && (oneShorterTypes = marshalTypes[l - 1]) != null) {
            varArgUpdate(oneShorterTypes, newTypes);
        }
    }

    private static void varArgUpdate(Class[] modifiedTypes, Class[] modifyingTypes) {
        int dl = modifiedTypes.length;
        int gl = modifyingTypes.length;
        int min = Math.min(gl, dl);
        for (int i = 0; i < min; i++) {
            modifiedTypes[i] = MethodUtilities.getMostSpecificCommonType(modifiedTypes[i], modifyingTypes[i]);
        }
        if (dl > gl) {
            Class varArgType = modifyingTypes[gl - 1];
            for (int i2 = gl; i2 < dl; i2++) {
                modifiedTypes[i2] = MethodUtilities.getMostSpecificCommonType(modifiedTypes[i2], varArgType);
            }
        }
    }

    private static void componentizeLastType(Class[] types) {
        int l1 = types.length - 1;
        types[l1] = types[l1].getComponentType();
    }

    @Override // freemarker.ext.beans.OverloadedMethodsSubset
    Object getMemberAndArguments(List tmArgs, BeansWrapper w) throws TemplateModelException {
        if (tmArgs == null) {
            tmArgs = Collections.EMPTY_LIST;
        }
        int l = tmArgs.size();
        Class[][] unwrappingArgTypesByArgCount = getUnwrappingArgTypesByArgCount();
        Object[] pojoArgs = new Object[l];
        int j = Math.min(l + 1, unwrappingArgTypesByArgCount.length - 1);
        loop0: while (j >= 0) {
            Class[] unwarappingArgTypes = unwrappingArgTypesByArgCount[j];
            if (unwarappingArgTypes == null) {
                if (j == 0) {
                    return NO_SUCH_METHOD;
                }
            } else {
                Iterator it = tmArgs.iterator();
                int i = 0;
                while (i < l) {
                    Object pojo = w.unwrapInternal((TemplateModel) it.next(), i < j ? unwarappingArgTypes[i] : unwarappingArgTypes[j - 1]);
                    if (pojo == BeansWrapper.CAN_NOT_UNWRAP) {
                        break;
                    }
                    if (pojo != pojoArgs[i]) {
                        pojoArgs[i] = pojo;
                    }
                    i++;
                }
                break loop0;
            }
            j--;
        }
        Object objMember = getMemberForArgs(pojoArgs, true);
        if (objMember instanceof Member) {
            Member member = (Member) objMember;
            Object[] pojoArgs2 = ((ArgumentPacker) this.argPackers.get(member)).packArgs(pojoArgs, tmArgs, w);
            if (pojoArgs2 == null) {
                return NO_SUCH_METHOD;
            }
            BeansWrapper.coerceBigDecimals(getSignature(member), pojoArgs2);
            return new MemberAndArguments(member, pojoArgs2);
        }
        return objMember;
    }
}
