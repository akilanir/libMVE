.class public Lorg/apache/commons/digester/plugins/PluginManager;
.super Ljava/lang/Object;
.source "PluginManager.java"


# instance fields
.field private declarationsByClass:Ljava/util/HashMap;

.field private declarationsById:Ljava/util/HashMap;

.field private parent:Lorg/apache/commons/digester/plugins/PluginManager;

.field private pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;


# direct methods
.method public constructor <init>(Lorg/apache/commons/digester/plugins/PluginContext;)V
    .registers 3
    .param p1, "r"    # Lorg/apache/commons/digester/plugins/PluginContext;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginManager;->declarationsByClass:Ljava/util/HashMap;

    .line 45
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginManager;->declarationsById:Ljava/util/HashMap;

    .line 60
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginManager;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    .line 61
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/plugins/PluginManager;)V
    .registers 3
    .param p1, "parent"    # Lorg/apache/commons/digester/plugins/PluginManager;

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginManager;->declarationsByClass:Ljava/util/HashMap;

    .line 45
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginManager;->declarationsById:Ljava/util/HashMap;

    .line 74
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginManager;->parent:Lorg/apache/commons/digester/plugins/PluginManager;

    .line 75
    iget-object v0, p1, Lorg/apache/commons/digester/plugins/PluginManager;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginManager;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    .line 76
    return-void
.end method


# virtual methods
.method public addDeclaration(Lorg/apache/commons/digester/plugins/Declaration;)V
    .registers 8
    .param p1, "decl"    # Lorg/apache/commons/digester/plugins/Declaration;

    .prologue
    .line 90
    const/4 v4, 0x0

    invoke-static {v4}, Lorg/apache/commons/digester/plugins/LogUtils;->getLogger(Lorg/apache/commons/digester/Digester;)Lorg/apache/commons/logging/Log;

    move-result-object v2

    .line 91
    .local v2, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    .line 93
    .local v0, "debug":Z
    invoke-virtual {p1}, Lorg/apache/commons/digester/plugins/Declaration;->getPluginClass()Ljava/lang/Class;

    move-result-object v3

    .line 94
    .local v3, "pluginClass":Ljava/lang/Class;
    invoke-virtual {p1}, Lorg/apache/commons/digester/plugins/Declaration;->getId()Ljava/lang/String;

    move-result-object v1

    .line 96
    .local v1, "id":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/commons/digester/plugins/PluginManager;->declarationsByClass:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    if-eqz v1, :cond_53

    .line 99
    iget-object v4, p0, Lorg/apache/commons/digester/plugins/PluginManager;->declarationsById:Ljava/util/HashMap;

    invoke-virtual {v4, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    if-eqz v0, :cond_53

    .line 101
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Indexing plugin-id ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " -> class ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 106
    :cond_53
    return-void
.end method

.method public findLoader(Lorg/apache/commons/digester/Digester;Ljava/lang/String;Ljava/lang/Class;Ljava/util/Properties;)Lorg/apache/commons/digester/plugins/RuleLoader;
    .registers 15
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "id"    # Ljava/lang/String;
    .param p3, "pluginClass"    # Ljava/lang/Class;
    .param p4, "props"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 155
    invoke-static {p1}, Lorg/apache/commons/digester/plugins/LogUtils;->getLogger(Lorg/apache/commons/digester/Digester;)Lorg/apache/commons/logging/Log;

    move-result-object v4

    .line 156
    .local v4, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    .line 157
    .local v0, "debug":Z
    const-string v7, "scanning ruleFinders to locate loader.."

    invoke-interface {v4, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 159
    iget-object v7, p0, Lorg/apache/commons/digester/plugins/PluginManager;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    invoke-virtual {v7}, Lorg/apache/commons/digester/plugins/PluginContext;->getRuleFinders()Ljava/util/List;

    move-result-object v5

    .line 160
    .local v5, "ruleFinders":Ljava/util/List;
    const/4 v6, 0x0

    .line 162
    .local v6, "ruleLoader":Lorg/apache/commons/digester/plugins/RuleLoader;
    :try_start_14
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 163
    .local v3, "i":Ljava/util/Iterator;
    :goto_18
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z
    :try_end_1b
    .catch Lorg/apache/commons/digester/plugins/PluginException; {:try_start_14 .. :try_end_1b} :catch_51

    move-result v7

    if-eqz v7, :cond_20

    if-eqz v6, :cond_26

    .line 179
    :cond_20
    const-string v7, "scanned ruleFinders."

    invoke-interface {v4, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 181
    return-object v6

    .line 165
    :cond_26
    :try_start_26
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/digester/plugins/RuleFinder;

    .line 166
    .local v2, "finder":Lorg/apache/commons/digester/plugins/RuleFinder;
    if-eqz v0, :cond_4c

    .line 167
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "checking finder of type "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v7}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 169
    :cond_4c
    invoke-virtual {v2, p1, p3, p4}, Lorg/apache/commons/digester/plugins/RuleFinder;->findLoader(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;Ljava/util/Properties;)Lorg/apache/commons/digester/plugins/RuleLoader;
    :try_end_4f
    .catch Lorg/apache/commons/digester/plugins/PluginException; {:try_start_26 .. :try_end_4f} :catch_51

    move-result-object v6

    goto :goto_18

    .line 173
    .end local v2    # "finder":Lorg/apache/commons/digester/plugins/RuleFinder;
    .end local v3    # "i":Ljava/util/Iterator;
    :catch_51
    move-exception v1

    .local v1, "e":Lorg/apache/commons/digester/plugins/PluginException;
    new-instance v7, Lorg/apache/commons/digester/plugins/PluginException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "Unable to locate plugin rules for plugin with id ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, ", and class ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v1}, Lorg/apache/commons/digester/plugins/PluginException;->getMessage()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1}, Lorg/apache/commons/digester/plugins/PluginException;->getCause()Ljava/lang/Throwable;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v7
