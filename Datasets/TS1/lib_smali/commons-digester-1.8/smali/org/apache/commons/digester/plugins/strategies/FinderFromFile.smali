.class public Lorg/apache/commons/digester/plugins/strategies/FinderFromFile;
.super Lorg/apache/commons/digester/plugins/RuleFinder;
.source "FinderFromFile.java"


# static fields
.field public static DFLT_FILENAME_ATTR:Ljava/lang/String;


# instance fields
.field private filenameAttr:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 45
    const-string v0, "file"

    sput-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromFile;->DFLT_FILENAME_ATTR:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 52
    sget-object v0, Lorg/apache/commons/digester/plugins/strategies/FinderFromFile;->DFLT_FILENAME_ATTR:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/commons/digester/plugins/strategies/FinderFromFile;-><init>(Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "filenameAttr"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/apache/commons/digester/plugins/RuleFinder;-><init>()V

    .line 57
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromFile;->filenameAttr:Ljava/lang/String;

    .line 58
    return-void
.end method


# virtual methods
.method public findLoader(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;Ljava/util/Properties;)Lorg/apache/commons/digester/plugins/RuleLoader;
    .registers 12
    .param p1, "d"    # Lorg/apache/commons/digester/Digester;
    .param p2, "pluginClass"    # Ljava/lang/Class;
    .param p3, "p"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/strategies/FinderFromFile;->filenameAttr:Ljava/lang/String;

    invoke-virtual {p3, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 74
    .local v4, "rulesFileName":Ljava/lang/String;
    if-nez v4, :cond_a

    .line 77
    const/4 v3, 0x0

    .line 90
    :goto_9
    return-object v3

    .line 80
    :cond_a
    const/4 v2, 0x0

    .line 82
    .local v2, "is":Ljava/io/InputStream;
    :try_start_b
    new-instance v2, Ljava/io/FileInputStream;

    .end local v2    # "is":Ljava/io/InputStream;
    invoke-direct {v2, v4}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_10} :catch_39

    .line 89
    .restart local v2    # "is":Ljava/io/InputStream;
    :try_start_10
    new-instance v3, Lorg/apache/commons/digester/plugins/strategies/LoaderFromStream;

    invoke-direct {v3, v2}, Lorg/apache/commons/digester/plugins/strategies/LoaderFromStream;-><init>(Ljava/io/InputStream;)V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_15} :catch_59
    .catchall {:try_start_10 .. :try_end_15} :catchall_79

    .line 97
    .local v3, "loader":Lorg/apache/commons/digester/plugins/RuleLoader;
    :try_start_15
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_18} :catch_19

    goto :goto_9

    .line 99
    :catch_19
    move-exception v1

    .local v1, "ioe":Ljava/io/IOException;
    new-instance v5, Lorg/apache/commons/digester/plugins/PluginException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Unable to close stream for file ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v1}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 84
    .end local v1    # "ioe":Ljava/io/IOException;
    .end local v2    # "is":Ljava/io/InputStream;
    .end local v3    # "loader":Lorg/apache/commons/digester/plugins/RuleLoader;
    :catch_39
    move-exception v1

    .restart local v1    # "ioe":Ljava/io/IOException;
    new-instance v5, Lorg/apache/commons/digester/plugins/PluginException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Unable to process file ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v1}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 92
    .end local v1    # "ioe":Ljava/io/IOException;
    .restart local v2    # "is":Ljava/io/InputStream;
    :catch_59
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    :try_start_5a
    new-instance v5, Lorg/apache/commons/digester/plugins/PluginException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Unable to load xmlrules from file ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
    :try_end_79
    .catchall {:try_start_5a .. :try_end_79} :catchall_79

    .line 96
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_79
    move-exception v5

    .line 97
    :try_start_7a
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_7d
    .catch Ljava/io/IOException; {:try_start_7a .. :try_end_7d} :catch_7e

    .line 96
    throw v5

    .line 99
    :catch_7e
    move-exception v1

    .restart local v1    # "ioe":Ljava/io/IOException;
    new-instance v5, Lorg/apache/commons/digester/plugins/PluginException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Unable to close stream for file ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v1}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method
