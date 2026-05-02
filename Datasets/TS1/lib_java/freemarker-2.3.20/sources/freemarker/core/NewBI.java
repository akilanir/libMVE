package freemarker.core;

import freemarker.ext.beans.BeansWrapper;
import freemarker.template.ObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/NewBI.class */
class NewBI extends BuiltIn {
    static final Class BEAN_MODEL_CLASS;
    static Class JYTHON_MODEL_CLASS;
    static Class class$freemarker$ext$beans$BeanModel;
    static Class class$freemarker$template$TemplateModel;

    NewBI() {
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    static {
        Class cls;
        if (class$freemarker$ext$beans$BeanModel == null) {
            cls = class$("freemarker.ext.beans.BeanModel");
            class$freemarker$ext$beans$BeanModel = cls;
        } else {
            cls = class$freemarker$ext$beans$BeanModel;
        }
        BEAN_MODEL_CLASS = cls;
        try {
            JYTHON_MODEL_CLASS = Class.forName("freemarker.ext.jython.JythonModel");
        } catch (Throwable th) {
            JYTHON_MODEL_CLASS = null;
        }
    }

    @Override // freemarker.core.Expression
    TemplateModel _eval(Environment env) throws TemplateException {
        return new ConstructorFunction(this, this.target.evalAndCoerceToString(env), env, this.target.getTemplate());
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/NewBI$ConstructorFunction.class */
    class ConstructorFunction implements TemplateMethodModelEx {
        private final Class cl;
        private final Environment env;
        private final NewBI this$0;

        public ConstructorFunction(NewBI newBI, String classname, Environment env, Template template) throws TemplateException {
            Class cls;
            this.this$0 = newBI;
            this.env = env;
            this.cl = env.getNewBuiltinClassResolver().resolve(classname, env, template);
            if (NewBI.class$freemarker$template$TemplateModel == null) {
                cls = NewBI.class$("freemarker.template.TemplateModel");
                NewBI.class$freemarker$template$TemplateModel = cls;
            } else {
                cls = NewBI.class$freemarker$template$TemplateModel;
            }
            if (!cls.isAssignableFrom(this.cl)) {
                throw new _MiscTemplateException(newBI, env, new Object[]{"Class ", this.cl.getName(), " does not implement freemarker.template.TemplateModel"});
            }
            if (NewBI.BEAN_MODEL_CLASS.isAssignableFrom(this.cl)) {
                throw new _MiscTemplateException(newBI, env, new Object[]{"Bean Models cannot be instantiated using the ?", newBI.key, " built-in"});
            }
            if (NewBI.JYTHON_MODEL_CLASS != null && NewBI.JYTHON_MODEL_CLASS.isAssignableFrom(this.cl)) {
                throw new _MiscTemplateException(newBI, env, new Object[]{"Jython Models cannot be instantiated using the ?", newBI.key, " built-in"});
            }
        }

        @Override // freemarker.template.TemplateMethodModelEx, freemarker.template.TemplateMethodModel
        public Object exec(List arguments) throws TemplateModelException {
            ObjectWrapper ow = this.env.getObjectWrapper();
            BeansWrapper bw = ow instanceof BeansWrapper ? (BeansWrapper) ow : BeansWrapper.getDefaultInstance();
            return bw.newInstance(this.cl, arguments);
        }
    }
}
