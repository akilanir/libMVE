package freemarker.ext.beans;

import freemarker.core._DelayedFTLTypeDescription;
import freemarker.core._TemplateModelException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.ClassUtil;
import java.lang.reflect.Array;
import java.lang.reflect.Member;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/SimpleMemberModel.class */
class SimpleMemberModel {
    private final Member member;
    private final Class[] argTypes;

    protected SimpleMemberModel(Member member, Class[] argTypes) {
        this.member = member;
        this.argTypes = argTypes;
    }

    Object[] unwrapArguments(List arguments, BeansWrapper wrapper) throws TemplateModelException {
        if (arguments == null) {
            arguments = Collections.EMPTY_LIST;
        }
        boolean isVarArg = MethodUtilities.isVarArgs(this.member);
        int typesLen = this.argTypes.length;
        if (isVarArg) {
            if (typesLen - 1 > arguments.size()) {
                throw new TemplateModelException(new StringBuffer().append("Method ").append(this.member).append(" takes at least ").append(typesLen - 1).append(" arguments, ").append(arguments.size()).append(" was given.").toString());
            }
        } else if (typesLen != arguments.size()) {
            throw new TemplateModelException(new StringBuffer().append("Method ").append(this.member).append(" takes exactly ").append(typesLen).append(" arguments, ").append(arguments.size()).append(" was given.").toString());
        }
        Object[] args = unwrapArguments(arguments, this.argTypes, isVarArg, wrapper);
        return args;
    }

    static Object[] unwrapArguments(List args, Class[] argTypes, boolean isVarargs, BeansWrapper w) throws TemplateModelException {
        Object unwrappedArgVal;
        if (args == null) {
            return null;
        }
        int typesLen = argTypes.length;
        int argsLen = args.size();
        Object[] unwrappedArgs = new Object[typesLen];
        Iterator it = args.iterator();
        int normalArgCnt = isVarargs ? typesLen - 1 : typesLen;
        int argIdx = 0;
        while (argIdx < normalArgCnt) {
            Class argType = argTypes[argIdx];
            TemplateModel argVal = (TemplateModel) it.next();
            Object unwrappedArgVal2 = w.unwrapInternal(argVal, argType);
            if (unwrappedArgVal2 == BeansWrapper.CAN_NOT_UNWRAP) {
                throw createArgumentTypeMismarchException(argIdx, argVal, argType);
            }
            if (unwrappedArgVal2 == null && argType.isPrimitive()) {
                throw createNullToPrimitiveArgumentException(argIdx, argType);
            }
            int i = argIdx;
            argIdx++;
            unwrappedArgs[i] = unwrappedArgVal2;
        }
        if (isVarargs) {
            Class varargType = argTypes[typesLen - 1];
            Class varargItemType = varargType.getComponentType();
            if (!it.hasNext()) {
                int i2 = argIdx;
                int i3 = argIdx + 1;
                unwrappedArgs[i2] = Array.newInstance((Class<?>) varargItemType, 0);
            } else {
                TemplateModel argVal2 = (TemplateModel) it.next();
                if (argsLen - argIdx == 1 && (unwrappedArgVal = w.unwrapInternal(argVal2, varargType)) != BeansWrapper.CAN_NOT_UNWRAP) {
                    int i4 = argIdx;
                    int i5 = argIdx + 1;
                    unwrappedArgs[i4] = unwrappedArgVal;
                } else {
                    int varargArrayLen = argsLen - argIdx;
                    Object varargArray = Array.newInstance((Class<?>) varargItemType, varargArrayLen);
                    int varargIdx = 0;
                    while (varargIdx < varargArrayLen) {
                        TemplateModel varargVal = (TemplateModel) (varargIdx == 0 ? argVal2 : it.next());
                        Object unwrappedVarargVal = w.unwrapInternal(varargVal, varargItemType);
                        if (unwrappedVarargVal == BeansWrapper.CAN_NOT_UNWRAP) {
                            throw createArgumentTypeMismarchException(argIdx + varargIdx, varargVal, varargItemType);
                        }
                        if (unwrappedVarargVal == null && varargItemType.isPrimitive()) {
                            throw createNullToPrimitiveArgumentException(argIdx + varargIdx, varargItemType);
                        }
                        Array.set(varargArray, varargIdx, unwrappedVarargVal);
                        varargIdx++;
                    }
                    int i6 = argIdx;
                    int i7 = argIdx + 1;
                    unwrappedArgs[i6] = varargArray;
                }
            }
        }
        return unwrappedArgs;
    }

    private static TemplateModelException createArgumentTypeMismarchException(int argIdx, TemplateModel argVal, Class targetType) {
        return new _TemplateModelException(new Object[]{"Argument type mismatch; can't convert (unwrap) argument #", new Integer(argIdx + 1), " value of type ", new _DelayedFTLTypeDescription(argVal), " to ", ClassUtil.getShortClassName(targetType), "."});
    }

    private static TemplateModelException createNullToPrimitiveArgumentException(int argIdx, Class targetType) {
        return new _TemplateModelException(new Object[]{"Argument type mismatch; argument #", new Integer(argIdx + 1), " is null, which can't be converted to primitive type ", targetType.getName(), "."});
    }

    protected Member getMember() {
        return this.member;
    }
}
