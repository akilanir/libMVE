.class public Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltResource;
.super Lorg/apache/commons/digester/plugins/RuleFinder;
.source "FinderFromDfltResource.java"


# static fields
.field public static DFLT_RESOURCE_SUFFIX:Ljava/lang/String;


# instance fields
.field private resourceSuffix:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 40
    const-string v0, "RuleInfo.xml"

    sput-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltResource;->DFLT_RESOURCE_SUFFIX:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 46
    sget-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltResource;->DFLT_RESOURCE_SUFFIX:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltResource;-><init>(Ljava/lang/String;)V

    .line 47
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "resourceSuffix"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/apache/commons/digester/plugins/RuleFinder;-><init>()V

    .line 57
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltResource;->resourceSuffix:Ljava/lang/String;

    .line 58
    return-void
.end method


# virtual methods
.method public findLoader(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;Ljava/util/Properties;)Lorg/apache/commons/digester/plugins/RuleLoader;
    .registers 10
    .param p1, "d"    # Lorg/apache/commons/digester/Digester;
    .param p2, "pluginClass"    # Ljava/lang/Class;
    .param p3, "p"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 74
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x2e

    const/16 v5, 0x2f

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromDfltResource;->resourceSuffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 78
    .local v1, "resourceName":Ljava/lang/String;
    invoke-virtual {p2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 82
    .local v0, "is":Ljava/io/InputStream;
    if-nez v0, :cond_2b

    .line 84
    const/4 v2, 0x0

    .line 87
    :goto_2a
    return-object v2

    :cond_2b
    invoke-static {p1, p2, v0, v1}, Lorg/apache/commons/digester/plugins/strategies/FinderFromResource;->loadRules(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;Ljava/io/InputStream;Ljava/lang/String;)Lorg/apache/commons/digester/plugins/RuleLoader;

    move-result-object v2

    goto :goto_2a
.end method
