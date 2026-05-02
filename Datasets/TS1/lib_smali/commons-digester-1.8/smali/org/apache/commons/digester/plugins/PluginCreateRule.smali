.class public Lorg/apache/commons/digester/plugins/PluginCreateRule;
.super Lorg/apache/commons/digester/Rule;
.source "PluginCreateRule.java"

# interfaces
.implements Lorg/apache/commons/digester/plugins/InitializableRule;


# static fields
.field static class$java$lang$Object:Ljava/lang/Class;


# instance fields
.field private baseClass:Ljava/lang/Class;

.field private defaultPlugin:Lorg/apache/commons/digester/plugins/Declaration;

.field private initException:Lorg/apache/commons/digester/plugins/PluginConfigurationException;

.field private pattern:Ljava/lang/String;

.field private pluginClassAttr:Ljava/lang/String;

.field private pluginClassAttrNs:Ljava/lang/String;

.field private pluginIdAttr:Ljava/lang/String;

.field private pluginIdAttrNs:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .registers 3
    .param p1, "baseClass"    # Ljava/lang/Class;

    .prologue
    const/4 v0, 0x0

    .line 76
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 36
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttrNs:Ljava/lang/String;

    .line 37
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttr:Ljava/lang/String;

    .line 40
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttrNs:Ljava/lang/String;

    .line 41
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttr:Ljava/lang/String;

    .line 50
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->baseClass:Ljava/lang/Class;

    .line 77
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->baseClass:Ljava/lang/Class;

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;)V
    .registers 4
    .param p1, "baseClass"    # Ljava/lang/Class;
    .param p2, "dfltPluginClass"    # Ljava/lang/Class;

    .prologue
    const/4 v0, 0x0

    .line 91
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 36
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttrNs:Ljava/lang/String;

    .line 37
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttr:Ljava/lang/String;

    .line 40
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttrNs:Ljava/lang/String;

    .line 41
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttr:Ljava/lang/String;

    .line 50
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->baseClass:Ljava/lang/Class;

    .line 92
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->baseClass:Ljava/lang/Class;

    .line 93
    if-eqz p2, :cond_19

    .line 94
    new-instance v0, Lorg/apache/commons/digester/plugins/Declaration;

    invoke-direct {v0, p2}, Lorg/apache/commons/digester/plugins/Declaration;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->defaultPlugin:Lorg/apache/commons/digester/plugins/Declaration;

    .line 96
    :cond_19
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;Lorg/apache/commons/digester/plugins/RuleLoader;)V
    .registers 5
    .param p1, "baseClass"    # Ljava/lang/Class;
    .param p2, "dfltPluginClass"    # Ljava/lang/Class;
    .param p3, "dfltPluginRuleLoader"    # Lorg/apache/commons/digester/plugins/RuleLoader;

    .prologue
    const/4 v0, 0x0

    .line 112
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 36
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttrNs:Ljava/lang/String;

    .line 37
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttr:Ljava/lang/String;

    .line 40
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttrNs:Ljava/lang/String;

    .line 41
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttr:Ljava/lang/String;

    .line 50
    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->baseClass:Ljava/lang/Class;

    .line 114
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->baseClass:Ljava/lang/Class;

    .line 115
    if-eqz p2, :cond_19

    .line 116
    new-instance v0, Lorg/apache/commons/digester/plugins/Declaration;

    invoke-direct {v0, p2, p3}, Lorg/apache/commons/digester/plugins/Declaration;-><init>(Ljava/lang/Class;Lorg/apache/commons/digester/plugins/RuleLoader;)V

    iput-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->defaultPlugin:Lorg/apache/commons/digester/plugins/Declaration;

    .line 119
    :cond_19
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 33
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private fireBodyMethods(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p1, "rules"    # Ljava/util/List;
    .param p2, "namespaceURI"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 533
    if-eqz p1, :cond_19

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_19

    .line 534
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v5}, Lorg/apache/commons/digester/Digester;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v3

    .line 535
    .local v3, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    .line 536
    .local v0, "debug":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_13
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-lt v2, v5, :cond_1a

    .line 550
    .end local v0    # "debug":Z
    .end local v2    # "i":I
    .end local v3    # "log":Lorg/apache/commons/logging/Log;
    :cond_19
    return-void

    .line 538
    .restart local v0    # "debug":Z
    .restart local v2    # "i":I
    .restart local v3    # "log":Lorg/apache/commons/logging/Log;
    :cond_1a
    :try_start_1a
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/commons/digester/Rule;

    .line 539
    .local v4, "rule":Lorg/apache/commons/digester/Rule;
    if-eqz v0, :cond_38

    .line 540
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "  Fire body() for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 542
    :cond_38
    invoke-virtual {v4, p2, p3, p4}, Lorg/apache/commons/digester/Rule;->body(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_3b} :catch_3e
    .catch Ljava/lang/Error; {:try_start_1a .. :try_end_3b} :catch_46

    .line 536
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 544
    .end local v4    # "rule":Lorg/apache/commons/digester/Rule;
    :catch_3e
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v5, v1}, Lorg/apache/commons/digester/Digester;->createSAXException(Ljava/lang/Exception;)Lorg/xml/sax/SAXException;

    move-result-object v5

    throw v5

    .line 546
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_46
    move-exception v1

    .local v1, "e":Ljava/lang/Error;
    throw v1
