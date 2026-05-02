package freemarker.core;

import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.utility.ClassUtil;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/TemplateClassResolver.class */
public interface TemplateClassResolver {
    public static final TemplateClassResolver UNRESTRICTED_RESOLVER = new TemplateClassResolver() { // from class: freemarker.core.TemplateClassResolver.1
        @Override // freemarker.core.TemplateClassResolver
        public Class resolve(String className, Environment env, Template template) throws TemplateException {
            try {
                return ClassUtil.forName(className);
            } catch (ClassNotFoundException e) {
                throw new _MiscTemplateException(e, env);
            }
        }
    };
    public static final TemplateClassResolver SAFER_RESOLVER = new TemplateClassResolver() { // from class: freemarker.core.TemplateClassResolver.2
        @Override // freemarker.core.TemplateClassResolver
        public Class resolve(String className, Environment env, Template template) throws TemplateException {
            Class cls;
            Class cls2;
            if (AnonymousClass4.class$freemarker$template$utility$ObjectConstructor == null) {
                cls = AnonymousClass4.class$("freemarker.template.utility.ObjectConstructor");
                AnonymousClass4.class$freemarker$template$utility$ObjectConstructor = cls;
            } else {
                cls = AnonymousClass4.class$freemarker$template$utility$ObjectConstructor;
            }
            if (!className.equals(cls.getName())) {
                if (AnonymousClass4.class$freemarker$template$utility$Execute == null) {
                    cls2 = AnonymousClass4.class$("freemarker.template.utility.Execute");
                    AnonymousClass4.class$freemarker$template$utility$Execute = cls2;
                } else {
                    cls2 = AnonymousClass4.class$freemarker$template$utility$Execute;
                }
                if (!className.equals(cls2.getName()) && !className.equals("freemarker.template.utility.JythonRuntime")) {
                    try {
                        return ClassUtil.forName(className);
                    } catch (ClassNotFoundException e) {
                        throw new _MiscTemplateException(e, env);
                    }
                }
            }
            throw MessageUtil.newInstantiatingClassNotAllowedException(className, env);
        }
    };
    public static final TemplateClassResolver ALLOWS_NOTHING_RESOLVER = new TemplateClassResolver() { // from class: freemarker.core.TemplateClassResolver.3
        @Override // freemarker.core.TemplateClassResolver
        public Class resolve(String className, Environment env, Template template) throws TemplateException {
            throw MessageUtil.newInstantiatingClassNotAllowedException(className, env);
        }
    };

    Class resolve(String str, Environment environment, Template template) throws TemplateException;

    /* renamed from: freemarker.core.TemplateClassResolver$4, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/core/TemplateClassResolver$4.class */
    static class AnonymousClass4 {
        static Class class$freemarker$template$utility$ObjectConstructor;
        static Class class$freemarker$template$utility$Execute;

        static Class class$(String x0) {
            try {
                return Class.forName(x0);
            } catch (ClassNotFoundException x1) {
                throw new NoClassDefFoundError(x1.getMessage());
            }
        }
    }
}
