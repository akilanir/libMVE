package freemarker.ext.jsp;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspApplicationContext;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/FreeMarkerJspFactory21.class */
class FreeMarkerJspFactory21 extends FreeMarkerJspFactory {
    private static final String JSPCTX_KEY;
    static Class class$freemarker$ext$jsp$FreeMarkerJspFactory21;

    FreeMarkerJspFactory21() {
    }

    static {
        Class cls;
        StringBuffer stringBuffer = new StringBuffer();
        if (class$freemarker$ext$jsp$FreeMarkerJspFactory21 == null) {
            cls = class$("freemarker.ext.jsp.FreeMarkerJspFactory21");
            class$freemarker$ext$jsp$FreeMarkerJspFactory21 = cls;
        } else {
            cls = class$freemarker$ext$jsp$FreeMarkerJspFactory21;
        }
        JSPCTX_KEY = stringBuffer.append(cls.getName()).append("#jspAppContext").toString();
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    @Override // freemarker.ext.jsp.FreeMarkerJspFactory
    protected String getSpecificationVersion() {
        return "2.1";
    }

    public JspApplicationContext getJspApplicationContext(ServletContext ctx) {
        JspApplicationContext jspctx = (JspApplicationContext) ctx.getAttribute(JSPCTX_KEY);
        if (jspctx == null) {
            synchronized (ctx) {
                jspctx = (JspApplicationContext) ctx.getAttribute(JSPCTX_KEY);
                if (jspctx == null) {
                    jspctx = new FreeMarkerJspApplicationContext();
                    ctx.setAttribute(JSPCTX_KEY, jspctx);
                }
            }
        }
        return jspctx;
    }
}