.end method


# virtual methods
.method public begin(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 25
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 305
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/apache/commons/digester/Digester;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v8

    .line 306
    .local v8, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v8}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v6

    .line 307
    .local v6, "debug":Z
    if-eqz v6, :cond_4e

    .line 308
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "PluginCreateRule.begin: pattern=["

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pattern:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, "]"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, " match=["

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/apache/commons/digester/Digester;->getMatch()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, "]"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 312
    :cond_4e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->initException:Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    move-object/from16 v18, v0

    if-eqz v18, :cond_5d

    .line 315
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->initException:Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    move-object/from16 v18, v0

    throw v18

    .line 319
    :cond_5d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/apache/commons/digester/Digester;->getRules()Lorg/apache/commons/digester/Rules;

    move-result-object v10

    check-cast v10, Lorg/apache/commons/digester/plugins/PluginRules;

    .line 320
    .local v10, "oldRules":Lorg/apache/commons/digester/plugins/PluginRules;
    invoke-virtual {v10}, Lorg/apache/commons/digester/plugins/PluginRules;->getPluginManager()Lorg/apache/commons/digester/plugins/PluginManager;

    move-result-object v15

    .line 321
    .local v15, "pluginManager":Lorg/apache/commons/digester/plugins/PluginManager;
    const/4 v5, 0x0

    .line 324
    .local v5, "currDeclaration":Lorg/apache/commons/digester/plugins/Declaration;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttrNs:Ljava/lang/String;

    move-object/from16 v18, v0

    if-nez v18, :cond_195

    .line 332
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttr:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 339
    .local v13, "pluginClassName":Ljava/lang/String;
    :goto_84
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttrNs:Ljava/lang/String;

    move-object/from16 v18, v0

    if-nez v18, :cond_1ad

    .line 340
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttr:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 346
    .local v14, "pluginId":Ljava/lang/String;
    :goto_9a
    if-eqz v13, :cond_1d4

    .line 353
    invoke-virtual {v15, v13}, Lorg/apache/commons/digester/plugins/PluginManager;->getDeclarationByClass(Ljava/lang/String;)Lorg/apache/commons/digester/plugins/Declaration;

    move-result-object v5

    .line 356
    if-nez v5, :cond_b5

    .line 357
    new-instance v5, Lorg/apache/commons/digester/plugins/Declaration;

    .end local v5    # "currDeclaration":Lorg/apache/commons/digester/plugins/Declaration;
    invoke-direct {v5, v13}, Lorg/apache/commons/digester/plugins/Declaration;-><init>(Ljava/lang/String;)V

    .line 359
    .restart local v5    # "currDeclaration":Lorg/apache/commons/digester/plugins/Declaration;
    :try_start_a7
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v5, v0, v15}, Lorg/apache/commons/digester/plugins/Declaration;->init(Lorg/apache/commons/digester/Digester;Lorg/apache/commons/digester/plugins/PluginManager;)V
    :try_end_b2
    .catch Lorg/apache/commons/digester/plugins/PluginException; {:try_start_a7 .. :try_end_b2} :catch_1c5

    .line 364
    invoke-virtual {v15, v5}, Lorg/apache/commons/digester/plugins/PluginManager;->addDeclaration(Lorg/apache/commons/digester/plugins/Declaration;)V

    .line 382
    :cond_b5
    :goto_b5
    invoke-virtual {v5}, Lorg/apache/commons/digester/plugins/Declaration;->getPluginClass()Ljava/lang/Class;

    move-result-object v12

    .line 384
    .local v12, "pluginClass":Ljava/lang/Class;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lorg/apache/commons/digester/Digester;->getMatch()Ljava/lang/String;

    move-result-object v11

    .line 391
    .local v11, "path":Ljava/lang/String;
    new-instance v9, Lorg/apache/commons/digester/plugins/PluginRules;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-direct {v9, v0, v11, v10, v12}, Lorg/apache/commons/digester/plugins/PluginRules;-><init>(Lorg/apache/commons/digester/Digester;Ljava/lang/String;Lorg/apache/commons/digester/plugins/PluginRules;Ljava/lang/Class;)V

    .line 392
    .local v9, "newRules":Lorg/apache/commons/digester/plugins/PluginRules;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Lorg/apache/commons/digester/Digester;->setRules(Lorg/apache/commons/digester/Rules;)V

    .line 394
    if-eqz v6, :cond_107

    .line 395
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "PluginCreateRule.begin: installing new plugin: oldrules="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, ", newrules="

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual {v9}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 401
    :cond_107
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pattern:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v5, v0, v1}, Lorg/apache/commons/digester/plugins/Declaration;->configure(Lorg/apache/commons/digester/Digester;Ljava/lang/String;)V

    .line 404
    invoke-virtual {v12}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v7

    .line 405
    .local v7, "instance":Ljava/lang/Object;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/commons/digester/plugins/PluginCreateRule;->getDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v7}, Lorg/apache/commons/digester/Digester;->push(Ljava/lang/Object;)V

    .line 406
    if-eqz v6, :cond_17b

    .line 407
    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "PluginCreateRule.begin: pattern=["

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pattern:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, "]"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, " match=["

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lorg/apache/commons/digester/Digester;->getMatch()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, "]"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, " pushed instance of plugin ["

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual {v12}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, "]"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v8, v0}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 416
    :cond_17b
    invoke-virtual {v9}, Lorg/apache/commons/digester/plugins/PluginRules;->getDecoratedRules()Lorg/apache/commons/digester/Rules;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-interface {v0, v1, v11}, Lorg/apache/commons/digester/Rules;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v17

    .line 417
    .local v17, "rules":Ljava/util/List;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    invoke-virtual {v0, v1, v2, v3, v4}, Lorg/apache/commons/digester/plugins/PluginCreateRule;->fireBeginMethods(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V

    .line 418
    return-void

    .line 334
    .end local v7    # "instance":Ljava/lang/Object;
    .end local v9    # "newRules":Lorg/apache/commons/digester/plugins/PluginRules;
    .end local v11    # "path":Ljava/lang/String;
    .end local v12    # "pluginClass":Ljava/lang/Class;
    .end local v13    # "pluginClassName":Ljava/lang/String;
    .end local v14    # "pluginId":Ljava/lang/String;
    .end local v17    # "rules":Ljava/util/List;
    :cond_195
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttrNs:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttr:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .restart local v13    # "pluginClassName":Ljava/lang/String;
    goto/16 :goto_84

    .line 342
    :cond_1ad
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttrNs:Ljava/lang/String;

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttr:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p3

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .restart local v14    # "pluginId":Ljava/lang/String;
    goto/16 :goto_9a

    .line 361
    :catch_1c5
    move-exception v16

    .local v16, "pwe":Lorg/apache/commons/digester/plugins/PluginException;
    new-instance v18, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;

    invoke-virtual/range {v16 .. v16}, Lorg/apache/commons/digester/plugins/PluginException;->getMessage()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v16 .. v16}, Lorg/apache/commons/digester/plugins/PluginException;->getCause()Ljava/lang/Throwable;

    move-result-object v20

    invoke-direct/range {v18 .. v20}, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v18

    .line 366
    .end local v16    # "pwe":Lorg/apache/commons/digester/plugins/PluginException;
    :cond_1d4
    if-eqz v14, :cond_1fd

    .line 367
    invoke-virtual {v15, v14}, Lorg/apache/commons/digester/plugins/PluginManager;->getDeclarationById(Ljava/lang/String;)Lorg/apache/commons/digester/plugins/Declaration;

    move-result-object v5

    .line 369
    if-nez v5, :cond_b5

    .line 370
    new-instance v18, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string v20, "Plugin id ["

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string v20, "] is not defined."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 373
    :cond_1fd
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->defaultPlugin:Lorg/apache/commons/digester/plugins/Declaration;

    move-object/from16 v18, v0

    if-eqz v18, :cond_20b

    .line 374
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->defaultPlugin:Lorg/apache/commons/digester/plugins/Declaration;

    goto/16 :goto_b5

    .line 376
    :cond_20b
    new-instance v18, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string v20, "No plugin class specified for element "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pattern:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;-><init>(Ljava/lang/String;)V

    throw v18