.end method

.method public getDeclarationByClass(Ljava/lang/String;)Lorg/apache/commons/digester/plugins/Declaration;
    .registers 4
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 113
    iget-object v1, p0, Lorg/apache/commons/digester/plugins/PluginManager;->declarationsByClass:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/digester/plugins/Declaration;

    .line 116
    .local v0, "decl":Lorg/apache/commons/digester/plugins/Declaration;
    if-nez v0, :cond_14

    iget-object v1, p0, Lorg/apache/commons/digester/plugins/PluginManager;->parent:Lorg/apache/commons/digester/plugins/PluginManager;

    if-eqz v1, :cond_14

    .line 117
    iget-object v1, p0, Lorg/apache/commons/digester/plugins/PluginManager;->parent:Lorg/apache/commons/digester/plugins/PluginManager;

    invoke-virtual {v1, p1}, Lorg/apache/commons/digester/plugins/PluginManager;->getDeclarationByClass(Ljava/lang/String;)Lorg/apache/commons/digester/plugins/Declaration;

    move-result-object v0

    .line 120
    :cond_14
    return-object v0
.end method

.method public getDeclarationById(Ljava/lang/String;)Lorg/apache/commons/digester/plugins/Declaration;
    .registers 4
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 131
    iget-object v1, p0, Lorg/apache/commons/digester/plugins/PluginManager;->declarationsById:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/digester/plugins/Declaration;

    .line 133
    .local v0, "decl":Lorg/apache/commons/digester/plugins/Declaration;
    if-nez v0, :cond_14

    iget-object v1, p0, Lorg/apache/commons/digester/plugins/PluginManager;->parent:Lorg/apache/commons/digester/plugins/PluginManager;

    if-eqz v1, :cond_14

    .line 134
    iget-object v1, p0, Lorg/apache/commons/digester/plugins/PluginManager;->parent:Lorg/apache/commons/digester/plugins/PluginManager;

    invoke-virtual {v1, p1}, Lorg/apache/commons/digester/plugins/PluginManager;->getDeclarationById(Ljava/lang/String;)Lorg/apache/commons/digester/plugins/Declaration;

    move-result-object v0

    .line 137
    :cond_14
    return-object v0
.end method
