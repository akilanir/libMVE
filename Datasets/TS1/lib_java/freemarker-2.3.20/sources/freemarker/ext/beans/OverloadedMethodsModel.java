package freemarker.ext.beans;

import freemarker.template.SimpleNumber;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateSequenceModel;
import freemarker.template.utility.Collections12;
import freemarker.template.utility.StringUtil;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/OverloadedMethodsModel.class */
public class OverloadedMethodsModel implements TemplateMethodModelEx, TemplateSequenceModel {
    private final Object object;
    private final OverloadedMethods overloadedMethods;

    OverloadedMethodsModel(Object object, OverloadedMethods overloadedMethods) {
        this.object = object;
        this.overloadedMethods = overloadedMethods;
    }

    @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
    public Object exec(List arguments) throws TemplateModelException {
        MemberAndArguments maa = this.overloadedMethods.getMemberAndArguments(arguments);
        Method method = (Method) maa.getMember();
        try {
            return this.overloadedMethods.getWrapper().invokeMethod(this.object, method, maa.getArgs());
        } catch (Exception e) {
            e = e;
            while (e instanceof InvocationTargetException) {
                Throwable t = ((InvocationTargetException) e).getTargetException();
                if (!(t instanceof Exception)) {
                    break;
                }
                e = (Exception) t;
            }
            if ((method.getModifiers() & 8) != 0) {
                throw new TemplateModelException(new StringBuffer().append("Method ").append(method).append(" threw an exception. See cause exception.").toString(), e);
            }
            StringBuffer buf = new StringBuffer();
            Object[] args = maa.getArgs();
            for (int i = 0; i < args.length; i++) {
                Object arg = args[i];
                buf.append(arg == null ? "null" : arg.getClass().getName()).append(',');
            }
            throw new TemplateModelException(new StringBuffer().append("Method ").append(method).append(" threw an exception when invoked on ").append(this.object.getClass().getName()).append(" object ").append(StringUtil.jQuote(StringUtil.tryToString(this.object))).append(" with arguments of types [").append((Object) buf).append("]. See cause exception.").toString(), e);
        }
    }

    @Override // freemarker.template.TemplateSequenceModel
    public TemplateModel get(int index) throws TemplateModelException {
        return (TemplateModel) exec(Collections12.singletonList(new SimpleNumber(new Integer(index))));
    }

    @Override // freemarker.template.TemplateSequenceModel
    public int size() throws TemplateModelException {
        throw new TemplateModelException(new StringBuffer().append("?size is unsupported for ").append(getClass().getName()).toString());
    }
}