.end method

.method public body(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 441
    iget-object v3, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3}, Lorg/apache/commons/digester/Digester;->getMatch()Ljava/lang/String;

    move-result-object v1

    .line 442
    .local v1, "path":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3}, Lorg/apache/commons/digester/Digester;->getRules()Lorg/apache/commons/digester/Rules;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/digester/plugins/PluginRules;

    .line 443
    .local v0, "newRules":Lorg/apache/commons/digester/plugins/PluginRules;
    invoke-virtual {v0}, Lorg/apache/commons/digester/plugins/PluginRules;->getDecoratedRules()Lorg/apache/commons/digester/Rules;

    move-result-object v3

    invoke-interface {v3, p1, v1}, Lorg/apache/commons/digester/Rules;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 444
    .local v2, "rules":Ljava/util/List;
    invoke-direct {p0, v2, p1, p2, p3}, Lorg/apache/commons/digester/plugins/PluginCreateRule;->fireBodyMethods(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 445
    return-void
.end method

.method public end(Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 463
    iget-object v3, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3}, Lorg/apache/commons/digester/Digester;->getMatch()Ljava/lang/String;

    move-result-object v1

    .line 464
    .local v1, "path":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3}, Lorg/apache/commons/digester/Digester;->getRules()Lorg/apache/commons/digester/Rules;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/digester/plugins/PluginRules;

    .line 465
    .local v0, "newRules":Lorg/apache/commons/digester/plugins/PluginRules;
    invoke-virtual {v0}, Lorg/apache/commons/digester/plugins/PluginRules;->getDecoratedRules()Lorg/apache/commons/digester/Rules;

    move-result-object v3

    invoke-interface {v3, p1, v1}, Lorg/apache/commons/digester/Rules;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 466
    .local v2, "rules":Ljava/util/List;
    invoke-virtual {p0, v2, p1, p2}, Lorg/apache/commons/digester/plugins/PluginCreateRule;->fireEndMethods(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 470
    iget-object v3, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v0}, Lorg/apache/commons/digester/plugins/PluginRules;->getParent()Lorg/apache/commons/digester/Rules;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/commons/digester/Digester;->setRules(Lorg/apache/commons/digester/Rules;)V

    .line 474
    iget-object v3, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v3}, Lorg/apache/commons/digester/Digester;->pop()Ljava/lang/Object;

    .line 475
    return-void
