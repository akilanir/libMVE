package freemarker.ext.jsp;

import freemarker.core.Environment;
import freemarker.ext.jsp.TagTransformModel;
import freemarker.ext.servlet.FreemarkerServlet;
import freemarker.ext.servlet.HttpRequestHashModel;
import freemarker.ext.servlet.ServletContextHashModel;
import freemarker.ext.util.WrapperTemplateModel;
import freemarker.template.AdapterTemplateModel;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateBooleanModel;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.TemplateNumberModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.utility.UndeclaredThrowableException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;
import java.util.ListIterator;
import javax.servlet.GenericServlet;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.BodyContent;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/FreeMarkerPageContext.class */
abstract class FreeMarkerPageContext extends PageContext implements TemplateModel {
    private static final Class OBJECT_CLASS;
    private final GenericServlet servlet;
    private HttpSession session;
    private final HttpServletRequest request;
    private final HttpServletResponse response;
    private final ObjectWrapper wrapper;
    private JspWriter jspOut;
    static Class class$java$lang$Object;
    static Class class$freemarker$ext$servlet$ServletContextHashModel;
    static Class class$freemarker$ext$servlet$HttpRequestHashModel;
    private List tags = new ArrayList();
    private List outs = new ArrayList();
    private final Environment environment = Environment.getCurrentEnvironment();

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    static {
        Class cls;
        if (class$java$lang$Object == null) {
            cls = class$("java.lang.Object");
            class$java$lang$Object = cls;
        } else {
            cls = class$java$lang$Object;
        }
        OBJECT_CLASS = cls;
    }

    protected FreeMarkerPageContext() throws TemplateModelException {
        Class cls;
        Class cls2;
        TemplateModel appModel = this.environment.getGlobalVariable(FreemarkerServlet.KEY_APPLICATION_PRIVATE);
        appModel = appModel instanceof ServletContextHashModel ? appModel : this.environment.getGlobalVariable(FreemarkerServlet.KEY_APPLICATION);
        if (appModel instanceof ServletContextHashModel) {
            this.servlet = ((ServletContextHashModel) appModel).getServlet();
            TemplateModel requestModel = this.environment.getGlobalVariable(FreemarkerServlet.KEY_REQUEST_PRIVATE);
            requestModel = requestModel instanceof HttpRequestHashModel ? requestModel : this.environment.getGlobalVariable(FreemarkerServlet.KEY_REQUEST);
            if (requestModel instanceof HttpRequestHashModel) {
                HttpRequestHashModel reqHash = (HttpRequestHashModel) requestModel;
                this.request = reqHash.getRequest();
                this.session = this.request.getSession(false);
                this.response = reqHash.getResponse();
                this.wrapper = reqHash.getObjectWrapper();
                setAttribute("javax.servlet.jsp.jspRequest", this.request);
                setAttribute("javax.servlet.jsp.jspResponse", this.response);
                if (this.session != null) {
                    setAttribute("javax.servlet.jsp.jspSession", this.session);
                }
                setAttribute("javax.servlet.jsp.jspPage", this.servlet);
                setAttribute("javax.servlet.jsp.jspConfig", this.servlet.getServletConfig());
                setAttribute("javax.servlet.jsp.jspPageContext", this);
                setAttribute("javax.servlet.jsp.jspApplication", this.servlet.getServletContext());
                return;
            }
            StringBuffer append = new StringBuffer().append("Could not find an instance of ");
            if (class$freemarker$ext$servlet$HttpRequestHashModel == null) {
                cls2 = class$("freemarker.ext.servlet.HttpRequestHashModel");
                class$freemarker$ext$servlet$HttpRequestHashModel = cls2;
            } else {
                cls2 = class$freemarker$ext$servlet$HttpRequestHashModel;
            }
            throw new TemplateModelException(append.append(cls2.getName()).append(" in the data model under either the name ").append(FreemarkerServlet.KEY_REQUEST_PRIVATE).append(" or ").append(FreemarkerServlet.KEY_REQUEST).toString());
        }
        StringBuffer append2 = new StringBuffer().append("Could not find an instance of ");
        if (class$freemarker$ext$servlet$ServletContextHashModel == null) {
            cls = class$("freemarker.ext.servlet.ServletContextHashModel");
            class$freemarker$ext$servlet$ServletContextHashModel = cls;
        } else {
            cls = class$freemarker$ext$servlet$ServletContextHashModel;
        }
        throw new TemplateModelException(append2.append(cls.getName()).append(" in the data model under either the name ").append(FreemarkerServlet.KEY_APPLICATION_PRIVATE).append(" or ").append(FreemarkerServlet.KEY_APPLICATION).toString());
    }

