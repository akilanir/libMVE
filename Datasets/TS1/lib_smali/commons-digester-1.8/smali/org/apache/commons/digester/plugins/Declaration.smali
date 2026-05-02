.class public Lorg/apache/commons/digester/plugins/Declaration;
.super Ljava/lang/Object;
.source "Declaration.java"


# instance fields
.field private id:Ljava/lang/String;

.field private initialized:Z

.field private pluginClass:Ljava/lang/Class;

.field private pluginClassName:Ljava/lang/String;

.field private properties:Ljava/util/Properties;

.field private ruleLoader:Lorg/apache/commons/digester/plugins/RuleLoader;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 3
    .param p1, "pluginClass"    # Ljava/lang/Class;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/Declaration;->properties:Ljava/util/Properties;

    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/digester/plugins/Declaration;->initialized:Z

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/Declaration;->ruleLoader:Lorg/apache/commons/digester/plugins/RuleLoader;

    .line 72
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/Declaration;->pluginClass:Ljava/lang/Class;

    .line 73
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/Declaration;->pluginClassName:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Lorg/apache/commons/digester/plugins/RuleLoader;)V
    .registers 4
    .param p1, "pluginClass"    # Ljava/lang/Class;
    .param p2, "ruleLoader"    # Lorg/apache/commons/digester/plugins/RuleLoader;

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/Declaration;->properties:Ljava/util/Properties;

    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/digester/plugins/Declaration;->initialized:Z

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/Declaration;->ruleLoader:Lorg/apache/commons/digester/plugins/RuleLoader;

    .line 82
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/Declaration;->pluginClass:Ljava/lang/Class;

    .line 83
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/Declaration;->pluginClassName:Ljava/lang/String;

    .line 84
    iput-object p2, p0, Lorg/apache/commons/digester/plugins/Declaration;->ruleLoader:Lorg/apache/commons/digester/plugins/RuleLoader;

    .line 85
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "pluginClassName"    # Ljava/lang/String;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/Declaration;->properties:Ljava/util/Properties;

    .line 47
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/digester/plugins/Declaration;->initialized:Z

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/Declaration;->ruleLoader:Lorg/apache/commons/digester/plugins/RuleLoader;

    .line 65
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/Declaration;->pluginClassName:Ljava/lang/String;

    .line 66
    return-void
.end method


