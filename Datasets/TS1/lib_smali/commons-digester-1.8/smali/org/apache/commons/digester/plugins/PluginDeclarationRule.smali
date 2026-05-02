.class public Lorg/apache/commons/digester/plugins/PluginDeclarationRule;
.super Lorg/apache/commons/digester/Rule;
.source "PluginDeclarationRule.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 44
    return-void
.end method

.method public static declarePlugin(Lorg/apache/commons/digester/Digester;Ljava/util/Properties;)V
    .registers 9
    .param p0, "digester"    # Lorg/apache/commons/digester/Digester;
    .param p1, "props"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/digester/plugins/PluginException;
        }
    .end annotation

    .prologue
    .line 91
    const-string v5, "id"

    invoke-virtual {p1, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 92
    .local v0, "id":Ljava/lang/String;
    const-string v5, "class"

    invoke-virtual {p1, v5}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 94
    .local v2, "pluginClassName":Ljava/lang/String;
    if-nez v0, :cond_16

    .line 95
    new-instance v5, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;

    const-string v6, "mandatory attribute id not present on plugin declaration"

    invoke-direct {v5, v6}, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 99
    :cond_16
    if-nez v2, :cond_20

    .line 100
    new-instance v5, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;

    const-string v6, "mandatory attribute class not present on plugin declaration"

    invoke-direct {v5, v6}, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 104
    :cond_20
    new-instance v1, Lorg/apache/commons/digester/plugins/Declaration;

    invoke-direct {v1, v2}, Lorg/apache/commons/digester/plugins/Declaration;-><init>(Ljava/lang/String;)V

    .line 105
    .local v1, "newDecl":Lorg/apache/commons/digester/plugins/Declaration;
    invoke-virtual {v1, v0}, Lorg/apache/commons/digester/plugins/Declaration;->setId(Ljava/lang/String;)V

    .line 106
    invoke-virtual {v1, p1}, Lorg/apache/commons/digester/plugins/Declaration;->setProperties(Ljava/util/Properties;)V

    .line 108
    invoke-virtual {p0}, Lorg/apache/commons/digester/Digester;->getRules()Lorg/apache/commons/digester/Rules;

    move-result-object v4

    check-cast v4, Lorg/apache/commons/digester/plugins/PluginRules;

    .line 109
    .local v4, "rc":Lorg/apache/commons/digester/plugins/PluginRules;
    invoke-virtual {v4}, Lorg/apache/commons/digester/plugins/PluginRules;->getPluginManager()Lorg/apache/commons/digester/plugins/PluginManager;

    move-result-object v3

    .line 111
    .local v3, "pm":Lorg/apache/commons/digester/plugins/PluginManager;
    invoke-virtual {v1, p0, v3}, Lorg/apache/commons/digester/plugins/Declaration;->init(Lorg/apache/commons/digester/Digester;Lorg/apache/commons/digester/plugins/PluginManager;)V

    .line 112
    invoke-virtual {v3, v1}, Lorg/apache/commons/digester/plugins/PluginManager;->addDeclaration(Lorg/apache/commons/digester/plugins/Declaration;)V

    .line 118
    return-void
.end method


# virtual methods
.method public begin(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 13
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 68
    invoke-interface {p3}, Lorg/xml/sax/Attributes;->getLength()I

    move-result v3

    .line 69
    .local v3, "nAttrs":I
    new-instance v4, Ljava/util/Properties;

    invoke-direct {v4}, Ljava/util/Properties;-><init>()V

    .line 70
    .local v4, "props":Ljava/util/Properties;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    if-lt v1, v3, :cond_12

    .line 80
    :try_start_c
    iget-object v6, p0, Lorg/apache/commons/digester/plugins/PluginDeclarationRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-static {v6, v4}, Lorg/apache/commons/digester/plugins/PluginDeclarationRule;->declarePlugin(Lorg/apache/commons/digester/Digester;Ljava/util/Properties;)V
    :try_end_11
    .catch Lorg/apache/commons/digester/plugins/PluginInvalidInputException; {:try_start_c .. :try_end_11} :catch_2c

    .line 86
    return-void

    .line 71
    :cond_12
    invoke-interface {p3, v1}, Lorg/xml/sax/Attributes;->getLocalName(I)Ljava/lang/String;

    move-result-object v2

    .line 72
    .local v2, "key":Ljava/lang/String;
    if-eqz v2, :cond_1e

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_22

    .line 73
    :cond_1e
    invoke-interface {p3, v1}, Lorg/xml/sax/Attributes;->getQName(I)Ljava/lang/String;

    move-result-object v2

    .line 75
    :cond_22
    invoke-interface {p3, v1}, Lorg/xml/sax/Attributes;->getValue(I)Ljava/lang/String;

    move-result-object v5

    .line 76
    .local v5, "value":Ljava/lang/String;
    invoke-virtual {v4, v2, v5}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 70
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 82
    .end local v2    # "key":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :catch_2c
    move-exception v0

    .local v0, "ex":Lorg/apache/commons/digester/plugins/PluginInvalidInputException;
    new-instance v6, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Error on element ["

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/commons/digester/plugins/PluginDeclarationRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v8}, Lorg/apache/commons/digester/Digester;->getMatch()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "]: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v0}, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/commons/digester/plugins/PluginInvalidInputException;-><init>(Ljava/lang/String;)V

    throw v6
.end method
