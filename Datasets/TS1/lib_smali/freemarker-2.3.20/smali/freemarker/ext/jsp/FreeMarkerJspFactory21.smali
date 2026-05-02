.class Lfreemarker/ext/jsp/FreeMarkerJspFactory21;
.super Lfreemarker/ext/jsp/FreeMarkerJspFactory;
.source "FreeMarkerJspFactory21.java"


# static fields
.field private static final JSPCTX_KEY:Ljava/lang/String;

.field static class$freemarker$ext$jsp$FreeMarkerJspFactory21:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 11
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    sget-object v0, Lfreemarker/ext/jsp/FreeMarkerJspFactory21;->class$freemarker$ext$jsp$FreeMarkerJspFactory21:Ljava/lang/Class;

    if-nez v0, :cond_26

    const-string v0, "freemarker.ext.jsp.FreeMarkerJspFactory21"

    invoke-static {v0}, Lfreemarker/ext/jsp/FreeMarkerJspFactory21;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/FreeMarkerJspFactory21;->class$freemarker$ext$jsp$FreeMarkerJspFactory21:Ljava/lang/Class;

    :goto_11
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "#jspAppContext"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/FreeMarkerJspFactory21;->JSPCTX_KEY:Ljava/lang/String;

    return-void

    :cond_26
    sget-object v0, Lfreemarker/ext/jsp/FreeMarkerJspFactory21;->class$freemarker$ext$jsp$FreeMarkerJspFactory21:Ljava/lang/Class;

    goto :goto_11
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Lfreemarker/ext/jsp/FreeMarkerJspFactory;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 12
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
.method public getJspApplicationContext(Ljavax/servlet/ServletContext;)Ljavax/servlet/jsp/JspApplicationContext;
    .registers 6
    .param p1, "ctx"    # Ljavax/servlet/ServletContext;

    .prologue
    .line 19
    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerJspFactory21;->JSPCTX_KEY:Ljava/lang/String;

    invoke-interface {p1, v3}, Ljavax/servlet/ServletContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljavax/servlet/jsp/JspApplicationContext;

    .line 21
    .local v1, "jspctx":Ljavax/servlet/jsp/JspApplicationContext;
    if-nez v1, :cond_23

    .line 22
    monitor-enter p1

    .line 23
    :try_start_b
    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerJspFactory21;->JSPCTX_KEY:Ljava/lang/String;

    invoke-interface {p1, v3}, Ljavax/servlet/ServletContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Ljavax/servlet/jsp/JspApplicationContext;

    move-object v1, v0

    .line 24
    if-nez v1, :cond_22

    .line 25
    new-instance v2, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;

    invoke-direct {v2}, Lfreemarker/ext/jsp/FreeMarkerJspApplicationContext;-><init>()V
    :try_end_1c
    .catchall {:try_start_b .. :try_end_1c} :catchall_24

    .line 26
    .end local v1    # "jspctx":Ljavax/servlet/jsp/JspApplicationContext;
    .local v2, "jspctx":Ljavax/servlet/jsp/JspApplicationContext;
    :try_start_1c
    sget-object v3, Lfreemarker/ext/jsp/FreeMarkerJspFactory21;->JSPCTX_KEY:Ljava/lang/String;

    invoke-interface {p1, v3, v2}, Ljavax/servlet/ServletContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_21
    .catchall {:try_start_1c .. :try_end_21} :catchall_27

    move-object v1, v2

    .line 28
    .end local v2    # "jspctx":Ljavax/servlet/jsp/JspApplicationContext;
    .restart local v1    # "jspctx":Ljavax/servlet/jsp/JspApplicationContext;
    :cond_22
    :try_start_22
    monitor-exit p1

    .line 30
    :cond_23
    return-object v1

    .line 28
    :catchall_24
    move-exception v3

    :goto_25
    monitor-exit p1
    :try_end_26
    .catchall {:try_start_22 .. :try_end_26} :catchall_24

    throw v3

    .end local v1    # "jspctx":Ljavax/servlet/jsp/JspApplicationContext;
    .restart local v2    # "jspctx":Ljavax/servlet/jsp/JspApplicationContext;
    :catchall_27
    move-exception v3

    move-object v1, v2

    .end local v2    # "jspctx":Ljavax/servlet/jsp/JspApplicationContext;
    .restart local v1    # "jspctx":Ljavax/servlet/jsp/JspApplicationContext;
    goto :goto_25
.end method

.method protected getSpecificationVersion()Ljava/lang/String;
    .registers 2

    .prologue
    .line 15
    const-string v0, "2.1"

    return-object v0
.end method