# virtual methods
.method public configure(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V
    .registers 7
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 202
    invoke-virtual {p1}, Lorg/apache/commons/digester/Digester;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v1

    .line 203
    .local v1, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    .line 204
    .local v0, "debug":Z
    if-eqz v0, :cond_f

    .line 205
    const-string v2, "configure being called!"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 208
    :cond_f
    iget-boolean v2, p0, Lorg/apache/commons/digester/plugins/Declaration;->initialized:Z

    if-nez v2, :cond_1b

    .line 209
    new-instance v2, Lorg/apache/commons/digester/plugins/PluginAssertionFailure;

    const-string v3, "Not initialized."

    invoke-direct {v2, v3}, Lorg/apache/commons/digester/plugins/PluginAssertionFailure;-><init>(Ljava/lang/String;)V

    throw v2

    .line 212
    :cond_1b
    iget-object v2, p0, Lorg/apache/commons/digester/plugins/Declaration;->ruleLoader:Lorg/apache/commons/digester/plugins/RuleLoader;

    if-eqz v2, :cond_24

    .line 213
    iget-object v2, p0, Lorg/apache/commons/digester/plugins/Declaration;->ruleLoader:Lorg/apache/commons/digester/plugins/RuleLoader;

    invoke-virtual {v2, p1, p2}, Lorg/apache/commons/digester/plugins/RuleLoader;->addRules(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V

    .line 215
    :cond_24
    return-void
.end method

.method public getId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 107
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/Declaration;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getPluginClass()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/Declaration;->pluginClass:Ljava/lang/Class;

    return-object v0
.end method

.method public init(Lorg/apache/commons/digester/Digester;Lorg/apache/commons/digester/plugins/PluginManager;)V
    .registers 9
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "pm"    # Lorg/apache/commons/digester/plugins/PluginManager;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 143
    invoke-virtual {p1}, Lorg/apache/commons/digester/Digester;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v2

    .line 144
    .local v2, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    .line 145
    .local v1, "debug":Z
    if-eqz v1, :cond_f

    .line 146
    const-string v3, "init being called!"

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 149
    :cond_f
    iget-boolean v3, p0, Lorg/apache/commons/digester/plugins/Declaration;->initialized:Z

    if-eqz v3, :cond_1b

    .line 150
    new-instance v3, Lorg/apache/commons/digester/plugins/PluginAssertionFailure;

    const-string v4, "Init called multiple times."

    invoke-direct {v3, v4}, Lorg/apache/commons/digester/plugins/PluginAssertionFailure;-><init>(Ljava/lang/String;)V

    throw v3

    .line 153
    :cond_1b
    iget-object v3, p0, Lorg/apache/commons/digester/plugins/Declaration;->pluginClass:Ljava/lang/Class;

    if-nez v3, :cond_2f

    iget-object v3, p0, Lorg/apache/commons/digester/plugins/Declaration;->pluginClassName:Ljava/lang/String;

    if-eqz v3, :cond_2f

    .line 156
    :try_start_23
    invoke-virtual {p1}, Lorg/apache/commons/digester/Digester;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/digester/plugins/Declaration;->pluginClassName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/commons/digester/plugins/Declaration;->pluginClass:Ljava/lang/Class;
    :try_end_2f
    .catch Ljava/lang/ClassNotFoundException; {:try_start_23 .. :try_end_2f} :catch_86

    .line 164
    :cond_2f
    iget-object v3, p0, Lorg/apache/commons/digester/plugins/Declaration;->ruleLoader:Lorg/apache/commons/digester/plugins/RuleLoader;

    if-nez v3, :cond_a2

    .line 167
    const-string v3, "Searching for ruleloader..."

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 168
    iget-object v3, p0, Lorg/apache/commons/digester/plugins/Declaration;->id:Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/commons/digester/plugins/Declaration;->pluginClass:Ljava/lang/Class;

    iget-object v5, p0, Lorg/apache/commons/digester/plugins/Declaration;->properties:Ljava/util/Properties;

    invoke-virtual {p2, p1, v3, v4, v5}, Lorg/apache/commons/digester/plugins/PluginManager;->findLoader(Lorg/apache/commons/digester/Digester;Ljava/lang/String;Ljava/lang/Class;Ljava/util/Properties;)Lorg/apache/commons/digester/plugins/RuleLoader;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/commons/digester/plugins/Declaration;->ruleLoader:Lorg/apache/commons/digester/plugins/RuleLoader;

    .line 173
    :goto_44
    if-eqz v1, :cond_82

    .line 174
    iget-object v3, p0, Lorg/apache/commons/digester/plugins/Declaration;->ruleLoader:Lorg/apache/commons/digester/plugins/RuleLoader;

    if-nez v3, :cond_a8

    .line 175
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "No ruleLoader found for plugin declaration id ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/digester/plugins/Declaration;->id:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, ", class ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/digester/plugins/Declaration;->pluginClass:Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "]."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 188
    :cond_82
    :goto_82
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/apache/commons/digester/plugins/Declaration;->initialized:Z

    .line 189
    return-void

    .line 159
    :catch_86
    move-exception v0

    .local v0, "cnfe":Ljava/lang/ClassNotFoundException;
    new-instance v3, Lorg/apache/commons/digester/plugins/PluginException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Unable to load class "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/digester/plugins/Declaration;->pluginClassName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/apache/commons/digester/plugins/PluginException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 170
    .end local v0    # "cnfe":Ljava/lang/ClassNotFoundException;
    :cond_a2
    const-string v3, "This declaration has an explicit ruleLoader."

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_44

    .line 180
    :cond_a8
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "RuleLoader of type ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/digester/plugins/Declaration;->ruleLoader:Lorg/apache/commons/digester/plugins/RuleLoader;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "] associated with plugin declaration"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " id ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/digester/plugins/Declaration;->id:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, ", class ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/commons/digester/plugins/Declaration;->pluginClass:Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "]."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_82
.end method

.method public setId(Ljava/lang/String;)V
    .registers 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 97
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/Declaration;->id:Ljava/lang/String;

    .line 98
    return-void
.end method

.method public setProperties(Ljava/util/Properties;)V
    .registers 3
    .param p1, "p"    # Ljava/util/Properties;

    .prologue
    .line 124
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/Declaration;->properties:Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/util/Properties;->putAll(Ljava/util/Map;)V

    .line 125
    return-void
.end method
