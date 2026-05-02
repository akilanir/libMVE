.class public Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;
.super Lorg/apache/commons/digester/plugins/RuleFinder;
.source "FinderFromClass.java"


# static fields
.field public static DFLT_METHOD_ATTR:Ljava/lang/String;

.field public static DFLT_METHOD_NAME:Ljava/lang/String;

.field public static DFLT_RULECLASS_ATTR:Ljava/lang/String;


# instance fields
.field private dfltMethodName:Ljava/lang/String;

.field private methodAttr:Ljava/lang/String;

.field private ruleClassAttr:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    const-string v0, "ruleclass"

    sput-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;->DFLT_RULECLASS_ATTR:Ljava/lang/String;

    .line 36
    const-string v0, "method"

    sput-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;->DFLT_METHOD_ATTR:Ljava/lang/String;

    .line 37
    const-string v0, "addRules"

    sput-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;->DFLT_METHOD_NAME:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public constructor <init>()V
    .registers 4

    .prologue
    .line 47
    sget-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;->DFLT_RULECLASS_ATTR:Ljava/lang/String;

    sget-object v1, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;->DFLT_METHOD_ATTR:Ljava/lang/String;

    sget-object v2, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;->DFLT_METHOD_NAME:Ljava/lang/String;

    invoke-direct {p0, v0, v1, v2}, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "ruleClassAttr"    # Ljava/lang/String;
    .param p2, "methodAttr"    # Ljava/lang/String;
    .param p3, "dfltMethodName"    # Ljava/lang/String;

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/apache/commons/digester/plugins/RuleFinder;-><init>()V

    .line 61
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;->ruleClassAttr:Ljava/lang/String;

    .line 62
    iput-object p2, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;->methodAttr:Ljava/lang/String;

    .line 63
    iput-object p3, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;->dfltMethodName:Ljava/lang/String;

    .line 64
    return-void
.end method


# virtual methods
.method public findLoader(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;Ljava/util/Properties;)Lorg/apache/commons/digester/plugins/RuleLoader;
    .registers 11
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "pluginClass"    # Ljava/lang/Class;
    .param p3, "p"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 96
    iget-object v4, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;->ruleClassAttr:Ljava/lang/String;

    invoke-virtual {p3, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 97
    .local v3, "ruleClassName":Ljava/lang/String;
    if-nez v3, :cond_a

    .line 100
    const/4 v4, 0x0

    .line 125
    :goto_9
    return-object v4

    .line 104
    :cond_a
    const/4 v1, 0x0

    .line 105
    .local v1, "methodName":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;->methodAttr:Ljava/lang/String;

    if-eqz v4, :cond_15

    .line 106
    iget-object v4, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;->methodAttr:Ljava/lang/String;

    invoke-virtual {p3, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 108
    :cond_15
    if-nez v1, :cond_19

    .line 109
    iget-object v1, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;->dfltMethodName:Ljava/lang/String;

    .line 111
    :cond_19
    if-nez v1, :cond_1d

    .line 112
    sget-object v1, Lorg/apache/commons/digester/plugins/strategies/FinderFromClass;->DFLT_METHOD_NAME:Ljava/lang/String;

    .line 118
    :cond_1d
    :try_start_1d
    invoke-virtual {p1}, Lorg/apache/commons/digester/Digester;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_24
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1d .. :try_end_24} :catch_2b

    move-result-object v2

    .line 125
    .local v2, "ruleClass":Ljava/lang/Class;
    new-instance v4, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;

    invoke-direct {v4, v2, v1}, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    goto :goto_9

    .line 121
    .end local v2    # "ruleClass":Ljava/lang/Class;
    :catch_2b
    move-exception v0

    .local v0, "cnfe":Ljava/lang/ClassNotFoundException;
    new-instance v4, Lorg/apache/commons/digester/plugins/PluginException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Unable to load class "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v0}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method
