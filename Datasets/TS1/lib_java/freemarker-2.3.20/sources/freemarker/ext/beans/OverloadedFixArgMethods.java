package freemarker.ext.beans;

import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import java.lang.reflect.Member;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/OverloadedFixArgMethods.class */
class OverloadedFixArgMethods extends OverloadedMethodsSubset {
    OverloadedFixArgMethods() {
    }

    @Override // freemarker.ext.beans.OverloadedMethodsSubset
    void onAddSignature(Member member, Class[] argTypes) {
    }

    @Override // freemarker.ext.beans.OverloadedMethodsSubset
    void updateSignature(int l) {
    }

    @Override // freemarker.ext.beans.OverloadedMethodsSubset
    void afterSignatureAdded(int l) {
    }

    @Override // freemarker.ext.beans.OverloadedMethodsSubset
    Object getMemberAndArguments(List tmArgs, BeansWrapper w) throws TemplateModelException {
        if (tmArgs == null) {
            tmArgs = Collections.EMPTY_LIST;
        }
        int argCount = tmArgs.size();
        Class[][] unwrappingArgTypesByArgCount = getUnwrappingArgTypesByArgCount();
        if (unwrappingArgTypesByArgCount.length <= argCount) {
            return NO_SUCH_METHOD;
        }
        Class[] unwarppingArgumentTypes = unwrappingArgTypesByArgCount[argCount];
        if (unwarppingArgumentTypes == null) {
            return NO_SUCH_METHOD;
        }
        Object[] pojoArgs = new Object[argCount];
        Iterator it = tmArgs.iterator();
        for (int i = 0; i < argCount; i++) {
            Object pojo = w.unwrapInternal((TemplateModel) it.next(), unwarppingArgumentTypes[i]);
            if (pojo == BeansWrapper.CAN_NOT_UNWRAP) {
                return NO_SUCH_METHOD;
            }
            pojoArgs[i] = pojo;
        }
        Object objMember = getMemberForArgs(pojoArgs, false);
        if (objMember instanceof Member) {
            Member member = (Member) objMember;
            BeansWrapper.coerceBigDecimals(getSignature(member), pojoArgs);
            return new MemberAndArguments(member, pojoArgs);
        }
        return objMember;
    }
}
