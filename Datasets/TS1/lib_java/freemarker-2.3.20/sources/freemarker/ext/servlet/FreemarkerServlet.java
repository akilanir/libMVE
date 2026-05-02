package freemarker.ext.servlet;

import freemarker.cache.ClassTemplateLoader;
import freemarker.cache.FileTemplateLoader;
import freemarker.cache.TemplateLoader;
import freemarker.cache.WebappTemplateLoader;
import freemarker.core.Configurable;
import freemarker.ext.jsp.TaglibFactory;
import freemarker.log.Logger;
import freemarker.template.Configuration;
import freemarker.template.ObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.utility.StringUtil;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.Locale;
import javax.servlet.GenericServlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/servlet/FreemarkerServlet.class */
public class FreemarkerServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger("freemarker.servlet");
    public static final long serialVersionUID = -2440216393145762479L;
    private static final String INITPARAM_TEMPLATE_PATH = "TemplatePath";
    private static final String INITPARAM_NOCACHE = "NoCache";
    private static final String INITPARAM_CONTENT_TYPE = "ContentType";
    private static final String DEFAULT_CONTENT_TYPE = "text/html";
    private static final String INITPARAM_DEBUG = "Debug";
    private static final String DEPR_INITPARAM_TEMPLATE_DELAY = "TemplateDelay";
    private static final String DEPR_INITPARAM_ENCODING = "DefaultEncoding";
    private static final String DEPR_INITPARAM_OBJECT_WRAPPER = "ObjectWrapper";
    private static final String DEPR_INITPARAM_WRAPPER_SIMPLE = "simple";
    private static final String DEPR_INITPARAM_WRAPPER_BEANS = "beans";
    private static final String DEPR_INITPARAM_WRAPPER_JYTHON = "jython";
    private static final String DEPR_INITPARAM_TEMPLATE_EXCEPTION_HANDLER = "TemplateExceptionHandler";
    private static final String DEPR_INITPARAM_TEMPLATE_EXCEPTION_HANDLER_RETHROW = "rethrow";
    private static final String DEPR_INITPARAM_TEMPLATE_EXCEPTION_HANDLER_DEBUG = "debug";
    private static final String DEPR_INITPARAM_TEMPLATE_EXCEPTION_HANDLER_HTML_DEBUG = "htmlDebug";
    private static final String DEPR_INITPARAM_TEMPLATE_EXCEPTION_HANDLER_IGNORE = "ignore";
    private static final String DEPR_INITPARAM_DEBUG = "debug";
    public static final String KEY_REQUEST = "Request";
    public static final String KEY_INCLUDE = "include_page";
    public static final String KEY_REQUEST_PRIVATE = "__FreeMarkerServlet.Request__";
    public static final String KEY_REQUEST_PARAMETERS = "RequestParameters";
    public static final String KEY_SESSION = "Session";
    public static final String KEY_APPLICATION = "Application";
    public static final String KEY_APPLICATION_PRIVATE = "__FreeMarkerServlet.Application__";
    public static final String KEY_JSP_TAGLIBS = "JspTaglibs";
    private static final String ATTR_REQUEST_MODEL = ".freemarker.Request";
    private static final String ATTR_REQUEST_PARAMETERS_MODEL = ".freemarker.RequestParameters";
    private static final String ATTR_SESSION_MODEL = ".freemarker.Session";
    private static final String ATTR_APPLICATION_MODEL = ".freemarker.Application";
    private static final String ATTR_JSP_TAGLIBS_MODEL = ".freemarker.JspTaglibs";
    private static final String EXPIRATION_DATE;
    private String templatePath;
    private boolean nocache;
    protected boolean debug;
    private Configuration config;
    private ObjectWrapper wrapper;
    private String contentType;
    private boolean noCharsetInContentType;
    static Class class$java$lang$Throwable;

    static {
        GregorianCalendar expiration = new GregorianCalendar();
        expiration.roll(1, -1);
        SimpleDateFormat httpDate = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.US);
        EXPIRATION_DATE = httpDate.format(expiration.getTime());
    }

    public void init() throws ServletException {
        try {
            this.config = createConfiguration();
            this.config.setTemplateExceptionHandler(TemplateExceptionHandler.HTML_DEBUG_HANDLER);
            this.contentType = DEFAULT_CONTENT_TYPE;
            this.wrapper = createObjectWrapper();
            if (logger.isDebugEnabled()) {
                logger.debug(new StringBuffer().append("Using object wrapper of class ").append(this.wrapper.getClass().getName()).toString());
            }
            this.config.setObjectWrapper(this.wrapper);
            this.templatePath = getInitParameter(INITPARAM_TEMPLATE_PATH);
            if (this.templatePath == null) {
                this.templatePath = "class://";
            }
            this.config.setTemplateLoader(createTemplateLoader(this.templatePath));
            Enumeration initpnames = getServletConfig().getInitParameterNames();
            while (initpnames.hasMoreElements()) {
                String name = (String) initpnames.nextElement();
                String value = getInitParameter(name);
                if (name == null) {
                    throw new ServletException("init-param without param-name. Maybe the web.xml is not well-formed?");
                }
                if (value == null) {
                    throw new ServletException("init-param without param-value. Maybe the web.xml is not well-formed?");
                }
                if (!name.equals(DEPR_INITPARAM_OBJECT_WRAPPER) && !name.equals(Configurable.OBJECT_WRAPPER_KEY) && !name.equals(INITPARAM_TEMPLATE_PATH)) {
                    if (name.equals(DEPR_INITPARAM_ENCODING)) {
                        if (getInitParameter(Configuration.DEFAULT_ENCODING_KEY) != null) {
                            throw new ServletException("Conflicting init-params: default_encoding and DefaultEncoding");
                        }
                        this.config.setDefaultEncoding(value);
                    } else if (name.equals(DEPR_INITPARAM_TEMPLATE_DELAY)) {
                        if (getInitParameter(Configuration.TEMPLATE_UPDATE_DELAY_KEY) != null) {
                            throw new ServletException("Conflicting init-params: template_update_delay and TemplateDelay");
                        }
                        try {
                            this.config.setTemplateUpdateDelay(Integer.parseInt(value));
                        } catch (NumberFormatException e) {
                        }
                    } else if (name.equals(DEPR_INITPARAM_TEMPLATE_EXCEPTION_HANDLER)) {
                        if (getInitParameter(Configurable.TEMPLATE_EXCEPTION_HANDLER_KEY) != null) {
                            throw new ServletException("Conflicting init-params: template_exception_handler and TemplateExceptionHandler");
                        }
                        if (DEPR_INITPARAM_TEMPLATE_EXCEPTION_HANDLER_RETHROW.equals(value)) {
                            this.config.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
                        } else if ("debug".equals(value)) {
                            this.config.setTemplateExceptionHandler(TemplateExceptionHandler.DEBUG_HANDLER);
                        } else if (DEPR_INITPARAM_TEMPLATE_EXCEPTION_HANDLER_HTML_DEBUG.equals(value)) {
                            this.config.setTemplateExceptionHandler(TemplateExceptionHandler.HTML_DEBUG_HANDLER);
                        } else if (DEPR_INITPARAM_TEMPLATE_EXCEPTION_HANDLER_IGNORE.equals(value)) {
                            this.config.setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);
                        } else {
                            throw new ServletException(new StringBuffer().append("Invalid value for servlet init-param TemplateExceptionHandler: ").append(value).toString());
                        }
                    } else if (name.equals(INITPARAM_NOCACHE)) {
                        this.nocache = StringUtil.getYesNo(value);
                    } else if (name.equals("debug")) {
                        if (getInitParameter(INITPARAM_DEBUG) != null) {
                            throw new ServletException("Conflicting init-params: Debug and debug");
                        }
                        this.debug = StringUtil.getYesNo(value);
                    } else if (name.equals(INITPARAM_DEBUG)) {
                        this.debug = StringUtil.getYesNo(value);
                    } else if (name.equals(INITPARAM_CONTENT_TYPE)) {
                        this.contentType = value;
                    } else {
                        this.config.setSetting(name, value);
                    }
                }
            }
            this.noCharsetInContentType = true;
            int i = this.contentType.toLowerCase().indexOf("charset=");
            if (i != -1) {
                char c = ' ';
                int i2 = i - 1;
                while (i2 >= 0) {
                    c = this.contentType.charAt(i2);
                    if (!Character.isWhitespace(c)) {
                        break;
                    } else {
                        i2--;
                    }
                }
                if (i2 == -1 || c == ';') {
                    this.noCharsetInContentType = false;
                }
            }
        } catch (Exception e2) {
            throw new ServletException(e2);
        } catch (ServletException e3) {
            throw e3;
        }
    }

    protected TemplateLoader createTemplateLoader(String templatePath) throws IOException {
        if (templatePath.startsWith("class://")) {
            return new ClassTemplateLoader(getClass(), templatePath.substring(7));
        }
        if (templatePath.startsWith("file://")) {
            return new FileTemplateLoader(new File(templatePath.substring(7)));
        }
        return new WebappTemplateLoader(getServletContext(), templatePath);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        process(request, response);
    }

    private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Class<?> cls;
        if (preprocessRequest(request, response)) {
            return;
        }
        String path = requestUrlToTemplatePath(request);
        if (this.debug) {
            log(new StringBuffer().append("Requested template: ").append(StringUtil.jQuoteNoXSS(path)).toString());
        }
        try {
            Template template = this.config.getTemplate(path, deduceLocale(path, request, response));
            Object attrContentType = template.getCustomAttribute("content_type");
            if (attrContentType != null) {
                response.setContentType(attrContentType.toString());
            } else if (this.noCharsetInContentType) {
                response.setContentType(new StringBuffer().append(this.contentType).append("; charset=").append(template.getEncoding()).toString());
            } else {
                response.setContentType(this.contentType);
            }
            setBrowserCachingPolicy(response);
            ServletContext servletContext = getServletContext();
            try {
                TemplateModel model = createModel(this.wrapper, servletContext, request, response);
                if (preTemplateProcess(request, response, template, model)) {
                    try {
                        template.process(model, response.getWriter());
                        postTemplateProcess(request, response, template, model);
                    } catch (Throwable th) {
                        postTemplateProcess(request, response, template, model);
                        throw th;
                    }
                }
            } catch (TemplateException te) {
                if (this.config.getTemplateExceptionHandler().getClass().getName().indexOf(INITPARAM_DEBUG) != -1) {
                    log("Error executing FreeMarker template", te);
                    return;
                }
                ServletException e = new ServletException("Error executing FreeMarker template", te);
                try {
                    Class<?> cls2 = e.getClass();
                    Class<?>[] clsArr = new Class[1];
                    if (class$java$lang$Throwable == null) {
                        cls = class$("java.lang.Throwable");
                        class$java$lang$Throwable = cls;
                    } else {
                        cls = class$java$lang$Throwable;
                    }
                    clsArr[0] = cls;
                    cls2.getMethod("initCause", clsArr).invoke(e, te);
                } catch (Exception e2) {
                }
                throw e;
            }
        } catch (FileNotFoundException e3) {
            response.sendError(404);
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    protected Locale deduceLocale(String templatePath, HttpServletRequest request, HttpServletResponse response) {
        return this.config.getLocale();
    }

    protected TemplateModel createModel(ObjectWrapper wrapper, ServletContext servletContext, HttpServletRequest request, HttpServletResponse response) throws TemplateModelException {
        HttpSessionHashModel sessionModel;
        try {
            AllHttpScopesHashModel params = new AllHttpScopesHashModel(wrapper, servletContext, request);
            ServletContextHashModel servletContextModel = (ServletContextHashModel) servletContext.getAttribute(ATTR_APPLICATION_MODEL);
            if (servletContextModel == null) {
                servletContextModel = new ServletContextHashModel((GenericServlet) this, wrapper);
                servletContext.setAttribute(ATTR_APPLICATION_MODEL, servletContextModel);
                TaglibFactory taglibs = new TaglibFactory(servletContext);
                servletContext.setAttribute(ATTR_JSP_TAGLIBS_MODEL, taglibs);
                initializeServletContext(request, response);
            }
            params.putUnlistedModel(KEY_APPLICATION, servletContextModel);
            params.putUnlistedModel(KEY_APPLICATION_PRIVATE, servletContextModel);
            params.putUnlistedModel(KEY_JSP_TAGLIBS, (TemplateModel) servletContext.getAttribute(ATTR_JSP_TAGLIBS_MODEL));
            HttpSession session = request.getSession(false);
            if (session != null) {
                sessionModel = (HttpSessionHashModel) session.getAttribute(ATTR_SESSION_MODEL);
                if (sessionModel == null || sessionModel.isOrphaned(session)) {
                    sessionModel = new HttpSessionHashModel(session, wrapper);
                    initializeSessionAndInstallModel(request, response, sessionModel, session);
                }
            } else {
                sessionModel = new HttpSessionHashModel(this, request, response, wrapper);
            }
            params.putUnlistedModel(KEY_SESSION, sessionModel);
            HttpRequestHashModel requestModel = (HttpRequestHashModel) request.getAttribute(ATTR_REQUEST_MODEL);
            if (requestModel == null || requestModel.getRequest() != request) {
                requestModel = new HttpRequestHashModel(request, response, wrapper);
                request.setAttribute(ATTR_REQUEST_MODEL, requestModel);
                request.setAttribute(ATTR_REQUEST_PARAMETERS_MODEL, createRequestParametersHashModel(request));
            }
            params.putUnlistedModel(KEY_REQUEST, requestModel);
            params.putUnlistedModel(KEY_INCLUDE, new IncludePage(request, response));
            params.putUnlistedModel(KEY_REQUEST_PRIVATE, requestModel);
            HttpRequestParametersHashModel requestParametersModel = (HttpRequestParametersHashModel) request.getAttribute(ATTR_REQUEST_PARAMETERS_MODEL);
            params.putUnlistedModel(KEY_REQUEST_PARAMETERS, requestParametersModel);
            return params;
        } catch (IOException e) {
            throw new TemplateModelException((Exception) e);
        } catch (ServletException e2) {
            throw new TemplateModelException((Exception) e2);
        }
    }

    void initializeSessionAndInstallModel(HttpServletRequest request, HttpServletResponse response, HttpSessionHashModel sessionModel, HttpSession session) throws ServletException, IOException {
        session.setAttribute(ATTR_SESSION_MODEL, sessionModel);
        initializeSession(request, response);
    }

    protected String requestUrlToTemplatePath(HttpServletRequest request) {
        String includeServletPath = (String) request.getAttribute("javax.servlet.include.servlet_path");
        if (includeServletPath != null) {
            String includePathInfo = (String) request.getAttribute("javax.servlet.include.path_info");
            return includePathInfo == null ? includeServletPath : includePathInfo;
        }
        String path = request.getPathInfo();
        if (path != null) {
            return path;
        }
        String path2 = request.getServletPath();
        return path2 != null ? path2 : "";
    }

    protected boolean preprocessRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return false;
    }

    protected Configuration createConfiguration() {
        return new Configuration();
    }

    protected ObjectWrapper createObjectWrapper() {
        String wrapper = getServletConfig().getInitParameter(DEPR_INITPARAM_OBJECT_WRAPPER);
        if (wrapper != null) {
            if (getInitParameter(Configurable.OBJECT_WRAPPER_KEY) != null) {
                throw new RuntimeException("Conflicting init-params: object_wrapper and ObjectWrapper");
            }
            if (DEPR_INITPARAM_WRAPPER_BEANS.equals(wrapper)) {
                return ObjectWrapper.BEANS_WRAPPER;
            }
            if (DEPR_INITPARAM_WRAPPER_SIMPLE.equals(wrapper)) {
                return ObjectWrapper.SIMPLE_WRAPPER;
            }
            if (DEPR_INITPARAM_WRAPPER_JYTHON.equals(wrapper)) {
                try {
                    return (ObjectWrapper) Class.forName("freemarker.ext.jython.JythonWrapper").newInstance();
                } catch (ClassNotFoundException e) {
                    throw new NoClassDefFoundError(e.getMessage());
                } catch (IllegalAccessException e2) {
                    throw new IllegalAccessError(e2.getMessage());
                } catch (InstantiationException e3) {
                    throw new InstantiationError(e3.getMessage());
                }
            }
            return ObjectWrapper.DEFAULT_WRAPPER;
        }
        String wrapper2 = getInitParameter(Configurable.OBJECT_WRAPPER_KEY);
        if (wrapper2 == null) {
            return ObjectWrapper.DEFAULT_WRAPPER;
        }
        try {
            this.config.setSetting(Configurable.OBJECT_WRAPPER_KEY, wrapper2);
            return this.config.getObjectWrapper();
        } catch (TemplateException e4) {
            throw new RuntimeException(e4.toString());
        }
    }

    protected ObjectWrapper getObjectWrapper() {
        return this.wrapper;
    }

    protected final String getTemplatePath() {
        return this.templatePath;
    }

    protected HttpRequestParametersHashModel createRequestParametersHashModel(HttpServletRequest request) {
        return new HttpRequestParametersHashModel(request);
    }

    protected void initializeServletContext(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void initializeSession(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected boolean preTemplateProcess(HttpServletRequest request, HttpServletResponse response, Template template, TemplateModel data) throws ServletException, IOException {
        return true;
    }

    protected void postTemplateProcess(HttpServletRequest request, HttpServletResponse response, Template template, TemplateModel data) throws ServletException, IOException {
    }

    protected Configuration getConfiguration() {
        return this.config;
    }

    private void setBrowserCachingPolicy(HttpServletResponse res) {
        if (this.nocache) {
            res.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, post-check=0, pre-check=0");
            res.setHeader("Pragma", "no-cache");
            res.setHeader("Expires", EXPIRATION_DATE);
        }
    }
}
