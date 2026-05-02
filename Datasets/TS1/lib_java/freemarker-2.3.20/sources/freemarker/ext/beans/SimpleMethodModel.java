package freemarker.ext.beans;

import freemarker.template.SimpleNumber;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateSequenceModel;
import freemarker.template.utility.ClassUtil;
import freemarker.template.utility.Collections12;
import freemarker.template.utility.StringUtil;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/beans/SimpleMethodModel.class */
public final class SimpleMethodModel extends SimpleMemberModel implements TemplateMethodModelEx, TemplateSequenceModel {
    private final Object object;
    private final BeansWrapper wrapper;

    SimpleMethodModel(Object object, Method method, Class[] argTypes, BeansWrapper wrapper) {
        super(method, argTypes);
        this.object = object;
        this.wrapper = wrapper;
    }

    @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
    public Object exec(List arguments) throws TemplateModelException {
        try {
            return this.wrapper.invokeMethod(this.object, (Method) getMember(), unwrapArguments(arguments, this.wrapper));
        } catch (TemplateModelException e) {
            throw e;
        } catch (Exception e2) {
            e = e2;
            while (e instanceof InvocationTargetException) {
                Throwable t = ((InvocationTargetException) e).getTargetException();
                if (!(t instanceof Exception)) {
                    break;
                }
                e = (Exception) t;
            }
            if ((getMember().getModifiers() & 8) != 0) {
                throw new TemplateModelException(new StringBuffer().append("Method ").append(StringUtil.jQuote(getMember())).append(" threw an exception; see cause exception").toString(), e);
            }
            throw new TemplateModelException(new StringBuffer().append("Method ").append(StringUtil.jQuote(getMember())).append(" threw an exception when invoked on ").append(this.object.getClass().getName()).append(" object ").append(StringUtil.jQuote(StringUtil.tryToString(this.object))).append(". See cause exception.").toString(), e);
        }
    }

    @Override // freemarker.template.TemplateSequenceModel
    public TemplateModel get(int index) throws TemplateModelException {
        return (TemplateModel) exec(Collections12.singletonList(new SimpleNumber(new Integer(index))));
    }

    @Override // freemarker.template.TemplateSequenceModel
    public int size() throws TemplateModelException {
        throw new TemplateModelException(new StringBuffer().append("Getting the number of items or enumerating the items is not supported on this ").append(ClassUtil.getFTLTypeDescription(this)).append(" value.\n").append("(").append("Hint 1: Maybe you wanted to call this method first and then do something with its return value. ").append("Hint 2: Getting items by intex possibly works, hence it's a \"+sequence\".").append(")").toString());
    }

    public String toString() {
        return getMember().toString();
    }
}
