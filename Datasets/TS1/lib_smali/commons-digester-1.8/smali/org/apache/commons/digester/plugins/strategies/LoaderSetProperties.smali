.class public Lorg/apache/commons/digester/plugins/strategies/LoaderSetProperties;
.super Lorg/apache/commons/digester/plugins/RuleLoader;
.source "LoaderSetProperties.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/commons/digester/plugins/RuleLoader;-><init>()V

    return-void
.end method


# virtual methods
.method public addRules(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V
    .registers 7
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-virtual {p1}, Lorg/apache/commons/digester/Digester;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v1

    .line 44
    .local v1, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    .line 45
    .local v0, "debug":Z
    if-eqz v0, :cond_26

    .line 46
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "LoaderSetProperties loading rules for plugin at path ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 51
    :cond_26
    invoke-virtual {p1, p2}, Lorg/apache/commons/digester/Digester;->addSetProperties(Ljava/lang/String;)V

    .line 52
    return-void
.end method
