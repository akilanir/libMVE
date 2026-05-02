package freemarker.ext.beans;

import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.ClassUtil;
import java.lang.reflect.Constructor;
import java.lang.reflect.Member;
import java.util.Iterator;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/OverloadedMethods.class */
final class OverloadedMethods {
    private final BeansWrapper wrapper;
    private final OverloadedMethodsSubset fixArgMethods = new OverloadedFixArgMethods();
    private OverloadedMethodsSubset varargMethods;

    OverloadedMethods(BeansWrapper wrapper) {
        this.wrapper = wrapper;
    }

    BeansWrapper getWrapper() {
        return this.wrapper;
    }

    void addMember(Member member) {
        this.fixArgMethods.addMember(member);
        if (MethodUtilities.isVarArgs(member)) {
            if (this.varargMethods == null) {
                this.varargMethods = new OverloadedVarargMethods();
            }
            this.varargMethods.addMember(member);
        }
    }

    MemberAndArguments getMemberAndArguments(List tmArgs) throws TemplateModelException {
        Object memberAndArguments = this.fixArgMethods.getMemberAndArguments(tmArgs, this.wrapper);
        if (memberAndArguments == OverloadedMethodsSubset.NO_SUCH_METHOD) {
            if (this.varargMethods != null) {
                memberAndArguments = this.varargMethods.getMemberAndArguments(tmArgs, this.wrapper);
            }
            if (memberAndArguments == OverloadedMethodsSubset.NO_SUCH_METHOD) {
                throw new TemplateModelException(new StringBuffer().append("No compatible overloaded variation was found for the signature deducated from the actual parameter values:\n").append(getDeducedCallSignature(tmArgs)).append("\nThe available overloaded variations are:\n").append(memberListToString()).toString());
            }
        }
        if (memberAndArguments == OverloadedMethodsSubset.AMBIGUOUS_METHOD) {
            throw new TemplateModelException(new StringBuffer().append("Multiple compatible overloaded variation was found for the signature deducated from the actual parameter values:\n").append(getDeducedCallSignature(tmArgs)).append("\nThe available overloaded variations are (including non-matching):\n").append(memberListToString()).toString());
        }
        return (MemberAndArguments) memberAndArguments;
    }

    private String memberListToString() {
        Iterator fixArgMethodsIter = this.fixArgMethods.getMembers();
        Iterator varargMethodsIter = this.varargMethods != null ? this.varargMethods.getMembers() : null;
        boolean hasMethods = fixArgMethodsIter.hasNext() || (varargMethodsIter != null && varargMethodsIter.hasNext());
        if (hasMethods) {
            StringBuffer sb = new StringBuffer();
            while (fixArgMethodsIter.hasNext()) {
                if (sb.length() != 0) {
                    sb.append(",\n");
                }
                sb.append("    ");
                sb.append(methodOrConstructorToString((Member) fixArgMethodsIter.next()));
            }
            if (varargMethodsIter != null) {
                while (varargMethodsIter.hasNext()) {
                    if (sb.length() != 0) {
                        sb.append(",\n");
                    }
                    sb.append(methodOrConstructorToString((Member) varargMethodsIter.next()));
                }
            }
            return sb.toString();
        }
        return "No members";
    }

    private String getDeducedCallSignature(List arguments) {
        Member firstMember;
        Iterator fixArgMethodsIter = this.fixArgMethods.getMembers();
        if (fixArgMethodsIter.hasNext()) {
            firstMember = (Member) fixArgMethodsIter.next();
        } else {
            Iterator varArgMethods = this.varargMethods != null ? this.varargMethods.getMembers() : null;
            if (varArgMethods != null && varArgMethods.hasNext()) {
                firstMember = (Member) varArgMethods.next();
            } else {
                firstMember = null;
            }
        }
        StringBuffer sb = new StringBuffer();
        if (firstMember != null) {
            if (firstMember instanceof Constructor) {
                sb.append("constructor ");
            } else {
                sb.append("method ");
            }
            sb.append(firstMember.getName());
        } else {
            sb.append("???");
        }
        sb.append('(');
        for (int i = 0; i < arguments.size(); i++) {
            if (i != 0) {
                sb.append(", ");
            }
            sb.append(ClassUtil.getFTLTypeDescription((TemplateModel) arguments.get(i)));
        }
        sb.append(')');
        return sb.toString();
    }

    private String methodOrConstructorToString(Member member) {
        StringBuffer sb = new StringBuffer();
        String className = ClassUtil.getShortClassName(member.getDeclaringClass());
        if (className != null) {
            sb.append(className);
            sb.append('.');
        }
        sb.append(member.getName());
        sb.append('(');
        Class[] paramTypes = MethodUtilities.getParameterTypes(member);
        for (int i = 0; i < paramTypes.length; i++) {
            if (i != 0) {
                sb.append(", ");
            }
            sb.append(ClassUtil.getShortClassName(paramTypes[i]));
        }
        sb.append(')');
        return sb.toString();
    }
}