.end method

.method public fireBeginMethods(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 12
    .param p1, "rules"    # Ljava/util/List;
    .param p2, "namespace"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "list"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 504
    if-eqz p1, :cond_19

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_19

    .line 505
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v5}, Lorg/apache/commons/digester/Digester;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v3

    .line 506
    .local v3, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    .line 507
    .local v0, "debug":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_13
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v5

    if-lt v2, v5, :cond_1a

    .line 521
    .end local v0    # "debug":Z
    .end local v2    # "i":I
    .end local v3    # "log":Lorg/apache/commons/logging/Log;
    :cond_19
    return-void

    .line 509
    .restart local v0    # "debug":Z
    .restart local v2    # "i":I
    .restart local v3    # "log":Lorg/apache/commons/logging/Log;
    :cond_1a
    :try_start_1a
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/commons/digester/Rule;

    .line 510
    .local v4, "rule":Lorg/apache/commons/digester/Rule;
    if-eqz v0, :cond_38

    .line 511
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "  Fire begin() for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 513
    :cond_38
    invoke-virtual {v4, p2, p3, p4}, Lorg/apache/commons/digester/Rule;->begin(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_3b} :catch_3e
    .catch Ljava/lang/Error; {:try_start_1a .. :try_end_3b} :catch_46

    .line 507
    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    .line 515
    .end local v4    # "rule":Lorg/apache/commons/digester/Rule;
    :catch_3e
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v5, v1}, Lorg/apache/commons/digester/Digester;->createSAXException(Ljava/lang/Exception;)Lorg/xml/sax/SAXException;

    move-result-object v5

    throw v5

    .line 517
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_46
    move-exception v1

    .local v1, "e":Ljava/lang/Error;
    throw v1
