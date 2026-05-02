.class public Lorg/apache/commons/digester/plugins/PluginRules;
.super Ljava/lang/Object;
.source "PluginRules.java"

# interfaces
.implements Lorg/apache/commons/digester/Rules;


# instance fields
.field private decoratedRules:Lorg/apache/commons/digester/Rules;

.field protected digester:Lorg/apache/commons/digester/Digester;

.field private mountPoint:Ljava/lang/String;

.field private parent:Lorg/apache/commons/digester/plugins/PluginRules;

.field private pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

.field private pluginManager:Lorg/apache/commons/digester/plugins/PluginManager;

.field private rulesFactory:Lorg/apache/commons/digester/plugins/RulesFactory;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 100
    new-instance v0, Lorg/apache/commons/digester/RulesBase;

    invoke-direct {v0}, Lorg/apache/commons/digester/RulesBase;-><init>()V

    invoke-direct {p0, v0}, Lorg/apache/commons/digester/plugins/PluginRules;-><init>(Lorg/apache/commons/digester/Rules;)V

    .line 101
    return-void
.end method

.method constructor <init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;Lorg/apache/commons/digester/plugins/PluginRules;Ljava/lang/Class;)V
    .registers 7
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p2, "mountPoint"    # Ljava/lang/String;
    .param p3, "parent"    # Lorg/apache/commons/digester/plugins/PluginRules;
    .param p4, "pluginClass"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->digester:Lorg/apache/commons/digester/Digester;

    .line 78
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->mountPoint:Ljava/lang/String;

    .line 84
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->parent:Lorg/apache/commons/digester/plugins/PluginRules;

    .line 90
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    .line 140
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginRules;->digester:Lorg/apache/commons/digester/Digester;

    .line 141
    iput-object p2, p0, Lorg/apache/commons/digester/plugins/PluginRules;->mountPoint:Ljava/lang/String;

    .line 142
    iput-object p3, p0, Lorg/apache/commons/digester/plugins/PluginRules;->parent:Lorg/apache/commons/digester/plugins/PluginRules;

    .line 143
    iget-object v0, p3, Lorg/apache/commons/digester/plugins/PluginRules;->rulesFactory:Lorg/apache/commons/digester/plugins/RulesFactory;

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->rulesFactory:Lorg/apache/commons/digester/plugins/RulesFactory;

    .line 145
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->rulesFactory:Lorg/apache/commons/digester/plugins/RulesFactory;

    if-nez v0, :cond_2f

    .line 146
    new-instance v0, Lorg/apache/commons/digester/RulesBase;

    invoke-direct {v0}, Lorg/apache/commons/digester/RulesBase;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    .line 151
    :goto_21
    iget-object v0, p3, Lorg/apache/commons/digester/plugins/PluginRules;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    .line 152
    new-instance v0, Lorg/apache/commons/digester/plugins/PluginManager;

    iget-object v1, p3, Lorg/apache/commons/digester/plugins/PluginRules;->pluginManager:Lorg/apache/commons/digester/plugins/PluginManager;

    invoke-direct {v0, v1}, Lorg/apache/commons/digester/plugins/PluginManager;-><init>(Lorg/apache/commons/digester/plugins/PluginManager;)V

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginManager:Lorg/apache/commons/digester/plugins/PluginManager;

    .line 153
    return-void

    .line 148
    :cond_2f
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->rulesFactory:Lorg/apache/commons/digester/plugins/RulesFactory;

    invoke-virtual {v0, p1, p4}, Lorg/apache/commons/digester/plugins/RulesFactory;->newRules(Lorg/apache/commons/digester/Digester;Ljava/lang/Class;)Lorg/apache/commons/digester/Rules;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    goto :goto_21
.end method