    ObjectWrapper getObjectWrapper() {
        return this.wrapper;
    }

    public void initialize(Servlet servlet, ServletRequest request, ServletResponse response, String errorPageURL, boolean needsSession, int bufferSize, boolean autoFlush) {
        throw new UnsupportedOperationException();
    }

    public void release() {
    }

    public void setAttribute(String name, Object value) {
        setAttribute(name, value, 1);
    }

    public void setAttribute(String name, Object value, int scope) {
        switch (scope) {
            case 1:
                try {
                    this.environment.setGlobalVariable(name, this.wrapper.wrap(value));
                    return;
                } catch (TemplateModelException e) {
                    throw new UndeclaredThrowableException(e);
                }
            case 2:
                getRequest().setAttribute(name, value);
                return;
            case 3:
                getSession(true).setAttribute(name, value);
                return;
            case 4:
                getServletContext().setAttribute(name, value);
                return;
            default:
                throw new IllegalArgumentException(new StringBuffer().append("Invalid scope ").append(scope).toString());
        }
    }

    public Object getAttribute(String name) {
        return getAttribute(name, 1);
    }

    public Object getAttribute(String name, int scope) {
        switch (scope) {
            case 1:
                try {
                    TemplateModel m = this.environment.getGlobalNamespace().get(name);
                    if (m instanceof AdapterTemplateModel) {
                        return ((AdapterTemplateModel) m).getAdaptedObject(OBJECT_CLASS);
                    }
                    if (m instanceof WrapperTemplateModel) {
                        return ((WrapperTemplateModel) m).getWrappedObject();
                    }
                    if (m instanceof TemplateScalarModel) {
                        return ((TemplateScalarModel) m).getAsString();
                    }
                    if (m instanceof TemplateNumberModel) {
                        return ((TemplateNumberModel) m).getAsNumber();
                    }
                    if (m instanceof TemplateBooleanModel) {
                        return ((TemplateBooleanModel) m).getAsBoolean() ? Boolean.TRUE : Boolean.FALSE;
                    }
                    return m;
                } catch (TemplateModelException e) {
                    throw new UndeclaredThrowableException(e);
                }
            case 2:
                return getRequest().getAttribute(name);
            case 3:
                HttpSession session = getSession(false);
                if (session == null) {
                    return null;
                }
                return session.getAttribute(name);
            case 4:
                return getServletContext().getAttribute(name);
            default:
                throw new IllegalArgumentException(new StringBuffer().append("Invalid scope ").append(scope).toString());
        }
    }

    public Object findAttribute(String name) {
        Object retval = getAttribute(name, 1);
        if (retval != null) {
            return retval;
        }
        Object retval2 = getAttribute(name, 2);
        if (retval2 != null) {
            return retval2;
        }
        Object retval3 = getAttribute(name, 3);
        return retval3 != null ? retval3 : getAttribute(name, 4);
    }

    public void removeAttribute(String name) {
        removeAttribute(name, 1);
        removeAttribute(name, 2);
        removeAttribute(name, 3);
        removeAttribute(name, 4);
    }

    public void removeAttribute(String name, int scope) {
        switch (scope) {
            case 1:
                this.environment.getGlobalNamespace().remove(name);
                return;
            case 2:
                getRequest().removeAttribute(name);
                return;
            case 3:
                HttpSession session = getSession(false);
                if (session != null) {
                    session.removeAttribute(name);
                    return;
                }
                return;
            case 4:
                getServletContext().removeAttribute(name);
                return;
            default:
                throw new IllegalArgumentException(new StringBuffer().append("Invalid scope: ").append(scope).toString());
        }
    }

    public int getAttributesScope(String name) {
        if (getAttribute(name, 1) != null) {
            return 1;
        }
        if (getAttribute(name, 2) != null) {
            return 2;
        }
        if (getAttribute(name, 3) != null) {
            return 3;
        }
        return getAttribute(name, 4) != null ? 4 : 0;
    }

    public Enumeration getAttributeNamesInScope(int scope) {
        switch (scope) {
            case 1:
                try {
                    return new TemplateHashModelExEnumeration(this.environment.getGlobalNamespace(), null);
                } catch (TemplateModelException e) {
                    throw new UndeclaredThrowableException(e);
                }
            case 2:
                return getRequest().getAttributeNames();
            case 3:
                HttpSession session = getSession(false);
                if (session != null) {
                    return session.getAttributeNames();
                }
                return Collections.enumeration(Collections.EMPTY_SET);
            case 4:
                return getServletContext().getAttributeNames();
            default:
                throw new IllegalArgumentException(new StringBuffer().append("Invalid scope ").append(scope).toString());
        }
    }

