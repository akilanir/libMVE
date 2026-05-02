package freemarker.ext.jsp;

import freemarker.log.Logger;
import freemarker.template.utility.ClassUtil;
import java.util.Iterator;
import java.util.LinkedList;
import javax.el.ArrayELResolver;
import javax.el.BeanELResolver;
import javax.el.CompositeELResolver;
import javax.el.ELContext;
import javax.el.ELContextEvent;
import javax.el.ELContextListener;
import javax.el.ELResolver;
import javax.el.ExpressionFactory;
import javax.el.FunctionMapper;
import javax.el.ListELResolver;
import javax.el.MapELResolver;
import javax.el.ResourceBundleELResolver;
import javax.el.ValueExpression;
import javax.el.VariableMapper;
import javax.servlet.jsp.JspApplicationContext;
import javax.servlet.jsp.el.ImplicitObjectELResolver;
import javax.servlet.jsp.el.ScopedAttributeELResolver;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/FreeMarkerJspApplicationContext.class */
class FreeMarkerJspApplicationContext implements JspApplicationContext {
    private static final Logger logger = Logger.getLogger("freemarker.jsp");
    private static final ExpressionFactory expressionFactoryImpl = findExpressionFactoryImplementation();
    private final LinkedList listeners = new LinkedList();
    private final CompositeELResolver elResolver = new CompositeELResolver();
    private final CompositeELResolver additionalResolvers = new CompositeELResolver();
    static Class class$javax$el$ExpressionFactory;

    FreeMarkerJspApplicationContext() {
        this.elResolver.add(new ImplicitObjectELResolver());
        this.elResolver.add(this.additionalResolvers);
        this.elResolver.add(new MapELResolver());
        this.elResolver.add(new ResourceBundleELResolver());
        this.elResolver.add(new ListELResolver());
        this.elResolver.add(new ArrayELResolver());
        this.elResolver.add(new BeanELResolver());
        this.elResolver.add(new ScopedAttributeELResolver());
    }

    public void addELContextListener(ELContextListener listener) {
        synchronized (this.listeners) {
            this.listeners.addLast(listener);
        }
    }

    private static ExpressionFactory findExpressionFactoryImplementation() {
        Class cls;
        ExpressionFactory ef = tryExpressionFactoryImplementation("com.sun");
        if (ef == null) {
            ef = tryExpressionFactoryImplementation("org.apache");
            if (ef == null) {
                Logger logger2 = logger;
                StringBuffer append = new StringBuffer().append("Could not find any implementation for ");
                if (class$javax$el$ExpressionFactory == null) {
                    cls = class$("javax.el.ExpressionFactory");
                    class$javax$el$ExpressionFactory = cls;
                } else {
                    cls = class$javax$el$ExpressionFactory;
                }
                logger2.warn(append.append(cls.getName()).toString());
            }
        }
        return ef;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    private static ExpressionFactory tryExpressionFactoryImplementation(String packagePrefix) {
        Class cls;
        Class cls2;
        Class cls3;
        String className = new StringBuffer().append(packagePrefix).append(".el.ExpressionFactoryImpl").toString();
        try {
            Class cl = ClassUtil.forName(className);
            if (class$javax$el$ExpressionFactory == null) {
                cls = class$("javax.el.ExpressionFactory");
                class$javax$el$ExpressionFactory = cls;
            } else {
                cls = class$javax$el$ExpressionFactory;
            }
            if (cls.isAssignableFrom(cl)) {
                Logger logger2 = logger;
                StringBuffer append = new StringBuffer().append("Using ").append(className).append(" as implementation of ");
                if (class$javax$el$ExpressionFactory == null) {
                    cls3 = class$("javax.el.ExpressionFactory");
                    class$javax$el$ExpressionFactory = cls3;
                } else {
                    cls3 = class$javax$el$ExpressionFactory;
                }
                logger2.info(append.append(cls3.getName()).toString());
                return (ExpressionFactory) cl.newInstance();
            }
            Logger logger3 = logger;
            StringBuffer append2 = new StringBuffer().append("Class ").append(className).append(" does not implement ");
            if (class$javax$el$ExpressionFactory == null) {
                cls2 = class$("javax.el.ExpressionFactory");
                class$javax$el$ExpressionFactory = cls2;
            } else {
                cls2 = class$javax$el$ExpressionFactory;
            }
            logger3.warn(append2.append(cls2.getName()).toString());
            return null;
        } catch (ClassNotFoundException e) {
            return null;
        } catch (Exception e2) {
            logger.error(new StringBuffer().append("Failed to instantiate ").append(className).toString(), e2);
            return null;
        }
    }

    public void addELResolver(ELResolver resolver) {
        this.additionalResolvers.add(resolver);
    }

    public ExpressionFactory getExpressionFactory() {
        return expressionFactoryImpl;
    }

    ELContext createNewELContext(FreeMarkerPageContext pageCtx) {
        ELContext ctx = new FreeMarkerELContext(this, pageCtx);
        ELContextEvent event = new ELContextEvent(ctx);
        synchronized (this.listeners) {
            Iterator iter = this.listeners.iterator();
            while (iter.hasNext()) {
                ELContextListener l = (ELContextListener) iter.next();
                l.contextCreated(event);
            }
        }
        return ctx;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/FreeMarkerJspApplicationContext$FreeMarkerELContext.class */
    private class FreeMarkerELContext extends ELContext {
        private final FreeMarkerPageContext pageCtx;
        private final FreeMarkerJspApplicationContext this$0;

        FreeMarkerELContext(FreeMarkerJspApplicationContext freeMarkerJspApplicationContext, FreeMarkerPageContext pageCtx) {
            this.this$0 = freeMarkerJspApplicationContext;
            this.pageCtx = pageCtx;
        }

        public ELResolver getELResolver() {
            return this.this$0.elResolver;
        }

        public FunctionMapper getFunctionMapper() {
            return null;
        }

        public VariableMapper getVariableMapper() {
            return new VariableMapper(this) { // from class: freemarker.ext.jsp.FreeMarkerJspApplicationContext.FreeMarkerELContext.1
                private final FreeMarkerELContext this$1;

                {
                    this.this$1 = this;
                }

                public ValueExpression resolveVariable(String name) {
                    Object obj = this.this$1.pageCtx.findAttribute(name);
                    if (obj != null) {
                        return FreeMarkerJspApplicationContext.expressionFactoryImpl.createValueExpression(obj, obj.getClass());
                    }
                    return null;
                }

                public ValueExpression setVariable(String name, ValueExpression value) {
                    ValueExpression prev = resolveVariable(name);
                    this.this$1.pageCtx.setAttribute(name, value.getValue(this.this$1));
                    return prev;
                }
            };
        }
    }
}
