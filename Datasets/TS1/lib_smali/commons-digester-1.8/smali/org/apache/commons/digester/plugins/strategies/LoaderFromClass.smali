.class public Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;
.super Lorg/apache/commons/digester/plugins/RuleLoader;
.source "LoaderFromClass.java"


# static fields
.field static class$java$lang$String:Ljava/lang/Class;

.field static class$org$apache$commons$digester$Digester:Ljava/lang/Class;


# instance fields
.field private rulesClass:Ljava/lang/Class;

.field private rulesMethod:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Ljava/lang/String;)V
    .registers 7
    .param p1, "rulesClass"    # Ljava/lang/Class;
    .param p2, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/apache/commons/digester/plugins/RuleLoader;-><init>()V

    .line 51
    invoke-static {p1, p2}, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->locateMethod(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 53
    .local v0, "method":Ljava/lang/reflect/Method;
    if-nez v0, :cond_36

    .line 54
    new-instance v1, Lorg/apache/commons/digester/plugins/PluginException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "rule class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " does not have method "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " or that method has an invalid signature."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 60
    :cond_36
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->rulesClass:Ljava/lang/Class;

    .line 61
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->rulesMethod:Ljava/lang/reflect/Method;

    .line 62
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/reflect/Method;)V
    .registers 3
    .param p1, "rulesClass"    # Ljava/lang/Class;
    .param p2, "rulesMethod"    # Ljava/lang/reflect/Method;

    .prologue
    .line 42
    invoke-direct {p0}, Lorg/apache/commons/digester/plugins/RuleLoader;-><init>()V

    .line 43
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->rulesClass:Ljava/lang/Class;

    .line 44
    iput-object p2, p0, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->rulesMethod:Ljava/lang/reflect/Method;

    .line 45
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 36
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

.method public static locateMethod(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Method;
    .registers 6
    .param p0, "rulesClass"    # Ljava/lang/Class;
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 96
    const/4 v2, 0x2

    new-array v0, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v2, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->class$org$apache$commons$digester$Digester:Ljava/lang/Class;

    if-nez v2, :cond_26

    const-string v2, "org.apache.commons.digester.Digester"

    invoke-static {v2}, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->class$org$apache$commons$digester$Digester:Ljava/lang/Class;

    :goto_10
    aput-object v2, v0, v3

    const/4 v3, 0x1

    sget-object v2, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->class$java$lang$String:Ljava/lang/Class;

    if-nez v2, :cond_29

    const-string v2, "java.lang.String"

    invoke-static {v2}, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->class$java$lang$String:Ljava/lang/Class;

    :goto_1f
    aput-object v2, v0, v3

    .line 97
    .local v0, "paramSpec":[Ljava/lang/Class;
    invoke-static {p0, p1, v0}, Lorg/apache/commons/beanutils/MethodUtils;->getAccessibleMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 100
    .local v1, "rulesMethod":Ljava/lang/reflect/Method;
    return-object v1

    .line 96
    .end local v0    # "paramSpec":[Ljava/lang/Class;
    .end local v1    # "rulesMethod":Ljava/lang/reflect/Method;
    :cond_26
    sget-object v2, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->class$org$apache$commons$digester$Digester:Ljava/lang/Class;

    goto :goto_10

    :cond_29
    sget-object v2, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->class$java$lang$String:Ljava/lang/Class;

    goto :goto_1f
.end method


# virtual methods
.method public addRules(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V
    .registers 10
    .param p1, "d"    # Lorg/apache/commons/digester/Digester;
    .param p2, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-virtual {p1}, Lorg/apache/commons/digester/Digester;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v2

    .line 69
    .local v2, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    .line 70
    .local v0, "debug":Z
    if-eqz v0, :cond_26

    .line 71
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "LoaderFromClass loading rules for plugin at path ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 77
    :cond_26
    const/4 v4, 0x2

    :try_start_27
    new-array v3, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    .line 78
    .local v3, "params":[Ljava/lang/Object;
    iget-object v4, p0, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->rulesMethod:Ljava/lang/reflect/Method;

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_35} :catch_36

    .line 84
    return-void

    .line 80
    .end local v3    # "params":[Ljava/lang/Object;
    :catch_36
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    new-instance v4, Lorg/apache/commons/digester/plugins/PluginException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Unable to invoke rules method "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->rulesMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " on rules class "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->rulesClass:Ljava/lang/Class;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v1}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method