    public JspWriter getOut() {
        return this.jspOut;
    }

    private HttpSession getSession(boolean create) {
        if (this.session == null) {
            this.session = this.request.getSession(create);
            if (this.session != null) {
                setAttribute("javax.servlet.jsp.jspSession", this.session);
            }
        }
        return this.session;
    }

    public HttpSession getSession() {
        return getSession(false);
    }

    public Object getPage() {
        return this.servlet;
    }

    public ServletRequest getRequest() {
        return this.request;
    }

    public ServletResponse getResponse() {
        return this.response;
    }

    public Exception getException() {
        throw new UnsupportedOperationException();
    }

    public ServletConfig getServletConfig() {
        return this.servlet.getServletConfig();
    }

    public ServletContext getServletContext() {
        return this.servlet.getServletContext();
    }

    public void forward(String url) throws ServletException, IOException {
        this.request.getRequestDispatcher(url).forward(this.request, this.response);
    }

    public void include(String url) throws ServletException, IOException {
        this.jspOut.flush();
        this.request.getRequestDispatcher(url).include(this.request, this.response);
    }

    public void include(String url, boolean flush) throws ServletException, IOException {
        if (flush) {
            this.jspOut.flush();
        }
        PrintWriter pw = new PrintWriter((Writer) this.jspOut);
        this.request.getRequestDispatcher(url).include(this.request, new HttpServletResponseWrapper(this, this.response, pw) { // from class: freemarker.ext.jsp.FreeMarkerPageContext.1
            private final PrintWriter val$pw;
            private final FreeMarkerPageContext this$0;

            {
                this.this$0 = this;
                this.val$pw = pw;
            }

            public PrintWriter getWriter() {
                return this.val$pw;
            }

            public ServletOutputStream getOutputStream() {
                throw new UnsupportedOperationException("JSP-included resource must use getWriter()");
            }
        });
        pw.flush();
    }

    public void handlePageException(Exception e) {
        throw new UnsupportedOperationException();
    }

    public void handlePageException(Throwable e) {
        throw new UnsupportedOperationException();
    }

    public BodyContent pushBody() {
        return pushWriter(new TagTransformModel.BodyContentImpl(getOut(), true));
    }

    public JspWriter pushBody(Writer w) {
        return pushWriter(new JspWriterAdapter(w));
    }

    public JspWriter popBody() {
        popWriter();
        return (JspWriter) getAttribute("javax.servlet.jsp.jspOut");
    }

    Object peekTopTag(Class tagClass) {
        ListIterator iter = this.tags.listIterator(this.tags.size());
        while (iter.hasPrevious()) {
            Object tag = iter.previous();
            if (tagClass.isInstance(tag)) {
                return tag;
            }
        }
        return null;
    }

    void popTopTag() {
        this.tags.remove(this.tags.size() - 1);
    }

    void popWriter() {
        this.jspOut = (JspWriter) this.outs.remove(this.outs.size() - 1);
        setAttribute("javax.servlet.jsp.jspOut", this.jspOut);
    }

    void pushTopTag(Object tag) {
        this.tags.add(tag);
    }

    JspWriter pushWriter(JspWriter out) {
        this.outs.add(this.jspOut);
        this.jspOut = out;
        setAttribute("javax.servlet.jsp.jspOut", this.jspOut);
        return out;
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/ext/jsp/FreeMarkerPageContext$TemplateHashModelExEnumeration.class */
    private static class TemplateHashModelExEnumeration implements Enumeration {
        private final TemplateModelIterator it;

        TemplateHashModelExEnumeration(TemplateHashModelEx x0, AnonymousClass1 x1) throws TemplateModelException {
            this(x0);
        }

        private TemplateHashModelExEnumeration(TemplateHashModelEx hashEx) throws TemplateModelException {
            this.it = hashEx.keys().iterator();
        }

        @Override // java.util.Enumeration
        public boolean hasMoreElements() {
            try {
                return this.it.hasNext();
            } catch (TemplateModelException tme) {
                throw new UndeclaredThrowableException(tme);
            }
        }

        @Override // java.util.Enumeration
        public Object nextElement() {
            try {
                return ((TemplateScalarModel) this.it.next()).getAsString();
            } catch (TemplateModelException tme) {
                throw new UndeclaredThrowableException(tme);
            }
        }
    }
}
