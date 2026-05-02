.class Lfreemarker/ext/jsp/PageContextFactory;
.super Ljava/lang/Object;
.source "PageContextFactory.java"


# static fields
.field static class$javax$servlet$jsp$PageContext:Ljava/lang/Class;

.field private static final pageContextImpl:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 14
    invoke-static {}, Lfreemarker/ext/jsp/PageContextFactory;->getPageContextImpl()Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/PageContextFactory;->pageContextImpl:Ljava/lang/Class;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 19
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

.method static getCurrentPageContext()Lfreemarker/ext/jsp/FreeMarkerPageContext;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 38
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v1

    .line 39
    .local v1, "env":Lfreemarker/core/Environment;
    const-string v4, "javax.servlet.jsp.jspPageContext"

    invoke-virtual {v1, v4}, Lfreemarker/core/Environment;->getGlobalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    .line 40
    .local v3, "pageContextModel":Lfreemarker/template/TemplateModel;
    instance-of v4, v3, Lfreemarker/ext/jsp/FreeMarkerPageContext;

    if-eqz v4, :cond_11

    .line 41
    check-cast v3, Lfreemarker/ext/jsp/FreeMarkerPageContext;

    .line 47
    .end local v3    # "pageContextModel":Lfreemarker/template/TemplateModel;
    :goto_10
    return-object v3

    .line 44
    .restart local v3    # "pageContextModel":Lfreemarker/template/TemplateModel;
    :cond_11
    :try_start_11
    sget-object v4, Lfreemarker/ext/jsp/PageContextFactory;->pageContextImpl:Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/ext/jsp/FreeMarkerPageContext;

    .line 46
    .local v2, "pageContext":Lfreemarker/ext/jsp/FreeMarkerPageContext;
    const-string v4, "javax.servlet.jsp.jspPageContext"

    invoke-virtual {v1, v4, v2}, Lfreemarker/core/Environment;->setGlobalVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V
    :try_end_1e
    .catch Ljava/lang/IllegalAccessException; {:try_start_11 .. :try_end_1e} :catch_20
    .catch Ljava/lang/InstantiationException; {:try_start_11 .. :try_end_1e} :catch_2b

    move-object v3, v2

    .line 47
    goto :goto_10

    .line 49
    .end local v2    # "pageContext":Lfreemarker/ext/jsp/FreeMarkerPageContext;
    :catch_20
    move-exception v0

    .line 50
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v4, Ljava/lang/IllegalAccessError;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw v4

    .line 52
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_2b
    move-exception v0

    .line 53
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v4, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v4, v0}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method private static getPageContextImpl()Ljava/lang/Class;
    .registers 6

    .prologue
    .line 19
    :try_start_0
    sget-object v3, Lfreemarker/ext/jsp/PageContextFactory;->class$javax$servlet$jsp$PageContext:Ljava/lang/Class;

    if-nez v3, :cond_1c

    const-string v3, "javax.servlet.jsp.PageContext"

    invoke-static {v3}, Lfreemarker/ext/jsp/PageContextFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lfreemarker/ext/jsp/PageContextFactory;->class$javax$servlet$jsp$PageContext:Ljava/lang/Class;

    move-object v4, v3

    :goto_d
    const-string v5, "getELContext"

    const/4 v3, 0x0

    check-cast v3, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 20
    const-string v3, "freemarker.ext.jsp._FreeMarkerPageContext21"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 28
    .local v1, "e1":Ljava/lang/NoSuchMethodException;
    :goto_1b
    return-object v3

    .line 19
    .end local v1    # "e1":Ljava/lang/NoSuchMethodException;
    :cond_1c
    sget-object v3, Lfreemarker/ext/jsp/PageContextFactory;->class$javax$servlet$jsp$PageContext:Ljava/lang/Class;
    :try_end_1e
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_1e} :catch_20
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_1e} :catch_49

    move-object v4, v3

    goto :goto_d

    .line 22
    :catch_20
    move-exception v1

    .line 24
    .restart local v1    # "e1":Ljava/lang/NoSuchMethodException;
    :try_start_21
    sget-object v3, Lfreemarker/ext/jsp/PageContextFactory;->class$javax$servlet$jsp$PageContext:Ljava/lang/Class;

    if-nez v3, :cond_3d

    const-string v3, "javax.servlet.jsp.PageContext"

    invoke-static {v3}, Lfreemarker/ext/jsp/PageContextFactory;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lfreemarker/ext/jsp/PageContextFactory;->class$javax$servlet$jsp$PageContext:Ljava/lang/Class;

    move-object v4, v3

    :goto_2e
    const-string v5, "getExpressionEvaluator"

    const/4 v3, 0x0

    check-cast v3, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 25
    const-string v3, "freemarker.ext.jsp._FreeMarkerPageContext2"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    goto :goto_1b

    .line 24
    :cond_3d
    sget-object v3, Lfreemarker/ext/jsp/PageContextFactory;->class$javax$servlet$jsp$PageContext:Ljava/lang/Class;
    :try_end_3f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_21 .. :try_end_3f} :catch_41
    .catch Ljava/lang/ClassNotFoundException; {:try_start_21 .. :try_end_3f} :catch_49

    move-object v4, v3

    goto :goto_2e

    .line 27
    :catch_41
    move-exception v2

    .line 28
    .local v2, "e2":Ljava/lang/NoSuchMethodException;
    :try_start_42
    const-string v3, "freemarker.ext.jsp._FreeMarkerPageContext1"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_47
    .catch Ljava/lang/ClassNotFoundException; {:try_start_42 .. :try_end_47} :catch_49

    move-result-object v3

    goto :goto_1b

    .line 32
    .end local v2    # "e2":Ljava/lang/NoSuchMethodException;
    :catch_49
    move-exception v0

    .line 33
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v3, Ljava/lang/NoClassDefFoundError;

    .end local v1    # "e1":Ljava/lang/NoSuchMethodException;
    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v3
.end method
