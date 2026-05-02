.class public Lfreemarker/ext/servlet/FreemarkerServlet;
.super Ljavax/servlet/http/HttpServlet;
.source "FreemarkerServlet.java"


# static fields
.field private static final ATTR_APPLICATION_MODEL:Ljava/lang/String; = ".freemarker.Application"

.field private static final ATTR_JSP_TAGLIBS_MODEL:Ljava/lang/String; = ".freemarker.JspTaglibs"

.field private static final ATTR_REQUEST_MODEL:Ljava/lang/String; = ".freemarker.Request"

.field private static final ATTR_REQUEST_PARAMETERS_MODEL:Ljava/lang/String; = ".freemarker.RequestParameters"

.field private static final ATTR_SESSION_MODEL:Ljava/lang/String; = ".freemarker.Session"

.field private static final DEFAULT_CONTENT_TYPE:Ljava/lang/String; = "text/html"

.field private static final DEPR_INITPARAM_DEBUG:Ljava/lang/String; = "debug"

.field private static final DEPR_INITPARAM_ENCODING:Ljava/lang/String; = "DefaultEncoding"

.field private static final DEPR_INITPARAM_OBJECT_WRAPPER:Ljava/lang/String; = "ObjectWrapper"

.field private static final DEPR_INITPARAM_TEMPLATE_DELAY:Ljava/lang/String; = "TemplateDelay"

.field private static final DEPR_INITPARAM_TEMPLATE_EXCEPTION_HANDLER:Ljava/lang/String; = "TemplateExceptionHandler"

.field private static final DEPR_INITPARAM_TEMPLATE_EXCEPTION_HANDLER_DEBUG:Ljava/lang/String; = "debug"

.field private static final DEPR_INITPARAM_TEMPLATE_EXCEPTION_HANDLER_HTML_DEBUG:Ljava/lang/String; = "htmlDebug"

.field private static final DEPR_INITPARAM_TEMPLATE_EXCEPTION_HANDLER_IGNORE:Ljava/lang/String; = "ignore"

.field private static final DEPR_INITPARAM_TEMPLATE_EXCEPTION_HANDLER_RETHROW:Ljava/lang/String; = "rethrow"

.field private static final DEPR_INITPARAM_WRAPPER_BEANS:Ljava/lang/String; = "beans"

.field private static final DEPR_INITPARAM_WRAPPER_JYTHON:Ljava/lang/String; = "jython"

.field private static final DEPR_INITPARAM_WRAPPER_SIMPLE:Ljava/lang/String; = "simple"

.field private static final EXPIRATION_DATE:Ljava/lang/String;

.field private static final INITPARAM_CONTENT_TYPE:Ljava/lang/String; = "ContentType"

.field private static final INITPARAM_DEBUG:Ljava/lang/String; = "Debug"

.field private static final INITPARAM_NOCACHE:Ljava/lang/String; = "NoCache"

.field private static final INITPARAM_TEMPLATE_PATH:Ljava/lang/String; = "TemplatePath"

.field public static final KEY_APPLICATION:Ljava/lang/String; = "Application"

.field public static final KEY_APPLICATION_PRIVATE:Ljava/lang/String; = "__FreeMarkerServlet.Application__"

.field public static final KEY_INCLUDE:Ljava/lang/String; = "include_page"

.field public static final KEY_JSP_TAGLIBS:Ljava/lang/String; = "JspTaglibs"

.field public static final KEY_REQUEST:Ljava/lang/String; = "Request"

.field public static final KEY_REQUEST_PARAMETERS:Ljava/lang/String; = "RequestParameters"

.field public static final KEY_REQUEST_PRIVATE:Ljava/lang/String; = "__FreeMarkerServlet.Request__"

.field public static final KEY_SESSION:Ljava/lang/String; = "Session"

.field static class$java$lang$Throwable:Ljava/lang/Class; = null

.field private static final logger:Lfreemarker/log/Logger;

.field public static final serialVersionUID:J = -0x21dd63e17889c2afL


# instance fields
.field private config:Lfreemarker/template/Configuration;

.field private contentType:Ljava/lang/String;

.field protected debug:Z

.field private noCharsetInContentType:Z

.field private nocache:Z

.field private templatePath:Ljava/lang/String;

