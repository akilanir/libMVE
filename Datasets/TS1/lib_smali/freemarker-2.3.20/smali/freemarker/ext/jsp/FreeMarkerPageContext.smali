.class abstract Lfreemarker/ext/jsp/FreeMarkerPageContext;
.super Ljavax/servlet/jsp/PageContext;
.source "FreeMarkerPageContext.java"

# interfaces
.implements Lfreemarker/template/TemplateModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/jsp/FreeMarkerPageContext$TemplateHashModelExEnumeration;
    }
.end annotation


# static fields
.field private static final OBJECT_CLASS:Ljava/lang/Class;

.field static class$freemarker$ext$servlet$HttpRequestHashModel:Ljava/lang/Class;

.field static class$freemarker$ext$servlet$ServletContextHashModel:Ljava/lang/Class;

.field static class$java$lang$Object:Ljava/lang/Class;


# instance fields
.field private final environment:Lfreemarker/core/Environment;

.field private jspOut:Ljavax/servlet/jsp/JspWriter;

.field private outs:Ljava/util/List;

.field private final request:Ljavax/servlet/http/HttpServletRequest;

.field private final response:Ljavax/servlet/http/HttpServletResponse;

.field private final servlet:Ljavax/servlet/GenericServlet;

.field private session:Ljavax/servlet/http/HttpSession;

.field private tags:Ljava/util/List;