.method public constructor <init>(Lorg/apache/commons/digester/Rules;)V
    .registers 4
    .param p1, "decoratedRules"    # Lorg/apache/commons/digester/Rules;

    .prologue
    const/4 v0, 0x0

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->digester:Lorg/apache/commons/digester/Digester;

    .line 78
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->mountPoint:Ljava/lang/String;

    .line 84
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->parent:Lorg/apache/commons/digester/plugins/PluginRules;

    .line 90
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    .line 108
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    .line 110
    new-instance v0, Lorg/apache/commons/digester/plugins/PluginContext;

    invoke-direct {v0}, Lorg/apache/commons/digester/plugins/PluginContext;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    .line 111
    new-instance v0, Lorg/apache/commons/digester/plugins/PluginManager;

    iget-object v1, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    invoke-direct {v0, v1}, Lorg/apache/commons/digester/plugins/PluginManager;-><init>(Lorg/apache/commons/digester/plugins/PluginContext;)V

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginManager:Lorg/apache/commons/digester/plugins/PluginManager;

    .line 112
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V
    .registers 9
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "rule"    # Lorg/apache/commons/digester/Rule;

    .prologue
    .line 272
    iget-object v4, p0, Lorg/apache/commons/digester/plugins/PluginRules;->digester:Lorg/apache/commons/digester/Digester;

    invoke-static {v4}, Lorg/apache/commons/digester/plugins/LogUtils;->getLogger(Lorg/apache/commons/digester/Digester;)Lorg/apache/commons/logging/Log;

    move-result-object v3

    .line 273
    .local v3, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    .line 275
    .local v1, "debug":Z
    if-eqz v1, :cond_40

    .line 276
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "add entry: mapping pattern ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " to rule of type ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 281
    :cond_40
    const-string v4, "/"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4d

    .line 283
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 286
    :cond_4d
    iget-object v4, p0, Lorg/apache/commons/digester/plugins/PluginRules;->mountPoint:Ljava/lang/String;

    if-eqz v4, :cond_a9

    .line 287
    iget-object v4, p0, Lorg/apache/commons/digester/plugins/PluginRules;->mountPoint:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a9

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginRules;->mountPoint:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_a9

    .line 296
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "An attempt was made to add a rule with a pattern thatis not at or below the mountpoint of the current PluginRules object. Rule pattern: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ", mountpoint: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginRules;->mountPoint:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, ", rule type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 330
    :cond_a8
    :goto_a8
    return-void

    .line 307
    :cond_a9
    iget-object v4, p0, Lorg/apache/commons/digester/plugins/PluginRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v4, p1, p2}, Lorg/apache/commons/digester/Rules;->add(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 309
    instance-of v4, p2, Lorg/apache/commons/digester/plugins/InitializableRule;

    if-eqz v4, :cond_b9

    .line 311
    :try_start_b2
    move-object v0, p2

    check-cast v0, Lorg/apache/commons/digester/plugins/InitializableRule;

    move-object v4, v0

    invoke-interface {v4, p1}, Lorg/apache/commons/digester/plugins/InitializableRule;->postRegisterInit(Ljava/lang/String;)V
    :try_end_b9
    .catch Lorg/apache/commons/digester/plugins/PluginConfigurationException; {:try_start_b2 .. :try_end_b9} :catch_f0

    .line 326
    :cond_b9
    if-eqz v1, :cond_a8

    .line 327
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "add exit: mapped pattern ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, " to rule of type ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_a8

    .line 318
    :catch_f0
    move-exception v2

    .local v2, "e":Lorg/apache/commons/digester/plugins/PluginConfigurationException;
    if-eqz v1, :cond_a8

    .line 319
    const-string v4, "Rule initialisation failed"

    invoke-interface {v3, v4, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_a8
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 336
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->clear()V

    .line 337
    return-void
.end method

.method getDecoratedRules()Lorg/apache/commons/digester/Rules;
    .registers 2

    .prologue
    .line 247
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    return-object v0
.end method

.method public getDigester()Lorg/apache/commons/digester/Digester;
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->digester:Lorg/apache/commons/digester/Digester;

    return-object v0
.end method

.method public getNamespaceURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 186
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getParent()Lorg/apache/commons/digester/Rules;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->parent:Lorg/apache/commons/digester/plugins/PluginRules;

    return-object v0
.end method

.method public getPluginClassAttr()Ljava/lang/String;
    .registers 2

    .prologue
    .line 417
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    invoke-virtual {v0}, Lorg/apache/commons/digester/plugins/PluginContext;->getPluginClassAttr()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPluginClassAttrNs()Ljava/lang/String;
    .registers 2

    .prologue
    .line 412
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    invoke-virtual {v0}, Lorg/apache/commons/digester/plugins/PluginContext;->getPluginClassAttrNs()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPluginIdAttr()Ljava/lang/String;
    .registers 2

    .prologue
    .line 427
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    invoke-virtual {v0}, Lorg/apache/commons/digester/plugins/PluginContext;->getPluginIdAttr()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPluginIdAttrNs()Ljava/lang/String;
    .registers 2

    .prologue
    .line 422
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    invoke-virtual {v0}, Lorg/apache/commons/digester/plugins/PluginContext;->getPluginIdAttrNs()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPluginManager()Lorg/apache/commons/digester/plugins/PluginManager;
    .registers 2

    .prologue
    .line 207
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginManager:Lorg/apache/commons/digester/plugins/PluginManager;

    return-object v0
.end method

.method public getRuleFinders()Ljava/util/List;
    .registers 2

    .prologue
    .line 214
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    invoke-virtual {v0}, Lorg/apache/commons/digester/plugins/PluginContext;->getRuleFinders()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getRulesFactory()Lorg/apache/commons/digester/plugins/RulesFactory;
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->rulesFactory:Lorg/apache/commons/digester/plugins/RulesFactory;

    return-object v0
.end method

.method public match(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 351
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/digester/plugins/PluginRules;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 8
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 366
    iget-object v3, p0, Lorg/apache/commons/digester/plugins/PluginRules;->digester:Lorg/apache/commons/digester/Digester;

    invoke-static {v3}, Lorg/apache/commons/digester/plugins/LogUtils;->getLogger(Lorg/apache/commons/digester/Digester;)Lorg/apache/commons/logging/Log;

    move-result-object v1

    .line 367
    .local v1, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    .line 369
    .local v0, "debug":Z
    if-eqz v0, :cond_30

    .line 370
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Matching path ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "] on rules object "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 376
    :cond_30
    iget-object v3, p0, Lorg/apache/commons/digester/plugins/PluginRules;->mountPoint:Ljava/lang/String;

    if-eqz v3, :cond_65

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    iget-object v4, p0, Lorg/apache/commons/digester/plugins/PluginRules;->mountPoint:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-gt v3, v4, :cond_65

    .line 378
    if-eqz v0, :cond_5e

    .line 379
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Path ["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "] delegated to parent."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 383
    :cond_5e
    iget-object v3, p0, Lorg/apache/commons/digester/plugins/PluginRules;->parent:Lorg/apache/commons/digester/plugins/PluginRules;

    invoke-virtual {v3, p1, p2}, Lorg/apache/commons/digester/plugins/PluginRules;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 395
    .local v2, "matches":Ljava/util/List;
    :goto_64
    return-object v2

    .line 391
    .end local v2    # "matches":Ljava/util/List;
    :cond_65
    const-string v3, "delegating to decorated rules."

    invoke-interface {v1, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 392
    iget-object v3, p0, Lorg/apache/commons/digester/plugins/PluginRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v3, p1, p2}, Lorg/apache/commons/digester/Rules;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .restart local v2    # "matches":Ljava/util/List;
    goto :goto_64
.end method

.method public rules()Ljava/util/List;
    .registers 2

    .prologue
    .line 260
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->rules()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public setDigester(Lorg/apache/commons/digester/Digester;)V
    .registers 3
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 177
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginRules;->digester:Lorg/apache/commons/digester/Digester;

    .line 178
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0, p1}, Lorg/apache/commons/digester/Rules;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 179
    return-void
.end method

.method public setNamespaceURI(Ljava/lang/String;)V
    .registers 3
    .param p1, "namespaceURI"    # Ljava/lang/String;

    .prologue
    .line 198
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->decoratedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0, p1}, Lorg/apache/commons/digester/Rules;->setNamespaceURI(Ljava/lang/String;)V

    .line 199
    return-void
.end method

.method public setPluginClassAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "namespaceUri"    # Ljava/lang/String;
    .param p2, "attrName"    # Ljava/lang/String;

    .prologue
    .line 401
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/digester/plugins/PluginContext;->setPluginClassAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    return-void
.end method

.method public setPluginIdAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "namespaceUri"    # Ljava/lang/String;
    .param p2, "attrName"    # Ljava/lang/String;

    .prologue
    .line 407
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    invoke-virtual {v0, p1, p2}, Lorg/apache/commons/digester/plugins/PluginContext;->setPluginIdAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 408
    return-void
.end method

.method public setRuleFinders(Ljava/util/List;)V
    .registers 3
    .param p1, "ruleFinders"    # Ljava/util/List;

    .prologue
    .line 221
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginRules;->pluginContext:Lorg/apache/commons/digester/plugins/PluginContext;

    invoke-virtual {v0, p1}, Lorg/apache/commons/digester/plugins/PluginContext;->setRuleFinders(Ljava/util/List;)V

    .line 222
    return-void
.end method

.method public setRulesFactory(Lorg/apache/commons/digester/plugins/RulesFactory;)V
    .registers 2
    .param p1, "factory"    # Lorg/apache/commons/digester/plugins/RulesFactory;

    .prologue
    .line 236
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginRules;->rulesFactory:Lorg/apache/commons/digester/plugins/RulesFactory;

    .line 237
    return-void
.end method
