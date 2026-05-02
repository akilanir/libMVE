.class public Lfreemarker/ext/jsp/_FreeMarkerPageContext2;
.super Lfreemarker/ext/jsp/FreeMarkerPageContext;
.source "_FreeMarkerPageContext2.java"


# static fields
.field private static final logger:Lfreemarker/log/Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 23
    const-string v0, "freemarker.jsp"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/_FreeMarkerPageContext2;->logger:Lfreemarker/log/Logger;

    .line 26
    invoke-static {}, Ljavax/servlet/jsp/JspFactory;->getDefaultFactory()Ljavax/servlet/jsp/JspFactory;

    move-result-object v0

    if-nez v0, :cond_16

    .line 27
    new-instance v0, Lfreemarker/ext/jsp/FreeMarkerJspFactory2;

    invoke-direct {v0}, Lfreemarker/ext/jsp/FreeMarkerJspFactory2;-><init>()V

    invoke-static {v0}, Ljavax/servlet/jsp/JspFactory;->setDefaultFactory(Ljavax/servlet/jsp/JspFactory;)V

    .line 29
    :cond_16
    sget-object v0, Lfreemarker/ext/jsp/_FreeMarkerPageContext2;->logger:Lfreemarker/log/Logger;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Using JspFactory implementation class "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-static {}, Ljavax/servlet/jsp/JspFactory;->getDefaultFactory()Ljavax/servlet/jsp/JspFactory;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;)V

    .line 31
    return-void
.end method

.method public constructor <init>()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 34
    invoke-direct {p0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;-><init>()V

    .line 35
    return-void
.end method


# virtual methods
.method public getExpressionEvaluator()Ljavax/servlet/jsp/el/ExpressionEvaluator;
    .registers 5

    .prologue
    .line 44
    :try_start_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    const-string v3, "org.apache.commons.el.ExpressionEvaluatorImpl"

    invoke-virtual {v2, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 46
    .local v1, "type":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/servlet/jsp/el/ExpressionEvaluator;
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_14} :catch_15

    return-object v2

    .line 48
    .end local v1    # "type":Ljava/lang/Class;
    :catch_15
    move-exception v0

    .line 49
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    const-string v3, "In order for the getExpressionEvaluator() method to work, you must have downloaded the apache commons-el jar and made it available in the classpath."

    invoke-direct {v2, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getVariableResolver()Ljavax/servlet/jsp/el/VariableResolver;
    .registers 3

    .prologue
    .line 61
    move-object v0, p0

    .line 63
    .local v0, "ctx":Ljavax/servlet/jsp/PageContext;
    new-instance v1, Lfreemarker/ext/jsp/_FreeMarkerPageContext2$1;

    invoke-direct {v1, p0, v0}, Lfreemarker/ext/jsp/_FreeMarkerPageContext2$1;-><init>(Lfreemarker/ext/jsp/_FreeMarkerPageContext2;Ljavax/servlet/jsp/PageContext;)V

    return-object v1
.end method

.method public include(Ljava/lang/String;Z)V
    .registers 3
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "flush"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavax/servlet/ServletException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-super {p0, p1}, Lfreemarker/ext/jsp/FreeMarkerPageContext;->include(Ljava/lang/String;)V

    .line 75
    return-void
.end method
