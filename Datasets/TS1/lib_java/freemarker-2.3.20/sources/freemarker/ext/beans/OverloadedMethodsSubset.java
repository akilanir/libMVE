package freemarker.ext.beans;

import freemarker.template.TemplateModelException;
import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/OverloadedMethodsSubset.class */
abstract class OverloadedMethodsSubset {
    static final Object NO_SUCH_METHOD = new Object();
    static final Object AMBIGUOUS_METHOD = new Object();
    static final Object[] EMPTY_ARGS = new Object[0];
    private Class[][] unwrappingArgTypesByArgCount;
    private final Map selectorCache = new HashMap();
    private final List members = new LinkedList();
    private final Map signatures = new HashMap();

    abstract void onAddSignature(Member member, Class[] clsArr);

    abstract void updateSignature(int i);

    abstract void afterSignatureAdded(int i);

    abstract Object getMemberAndArguments(List list, BeansWrapper beansWrapper) throws TemplateModelException;

    OverloadedMethodsSubset() {
    }

    /* JADX WARN: Type inference failed for: r0v27, types: [java.lang.Class[], java.lang.Class[][], java.lang.Object] */
    /* JADX WARN: Type inference failed for: r1v17, types: [java.lang.Class[], java.lang.Class[][]] */
    void addMember(Member member) {
        this.members.add(member);
        Class[] argTypes = MethodUtilities.getParameterTypes(member);
        int argCount = argTypes.length;
        this.signatures.put(member, argTypes.clone());
        onAddSignature(member, argTypes);
        if (this.unwrappingArgTypesByArgCount == null) {
            this.unwrappingArgTypesByArgCount = new Class[argCount + 1];
            this.unwrappingArgTypesByArgCount[argCount] = argTypes;
        } else if (this.unwrappingArgTypesByArgCount.length <= argCount) {
            ?? r0 = new Class[argCount + 1];
            System.arraycopy(this.unwrappingArgTypesByArgCount, 0, r0, 0, this.unwrappingArgTypesByArgCount.length);
            this.unwrappingArgTypesByArgCount = r0;
            this.unwrappingArgTypesByArgCount[argCount] = argTypes;
        } else {
            Class[] oldUnwrappingArgTypes = this.unwrappingArgTypesByArgCount[argCount];
            if (oldUnwrappingArgTypes == null) {
                this.unwrappingArgTypesByArgCount[argCount] = argTypes;
            } else {
                for (int i = 0; i < oldUnwrappingArgTypes.length; i++) {
                    oldUnwrappingArgTypes[i] = MethodUtilities.getMostSpecificCommonType(oldUnwrappingArgTypes[i], argTypes[i]);
                }
            }
        }
        updateSignature(argCount);
        afterSignatureAdded(argCount);
    }

    Class[] getSignature(Member member) {
        return (Class[]) this.signatures.get(member);
    }

    Class[][] getUnwrappingArgTypesByArgCount() {
        return this.unwrappingArgTypesByArgCount;
    }

    Object getMemberForArgs(Object[] args, boolean varArg) {
        Object objMember;
        ClassString argTypes = new ClassString(args);
        synchronized (this.selectorCache) {
            objMember = this.selectorCache.get(argTypes);
            if (objMember == null) {
                objMember = argTypes.getMostSpecific(this.members, varArg);
                this.selectorCache.put(argTypes, objMember);
            }
        }
        return objMember;
    }

    Iterator getMembers() {
        return this.members.iterator();
    }
}