.end method

.method public fireEndMethods(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12
    .param p1, "rules"    # Ljava/util/List;
    .param p2, "namespaceURI"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 563
    if-eqz p1, :cond_13

    .line 564
    iget-object v6, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v6}, Lorg/apache/commons/digester/Digester;->getLogger()Lorg/apache/commons/logging/Log;

    move-result-object v4

    .line 565
    .local v4, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v4}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    .line 566
    .local v0, "debug":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_d
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    if-lt v2, v6, :cond_14

    .line 581
    .end local v0    # "debug":Z
    .end local v2    # "i":I
    .end local v4    # "log":Lorg/apache/commons/logging/Log;
    :cond_13
    return-void

    .line 567
    .restart local v0    # "debug":Z
    .restart local v2    # "i":I
    .restart local v4    # "log":Lorg/apache/commons/logging/Log;
    :cond_14
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    sub-int/2addr v6, v2

    add-int/lit8 v3, v6, -0x1

    .line 569
    .local v3, "j":I
    :try_start_1b
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/commons/digester/Rule;

    .line 570
    .local v5, "rule":Lorg/apache/commons/digester/Rule;
    if-eqz v0, :cond_39

    .line 571
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "  Fire end() for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 573
    :cond_39
    invoke-virtual {v5, p2, p3}, Lorg/apache/commons/digester/Rule;->end(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_3c} :catch_3f
    .catch Ljava/lang/Error; {:try_start_1b .. :try_end_3c} :catch_47

    .line 566
    add-int/lit8 v2, v2, 0x1

    goto :goto_d

    .line 575
    .end local v5    # "rule":Lorg/apache/commons/digester/Rule;
    :catch_3f
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    iget-object v6, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v6, v1}, Lorg/apache/commons/digester/Digester;->createSAXException(Ljava/lang/Exception;)Lorg/xml/sax/SAXException;

    move-result-object v6

    throw v6

    .line 577
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_47
    move-exception v1

    .local v1, "e":Ljava/lang/Error;
    throw v1
.end method

.method public getPattern()Ljava/lang/String;
    .registers 2

    .prologue
    .line 490
    iget-object v0, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pattern:Ljava/lang/String;

    return-object v0
.end method