.field private wrapper:Lfreemarker/template/ObjectWrapper;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 177
    const-string v2, "freemarker.servlet"

    invoke-static {v2}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/servlet/FreemarkerServlet;->logger:Lfreemarker/log/Logger;

    .line 224
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct {v0}, Ljava/util/GregorianCalendar;-><init>()V

    .line 225
    .local v0, "expiration":Ljava/util/GregorianCalendar;
    const/4 v2, 0x1

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Ljava/util/GregorianCalendar;->roll(II)V

    .line 226
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "EEE, dd MMM yyyy HH:mm:ss z"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 230
    .local v1, "httpDate":Ljava/text/SimpleDateFormat;
    invoke-virtual {v0}, Ljava/util/GregorianCalendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lfreemarker/ext/servlet/FreemarkerServlet;->EXPIRATION_DATE:Ljava/lang/String;

    .line 231
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 175
    invoke-direct {p0}, Ljavax/servlet/http/HttpServlet;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 471
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private process(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 15
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 408
    invoke-virtual {p0, p1, p2}, Lfreemarker/ext/servlet/FreemarkerServlet;->preprocessRequest(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 480
    :cond_6
    :goto_6
    return-void

    .line 412
    :cond_7
    invoke-virtual {p0, p1}, Lfreemarker/ext/servlet/FreemarkerServlet;->requestUrlToTemplatePath(Ljavax/servlet/http/HttpServletRequest;)Ljava/lang/String;

    move-result-object v3

    .line 414
    .local v3, "path":Ljava/lang/String;
    iget-boolean v7, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->debug:Z

    if-eqz v7, :cond_29

    .line 415
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Requested template: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-static {v3}, Lfreemarker/template/utility/StringUtil;->jQuoteNoXSS(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lfreemarker/ext/servlet/FreemarkerServlet;->log(Ljava/lang/String;)V

    .line 418
    :cond_29
    const/4 v6, 0x0

    .line 420
    .local v6, "template":Lfreemarker/template/Template;
    :try_start_2a
    iget-object v7, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    invoke-virtual {p0, v3, p1, p2}, Lfreemarker/ext/servlet/FreemarkerServlet;->deduceLocale(Ljava/lang/String;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)Ljava/util/Locale;

    move-result-object v8

    invoke-virtual {v7, v3, v8}, Lfreemarker/template/Configuration;->getTemplate(Ljava/lang/String;Ljava/util/Locale;)Lfreemarker/template/Template;
    :try_end_33
    .catch Ljava/io/FileNotFoundException; {:try_start_2a .. :try_end_33} :catch_7f

    move-result-object v6

    .line 428
    const-string v7, "content_type"

    invoke-virtual {v6, v7}, Lfreemarker/template/Template;->getCustomAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 429
    .local v0, "attrContentType":Ljava/lang/Object;
    if-eqz v0, :cond_86

    .line 430
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {p2, v7}, Ljavax/servlet/http/HttpServletResponse;->setContentType(Ljava/lang/String;)V

    .line 442
    :goto_43
    invoke-direct {p0, p2}, Lfreemarker/ext/servlet/FreemarkerServlet;->setBrowserCachingPolicy(Ljavax/servlet/http/HttpServletResponse;)V

    .line 444
    invoke-virtual {p0}, Lfreemarker/ext/servlet/FreemarkerServlet;->getServletContext()Ljavax/servlet/ServletContext;

    move-result-object v4

    .line 446
    .local v4, "servletContext":Ljavax/servlet/ServletContext;
    :try_start_4a
    iget-object v7, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->wrapper:Lfreemarker/template/ObjectWrapper;

    invoke-virtual {p0, v7, v4, p1, p2}, Lfreemarker/ext/servlet/FreemarkerServlet;->createModel(Lfreemarker/template/ObjectWrapper;Ljavax/servlet/ServletContext;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    .line 449
    .local v2, "model":Lfreemarker/template/TemplateModel;
    invoke-virtual {p0, p1, p2, v6, v2}, Lfreemarker/ext/servlet/FreemarkerServlet;->preTemplateProcess(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lfreemarker/template/Template;Lfreemarker/template/TemplateModel;)Z
    :try_end_53
    .catch Lfreemarker/template/TemplateException; {:try_start_4a .. :try_end_53} :catch_61

    move-result v7

    if-eqz v7, :cond_6

    .line 452
    :try_start_56
    invoke-interface {p2}, Ljavax/servlet/http/HttpServletResponse;->getWriter()Ljava/io/PrintWriter;

    move-result-object v7

    invoke-virtual {v6, v2, v7}, Lfreemarker/template/Template;->process(Ljava/lang/Object;Ljava/io/Writer;)V
    :try_end_5d
    .catchall {:try_start_56 .. :try_end_5d} :catchall_b1

    .line 455
    :try_start_5d
    invoke-virtual {p0, p1, p2, v6, v2}, Lfreemarker/ext/servlet/FreemarkerServlet;->postTemplateProcess(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lfreemarker/template/Template;Lfreemarker/template/TemplateModel;)V
    :try_end_60
    .catch Lfreemarker/template/TemplateException; {:try_start_5d .. :try_end_60} :catch_61

    goto :goto_6

    .line 458
    .end local v2    # "model":Lfreemarker/template/TemplateModel;
    :catch_61
    move-exception v5

    .line 459
    .local v5, "te":Lfreemarker/template/TemplateException;
    iget-object v7, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    invoke-virtual {v7}, Lfreemarker/template/Configuration;->getTemplateExceptionHandler()Lfreemarker/template/TemplateExceptionHandler;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    const-string v8, "Debug"

    invoke-virtual {v7, v8}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_b6

    .line 461
    const-string v7, "Error executing FreeMarker template"

    invoke-virtual {p0, v7, v5}, Lfreemarker/ext/servlet/FreemarkerServlet;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_6

    .line 423
    .end local v0    # "attrContentType":Ljava/lang/Object;
    .end local v4    # "servletContext":Ljavax/servlet/ServletContext;
    .end local v5    # "te":Lfreemarker/template/TemplateException;
    :catch_7f
    move-exception v1

    .line 424
    .local v1, "e":Ljava/io/FileNotFoundException;
    const/16 v7, 0x194

    invoke-interface {p2, v7}, Ljavax/servlet/http/HttpServletResponse;->sendError(I)V

    goto :goto_6

    .line 433
    .end local v1    # "e":Ljava/io/FileNotFoundException;
    .restart local v0    # "attrContentType":Ljava/lang/Object;
    :cond_86
    iget-boolean v7, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->noCharsetInContentType:Z

    if-eqz v7, :cond_ab

    .line 434
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v8, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->contentType:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "; charset="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v6}, Lfreemarker/template/Template;->getEncoding()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {p2, v7}, Ljavax/servlet/http/HttpServletResponse;->setContentType(Ljava/lang/String;)V

    goto :goto_43

    .line 437
    :cond_ab
    iget-object v7, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->contentType:Ljava/lang/String;

    invoke-interface {p2, v7}, Ljavax/servlet/http/HttpServletResponse;->setContentType(Ljava/lang/String;)V

    goto :goto_43

    .line 455
    .restart local v2    # "model":Lfreemarker/template/TemplateModel;
    .restart local v4    # "servletContext":Ljavax/servlet/ServletContext;
    :catchall_b1
    move-exception v7

    :try_start_b2
    invoke-virtual {p0, p1, p2, v6, v2}, Lfreemarker/ext/servlet/FreemarkerServlet;->postTemplateProcess(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lfreemarker/template/Template;Lfreemarker/template/TemplateModel;)V

    throw v7
    :try_end_b6
    .catch Lfreemarker/template/TemplateException; {:try_start_b2 .. :try_end_b6} :catch_61

    .line 463
    .end local v2    # "model":Lfreemarker/template/TemplateModel;
    .restart local v5    # "te":Lfreemarker/template/TemplateException;
    :cond_b6
    new-instance v1, Ljavax/servlet/ServletException;

    const-string v7, "Error executing FreeMarker template"

    invoke-direct {v1, v7, v5}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 470
    .local v1, "e":Ljavax/servlet/ServletException;
    :try_start_bd
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    const-string v9, "initCause"

    const/4 v7, 0x1

    new-array v10, v7, [Ljava/lang/Class;

    const/4 v11, 0x0

    sget-object v7, Lfreemarker/ext/servlet/FreemarkerServlet;->class$java$lang$Throwable:Ljava/lang/Class;

    if-nez v7, :cond_e3

    const-string v7, "java.lang.Throwable"

    invoke-static {v7}, Lfreemarker/ext/servlet/FreemarkerServlet;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lfreemarker/ext/servlet/FreemarkerServlet;->class$java$lang$Throwable:Ljava/lang/Class;

    :goto_d3
    aput-object v7, v10, v11

    invoke-virtual {v8, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v5, v8, v9

    invoke-virtual {v7, v1, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_e2
    .catch Ljava/lang/Exception; {:try_start_bd .. :try_end_e2} :catch_e6

    .line 477
    :goto_e2
    throw v1

    .line 470
    :cond_e3
    :try_start_e3
    sget-object v7, Lfreemarker/ext/servlet/FreemarkerServlet;->class$java$lang$Throwable:Ljava/lang/Class;
    :try_end_e5
    .catch Ljava/lang/Exception; {:try_start_e3 .. :try_end_e5} :catch_e6

    goto :goto_d3

    .line 473
    :catch_e6
    move-exception v7

    goto :goto_e2
.end method

.method private setBrowserCachingPolicy(Ljavax/servlet/http/HttpServletResponse;)V
    .registers 4
    .param p1, "res"    # Ljavax/servlet/http/HttpServletResponse;

    .prologue
    .line 802
    iget-boolean v0, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->nocache:Z

    if-eqz v0, :cond_19

    .line 805
    const-string v0, "Cache-Control"

    const-string v1, "no-store, no-cache, must-revalidate, post-check=0, pre-check=0"

    invoke-interface {p1, v0, v1}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 808
    const-string v0, "Pragma"

    const-string v1, "no-cache"

    invoke-interface {p1, v0, v1}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 810
    const-string v0, "Expires"

    sget-object v1, Lfreemarker/ext/servlet/FreemarkerServlet;->EXPIRATION_DATE:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, Ljavax/servlet/http/HttpServletResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 812
    :cond_19
    return-void
.end method


# virtual methods
.method protected createConfiguration()Lfreemarker/template/Configuration;
    .registers 2

    .prologue
    .line 630
    new-instance v0, Lfreemarker/template/Configuration;

    invoke-direct {v0}, Lfreemarker/template/Configuration;-><init>()V

    return-object v0
.end method

.method protected createModel(Lfreemarker/template/ObjectWrapper;Ljavax/servlet/ServletContext;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)Lfreemarker/template/TemplateModel;
    .registers 15
    .param p1, "wrapper"    # Lfreemarker/template/ObjectWrapper;
    .param p2, "servletContext"    # Ljavax/servlet/ServletContext;
    .param p3, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p4, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 499
    :try_start_0
    new-instance v1, Lfreemarker/ext/servlet/AllHttpScopesHashModel;

    invoke-direct {v1, p1, p2, p3}, Lfreemarker/ext/servlet/AllHttpScopesHashModel;-><init>(Lfreemarker/template/ObjectWrapper;Ljavax/servlet/ServletContext;Ljavax/servlet/http/HttpServletRequest;)V

    .line 502
    .local v1, "params":Lfreemarker/ext/servlet/AllHttpScopesHashModel;
    const-string v8, ".freemarker.Application"

    invoke-interface {p2, v8}, Ljavax/servlet/ServletContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lfreemarker/ext/servlet/ServletContextHashModel;

    .line 505
    .local v4, "servletContextModel":Lfreemarker/ext/servlet/ServletContextHashModel;
    if-nez v4, :cond_26

    .line 507
    new-instance v4, Lfreemarker/ext/servlet/ServletContextHashModel;

    .end local v4    # "servletContextModel":Lfreemarker/ext/servlet/ServletContextHashModel;
    invoke-direct {v4, p0, p1}, Lfreemarker/ext/servlet/ServletContextHashModel;-><init>(Ljavax/servlet/GenericServlet;Lfreemarker/template/ObjectWrapper;)V

    .line 508
    .restart local v4    # "servletContextModel":Lfreemarker/ext/servlet/ServletContextHashModel;
    const-string v8, ".freemarker.Application"

    invoke-interface {p2, v8, v4}, Ljavax/servlet/ServletContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 511
    new-instance v7, Lfreemarker/ext/jsp/TaglibFactory;

    invoke-direct {v7, p2}, Lfreemarker/ext/jsp/TaglibFactory;-><init>(Ljavax/servlet/ServletContext;)V

    .line 512
    .local v7, "taglibs":Lfreemarker/ext/jsp/TaglibFactory;
    const-string v8, ".freemarker.JspTaglibs"

    invoke-interface {p2, v8, v7}, Ljavax/servlet/ServletContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 515
    invoke-virtual {p0, p3, p4}, Lfreemarker/ext/servlet/FreemarkerServlet;->initializeServletContext(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 517
    .end local v7    # "taglibs":Lfreemarker/ext/jsp/TaglibFactory;
    :cond_26
    const-string v8, "Application"

    invoke-virtual {v1, v8, v4}, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->putUnlistedModel(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 518
    const-string v8, "__FreeMarkerServlet.Application__"

    invoke-virtual {v1, v8, v4}, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->putUnlistedModel(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 519
    const-string v9, "JspTaglibs"

    const-string v8, ".freemarker.JspTaglibs"

    invoke-interface {p2, v8}, Ljavax/servlet/ServletContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lfreemarker/template/TemplateModel;

    invoke-virtual {v1, v9, v8}, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->putUnlistedModel(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 522
    const/4 v8, 0x0

    invoke-interface {p3, v8}, Ljavax/servlet/http/HttpServletRequest;->getSession(Z)Ljavax/servlet/http/HttpSession;

    move-result-object v5

    .line 523
    .local v5, "session":Ljavax/servlet/http/HttpSession;
    if-eqz v5, :cond_a6

    .line 524
    const-string v8, ".freemarker.Session"

    invoke-interface {v5, v8}, Ljavax/servlet/http/HttpSession;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfreemarker/ext/servlet/HttpSessionHashModel;

    .line 525
    .local v6, "sessionModel":Lfreemarker/ext/servlet/HttpSessionHashModel;
    if-eqz v6, :cond_54

    invoke-virtual {v6, v5}, Lfreemarker/ext/servlet/HttpSessionHashModel;->isOrphaned(Ljavax/servlet/http/HttpSession;)Z

    move-result v8

    if-eqz v8, :cond_5c

    .line 526
    :cond_54
    new-instance v6, Lfreemarker/ext/servlet/HttpSessionHashModel;

    .end local v6    # "sessionModel":Lfreemarker/ext/servlet/HttpSessionHashModel;
    invoke-direct {v6, v5, p1}, Lfreemarker/ext/servlet/HttpSessionHashModel;-><init>(Ljavax/servlet/http/HttpSession;Lfreemarker/template/ObjectWrapper;)V

    .line 527
    .restart local v6    # "sessionModel":Lfreemarker/ext/servlet/HttpSessionHashModel;
    invoke-virtual {p0, p3, p4, v6, v5}, Lfreemarker/ext/servlet/FreemarkerServlet;->initializeSessionAndInstallModel(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lfreemarker/ext/servlet/HttpSessionHashModel;Ljavax/servlet/http/HttpSession;)V

    .line 534
    :cond_5c
    :goto_5c
    const-string v8, "Session"

    invoke-virtual {v1, v8, v6}, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->putUnlistedModel(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 537
    const-string v8, ".freemarker.Request"

    invoke-interface {p3, v8}, Ljavax/servlet/http/HttpServletRequest;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/ext/servlet/HttpRequestHashModel;

    .line 539
    .local v2, "requestModel":Lfreemarker/ext/servlet/HttpRequestHashModel;
    if-eqz v2, :cond_71

    invoke-virtual {v2}, Lfreemarker/ext/servlet/HttpRequestHashModel;->getRequest()Ljavax/servlet/http/HttpServletRequest;

    move-result-object v8

    if-eq v8, p3, :cond_84

    .line 541
    :cond_71
    new-instance v2, Lfreemarker/ext/servlet/HttpRequestHashModel;

    .end local v2    # "requestModel":Lfreemarker/ext/servlet/HttpRequestHashModel;
    invoke-direct {v2, p3, p4, p1}, Lfreemarker/ext/servlet/HttpRequestHashModel;-><init>(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lfreemarker/template/ObjectWrapper;)V

    .line 542
    .restart local v2    # "requestModel":Lfreemarker/ext/servlet/HttpRequestHashModel;
    const-string v8, ".freemarker.Request"

    invoke-interface {p3, v8, v2}, Ljavax/servlet/http/HttpServletRequest;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 543
    const-string v8, ".freemarker.RequestParameters"

    invoke-virtual {p0, p3}, Lfreemarker/ext/servlet/FreemarkerServlet;->createRequestParametersHashModel(Ljavax/servlet/http/HttpServletRequest;)Lfreemarker/ext/servlet/HttpRequestParametersHashModel;

    move-result-object v9

    invoke-interface {p3, v8, v9}, Ljavax/servlet/http/HttpServletRequest;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 547
    :cond_84
    const-string v8, "Request"

    invoke-virtual {v1, v8, v2}, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->putUnlistedModel(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 548
    const-string v8, "include_page"

    new-instance v9, Lfreemarker/ext/servlet/IncludePage;

    invoke-direct {v9, p3, p4}, Lfreemarker/ext/servlet/IncludePage;-><init>(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    invoke-virtual {v1, v8, v9}, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->putUnlistedModel(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 549
    const-string v8, "__FreeMarkerServlet.Request__"

    invoke-virtual {v1, v8, v2}, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->putUnlistedModel(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 552
    const-string v8, ".freemarker.RequestParameters"

    invoke-interface {p3, v8}, Ljavax/servlet/http/HttpServletRequest;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;

    .line 555
    .local v3, "requestParametersModel":Lfreemarker/ext/servlet/HttpRequestParametersHashModel;
    const-string v8, "RequestParameters"

    invoke-virtual {v1, v8, v3}, Lfreemarker/ext/servlet/AllHttpScopesHashModel;->putUnlistedModel(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 556
    return-object v1

    .line 532
    .end local v2    # "requestModel":Lfreemarker/ext/servlet/HttpRequestHashModel;
    .end local v3    # "requestParametersModel":Lfreemarker/ext/servlet/HttpRequestParametersHashModel;
    .end local v6    # "sessionModel":Lfreemarker/ext/servlet/HttpSessionHashModel;
    :cond_a6
    new-instance v6, Lfreemarker/ext/servlet/HttpSessionHashModel;

    invoke-direct {v6, p0, p3, p4, p1}, Lfreemarker/ext/servlet/HttpSessionHashModel;-><init>(Lfreemarker/ext/servlet/FreemarkerServlet;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lfreemarker/template/ObjectWrapper;)V
    :try_end_ab
    .catch Ljavax/servlet/ServletException; {:try_start_0 .. :try_end_ab} :catch_ac
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_ab} :catch_b3

    .restart local v6    # "sessionModel":Lfreemarker/ext/servlet/HttpSessionHashModel;
    goto :goto_5c

    .line 557
    .end local v1    # "params":Lfreemarker/ext/servlet/AllHttpScopesHashModel;
    .end local v4    # "servletContextModel":Lfreemarker/ext/servlet/ServletContextHashModel;
    .end local v5    # "session":Ljavax/servlet/http/HttpSession;
    .end local v6    # "sessionModel":Lfreemarker/ext/servlet/HttpSessionHashModel;
    :catch_ac
    move-exception v0

    .line 558
    .local v0, "e":Ljavax/servlet/ServletException;
    new-instance v8, Lfreemarker/template/TemplateModelException;

    invoke-direct {v8, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v8

    .line 559
    .end local v0    # "e":Ljavax/servlet/ServletException;
    :catch_b3
    move-exception v0

    .line 560
    .local v0, "e":Ljava/io/IOException;
    new-instance v8, Lfreemarker/template/TemplateModelException;

    invoke-direct {v8, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v8
.end method

.method protected createObjectWrapper()Lfreemarker/template/ObjectWrapper;
    .registers 5

    .prologue
    .line 646
    invoke-virtual {p0}, Lfreemarker/ext/servlet/FreemarkerServlet;->getServletConfig()Ljavax/servlet/ServletConfig;

    move-result-object v2

    const-string v3, "ObjectWrapper"

    invoke-interface {v2, v3}, Ljavax/servlet/ServletConfig;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 647
    .local v1, "wrapper":Ljava/lang/String;
    if-eqz v1, :cond_6b

    .line 648
    const-string v2, "object_wrapper"

    invoke-virtual {p0, v2}, Lfreemarker/ext/servlet/FreemarkerServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1c

    .line 649
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Conflicting init-params: object_wrapper and ObjectWrapper"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 653
    :cond_1c
    const-string v2, "beans"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_27

    .line 654
    sget-object v2, Lfreemarker/template/ObjectWrapper;->BEANS_WRAPPER:Lfreemarker/template/ObjectWrapper;

    .line 685
    :goto_26
    return-object v2

    .line 656
    :cond_27
    const-string v2, "simple"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_32

    .line 657
    sget-object v2, Lfreemarker/template/ObjectWrapper;->SIMPLE_WRAPPER:Lfreemarker/template/ObjectWrapper;

    goto :goto_26

    .line 659
    :cond_32
    const-string v2, "jython"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_68

    .line 662
    :try_start_3a
    const-string v2, "freemarker.ext.jython.JythonWrapper"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/template/ObjectWrapper;
    :try_end_46
    .catch Ljava/lang/InstantiationException; {:try_start_3a .. :try_end_46} :catch_47
    .catch Ljava/lang/IllegalAccessException; {:try_start_3a .. :try_end_46} :catch_52
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3a .. :try_end_46} :catch_5d

    goto :goto_26

    .line 664
    :catch_47
    move-exception v0

    .line 665
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v2, Ljava/lang/InstantiationError;

    invoke-virtual {v0}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/InstantiationError;-><init>(Ljava/lang/String;)V

    throw v2

    .line 666
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :catch_52
    move-exception v0

    .line 667
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v2

    .line 668
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_5d
    move-exception v0

    .line 669
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v2, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v2

    .line 673
    .end local v0    # "e":Ljava/lang/ClassNotFoundException;
    :cond_68
    sget-object v2, Lfreemarker/template/ObjectWrapper;->DEFAULT_WRAPPER:Lfreemarker/template/ObjectWrapper;

    goto :goto_26

    .line 675
    :cond_6b
    const-string v2, "object_wrapper"

    invoke-virtual {p0, v2}, Lfreemarker/ext/servlet/FreemarkerServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 676
    if-nez v1, :cond_76

    .line 678
    sget-object v2, Lfreemarker/template/ObjectWrapper;->DEFAULT_WRAPPER:Lfreemarker/template/ObjectWrapper;

    goto :goto_26

    .line 681
    :cond_76
    :try_start_76
    iget-object v2, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    const-string v3, "object_wrapper"

    invoke-virtual {v2, v3, v1}, Lfreemarker/template/Configuration;->setSetting(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7d
    .catch Lfreemarker/template/TemplateException; {:try_start_76 .. :try_end_7d} :catch_84

    .line 685
    iget-object v2, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    invoke-virtual {v2}, Lfreemarker/template/Configuration;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v2

    goto :goto_26

    .line 682
    :catch_84
    move-exception v0

    .line 683
    .local v0, "e":Lfreemarker/template/TemplateException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Lfreemarker/template/TemplateException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected createRequestParametersHashModel(Ljavax/servlet/http/HttpServletRequest;)Lfreemarker/ext/servlet/HttpRequestParametersHashModel;
    .registers 3
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;

    .prologue
    .line 699
    new-instance v0, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;

    invoke-direct {v0, p1}, Lfreemarker/ext/servlet/HttpRequestParametersHashModel;-><init>(Ljavax/servlet/http/HttpServletRequest;)V

    return-object v0
.end method

.method protected createTemplateLoader(Ljava/lang/String;)Lfreemarker/cache/TemplateLoader;
    .registers 5
    .param p1, "templatePath"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x7

    .line 375
    const-string v0, "class://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 377
    new-instance v0, Lfreemarker/cache/ClassTemplateLoader;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lfreemarker/cache/ClassTemplateLoader;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    .line 383
    :goto_16
    return-object v0

    .line 379
    :cond_17
    const-string v0, "file://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 380
    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 381
    new-instance v0, Lfreemarker/cache/FileTemplateLoader;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lfreemarker/cache/FileTemplateLoader;-><init>(Ljava/io/File;)V

    goto :goto_16

    .line 383
    :cond_2e
    new-instance v0, Lfreemarker/cache/WebappTemplateLoader;

    invoke-virtual {p0}, Lfreemarker/ext/servlet/FreemarkerServlet;->getServletContext()Ljavax/servlet/ServletContext;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lfreemarker/cache/WebappTemplateLoader;-><init>(Ljavax/servlet/ServletContext;Ljava/lang/String;)V

    goto :goto_16
.end method

.method protected deduceLocale(Ljava/lang/String;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)Ljava/util/Locale;
    .registers 5
    .param p1, "templatePath"    # Ljava/lang/String;
    .param p2, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p3, "response"    # Ljavax/servlet/http/HttpServletResponse;

    .prologue
    .line 491
    iget-object v0, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    invoke-virtual {v0}, Lfreemarker/template/Configuration;->getLocale()Ljava/util/Locale;

    move-result-object v0

    return-object v0
.end method

.method public doGet(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 3
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 391
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/servlet/FreemarkerServlet;->process(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 392
    return-void
.end method

.method public doPost(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 3
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 399
    invoke-direct {p0, p1, p2}, Lfreemarker/ext/servlet/FreemarkerServlet;->process(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 400
    return-void
.end method

.method protected getConfiguration()Lfreemarker/template/Configuration;
    .registers 2

    .prologue
    .line 793
    iget-object v0, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    return-object v0
.end method

.method protected getObjectWrapper()Lfreemarker/template/ObjectWrapper;
    .registers 2

    .prologue
    .line 691
    iget-object v0, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->wrapper:Lfreemarker/template/ObjectWrapper;

    return-object v0
.end method

.method protected final getTemplatePath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 695
    iget-object v0, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->templatePath:Ljava/lang/String;

    return-object v0
.end method

.method public init()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .prologue
    const/4 v9, -0x1

    .line 243
    :try_start_1
    invoke-virtual {p0}, Lfreemarker/ext/servlet/FreemarkerServlet;->createConfiguration()Lfreemarker/template/Configuration;

    move-result-object v6

    iput-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    .line 246
    iget-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    sget-object v7, Lfreemarker/template/TemplateExceptionHandler;->HTML_DEBUG_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    invoke-virtual {v6, v7}, Lfreemarker/template/Configuration;->setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V

    .line 247
    const-string v6, "text/html"

    iput-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->contentType:Ljava/lang/String;

    .line 250
    invoke-virtual {p0}, Lfreemarker/ext/servlet/FreemarkerServlet;->createObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v6

    iput-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->wrapper:Lfreemarker/template/ObjectWrapper;

    .line 251
    sget-object v6, Lfreemarker/ext/servlet/FreemarkerServlet;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v6}, Lfreemarker/log/Logger;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_42

    .line 252
    sget-object v6, Lfreemarker/ext/servlet/FreemarkerServlet;->logger:Lfreemarker/log/Logger;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Using object wrapper of class "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->wrapper:Lfreemarker/template/ObjectWrapper;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 254
    :cond_42
    iget-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    iget-object v7, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->wrapper:Lfreemarker/template/ObjectWrapper;

    invoke-virtual {v6, v7}, Lfreemarker/template/Configuration;->setObjectWrapper(Lfreemarker/template/ObjectWrapper;)V

    .line 257
    const-string v6, "TemplatePath"

    invoke-virtual {p0, v6}, Lfreemarker/ext/servlet/FreemarkerServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->templatePath:Ljava/lang/String;

    .line 258
    iget-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->templatePath:Ljava/lang/String;

    if-nez v6, :cond_59

    .line 259
    const-string v6, "class://"

    iput-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->templatePath:Ljava/lang/String;

    .line 260
    :cond_59
    iget-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    iget-object v7, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->templatePath:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lfreemarker/ext/servlet/FreemarkerServlet;->createTemplateLoader(Ljava/lang/String;)Lfreemarker/cache/TemplateLoader;

    move-result-object v7

    invoke-virtual {v6, v7}, Lfreemarker/template/Configuration;->setTemplateLoader(Lfreemarker/cache/TemplateLoader;)V

    .line 263
    invoke-virtual {p0}, Lfreemarker/ext/servlet/FreemarkerServlet;->getServletConfig()Ljavax/servlet/ServletConfig;

    move-result-object v6

    invoke-interface {v6}, Ljavax/servlet/ServletConfig;->getInitParameterNames()Ljava/util/Enumeration;

    move-result-object v3

    .line 264
    .local v3, "initpnames":Ljava/util/Enumeration;
    :cond_6c
    :goto_6c
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_1bd

    .line 265
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 266
    .local v4, "name":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lfreemarker/ext/servlet/FreemarkerServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 268
    .local v5, "value":Ljava/lang/String;
    if-nez v4, :cond_88

    .line 269
    new-instance v6, Ljavax/servlet/ServletException;

    const-string v7, "init-param without param-name. Maybe the web.xml is not well-formed?"

    invoke-direct {v6, v7}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_86
    .catch Ljavax/servlet/ServletException; {:try_start_1 .. :try_end_86} :catch_86
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_86} :catch_92

    .line 357
    .end local v3    # "initpnames":Ljava/util/Enumeration;
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :catch_86
    move-exception v1

    .line 358
    .local v1, "e":Ljavax/servlet/ServletException;
    throw v1

    .line 273
    .end local v1    # "e":Ljavax/servlet/ServletException;
    .restart local v3    # "initpnames":Ljava/util/Enumeration;
    .restart local v4    # "name":Ljava/lang/String;
    .restart local v5    # "value":Ljava/lang/String;
    :cond_88
    if-nez v5, :cond_99

    .line 274
    :try_start_8a
    new-instance v6, Ljavax/servlet/ServletException;

    const-string v7, "init-param without param-value. Maybe the web.xml is not well-formed?"

    invoke-direct {v6, v7}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_92
    .catch Ljavax/servlet/ServletException; {:try_start_8a .. :try_end_92} :catch_86
    .catch Ljava/lang/Exception; {:try_start_8a .. :try_end_92} :catch_92

    .line 359
    .end local v3    # "initpnames":Ljava/util/Enumeration;
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :catch_92
    move-exception v1

    .line 360
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Ljavax/servlet/ServletException;

    invoke-direct {v6, v1}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 279
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v3    # "initpnames":Ljava/util/Enumeration;
    .restart local v4    # "name":Ljava/lang/String;
    .restart local v5    # "value":Ljava/lang/String;
    :cond_99
    :try_start_99
    const-string v6, "ObjectWrapper"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6c

    const-string v6, "object_wrapper"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6c

    const-string v6, "TemplatePath"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6c

    .line 283
    const-string v6, "DefaultEncoding"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_cf

    .line 284
    const-string v6, "default_encoding"

    invoke-virtual {p0, v6}, Lfreemarker/ext/servlet/FreemarkerServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_c9

    .line 285
    new-instance v6, Ljavax/servlet/ServletException;

    const-string v7, "Conflicting init-params: default_encoding and DefaultEncoding"

    invoke-direct {v6, v7}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 290
    :cond_c9
    iget-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    invoke-virtual {v6, v5}, Lfreemarker/template/Configuration;->setDefaultEncoding(Ljava/lang/String;)V

    goto :goto_6c

    .line 291
    :cond_cf
    const-string v6, "TemplateDelay"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_f5

    .line 292
    const-string v6, "template_update_delay"

    invoke-virtual {p0, v6}, Lfreemarker/ext/servlet/FreemarkerServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_e7

    .line 293
    new-instance v6, Ljavax/servlet/ServletException;

    const-string v7, "Conflicting init-params: template_update_delay and TemplateDelay"

    invoke-direct {v6, v7}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_e7
    .catch Ljavax/servlet/ServletException; {:try_start_99 .. :try_end_e7} :catch_86
    .catch Ljava/lang/Exception; {:try_start_99 .. :try_end_e7} :catch_92

    .line 299
    :cond_e7
    :try_start_e7
    iget-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v6, v7}, Lfreemarker/template/Configuration;->setTemplateUpdateDelay(I)V
    :try_end_f0
    .catch Ljava/lang/NumberFormatException; {:try_start_e7 .. :try_end_f0} :catch_f2
    .catch Ljavax/servlet/ServletException; {:try_start_e7 .. :try_end_f0} :catch_86
    .catch Ljava/lang/Exception; {:try_start_e7 .. :try_end_f0} :catch_92

    goto/16 :goto_6c

    .line 300
    :catch_f2
    move-exception v6

    goto/16 :goto_6c

    .line 303
    :cond_f5
    :try_start_f5
    const-string v6, "TemplateExceptionHandler"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_16a

    .line 304
    const-string v6, "template_exception_handler"

    invoke-virtual {p0, v6}, Lfreemarker/ext/servlet/FreemarkerServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_10d

    .line 305
    new-instance v6, Ljavax/servlet/ServletException;

    const-string v7, "Conflicting init-params: template_exception_handler and TemplateExceptionHandler"

    invoke-direct {v6, v7}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 311
    :cond_10d
    const-string v6, "rethrow"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11e

    .line 312
    iget-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    sget-object v7, Lfreemarker/template/TemplateExceptionHandler;->RETHROW_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    invoke-virtual {v6, v7}, Lfreemarker/template/Configuration;->setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V

    goto/16 :goto_6c

    .line 313
    :cond_11e
    const-string v6, "debug"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_12f

    .line 314
    iget-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    sget-object v7, Lfreemarker/template/TemplateExceptionHandler;->DEBUG_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    invoke-virtual {v6, v7}, Lfreemarker/template/Configuration;->setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V

    goto/16 :goto_6c

    .line 315
    :cond_12f
    const-string v6, "htmlDebug"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_140

    .line 316
    iget-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    sget-object v7, Lfreemarker/template/TemplateExceptionHandler;->HTML_DEBUG_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    invoke-virtual {v6, v7}, Lfreemarker/template/Configuration;->setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V

    goto/16 :goto_6c

    .line 317
    :cond_140
    const-string v6, "ignore"

    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_151

    .line 318
    iget-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    sget-object v7, Lfreemarker/template/TemplateExceptionHandler;->IGNORE_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    invoke-virtual {v6, v7}, Lfreemarker/template/Configuration;->setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V

    goto/16 :goto_6c

    .line 320
    :cond_151
    new-instance v6, Ljavax/servlet/ServletException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Invalid value for servlet init-param TemplateExceptionHandler: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 324
    :cond_16a
    const-string v6, "NoCache"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_17a

    .line 325
    invoke-static {v5}, Lfreemarker/template/utility/StringUtil;->getYesNo(Ljava/lang/String;)Z

    move-result v6

    iput-boolean v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->nocache:Z

    goto/16 :goto_6c

    .line 326
    :cond_17a
    const-string v6, "debug"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_19a

    .line 327
    const-string v6, "Debug"

    invoke-virtual {p0, v6}, Lfreemarker/ext/servlet/FreemarkerServlet;->getInitParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_192

    .line 328
    new-instance v6, Ljavax/servlet/ServletException;

    const-string v7, "Conflicting init-params: Debug and debug"

    invoke-direct {v6, v7}, Ljavax/servlet/ServletException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 333
    :cond_192
    invoke-static {v5}, Lfreemarker/template/utility/StringUtil;->getYesNo(Ljava/lang/String;)Z

    move-result v6

    iput-boolean v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->debug:Z

    goto/16 :goto_6c

    .line 334
    :cond_19a
    const-string v6, "Debug"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1aa

    .line 335
    invoke-static {v5}, Lfreemarker/template/utility/StringUtil;->getYesNo(Ljava/lang/String;)Z

    move-result v6

    iput-boolean v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->debug:Z

    goto/16 :goto_6c

    .line 336
    :cond_1aa
    const-string v6, "ContentType"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1b6

    .line 337
    iput-object v5, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->contentType:Ljava/lang/String;

    goto/16 :goto_6c

    .line 339
    :cond_1b6
    iget-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->config:Lfreemarker/template/Configuration;

    invoke-virtual {v6, v4, v5}, Lfreemarker/template/Configuration;->setSetting(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_6c

    .line 343
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_1bd
    const/4 v6, 0x1

    iput-boolean v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->noCharsetInContentType:Z

    .line 344
    iget-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->contentType:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    const-string v7, "charset="

    invoke-virtual {v6, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 345
    .local v2, "i":I
    if-eq v2, v9, :cond_1e9

    .line 346
    const/16 v0, 0x20

    .line 347
    .local v0, "c":C
    add-int/lit8 v2, v2, -0x1

    .line 348
    :goto_1d2
    if-ltz v2, :cond_1e0

    .line 349
    iget-object v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->contentType:Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 350
    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v6

    if-nez v6, :cond_1ea

    .line 353
    :cond_1e0
    if-eq v2, v9, :cond_1e6

    const/16 v6, 0x3b

    if-ne v0, v6, :cond_1e9

    .line 354
    :cond_1e6
    const/4 v6, 0x0

    iput-boolean v6, p0, Lfreemarker/ext/servlet/FreemarkerServlet;->noCharsetInContentType:Z
    :try_end_1e9
    .catch Ljavax/servlet/ServletException; {:try_start_f5 .. :try_end_1e9} :catch_86
    .catch Ljava/lang/Exception; {:try_start_f5 .. :try_end_1e9} :catch_92

    .line 362
    .end local v0    # "c":C
    :cond_1e9
    return-void

    .line 351
    .restart local v0    # "c":C
    :cond_1ea
    add-int/lit8 v2, v2, -0x1

    goto :goto_1d2
.end method

.method protected initializeServletContext(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 3
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 715
    return-void
.end method

.method protected initializeSession(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V
    .registers 3
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 733
    return-void
.end method

.method initializeSessionAndInstallModel(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lfreemarker/ext/servlet/HttpSessionHashModel;Ljavax/servlet/http/HttpSession;)V
    .registers 6
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .param p3, "sessionModel"    # Lfreemarker/ext/servlet/HttpSessionHashModel;
    .param p4, "session"    # Ljavax/servlet/http/HttpSession;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 569
    const-string v0, ".freemarker.Session"

    invoke-interface {p4, v0, p3}, Ljavax/servlet/http/HttpSession;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 570
    invoke-virtual {p0, p1, p2}, Lfreemarker/ext/servlet/FreemarkerServlet;->initializeSession(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)V

    .line 571
    return-void
.end method

.method protected postTemplateProcess(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lfreemarker/template/Template;Lfreemarker/template/TemplateModel;)V
    .registers 5
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .param p3, "template"    # Lfreemarker/template/Template;
    .param p4, "data"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 785
    return-void
.end method

.method protected preTemplateProcess(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lfreemarker/template/Template;Lfreemarker/template/TemplateModel;)Z
    .registers 6
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .param p3, "template"    # Lfreemarker/template/Template;
    .param p4, "data"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 765
    const/4 v0, 0x1

    return v0
.end method

.method protected preprocessRequest(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;)Z
    .registers 4
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p2, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 618
    const/4 v0, 0x0

    return v0
.end method

.method protected requestUrlToTemplatePath(Ljavax/servlet/http/HttpServletRequest;)Ljava/lang/String;
    .registers 6
    .param p1, "request"    # Ljavax/servlet/http/HttpServletRequest;

    .prologue
    .line 585
    const-string v3, "javax.servlet.include.servlet_path"

    invoke-interface {p1, v3}, Ljavax/servlet/http/HttpServletRequest;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 586
    .local v1, "includeServletPath":Ljava/lang/String;
    if-eqz v1, :cond_18

    .line 590
    const-string v3, "javax.servlet.include.path_info"

    invoke-interface {p1, v3}, Ljavax/servlet/http/HttpServletRequest;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 591
    .local v0, "includePathInfo":Ljava/lang/String;
    if-nez v0, :cond_16

    .end local v1    # "includeServletPath":Ljava/lang/String;
    :goto_14
    move-object v2, v1

    .line 601
    .end local v0    # "includePathInfo":Ljava/lang/String;
    :cond_15
    :goto_15
    return-object v2

    .restart local v0    # "includePathInfo":Ljava/lang/String;
    .restart local v1    # "includeServletPath":Ljava/lang/String;
    :cond_16
    move-object v1, v0

    .line 591
    goto :goto_14

    .line 596
    .end local v0    # "includePathInfo":Ljava/lang/String;
    :cond_18
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getPathInfo()Ljava/lang/String;

    move-result-object v2

    .line 597
    .local v2, "path":Ljava/lang/String;
    if-nez v2, :cond_15

    .line 598
    invoke-interface {p1}, Ljavax/servlet/http/HttpServletRequest;->getServletPath()Ljava/lang/String;

    move-result-object v2

    .line 599
    if-nez v2, :cond_15

    .line 601
    const-string v2, ""

    goto :goto_15
.end method
