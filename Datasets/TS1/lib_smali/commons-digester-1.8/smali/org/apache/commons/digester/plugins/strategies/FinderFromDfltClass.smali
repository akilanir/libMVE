.class public Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltClass;
.super Lorg/apache/commons/digester/plugins/RuleFinder;
.source "FinderFromDfltClass.java"


# static fields
.field public static DFLT_METHOD_NAME:Ljava/lang/String;

.field public static DFLT_RULECLASS_SUFFIX:Ljava/lang/String;


# instance fields
.field private methodName:Ljava/lang/String;

.field private rulesClassSuffix:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    const-string v0, "RuleInfo"

    sput-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltClass;->DFLT_RULECLASS_SUFFIX:Ljava/lang/String;

    .line 36
    const-string v0, "addRules"

    sput-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltClass;->DFLT_METHOD_NAME:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 43
    sget-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltClass;->DFLT_RULECLASS_SUFFIX:Ljava/lang/String;

    sget-object v1, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltClass;->DFLT_METHOD_NAME:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltClass;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "rulesClassSuffix"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/apache/commons/digester/plugins/RuleFinder;-><init>()V

    .line 55
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltClass;->rulesClassSuffix:Ljava/lang/String;

    .line 56
    iput-object p2, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltClass;->methodName:Ljava/lang/String;

    .line 57
    return-void
.end method


# virtual methods
.method public findLoader(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;Ljava/util/Properties;)Lorg/apache/commons/digester/plugins/RuleLoader;
    .registers 8
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "pluginClass"    # Ljava/lang/Class;
    .param p3, "p"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 75
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltClass;->rulesClassSuffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 77
    .local v1, "rulesClassName":Ljava/lang/String;
    const/4 v0, 0x0

    .line 79
    .local v0, "rulesClass":Ljava/lang/Class;
    :try_start_18
    invoke-virtual {p1}, Lorg/apache/commons/digester/Digester;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1f
    .catch Ljava/lang/ClassNotFoundException; {:try_start_18 .. :try_end_1f} :catch_34

    move-result-object v0

    .line 84
    :goto_20
    if-nez v0, :cond_24

    .line 86
    const/4 v2, 0x0

    .line 93
    :goto_23
    return-object v2

    .line 89
    :cond_24
    iget-object v2, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltClass;->methodName:Ljava/lang/String;

    if-nez v2, :cond_2c

    .line 90
    sget-object v2, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltClass;->DFLT_METHOD_NAME:Ljava/lang/String;

    iput-object v2, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltClass;->methodName:Ljava/lang/String;

    .line 93
    :cond_2c
    new-instance v2, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;

    iget-object v3, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltClass;->methodName:Ljava/lang/String;

    invoke-direct {v2, v0, v3}, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    goto :goto_23

    .line 80
    :catch_34
    move-exception v2

    goto :goto_20
.end method
