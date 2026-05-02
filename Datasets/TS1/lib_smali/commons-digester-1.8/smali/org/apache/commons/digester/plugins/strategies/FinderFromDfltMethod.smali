.class public Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltMethod;
.super Lorg/apache/commons/digester/plugins/RuleFinder;
.source "FinderFromDfltMethod.java"


# static fields
.field public static DFLT_METHOD_NAME:Ljava/lang/String;


# instance fields
.field private methodName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 37
    const-string v0, "addRules"

    sput-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltMethod;->DFLT_METHOD_NAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 43
    sget-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltMethod;->DFLT_METHOD_NAME:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltMethod;-><init>(Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "methodName"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/apache/commons/digester/plugins/RuleFinder;-><init>()V

    .line 54
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltMethod;->methodName:Ljava/lang/String;

    .line 55
    return-void
.end method


# virtual methods
.method public findLoader(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;Ljava/util/Properties;)Lorg/apache/commons/digester/plugins/RuleLoader;
    .registers 6
    .param p1, "d"    # Lorg/apache/commons/digester/Digester;
    .param p2, "pluginClass"    # Ljava/lang/Class;
    .param p3, "p"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 72
    iget-object v1, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltMethod;->methodName:Ljava/lang/String;

    invoke-static {p2, v1}, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;->locateMethod(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 73
    .local v0, "rulesMethod":Ljava/lang/reflect/Method;
    if-nez v0, :cond_a

    .line 74
    const/4 v1, 0x0

    .line 77
    :goto_9
    return-object v1

    :cond_a
    new-instance v1, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;

    invoke-direct {v1, p2, v0}, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;-><init>(Ljava/lang/Class;Ljava/lang/reflect/Method;)V

    goto :goto_9
.end method
