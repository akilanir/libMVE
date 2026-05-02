package freemarker.ext.jsp;

import freemarker.core.Environment;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.UndeclaredThrowableException;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/PageContextFactory.class */
class PageContextFactory {
    private static final Class pageContextImpl = getPageContextImpl();
    static Class class$javax$servlet$jsp$PageContext;

    PageContextFactory() {
    }

    private static Class getPageContextImpl() {
        Class cls;
        Class cls2;
        try {
            try {
                if (class$javax$servlet$jsp$PageContext == null) {
                    cls2 = class$("javax.servlet.jsp.PageContext");
                    class$javax$servlet$jsp$PageContext = cls2;
                } else {
                    cls2 = class$javax$servlet$jsp$PageContext;
                }
                cls2.getMethod("getELContext", (Class[]) null);
                return Class.forName("freemarker.ext.jsp._FreeMarkerPageContext21");
            } catch (NoSuchMethodException e) {
                try {
                    if (class$javax$servlet$jsp$PageContext == null) {
                        cls = class$("javax.servlet.jsp.PageContext");
                        class$javax$servlet$jsp$PageContext = cls;
                    } else {
                        cls = class$javax$servlet$jsp$PageContext;
                    }
                    cls.getMethod("getExpressionEvaluator", (Class[]) null);
                    return Class.forName("freemarker.ext.jsp._FreeMarkerPageContext2");
                } catch (NoSuchMethodException e2) {
                    return Class.forName("freemarker.ext.jsp._FreeMarkerPageContext1");
                }
            }
        } catch (ClassNotFoundException e3) {
            throw new NoClassDefFoundError(e3.getMessage());
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    static FreeMarkerPageContext getCurrentPageContext() throws TemplateModelException {
        Environment env = Environment.getCurrentEnvironment();
        TemplateModel pageContextModel = env.getGlobalVariable("javax.servlet.jsp.jspPageContext");
        if (pageContextModel instanceof FreeMarkerPageContext) {
            return (FreeMarkerPageContext) pageContextModel;
        }
        try {
            FreeMarkerPageContext pageContext = (FreeMarkerPageContext) pageContextImpl.newInstance();
            env.setGlobalVariable("javax.servlet.jsp.jspPageContext", pageContext);
            return pageContext;
        } catch (IllegalAccessException e) {
            throw new IllegalAccessError(e.getMessage());
        } catch (InstantiationException e2) {
            throw new UndeclaredThrowableException(e2);
        }
    }
}
