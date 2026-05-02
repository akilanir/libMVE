.class public Lfreemarker/ext/jsp/_FreeMarkerPageContext21;
.super Lfreemarker/ext/jsp/FreeMarkerPageContext;
.source "_FreeMarkerPageContext21.java"


# static fields
.field static class$javax$servlet$jsp$JspContext:Ljava/lang/Class;

.field private static final logger:Lfreemarker/log/Logger;


# instance fields
.field private elContext:Ljavax/el/ELContext;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 28
    const-string v0, "freemarker.jsp"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/_FreeMarkerPageContext21;->logger:Lfreemarker/log/Logger;

    .line 31
    invoke-static {}, Ljavax/servlet/jsp/JspFactory;->getDefaultFactory()Ljavax/servlet/jsp/JspFactory;

    move-result-object v0

    if-nez v0, :cond_16

    .line 32
    new-instance v0, Lfreemarker/ext/jsp/FreeMarkerJspFactory21;

    invoke-direct {v0}, Lfreemarker/ext/jsp/FreeMarkerJspFactory21;-><init>()V

    invoke-static {v0}, Ljavax/servlet/jsp/JspFactory;->setDefaultFactory(Ljavax/servlet/jsp/JspFactory;)V

    .line 34
    :cond_16
    sget-object v0, Lfreemarker/ext/jsp/_FreeMarkerPageContext21;->logger:Lfreemarker/log/Logger;

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

    .line 36
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
    .line 39
    invoke-direct {p0}, Lfreemarker/ext/jsp/FreeMarkerPageContext;-><init>()V

    .line 40
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 87
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


# virtual methods
.method public getELContext()Ljavax/el/ELContext;
    .registers 4

    .prologue
    .line 83
    iget-object v1, p0, Lfreemarker/ext/jsp/_FreeMarkerPageContext21;->elContext:Ljavax/el/ELContext;

    if-nez v1, :cond_2d

    .line 84
    invoke-static {}, Ljavax/servlet/jsp/JspFactory;->getDefaultFactory()Ljavax/servlet/jsp/JspFactory;

    move-result-object v1

    invoke-virtual {p0}, Lfreemarker/ext/jsp/_FreeMarkerPageContext21;->getServletContext()Ljavax/servlet/ServletContext;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljavax/servlet/jsp/JspFactory;->getJspApplicationContext(Ljavax/servlet/ServletContext;)Ljavax/servlet/jsp/JspApplicationContext;

    move-result-object v0

    .line 85
    .local v0, "jspctx":Ljavax/servlet/jsp/JspApplicationContext;
    instance-of v1, v0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;

    if-eqz v1, :cond_33

    .line 86
    check-cast v0, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;

    .end local v0    # "jspctx":Ljavax/servlet/jsp/JspApplicationContext;
    invoke-virtual {v0, p0}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;->createNewELContext(Lfreemarker/ext/jsp/FreeMarkerPageContext;)Ljavax/el/ELContext;

    move-result-object v1

    iput-object v1, p0, Lfreemarker/ext/jsp/_FreeMarkerPageContext21;->elContext:Ljavax/el/ELContext;

    .line 87
    iget-object v2, p0, Lfreemarker/ext/jsp/_FreeMarkerPageContext21;->elContext:Ljavax/el/ELContext;

    sget-object v1, Lfreemarker/ext/jsp/_FreeMarkerPageContext21;->class$javax$servlet$jsp$JspContext:Ljava/lang/Class;

    if-nez v1, :cond_30

    const-string v1, "javax.servlet.jsp.JspContext"

    invoke-static {v1}, Lfreemarker/ext/jsp/_FreeMarkerPageContext21;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/ext/jsp/_FreeMarkerPageContext21;->class$javax$servlet$jsp$JspContext:Ljava/lang/Class;

    :goto_2a
    invoke-virtual {v2, v1, p0}, Ljavax/el/ELContext;->putContext(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 96
    :cond_2d
    iget-object v1, p0, Lfreemarker/ext/jsp/_FreeMarkerPageContext21;->elContext:Ljavax/el/ELContext;

    return-object v1

    .line 87
    :cond_30
    sget-object v1, Lfreemarker/ext/jsp/_FreeMarkerPageContext21;->class$javax$servlet$jsp$JspContext:Ljava/lang/Class;

    goto :goto_2a

    .line 90
    .restart local v0    # "jspctx":Ljavax/servlet/jsp/JspApplicationContext;
    :cond_33
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    const-string v2, "Can not create an ELContext using a foreign JspApplicationContext\nConsider dropping a private instance of JSP 2.1 API JAR file in\nyour WEB-INF/lib directory and then try again."

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getExpressionEvaluator()Ljavax/servlet/jsp/el/ExpressionEvaluator;
    .registers 5

    .prologue
    .line 49
    :try_start_0
    new-instance v2, Lfreemarker/ext/jsp/_FreeMarkerPageContext21$1;

    invoke-direct {v2, p0}, Lfreemarker/ext/jsp/_FreeMarkerPageContext21$1;-><init>(Lfreemarker/ext/jsp/_FreeMarkerPageContext21;)V

    invoke-static {v2}, Ljava/security/AccessController;->doPrivileged(Ljava/security/PrivilegedAction;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ClassLoader;

    const-string v3, "org.apache.commons.el.ExpressionEvaluatorImpl"

    invoke-virtual {v2, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 56
    .local v1, "type":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/servlet/jsp/el/ExpressionEvaluator;
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_17} :catch_18

    return-object v2

    .line 58
    .end local v1    # "type":Ljava/lang/Class;
    :catch_18
    move-exception v0

    .line 59
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/UnsupportedOperationException;

    const-string v3, "In order for the getExpressionEvaluator() method to work, you must have downloaded the apache commons-el jar and made it available in the classpath."

    invoke-direct {v2, v3}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getVariableResolver()Ljavax/servlet/jsp/el/VariableResolver;
    .registers 3

    .prologue
    .line 71
    move-object v0, p0

    .line 73
    .local v0, "ctx":Ljavax/servlet/jsp/PageContext;
    new-instance v1, Lfreemarker/ext/jsp/_FreeMarkerPageContext21$2;

    invoke-direct {v1, p0, v0}, Lfreemarker/ext/jsp/_FreeMarkerPageContext21$2;-><init>(Lfreemarker/ext/jsp/_FreeMarkerPageContext21;Ljavax/servlet/jsp/PageContext;)V

    return-object v1
.end method
