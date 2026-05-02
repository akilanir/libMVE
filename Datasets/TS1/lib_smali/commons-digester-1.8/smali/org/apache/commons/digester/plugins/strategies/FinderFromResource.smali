.class public Lorg/apache/commons/digester/plugins/strategies/FinderFromResource;
.super Lorg/apache/commons/digester/plugins/RuleFinder;
.source "FinderFromResource.java"


# static fields
.field public static DFLT_RESOURCE_ATTR:Ljava/lang/String;


# instance fields
.field private resourceAttr:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const-string v0, "resource"

    sput-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromResource;->DFLT_RESOURCE_ATTR:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 49
    sget-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromResource;->DFLT_RESOURCE_ATTR:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/commons/digester/plugins/strategies/FinderFromResource;-><init>(Ljava/lang/String;)V

    .line 50
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "resourceAttr"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/apache/commons/digester/plugins/RuleFinder;-><init>()V

    .line 54
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromResource;->resourceAttr:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public static loadRules(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;Ljava/io/InputStream;Ljava/lang/String;)Lorg/apache/commons/digester/plugins/RuleLoader;
    .registers 10
    .param p0, "d"    # Lorg/apache/commons/digester/Digester;
    .param p1, "pluginClass"    # Ljava/lang/Class;
    .param p2, "is"    # Ljava/io/InputStream;
    .param p3, "resourceName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 105
    :try_start_0
    new-instance v2, Lorg/apache/commons/digester/plugins/strategies/LoaderFromStream;

    invoke-direct {v2, p2}, Lorg/apache/commons/digester/plugins/strategies/LoaderFromStream;-><init>(Ljava/io/InputStream;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_9
    .catchall {:try_start_0 .. :try_end_5} :catchall_29

    .line 113
    .local v2, "loader":Lorg/apache/commons/digester/plugins/RuleLoader;
    :try_start_5
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_8} :catch_4e

    .line 106
    return-object v2

    .line 108
    .end local v2    # "loader":Lorg/apache/commons/digester/plugins/RuleLoader;
    :catch_9
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    :try_start_a
    new-instance v3, Lorg/apache/commons/digester/plugins/PluginException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Unable to load xmlrules from resource ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
    :try_end_29
    .catchall {:try_start_a .. :try_end_29} :catchall_29

    .line 112
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_29
    move-exception v3

    .line 113
    :try_start_2a
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_2d} :catch_2e

    .line 112
    throw v3

    .line 115
    :catch_2e
    move-exception v1

    .local v1, "ioe":Ljava/io/IOException;
    new-instance v3, Lorg/apache/commons/digester/plugins/PluginException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Unable to close stream for resource ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .end local v1    # "ioe":Ljava/io/IOException;
    .restart local v2    # "loader":Lorg/apache/commons/digester/plugins/RuleLoader;
    :catch_4e
    move-exception v1

    .restart local v1    # "ioe":Ljava/io/IOException;
    new-instance v3, Lorg/apache/commons/digester/plugins/PluginException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Unable to close stream for resource ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v1}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method


# virtual methods
.method public findLoader(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;Ljava/util/Properties;)Lorg/apache/commons/digester/plugins/RuleLoader;
    .registers 9
    .param p1, "d"    # Lorg/apache/commons/digester/Digester;
    .param p2, "pluginClass"    # Ljava/lang/Class;
    .param p3, "p"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v2, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromResource;->resourceAttr:Ljava/lang/String;

    invoke-virtual {p3, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 71
    .local v1, "resourceName":Ljava/lang/String;
    if-nez v1, :cond_a

    .line 74
    const/4 v2, 0x0

    .line 86
    :goto_9
    return-object v2

    .line 77
    :cond_a
    invoke-virtual {p2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    .line 81
    .local v0, "is":Ljava/io/InputStream;
    if-nez v0, :cond_33

    .line 82
    new-instance v2, Lorg/apache/commons/digester/plugins/PluginException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Resource "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " not found."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 86
    :cond_33
    invoke-static {p1, p2, v0, v1}, Lorg/apache/commons/digester/plugins/strategies/FinderFromResource;->loadRules(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;Ljava/io/InputStream;Ljava/lang/String;)Lorg/apache/commons/digester/plugins/RuleLoader;

    move-result-object v2

    goto :goto_9
.end method
