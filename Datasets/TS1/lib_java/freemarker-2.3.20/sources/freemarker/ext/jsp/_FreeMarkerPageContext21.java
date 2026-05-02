package freemarker.ext.jsp;

import freemarker.log.Logger;
import java.security.AccessController;
import java.security.PrivilegedAction;
import javax.el.ELContext;
import javax.servlet.jsp.JspApplicationContext;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.el.ELException;
import javax.servlet.jsp.el.ExpressionEvaluator;
import javax.servlet.jsp.el.VariableResolver;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/_FreeMarkerPageContext21.class */
public class _FreeMarkerPageContext21 extends FreeMarkerPageContext {
    private static final Logger logger = Logger.getLogger("freemarker.jsp");
    private ELContext elContext;
    static Class class$javax$servlet$jsp$JspContext;

    static {
        if (JspFactory.getDefaultFactory() == null) {
            JspFactory.setDefaultFactory(new FreeMarkerJspFactory21());
        }
        logger.debug(new StringBuffer().append("Using JspFactory implementation class ").append(JspFactory.getDefaultFactory().getClass().getName()).toString());
    }

    public ExpressionEvaluator getExpressionEvaluator() {
        try {
            Class type = ((ClassLoader) AccessController.doPrivileged(new PrivilegedAction(this) { // from class: freemarker.ext.jsp._FreeMarkerPageContext21.1
                private final _FreeMarkerPageContext21 this$0;

                {
                    this.this$0 = this;
                }

                @Override // java.security.PrivilegedAction
                public Object run() {
                    return Thread.currentThread().getContextClassLoader();
                }
            })).loadClass("org.apache.commons.el.ExpressionEvaluatorImpl");
            return (ExpressionEvaluator) type.newInstance();
        } catch (Exception e) {
            throw new UnsupportedOperationException("In order for the getExpressionEvaluator() method to work, you must have downloaded the apache commons-el jar and made it available in the classpath.");
        }
    }

    public VariableResolver getVariableResolver() {
        return new VariableResolver(this, this) { // from class: freemarker.ext.jsp._FreeMarkerPageContext21.2
            private final PageContext val$ctx;
            private final _FreeMarkerPageContext21 this$0;

            {
                this.this$0 = this;
                this.val$ctx = this;
            }

            public Object resolveVariable(String name) throws ELException {
                return this.val$ctx.findAttribute(name);
            }
        };
    }

    public ELContext getELContext() {
        Class cls;
        if (this.elContext == null) {
            JspApplicationContext jspctx = JspFactory.getDefaultFactory().getJspApplicationContext(getServletContext());
            if (jspctx instanceof FreeMarkerJspApplicationContext) {
                this.elContext = ((FreeMarkerJspApplicationContext) jspctx).createNewELContext(this);
                ELContext eLContext = this.elContext;
                if (class$javax$servlet$jsp$JspContext == null) {
                    cls = class$("javax.servlet.jsp.JspContext");
                    class$javax$servlet$jsp$JspContext = cls;
                } else {
                    cls = class$javax$servlet$jsp$JspContext;
                }
                eLContext.putContext(cls, this);
            } else {
                throw new UnsupportedOperationException("Can not create an ELContext using a foreign JspApplicationContext\nConsider dropping a private instance of JSP 2.1 API JAR file in\nyour WEB-INF/lib directory and then try again.");
            }
        }
        return this.elContext;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }
}
