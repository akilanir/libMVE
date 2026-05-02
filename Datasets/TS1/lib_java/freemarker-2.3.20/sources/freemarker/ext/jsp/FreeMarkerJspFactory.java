package freemarker.ext.jsp;

import javax.servlet.Servlet;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.jsp.JspEngineInfo;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/FreeMarkerJspFactory.class */
abstract class FreeMarkerJspFactory extends JspFactory {
    protected abstract String getSpecificationVersion();

    FreeMarkerJspFactory() {
    }

    public JspEngineInfo getEngineInfo() {
        return new JspEngineInfo(this) { // from class: freemarker.ext.jsp.FreeMarkerJspFactory.1
            private final FreeMarkerJspFactory this$0;

            {
                this.this$0 = this;
            }

            public String getSpecificationVersion() {
                return this.this$0.getSpecificationVersion();
            }
        };
    }

    public PageContext getPageContext(Servlet servlet, ServletRequest request, ServletResponse response, String errorPageURL, boolean needsSession, int bufferSize, boolean autoFlush) {
        throw new UnsupportedOperationException();
    }

    public void releasePageContext(PageContext ctx) {
        throw new UnsupportedOperationException();
    }
}
