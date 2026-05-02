.class public Lorg/apache/commons/digester/plugins/strategies/FinderFromMethod;
.super Lorg/apache/commons/digester/plugins/RuleFinder;
.source "FinderFromMethod.java"


# static fields
.field public static DFLT_METHOD_ATTR:Ljava/lang/String;


# instance fields
.field private methodAttr:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 39
    const-string v0, "method"

    sput-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromMethod;->DFLT_METHOD_ATTR:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 46
    sget-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromMethod;->DFLT_METHOD_ATTR:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/commons/digester/plugins/strategies/FinderFromMethod;-><init>(Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "methodAttr"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/apache/commons/digester/plugins/RuleFinder;-><init>()V

    .line 51
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromMethod;->methodAttr:Ljava/lang/String;

    .line 52
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
    .line 69
    iget-object v1, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromMethod;->methodAttr:Ljava/lang/String;

    invoke-virtual {p3, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "methodName":Ljava/lang/String;
    if-nez v0, :cond_a

    .line 73
    const/4 v1, 0x0

    .line 76
    :goto_9
    return-object v1

    :cond_a
    new-instance v1, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;

    invoke-direct {v1, p2, v0}, Lorg/apache/commons/digester/plugins/strategies/LoaderFromClass;-><init>(Ljava/lang/Class;Ljava/lang/String;)V

    goto :goto_9
.end method