.method public postRegisterInit(Ljava/lang/String;)V
    .registers 10
    .param p1, "matchPattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginConfigurationException;
        }
    .end annotation

    .prologue
    .line 158
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-static {v5}, Lorg/apache/commons/digester/plugins/LogUtils;->getLogger(Lorg/apache/commons/digester/Digester;)Lorg/apache/commons/logging/Log;

    move-result-object v1

    .line 159
    .local v1, "log":Lorg/apache/commons/logging/Log;
    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    .line 160
    .local v0, "debug":Z
    if-eqz v0, :cond_28

    .line 161
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "PluginCreateRule.postRegisterInit: rule registered for pattern ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 165
    :cond_28
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    if-nez v5, :cond_38

    .line 170
    new-instance v5, Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    const-string v6, "Invalid invocation of postRegisterInit: digester not set."

    invoke-direct {v5, v6}, Lorg/apache/commons/digester/plugins/PluginConfigurationException;-><init>(Ljava/lang/String;)V

    iput-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->initException:Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    .line 173
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->initException:Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    throw v5

    .line 176
    :cond_38
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pattern:Ljava/lang/String;

    if-eqz v5, :cond_48

    .line 184
    new-instance v5, Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    const-string v6, "A single PluginCreateRule instance has been mapped to multiple patterns; this is not supported."

    invoke-direct {v5, v6}, Lorg/apache/commons/digester/plugins/PluginConfigurationException;-><init>(Ljava/lang/String;)V

    iput-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->initException:Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    .line 187
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->initException:Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    throw v5

    .line 190
    :cond_48
    const/16 v5, 0x2a

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_80

    .line 202
    new-instance v5, Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "A PluginCreateRule instance has been mapped to pattern ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "]."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " This pattern includes a wildcard character."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, " This is not supported by the plugin architecture."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/commons/digester/plugins/PluginConfigurationException;-><init>(Ljava/lang/String;)V

    iput-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->initException:Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    .line 207
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->initException:Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    throw v5

    .line 210
    :cond_80
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->baseClass:Ljava/lang/Class;

    if-nez v5, :cond_92

    .line 211
    sget-object v5, Lorg/apache/commons/digester/plugins/PluginCreateRule;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v5, :cond_ed

    const-string v5, "java.lang.Object"

    invoke-static {v5}, Lorg/apache/commons/digester/plugins/PluginCreateRule;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    sput-object v5, Lorg/apache/commons/digester/plugins/PluginCreateRule;->class$java$lang$Object:Ljava/lang/Class;

    :goto_90
    iput-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->baseClass:Ljava/lang/Class;

    .line 214
    :cond_92
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v5}, Lorg/apache/commons/digester/Digester;->getRules()Lorg/apache/commons/digester/Rules;

    move-result-object v4

    check-cast v4, Lorg/apache/commons/digester/plugins/PluginRules;

    .line 215
    .local v4, "rules":Lorg/apache/commons/digester/plugins/PluginRules;
    invoke-virtual {v4}, Lorg/apache/commons/digester/plugins/PluginRules;->getPluginManager()Lorg/apache/commons/digester/plugins/PluginManager;

    move-result-object v2

    .line 218
    .local v2, "pm":Lorg/apache/commons/digester/plugins/PluginManager;
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->defaultPlugin:Lorg/apache/commons/digester/plugins/Declaration;

    if-eqz v5, :cond_f7

    .line 219
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->baseClass:Ljava/lang/Class;

    iget-object v6, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->defaultPlugin:Lorg/apache/commons/digester/plugins/Declaration;

    invoke-virtual {v6}, Lorg/apache/commons/digester/plugins/Declaration;->getPluginClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-nez v5, :cond_f0

    .line 220
    new-instance v5, Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Default class ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->defaultPlugin:Lorg/apache/commons/digester/plugins/Declaration;

    invoke-virtual {v7}, Lorg/apache/commons/digester/plugins/Declaration;->getPluginClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "] does not inherit from ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->baseClass:Ljava/lang/Class;

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "]."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/commons/digester/plugins/PluginConfigurationException;-><init>(Ljava/lang/String;)V

    iput-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->initException:Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    .line 225
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->initException:Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    throw v5

    .line 211
    .end local v2    # "pm":Lorg/apache/commons/digester/plugins/PluginManager;
    .end local v4    # "rules":Lorg/apache/commons/digester/plugins/PluginRules;
    :cond_ed
    sget-object v5, Lorg/apache/commons/digester/plugins/PluginCreateRule;->class$java$lang$Object:Ljava/lang/Class;

    goto :goto_90

    .line 229
    .restart local v2    # "pm":Lorg/apache/commons/digester/plugins/PluginManager;
    .restart local v4    # "rules":Lorg/apache/commons/digester/plugins/PluginRules;
    :cond_f0
    :try_start_f0
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->defaultPlugin:Lorg/apache/commons/digester/plugins/Declaration;

    iget-object v6, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v5, v6, v2}, Lorg/apache/commons/digester/plugins/Declaration;->init(Lorg/apache/commons/digester/Digester;Lorg/apache/commons/digester/plugins/PluginManager;)V
    :try_end_f7
    .catch Lorg/apache/commons/digester/plugins/PluginException; {:try_start_f0 .. :try_end_f7} :catch_172

    .line 239
    :cond_f7
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pattern:Ljava/lang/String;

    .line 241
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttr:Ljava/lang/String;

    if-nez v5, :cond_181

    .line 244
    invoke-virtual {v4}, Lorg/apache/commons/digester/plugins/PluginRules;->getPluginClassAttrNs()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttrNs:Ljava/lang/String;

    .line 245
    invoke-virtual {v4}, Lorg/apache/commons/digester/plugins/PluginRules;->getPluginClassAttr()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttr:Ljava/lang/String;

    .line 247
    if-eqz v0, :cond_135

    .line 248
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "init: pluginClassAttr set to per-digester values [ns="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttrNs:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, ", name="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttr:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 262
    :cond_135
    :goto_135
    iget-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttr:Ljava/lang/String;

    if-nez v5, :cond_1ae

    .line 265
    invoke-virtual {v4}, Lorg/apache/commons/digester/plugins/PluginRules;->getPluginIdAttrNs()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttrNs:Ljava/lang/String;

    .line 266
    invoke-virtual {v4}, Lorg/apache/commons/digester/plugins/PluginRules;->getPluginIdAttr()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttr:Ljava/lang/String;

    .line 268
    if-eqz v0, :cond_171

    .line 269
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "init: pluginIdAttr set to per-digester values [ns="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttrNs:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, ", name="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttr:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 282
    :cond_171
    :goto_171
    return-void

    .line 233
    :catch_172
    move-exception v3

    .local v3, "pwe":Lorg/apache/commons/digester/plugins/PluginException;
    new-instance v5, Lorg/apache/commons/digester/plugins/PluginConfigurationException;

    invoke-virtual {v3}, Lorg/apache/commons/digester/plugins/PluginException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3}, Lorg/apache/commons/digester/plugins/PluginException;->getCause()Ljava/lang/Throwable;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/commons/digester/plugins/PluginConfigurationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 254
    .end local v3    # "pwe":Lorg/apache/commons/digester/plugins/PluginException;
    :cond_181
    if-eqz v0, :cond_135

    .line 255
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "init: pluginClassAttr set to rule-specific values [ns="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttrNs:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, ", name="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttr:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_135

    .line 275
    :cond_1ae
    if-eqz v0, :cond_171

    .line 276
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "init: pluginIdAttr set to rule-specific values [ns="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttrNs:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, ", name="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttr:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    goto :goto_171
.end method

.method public setPluginClassAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "namespaceUri"    # Ljava/lang/String;
    .param p2, "attrName"    # Ljava/lang/String;

    .prologue
    .line 130
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttrNs:Ljava/lang/String;

    .line 131
    iput-object p2, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginClassAttr:Ljava/lang/String;

    .line 132
    return-void
.end method

.method public setPluginIdAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "namespaceUri"    # Ljava/lang/String;
    .param p2, "attrName"    # Ljava/lang/String;

    .prologue
    .line 141
    iput-object p1, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttrNs:Ljava/lang/String;

    .line 142
    iput-object p2, p0, Lorg/apache/commons/digester/plugins/PluginCreateRule;->pluginIdAttr:Ljava/lang/String;

    .line 143
    return-void
.end method