.field private final wrapper:Lfreemarker/template/ObjectWrapper;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 102
    sget-object v0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v0, :cond_f

    const-string v0, "java.lang.Object"

    invoke-static {v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->class$java$lang$Object:Ljava/lang/Class;

    :goto_c
    sput-object v0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->OBJECT_CLASS:Ljava/lang/Class;

    return-void

    :cond_f
    sget-object v0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_c
.end method

.method protected constructor <init>()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 115
    invoke-direct {p0}, Ljavax/servlet/jsp/PageContext;-><init>()V

    .line 105
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->tags:Ljava/util/List;

    .line 106
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->outs:Ljava/util/List;

    .line 116
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v3

    iput-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->environment:Lfreemarker/core/Environment;

    .line 118
    iget-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->environment:Lfreemarker/core/Environment;

    const-string v4, "__FreeMarkerServlet.Application__"

    invoke-virtual {v3, v4}, Lfreemarker/core/Environment;->getGlobalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 120
    .local v0, "appModel":Lfreemarker/template/TemplateModel;
    instance-of v3, v0, Lfreemarker/ext/servlet/ServletContextHashModel;

    if-nez v3, :cond_2b

    .line 121
    iget-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->environment:Lfreemarker/core/Environment;

    const-string v4, "Application"

    invoke-virtual {v3, v4}, Lfreemarker/core/Environment;->getGlobalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 124
    :cond_2b
    instance-of v3, v0, Lfreemarker/ext/servlet/ServletContextHashModel;

    if-eqz v3, :cond_a9

    .line 125
    check-cast v0, Lfreemarker/ext/servlet/ServletContextHashModel;

    .end local v0    # "appModel":Lfreemarker/template/TemplateModel;
    invoke-virtual {v0}, Lfreemarker/ext/servlet/ServletContextHashModel;->getServlet()Ljavax/servlet/GenericServlet;

    move-result-object v3

    iput-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->servlet:Ljavax/servlet/GenericServlet;

    .line 135
    iget-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->environment:Lfreemarker/core/Environment;

    const-string v4, "__FreeMarkerServlet.Request__"

    invoke-virtual {v3, v4}, Lfreemarker/core/Environment;->getGlobalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    .line 137
    .local v2, "requestModel":Lfreemarker/template/TemplateModel;
    instance-of v3, v2, Lfreemarker/ext/servlet/HttpRequestHashModel;

    if-nez v3, :cond_4b

    .line 138
    iget-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->environment:Lfreemarker/core/Environment;

    const-string v4, "Request"

    invoke-virtual {v3, v4}, Lfreemarker/core/Environment;->getGlobalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    .line 141
    :cond_4b
    instance-of v3, v2, Lfreemarker/ext/servlet/HttpRequestHashModel;

    if-eqz v3, :cond_ed

    move-object v1, v2

    .line 142
    check-cast v1, Lfreemarker/ext/servlet/HttpRequestHashModel;

    .line 143
    .local v1, "reqHash":Lfreemarker/ext/servlet/HttpRequestHashModel;
    invoke-virtual {v1}, Lfreemarker/ext/servlet/HttpRequestHashModel;->getRequest()Ljavax/servlet/http/HttpServletRequest;

    move-result-object v3

    iput-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->request:Ljavax/servlet/http/HttpServletRequest;

    .line 144
    iget-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->request:Ljavax/servlet/http/HttpServletRequest;

    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljavax/servlet/http/HttpServletRequest;->getSession(Z)Ljavax/servlet/http/HttpSession;

    move-result-object v3

    iput-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->session:Ljavax/servlet/http/HttpSession;

    .line 145
    invoke-virtual {v1}, Lfreemarker/ext/servlet/HttpRequestHashModel;->getResponse()Ljavax/servlet/http/HttpServletResponse;

    move-result-object v3

    iput-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->response:Ljavax/servlet/http/HttpServletResponse;

    .line 146
    invoke-virtual {v1}, Lfreemarker/ext/servlet/HttpRequestHashModel;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v3

    iput-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->wrapper:Lfreemarker/template/ObjectWrapper;

    .line 157
    const-string v3, "javax.servlet.jsp.jspRequest"

    iget-object v4, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-virtual {p0, v3, v4}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 158
    const-string v3, "javax.servlet.jsp.jspResponse"

    iget-object v4, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->response:Ljavax/servlet/http/HttpServletResponse;

    invoke-virtual {p0, v3, v4}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 159
    iget-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->session:Ljavax/servlet/http/HttpSession;

    if-eqz v3, :cond_86

    .line 160
    const-string v3, "javax.servlet.jsp.jspSession"

    iget-object v4, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->session:Ljavax/servlet/http/HttpSession;

    invoke-virtual {p0, v3, v4}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 161
    :cond_86
    const-string v3, "javax.servlet.jsp.jspPage"

    iget-object v4, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->servlet:Ljavax/servlet/GenericServlet;

    invoke-virtual {p0, v3, v4}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 162
    const-string v3, "javax.servlet.jsp.jspConfig"

    iget-object v4, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->servlet:Ljavax/servlet/GenericServlet;

    invoke-virtual {v4}, Ljavax/servlet/GenericServlet;->getServletConfig()Ljavax/servlet/ServletConfig;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 163
    const-string v3, "javax.servlet.jsp.jspPageContext"

    invoke-virtual {p0, v3, p0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 164
    const-string v3, "javax.servlet.jsp.jspApplication"

    iget-object v4, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->servlet:Ljavax/servlet/GenericServlet;

    invoke-virtual {v4}, Ljavax/servlet/GenericServlet;->getServletContext()Ljavax/servlet/ServletContext;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 165
    return-void

    .line 128
    .end local v1    # "reqHash":Lfreemarker/ext/servlet/HttpRequestHashModel;
    .end local v2    # "requestModel":Lfreemarker/template/TemplateModel;
    .restart local v0    # "appModel":Lfreemarker/template/TemplateModel;
    :cond_a9
    new-instance v4, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Could not find an instance of "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerPageContext;->class$freemarker$ext$servlet$ServletContextHashModel:Ljava/lang/Class;

    if-nez v3, :cond_ea

    const-string v3, "freemarker.ext.servlet.ServletContextHashModel"

    invoke-static {v3}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lfreemarker/ext/jsp/FreeMarkerPageContext;->class$freemarker$ext$servlet$ServletContextHashModel:Ljava/lang/Class;

    :goto_c2
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, " in the data model under either the name "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, "__FreeMarkerServlet.Application__"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, " or "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, "Application"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_ea
    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerPageContext;->class$freemarker$ext$servlet$ServletContextHashModel:Ljava/lang/Class;

    goto :goto_c2

    .line 149
    .end local v0    # "appModel":Lfreemarker/template/TemplateModel;
    .restart local v2    # "requestModel":Lfreemarker/template/TemplateModel;
    :cond_ed
    new-instance v4, Lfreemarker/template/TemplateModelException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Could not find an instance of "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerPageContext;->class$freemarker$ext$servlet$HttpRequestHashModel:Ljava/lang/Class;

    if-nez v3, :cond_12e

    const-string v3, "freemarker.ext.servlet.HttpRequestHashModel"

    invoke-static {v3}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lfreemarker/ext/jsp/FreeMarkerPageContext;->class$freemarker$ext$servlet$HttpRequestHashModel:Ljava/lang/Class;

    :goto_106
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, " in the data model under either the name "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, "__FreeMarkerServlet.Request__"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, " or "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v5, "Request"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_12e
    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerPageContext;->class$freemarker$ext$servlet$HttpRequestHashModel:Ljava/lang/Class;

    goto :goto_106
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 102
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

.method private getSession(Z)Ljavax/servlet/http/HttpSession;
    .registers 4
    .param p1, "create"    # Z

    .prologue
    .line 354
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->session:Ljavax/servlet/http/HttpSession;

    if-nez v0, :cond_17

    .line 355
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletRequest;->getSession(Z)Ljavax/servlet/http/HttpSession;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->session:Ljavax/servlet/http/HttpSession;

    .line 356
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->session:Ljavax/servlet/http/HttpSession;

    if-eqz v0, :cond_17

    .line 357
    const-string v0, "javax.servlet.jsp.jspSession"

    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->session:Ljavax/servlet/http/HttpSession;

    invoke-virtual {p0, v0, v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 360
    :cond_17
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->session:Ljavax/servlet/http/HttpSession;

    return-object v0
.end method


# virtual methods
.method public findAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 268
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getAttribute(Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    .line 269
    .local v0, "retval":Ljava/lang/Object;
    if-eqz v0, :cond_9

    move-object v1, v0

    .line 274
    :goto_8
    return-object v1

    .line 270
    :cond_9
    const/4 v1, 0x2

    invoke-virtual {p0, p1, v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getAttribute(Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    .line 271
    if-eqz v0, :cond_12

    move-object v1, v0

    goto :goto_8

    .line 272
    :cond_12
    const/4 v1, 0x3

    invoke-virtual {p0, p1, v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getAttribute(Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    .line 273
    if-eqz v0, :cond_1b

    move-object v1, v0

    goto :goto_8

    .line 274
    :cond_1b
    const/4 v1, 0x4

    invoke-virtual {p0, p1, v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getAttribute(Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_8
.end method

.method public forward(Ljava/lang/String;)V
    .registers 5
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 393
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletRequest;->getRequestDispatcher(Ljava/lang/String;)Ljavax/servlet/RequestDispatcher;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->request:Ljavax/servlet/http/HttpServletRequest;

    iget-object v2, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->response:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, v1, v2}, Ljavax/servlet/RequestDispatcher;->forward(Ljavax/servlet/ServletRequest;Ljavax/servlet/ServletResponse;)V

    .line 394
    return-void
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 217
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getAttribute(Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getAttribute(Ljava/lang/String;I)Ljava/lang/Object;
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "scope"    # I

    .prologue
    .line 222
    packed-switch p2, :pswitch_data_90

    .line 261
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Invalid scope "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 225
    :pswitch_1c
    :try_start_1c
    iget-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->environment:Lfreemarker/core/Environment;

    invoke-virtual {v3}, Lfreemarker/core/Environment;->getGlobalNamespace()Lfreemarker/core/Environment$Namespace;

    move-result-object v3

    invoke-virtual {v3, p1}, Lfreemarker/core/Environment$Namespace;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 226
    .local v1, "m":Lfreemarker/template/TemplateModel;
    instance-of v3, v1, Lfreemarker/template/AdapterTemplateModel;

    if-eqz v3, :cond_33

    .line 227
    check-cast v1, Lfreemarker/template/AdapterTemplateModel;

    .end local v1    # "m":Lfreemarker/template/TemplateModel;
    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerPageContext;->OBJECT_CLASS:Ljava/lang/Class;

    invoke-interface {v1, v3}, Lfreemarker/template/AdapterTemplateModel;->getAdaptedObject(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    .line 258
    :goto_32
    return-object v3

    .line 229
    .restart local v1    # "m":Lfreemarker/template/TemplateModel;
    :cond_33
    instance-of v3, v1, Lfreemarker/ext/util/WrapperTemplateModel;

    if-eqz v3, :cond_3e

    .line 230
    check-cast v1, Lfreemarker/ext/util/WrapperTemplateModel;

    .end local v1    # "m":Lfreemarker/template/TemplateModel;
    invoke-interface {v1}, Lfreemarker/ext/util/WrapperTemplateModel;->getWrappedObject()Ljava/lang/Object;

    move-result-object v3

    goto :goto_32

    .line 232
    .restart local v1    # "m":Lfreemarker/template/TemplateModel;
    :cond_3e
    instance-of v3, v1, Lfreemarker/template/TemplateScalarModel;

    if-eqz v3, :cond_49

    .line 233
    check-cast v1, Lfreemarker/template/TemplateScalarModel;

    .end local v1    # "m":Lfreemarker/template/TemplateModel;
    invoke-interface {v1}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v3

    goto :goto_32

    .line 235
    .restart local v1    # "m":Lfreemarker/template/TemplateModel;
    :cond_49
    instance-of v3, v1, Lfreemarker/template/TemplateNumberModel;

    if-eqz v3, :cond_54

    .line 236
    check-cast v1, Lfreemarker/template/TemplateNumberModel;

    .end local v1    # "m":Lfreemarker/template/TemplateModel;
    invoke-interface {v1}, Lfreemarker/template/TemplateNumberModel;->getAsNumber()Ljava/lang/Number;

    move-result-object v3

    goto :goto_32

    .line 238
    .restart local v1    # "m":Lfreemarker/template/TemplateModel;
    :cond_54
    instance-of v3, v1, Lfreemarker/template/TemplateBooleanModel;

    if-eqz v3, :cond_66

    .line 239
    check-cast v1, Lfreemarker/template/TemplateBooleanModel;

    .end local v1    # "m":Lfreemarker/template/TemplateModel;
    invoke-interface {v1}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z

    move-result v3

    if-eqz v3, :cond_63

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_32

    :cond_63
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
    :try_end_65
    .catch Lfreemarker/template/TemplateModelException; {:try_start_1c .. :try_end_65} :catch_68

    goto :goto_32

    .restart local v1    # "m":Lfreemarker/template/TemplateModel;
    :cond_66
    move-object v3, v1

    .line 241
    goto :goto_32

    .line 243
    .end local v1    # "m":Lfreemarker/template/TemplateModel;
    :catch_68
    move-exception v0

    .line 244
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v3, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v3, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 248
    .end local v0    # "e":Lfreemarker/template/TemplateModelException;
    :pswitch_6f
    invoke-virtual {p0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getRequest()Ljavax/servlet/ServletRequest;

    move-result-object v3

    invoke-interface {v3, p1}, Ljavax/servlet/ServletRequest;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_32

    .line 251
    :pswitch_78
    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getSession(Z)Ljavax/servlet/http/HttpSession;

    move-result-object v2

    .line 252
    .local v2, "session":Ljavax/servlet/http/HttpSession;
    if-nez v2, :cond_81

    .line 253
    const/4 v3, 0x0

    goto :goto_32

    .line 255
    :cond_81
    invoke-interface {v2, p1}, Ljavax/servlet/http/HttpSession;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_32

    .line 258
    .end local v2    # "session":Ljavax/servlet/http/HttpSession;
    :pswitch_86
    invoke-virtual {p0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getServletContext()Ljavax/servlet/ServletContext;

    move-result-object v3

    invoke-interface {v3, p1}, Ljavax/servlet/ServletContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_32

    .line 222
    nop

    :pswitch_data_90
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_6f
        :pswitch_78
        :pswitch_86
    .end packed-switch
.end method

.method public getAttributeNamesInScope(I)Ljava/util/Enumeration;
    .registers 7
    .param p1, "scope"    # I

    .prologue
    .line 320
    packed-switch p1, :pswitch_data_56

    .line 344
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Invalid scope "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 323
    :pswitch_1c
    :try_start_1c
    new-instance v2, Lfreemarker/ext/jsp/FreeMarkerPageContext$TemplateHashModelExEnumeration;

    iget-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->environment:Lfreemarker/core/Environment;

    invoke-virtual {v3}, Lfreemarker/core/Environment;->getGlobalNamespace()Lfreemarker/core/Environment$Namespace;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lfreemarker/ext/jsp/FreeMarkerPageContext$TemplateHashModelExEnumeration;-><init>(Lfreemarker/template/TemplateHashModelEx;Lfreemarker/ext/jsp/FreeMarkerPageContext$1;)V
    :try_end_28
    .catch Lfreemarker/template/TemplateModelException; {:try_start_1c .. :try_end_28} :catch_29

    .line 341
    :goto_28
    return-object v2

    .line 326
    :catch_29
    move-exception v0

    .line 327
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v2, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v2, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 331
    .end local v0    # "e":Lfreemarker/template/TemplateModelException;
    :pswitch_30
    invoke-virtual {p0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getRequest()Ljavax/servlet/ServletRequest;

    move-result-object v2

    invoke-interface {v2}, Ljavax/servlet/ServletRequest;->getAttributeNames()Ljava/util/Enumeration;

    move-result-object v2

    goto :goto_28

    .line 334
    :pswitch_39
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getSession(Z)Ljavax/servlet/http/HttpSession;

    move-result-object v1

    .line 335
    .local v1, "session":Ljavax/servlet/http/HttpSession;
    if-eqz v1, :cond_45

    .line 336
    invoke-interface {v1}, Ljavax/servlet/http/HttpSession;->getAttributeNames()Ljava/util/Enumeration;

    move-result-object v2

    goto :goto_28

    .line 338
    :cond_45
    sget-object v2, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-static {v2}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object v2

    goto :goto_28

    .line 341
    .end local v1    # "session":Ljavax/servlet/http/HttpSession;
    :pswitch_4c
    invoke-virtual {p0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getServletContext()Ljavax/servlet/ServletContext;

    move-result-object v2

    invoke-interface {v2}, Ljavax/servlet/ServletContext;->getAttributeNames()Ljava/util/Enumeration;

    move-result-object v2

    goto :goto_28

    .line 320
    nop

    :pswitch_data_56
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_30
        :pswitch_39
        :pswitch_4c
    .end packed-switch
.end method

.method public getAttributesScope(Ljava/lang/String;)I
    .registers 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x4

    const/4 v2, 0x3

    const/4 v1, 0x2

    const/4 v0, 0x1

    .line 312
    invoke-virtual {p0, p1, v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getAttribute(Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_b

    .line 316
    :goto_a
    return v0

    .line 313
    :cond_b
    invoke-virtual {p0, p1, v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getAttribute(Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_13

    move v0, v1

    goto :goto_a

    .line 314
    :cond_13
    invoke-virtual {p0, p1, v2}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getAttribute(Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1b

    move v0, v2

    goto :goto_a

    .line 315
    :cond_1b
    invoke-virtual {p0, p1, v3}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getAttribute(Ljava/lang/String;I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_23

    move v0, v3

    goto :goto_a

    .line 316
    :cond_23
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 380
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method getObjectWrapper()Lfreemarker/template/ObjectWrapper;
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->wrapper:Lfreemarker/template/ObjectWrapper;

    return-object v0
.end method

.method public getOut()Ljavax/servlet/jsp/JspWriter;
    .registers 2

    .prologue
    .line 350
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->jspOut:Ljavax/servlet/jsp/JspWriter;

    return-object v0
.end method

.method public getPage()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 368
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->servlet:Ljavax/servlet/GenericServlet;

    return-object v0
.end method

.method public getRequest()Ljavax/servlet/ServletRequest;
    .registers 2

    .prologue
    .line 372
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->request:Ljavax/servlet/http/HttpServletRequest;

    return-object v0
.end method

.method public getResponse()Ljavax/servlet/ServletResponse;
    .registers 2

    .prologue
    .line 376
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->response:Ljavax/servlet/http/HttpServletResponse;

    return-object v0
.end method

.method public getServletConfig()Ljavax/servlet/ServletConfig;
    .registers 2

    .prologue
    .line 384
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->servlet:Ljavax/servlet/GenericServlet;

    invoke-virtual {v0}, Ljavax/servlet/GenericServlet;->getServletConfig()Ljavax/servlet/ServletConfig;

    move-result-object v0

    return-object v0
.end method

.method public getServletContext()Ljavax/servlet/ServletContext;
    .registers 2

    .prologue
    .line 388
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->servlet:Ljavax/servlet/GenericServlet;

    invoke-virtual {v0}, Ljavax/servlet/GenericServlet;->getServletContext()Ljavax/servlet/ServletContext;

    move-result-object v0

    return-object v0
.end method

.method public getSession()Ljavax/servlet/http/HttpSession;
    .registers 2

    .prologue
    .line 364
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getSession(Z)Ljavax/servlet/http/HttpSession;

    move-result-object v0

    return-object v0
.end method

.method public handlePageException(Ljava/lang/Exception;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 419
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public handlePageException(Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 423
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public include(Ljava/lang/String;)V
    .registers 5
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 397
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->jspOut:Ljavax/servlet/jsp/JspWriter;

    invoke-virtual {v0}, Ljavax/servlet/jsp/JspWriter;->flush()V

    .line 398
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpServletRequest;->getRequestDispatcher(Ljava/lang/String;)Ljavax/servlet/RequestDispatcher;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->request:Ljavax/servlet/http/HttpServletRequest;

    iget-object v2, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->response:Ljavax/servlet/http/HttpServletResponse;

    invoke-interface {v0, v1, v2}, Ljavax/servlet/RequestDispatcher;->include(Ljavax/servlet/ServletRequest;Ljavax/servlet/ServletResponse;)V

    .line 399
    return-void
.end method

.method public include(Ljava/lang/String;Z)V
    .registers 8
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "flush"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/servlet/ServletException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 402
    if-eqz p2, :cond_7

    .line 403
    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->jspOut:Ljavax/servlet/jsp/JspWriter;

    invoke-virtual {v1}, Ljavax/servlet/jsp/JspWriter;->flush()V

    .line 405
    :cond_7
    new-instance v0, Ljava/io/PrintWriter;

    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->jspOut:Ljavax/servlet/jsp/JspWriter;

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 406
    .local v0, "pw":Ljava/io/PrintWriter;
    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->request:Ljavax/servlet/http/HttpServletRequest;

    invoke-interface {v1, p1}, Ljavax/servlet/http/HttpServletRequest;->getRequestDispatcher(Ljava/lang/String;)Ljavax/servlet/RequestDispatcher;

    move-result-object v1

    iget-object v2, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->request:Ljavax/servlet/http/HttpServletRequest;

    new-instance v3, Lfreemarker/ext/jsp/FreeMarkerPageContext$1;

    iget-object v4, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->response:Ljavax/servlet/http/HttpServletResponse;

    invoke-direct {v3, p0, v4, v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext$1;-><init>(Lfreemarker/ext/jsp/FreeMarkerPageContext;Ljavax/servlet/http/HttpServletResponse;Ljava/io/PrintWriter;)V

    invoke-interface {v1, v2, v3}, Ljavax/servlet/RequestDispatcher;->include(Ljavax/servlet/ServletRequest;Ljavax/servlet/ServletResponse;)V

    .line 415
    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    .line 416
    return-void
.end method

.method public initialize(Ljavax/servlet/Servlet;Ljavax/servlet/ServletRequest;Ljavax/servlet/ServletResponse;Ljava/lang/String;ZIZ)V
    .registers 9
    .param p1, "servlet"    # Ljavax/servlet/Servlet;
    .param p2, "request"    # Ljavax/servlet/ServletRequest;
    .param p3, "response"    # Ljavax/servlet/ServletResponse;
    .param p4, "errorPageURL"    # Ljava/lang/String;
    .param p5, "needsSession"    # Z
    .param p6, "bufferSize"    # I
    .param p7, "autoFlush"    # Z

    .prologue
    .line 176
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method peekTopTag(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 6
    .param p1, "tagClass"    # Ljava/lang/Class;

    .prologue
    .line 440
    iget-object v2, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->tags:Ljava/util/List;

    iget-object v3, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->tags:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-interface {v2, v3}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/ListIterator;
    :cond_c
    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 442
    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v1

    .line 443
    .local v1, "tag":Ljava/lang/Object;
    invoke-virtual {p1, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 447
    .end local v1    # "tag":Ljava/lang/Object;
    :goto_1c
    return-object v1

    :cond_1d
    const/4 v1, 0x0

    goto :goto_1c
.end method

.method public popBody()Ljavax/servlet/jsp/JspWriter;
    .registers 2

    .prologue
    .line 435
    invoke-virtual {p0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->popWriter()V

    .line 436
    const-string v0, "javax.servlet.jsp.jspOut"

    invoke-virtual {p0, v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/servlet/jsp/JspWriter;

    return-object v0
.end method

.method popTopTag()V
    .registers 3

    .prologue
    .line 451
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->tags:Ljava/util/List;

    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->tags:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 452
    return-void
.end method

.method popWriter()V
    .registers 3

    .prologue
    .line 455
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->outs:Ljava/util/List;

    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->outs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/servlet/jsp/JspWriter;

    iput-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->jspOut:Ljavax/servlet/jsp/JspWriter;

    .line 456
    const-string v0, "javax.servlet.jsp.jspOut"

    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->jspOut:Ljavax/servlet/jsp/JspWriter;

    invoke-virtual {p0, v0, v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 457
    return-void
.end method

.method public pushBody(Ljava/io/Writer;)Ljavax/servlet/jsp/JspWriter;
    .registers 3
    .param p1, "w"    # Ljava/io/Writer;

    .prologue
    .line 431
    new-instance v0, Lfreemarker/ext/jsp/JspWriterAdapter;

    invoke-direct {v0, p1}, Lfreemarker/ext/jsp/JspWriterAdapter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {p0, v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->pushWriter(Ljavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;

    move-result-object v0

    return-object v0
.end method

.method public pushBody()Ljavax/servlet/jsp/tagext/BodyContent;
    .registers 4

    .prologue
    .line 427
    new-instance v0, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;

    invoke-virtual {p0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getOut()Ljavax/servlet/jsp/JspWriter;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lfreemarker/ext/jsp/TagTransformModel$BodyContentImpl;-><init>(Ljavax/servlet/jsp/JspWriter;Z)V

    invoke-virtual {p0, v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->pushWriter(Ljavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;

    move-result-object v0

    check-cast v0, Ljavax/servlet/jsp/tagext/BodyContent;

    return-object v0
.end method

.method pushTopTag(Ljava/lang/Object;)V
    .registers 3
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 460
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->tags:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 461
    return-void
.end method

.method pushWriter(Ljavax/servlet/jsp/JspWriter;)Ljavax/servlet/jsp/JspWriter;
    .registers 4
    .param p1, "out"    # Ljavax/servlet/jsp/JspWriter;

    .prologue
    .line 464
    iget-object v0, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->outs:Ljava/util/List;

    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->jspOut:Ljavax/servlet/jsp/JspWriter;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 465
    iput-object p1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->jspOut:Ljavax/servlet/jsp/JspWriter;

    .line 466
    const-string v0, "javax.servlet.jsp.jspOut"

    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->jspOut:Ljavax/servlet/jsp/JspWriter;

    invoke-virtual {p0, v0, v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 467
    return-object p1
.end method

.method public release()V
    .registers 1

    .prologue
    .line 180
    return-void
.end method

.method public removeAttribute(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 278
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->removeAttribute(Ljava/lang/String;I)V

    .line 279
    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->removeAttribute(Ljava/lang/String;I)V

    .line 280
    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->removeAttribute(Ljava/lang/String;I)V

    .line 281
    const/4 v0, 0x4

    invoke-virtual {p0, p1, v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->removeAttribute(Ljava/lang/String;I)V

    .line 282
    return-void
.end method

.method public removeAttribute(Ljava/lang/String;I)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "scope"    # I

    .prologue
    .line 285
    packed-switch p2, :pswitch_data_42

    .line 306
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Invalid scope: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 287
    :pswitch_1c
    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->environment:Lfreemarker/core/Environment;

    invoke-virtual {v1}, Lfreemarker/core/Environment;->getGlobalNamespace()Lfreemarker/core/Environment$Namespace;

    move-result-object v1

    invoke-virtual {v1, p1}, Lfreemarker/core/Environment$Namespace;->remove(Ljava/lang/String;)V

    .line 309
    :cond_25
    :goto_25
    return-void

    .line 291
    :pswitch_26
    invoke-virtual {p0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getRequest()Ljavax/servlet/ServletRequest;

    move-result-object v1

    invoke-interface {v1, p1}, Ljavax/servlet/ServletRequest;->removeAttribute(Ljava/lang/String;)V

    goto :goto_25

    .line 295
    :pswitch_2e
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getSession(Z)Ljavax/servlet/http/HttpSession;

    move-result-object v0

    .line 296
    .local v0, "session":Ljavax/servlet/http/HttpSession;
    if-eqz v0, :cond_25

    .line 297
    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpSession;->removeAttribute(Ljava/lang/String;)V

    goto :goto_25

    .line 302
    .end local v0    # "session":Ljavax/servlet/http/HttpSession;
    :pswitch_39
    invoke-virtual {p0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getServletContext()Ljavax/servlet/ServletContext;

    move-result-object v1

    invoke-interface {v1, p1}, Ljavax/servlet/ServletContext;->removeAttribute(Ljava/lang/String;)V

    goto :goto_25

    .line 285
    nop

    :pswitch_data_42
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_26
        :pswitch_2e
        :pswitch_39
    .end packed-switch
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 183
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 184
    return-void
.end method

.method public setAttribute(Ljava/lang/String;Ljava/lang/Object;I)V
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "scope"    # I

    .prologue
    .line 187
    packed-switch p3, :pswitch_data_48

    .line 210
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Invalid scope "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 190
    :pswitch_1c
    :try_start_1c
    iget-object v1, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->environment:Lfreemarker/core/Environment;

    iget-object v2, p0, Lfreemarker/ext/jsp/FreeMarkerPageContext;->wrapper:Lfreemarker/template/ObjectWrapper;

    invoke-interface {v2, p2}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lfreemarker/core/Environment;->setGlobalVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V
    :try_end_27
    .catch Lfreemarker/template/TemplateModelException; {:try_start_1c .. :try_end_27} :catch_28

    .line 213
    :goto_27
    return-void

    .line 193
    :catch_28
    move-exception v0

    .line 194
    .local v0, "e":Lfreemarker/template/TemplateModelException;
    new-instance v1, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v1, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 198
    .end local v0    # "e":Lfreemarker/template/TemplateModelException;
    :pswitch_2f
    invoke-virtual {p0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getRequest()Ljavax/servlet/ServletRequest;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Ljavax/servlet/ServletRequest;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_27

    .line 202
    :pswitch_37
    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getSession(Z)Ljavax/servlet/http/HttpSession;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Ljavax/servlet/http/HttpSession;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_27

    .line 206
    :pswitch_40
    invoke-virtual {p0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->getServletContext()Ljavax/servlet/ServletContext;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Ljavax/servlet/ServletContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_27

    .line 187
    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_1c
        :pswitch_2f
        :pswitch_37
        :pswitch_40
    .end packed-switch
.end method
