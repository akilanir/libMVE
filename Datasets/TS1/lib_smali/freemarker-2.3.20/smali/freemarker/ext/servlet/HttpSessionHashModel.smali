.class public final Lfreemarker/ext/servlet/HttpSessionHashModel;
.super Ljava/lang/Object;
.source "HttpSessionHashModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModel;
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final transient request:Ljavax/servlet/http/HttpServletRequest;

.field private final transient response:Ljavax/servlet/http/HttpServletResponse;

.field private final transient servlet:Lfreemarker/ext/servlet/FreemarkerServlet;

.field private transient session:Ljavax/servlet/http/HttpSession;

.field private final transient wrapper:Lfreemarker/template/ObjectWrapper;


# direct methods
.method public constructor <init>(Lfreemarker/ext/servlet/FreemarkerServlet;Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lfreemarker/template/ObjectWrapper;)V
    .registers 5
    .param p1, "servlet"    # Lfreemarker/ext/servlet/FreemarkerServlet;
    .param p2, "request"    # Ljavax/servlet/http/HttpServletRequest;
    .param p3, "response"    # Ljavax/servlet/http/HttpServletResponse;
    .param p4, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    iput-object p4, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->wrapper:Lfreemarker/template/ObjectWrapper;

    .line 112
    iput-object p1, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->servlet:Lfreemarker/ext/servlet/FreemarkerServlet;

    .line 113
    iput-object p2, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    .line 114
    iput-object p3, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->response:Ljavax/servlet/http/HttpServletResponse;

    .line 115
    return-void
.end method

.method public constructor <init>(Ljavax/servlet/http/HttpSession;Lfreemarker/template/ObjectWrapper;)V
    .registers 4
    .param p1, "session"    # Ljavax/servlet/http/HttpSession;
    .param p2, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    const/4 v0, 0x0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p1, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->session:Ljavax/servlet/http/HttpSession;

    .line 90
    iput-object p2, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->wrapper:Lfreemarker/template/ObjectWrapper;

    .line 92
    iput-object v0, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->servlet:Lfreemarker/ext/servlet/FreemarkerServlet;

    .line 93
    iput-object v0, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    .line 94
    iput-object v0, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->response:Ljavax/servlet/http/HttpServletResponse;

    .line 95
    return-void
.end method

.method private checkSessionExistence()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 125
    iget-object v1, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->session:Ljavax/servlet/http/HttpSession;

    if-nez v1, :cond_24

    iget-object v1, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    if-eqz v1, :cond_24

    .line 126
    iget-object v1, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljavax/servlet/http/HttpServletRequest;->getSession(Z)Ljavax/servlet/http/HttpSession;

    move-result-object v1

    iput-object v1, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->session:Ljavax/servlet/http/HttpSession;

    .line 127
    iget-object v1, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->session:Ljavax/servlet/http/HttpSession;

    if-eqz v1, :cond_24

    iget-object v1, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->servlet:Lfreemarker/ext/servlet/FreemarkerServlet;

    if-eqz v1, :cond_24

    .line 129
    :try_start_19
    iget-object v1, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->servlet:Lfreemarker/ext/servlet/FreemarkerServlet;

    iget-object v2, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    iget-object v3, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->response:Ljavax/servlet/http/HttpServletResponse;

    iget-object v4, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->session:Ljavax/servlet/http/HttpSession;

    invoke-virtual {v1, v2, v3, p0, v4}, Lfreemarker/ext/servlet/FreemarkerServlet;->initializeSessionAndInstallModel(Ljavax/servlet/http/HttpServletRequest;Ljavax/servlet/http/HttpServletResponse;Lfreemarker/ext/servlet/HttpSessionHashModel;Ljavax/servlet/http/HttpSession;)V
    :try_end_24
    .catch Ljava/lang/RuntimeException; {:try_start_19 .. :try_end_24} :catch_25
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_24} :catch_27

    .line 140
    :cond_24
    return-void

    .line 132
    :catch_25
    move-exception v0

    .line 133
    .local v0, "e":Ljava/lang/RuntimeException;
    throw v0

    .line 135
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_27
    move-exception v0

    .line 136
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lfreemarker/template/TemplateModelException;

    invoke-direct {v1, v0}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method


# virtual methods
.method public get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 119
    invoke-direct {p0}, Lfreemarker/ext/servlet/HttpSessionHashModel;->checkSessionExistence()V

    .line 120
    iget-object v1, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->wrapper:Lfreemarker/template/ObjectWrapper;

    iget-object v0, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->session:Ljavax/servlet/http/HttpSession;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->session:Ljavax/servlet/http/HttpSession;

    invoke-interface {v0, p1}, Ljavax/servlet/http/HttpSession;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    :goto_f
    invoke-interface {v1, v0}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public isEmpty()Z
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 152
    invoke-direct {p0}, Lfreemarker/ext/servlet/HttpSessionHashModel;->checkSessionExistence()V

    .line 153
    iget-object v0, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->session:Ljavax/servlet/http/HttpSession;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->session:Ljavax/servlet/http/HttpSession;

    invoke-interface {v0}, Ljavax/servlet/http/HttpSession;->getAttributeNames()Ljava/util/Enumeration;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-nez v0, :cond_15

    :cond_13
    const/4 v0, 0x1

    :goto_14
    return v0

    :cond_15
    const/4 v0, 0x0

    goto :goto_14
.end method

.method isOrphaned(Ljavax/servlet/http/HttpSession;)Z
    .registers 3
    .param p1, "currentSession"    # Ljavax/servlet/http/HttpSession;

    .prologue
    .line 144
    iget-object v0, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->session:Ljavax/servlet/http/HttpSession;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->session:Ljavax/servlet/http/HttpSession;

    if-ne v0, p1, :cond_10

    :cond_8
    iget-object v0, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->session:Ljavax/servlet/http/HttpSession;

    if-nez v0, :cond_12

    iget-object v0, p0, Lfreemarker/ext/servlet/HttpSessionHashModel;->request:Ljavax/servlet/http/HttpServletRequest;

    if-nez v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method
