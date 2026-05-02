package freemarker.ext.jsp;

import freemarker.log.Logger;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.el.ELException;
import javax.servlet.jsp.el.ExpressionEvaluator;
import javax.servlet.jsp.el.VariableResolver;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/_FreeMarkerPageContext2.class */
public class _FreeMarkerPageContext2 extends FreeMarkerPageContext {
    private static final Logger logger = Logger.getLogger("freemarker.jsp");

    static {
        if (JspFactory.getDefaultFactory() == null) {
            JspFactory.setDefaultFactory(new FreeMarkerJspFactory2());
        }
        logger.debug(new StringBuffer().append("Using JspFactory implementation class ").append(JspFactory.getDefaultFactory().getClass().getName()).toString());
    }

    public ExpressionEvaluator getExpressionEvaluator() {
        try {
            Class type = Thread.currentThread().getContextClassLoader().loadClass("org.apache.commons.el.ExpressionEvaluatorImpl");
            return (ExpressionEvaluator) type.newInstance();
        } catch (Exception e) {
            throw new UnsupportedOperationException("In order for the getExpressionEvaluator() method to work, you must have downloaded the apache commons-el jar and made it available in the classpath.");
        }
    }

    public VariableResolver getVariableResolver() {
        return new VariableResolver(this, this) { // from class: freemarker.ext.jsp._FreeMarkerPageContext2.1
            private final PageContext val$ctx;
            private final _FreeMarkerPageContext2 this$0;

            {
                this.this$0 = this;
                this.val$ctx = this;
            }

            public Object resolveVariable(String name) throws ELException {
                return this.val$ctx.findAttribute(name);
            }
        };
    }

    @Override // freemarker.ext.jsp.FreeMarkerPageContext
    public void include(String path, boolean flush) throws IOException, ServletException {
        super.include(path);
    }
}
