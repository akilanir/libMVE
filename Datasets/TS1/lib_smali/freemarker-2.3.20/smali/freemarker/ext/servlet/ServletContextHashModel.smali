.class public final Lfreemarker/ext/servlet/ServletContextHashModel;
.super Ljava/lang/Object;
.source "ServletContextHashModel.java"

# interfaces
.implements Lfreemarker/template/TemplateHashModel;


# instance fields
.field private final servlet:Ljavax/servlet/GenericServlet;

.field private final servletctx:Ljavax/servlet/ServletContext;

.field private final wrapper:Lfreemarker/template/ObjectWrapper;


# direct methods
.method public constructor <init>(Ljavax/servlet/GenericServlet;Lfreemarker/template/ObjectWrapper;)V
    .registers 4
    .param p1, "servlet"    # Ljavax/servlet/GenericServlet;
    .param p2, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p1, p0, Lfreemarker/ext/servlet/ServletContextHashModel;->servlet:Ljavax/servlet/GenericServlet;

    .line 77
    invoke-virtual {p1}, Ljavax/servlet/GenericServlet;->getServletContext()Ljavax/servlet/ServletContext;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/ext/servlet/ServletContextHashModel;->servletctx:Ljavax/servlet/ServletContext;

    .line 78
    iput-object p2, p0, Lfreemarker/ext/servlet/ServletContextHashModel;->wrapper:Lfreemarker/template/ObjectWrapper;

    .line 79
    return-void
.end method

.method public constructor <init>(Ljavax/servlet/ServletContext;Lfreemarker/template/ObjectWrapper;)V
    .registers 4
    .param p1, "servletctx"    # Ljavax/servlet/ServletContext;
    .param p2, "wrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/ext/servlet/ServletContextHashModel;->servlet:Ljavax/servlet/GenericServlet;

    .line 89
    iput-object p1, p0, Lfreemarker/ext/servlet/ServletContextHashModel;->servletctx:Ljavax/servlet/ServletContext;

    .line 90
    iput-object p2, p0, Lfreemarker/ext/servlet/ServletContextHashModel;->wrapper:Lfreemarker/template/ObjectWrapper;

    .line 91
    return-void
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
    .line 95
    iget-object v0, p0, Lfreemarker/ext/servlet/ServletContextHashModel;->wrapper:Lfreemarker/template/ObjectWrapper;

    iget-object v1, p0, Lfreemarker/ext/servlet/ServletContextHashModel;->servletctx:Ljavax/servlet/ServletContext;

    invoke-interface {v1, p1}, Ljavax/servlet/ServletContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    return-object v0
.end method

.method public getServlet()Ljavax/servlet/GenericServlet;
    .registers 2

    .prologue
    .line 109
    iget-object v0, p0, Lfreemarker/ext/servlet/ServletContextHashModel;->servlet:Ljavax/servlet/GenericServlet;

    return-object v0
.end method

.method public isEmpty()Z
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lfreemarker/ext/servlet/ServletContextHashModel;->servletctx:Ljavax/servlet/ServletContext;

    invoke-interface {v0}, Ljavax/servlet/ServletContext;->getAttributeNames()Ljava/util/Enumeration;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-nez v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method
