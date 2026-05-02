.class final Lfreemarker/ext/dom/JaxenXPathSupport$5;
.super Lorg/jaxen/dom/DocumentNavigator;
.source "JaxenXPathSupport.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 198
    invoke-direct {p0}, Lorg/jaxen/dom/DocumentNavigator;-><init>()V

    return-void
.end method


# virtual methods
.method public getDocument(Ljava/lang/String;)Ljava/lang/Object;
    .registers 11
    .param p1, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jaxen/FunctionCallException;
        }
    .end annotation

    .prologue
    .line 203
    :try_start_0
    invoke-static {p1}, Lfreemarker/ext/dom/JaxenXPathSupport;->getTemplate(Ljava/lang/String;)Lfreemarker/template/Template;

    move-result-object v5

    .line 204
    .local v5, "raw":Lfreemarker/template/Template;
    invoke-static {}, Lfreemarker/ext/dom/JaxenXPathSupport;->access$000()Lfreemarker/core/CustomAttribute;

    move-result-object v6

    invoke-virtual {v6, v5}, Lfreemarker/core/CustomAttribute;->get(Lfreemarker/template/Template;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Document;

    .line 205
    .local v1, "doc":Lorg/w3c/dom/Document;
    if-nez v1, :cond_3b

    .line 206
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v4

    .line 207
    .local v4, "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Ljavax/xml/parsers/DocumentBuilderFactory;->setNamespaceAware(Z)V

    .line 208
    invoke-virtual {v4}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 209
    .local v0, "builder":Ljavax/xml/parsers/DocumentBuilder;
    new-instance v3, Lfreemarker/ext/dom/JaxenXPathSupport$FmEntityResolver;

    const/4 v6, 0x0

    invoke-direct {v3, v6}, Lfreemarker/ext/dom/JaxenXPathSupport$FmEntityResolver;-><init>(Lfreemarker/ext/dom/JaxenXPathSupport$1;)V

    .line 210
    .local v3, "er":Lfreemarker/ext/dom/JaxenXPathSupport$FmEntityResolver;
    invoke-virtual {v0, v3}, Ljavax/xml/parsers/DocumentBuilder;->setEntityResolver(Lorg/xml/sax/EntityResolver;)V

    .line 211
    const/4 v6, 0x0

    invoke-static {v6, v5}, Lfreemarker/ext/dom/JaxenXPathSupport;->access$200(Ljava/lang/String;Lfreemarker/template/Template;)Lorg/xml/sax/InputSource;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljavax/xml/parsers/DocumentBuilder;->parse(Lorg/xml/sax/InputSource;)Lorg/w3c/dom/Document;

    move-result-object v1

    .line 214
    invoke-virtual {v3}, Lfreemarker/ext/dom/JaxenXPathSupport$FmEntityResolver;->getCallCount()I

    move-result v6

    if-nez v6, :cond_3b

    .line 215
    invoke-static {}, Lfreemarker/ext/dom/JaxenXPathSupport;->access$000()Lfreemarker/core/CustomAttribute;

    move-result-object v6

    invoke-virtual {v6, v1, v5}, Lfreemarker/core/CustomAttribute;->set(Ljava/lang/Object;Lfreemarker/template/Template;)V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3b} :catch_3c

    .line 218
    .end local v0    # "builder":Ljavax/xml/parsers/DocumentBuilder;
    .end local v3    # "er":Lfreemarker/ext/dom/JaxenXPathSupport$FmEntityResolver;
    .end local v4    # "factory":Ljavax/xml/parsers/DocumentBuilderFactory;
    :cond_3b
    return-object v1

    .line 220
    .end local v1    # "doc":Lorg/w3c/dom/Document;
    .end local v5    # "raw":Lfreemarker/template/Template;
    :catch_3c
    move-exception v2

    .line 222
    .local v2, "e":Ljava/lang/Exception;
    new-instance v6, Lorg/jaxen/FunctionCallException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Failed to parse document for URI: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v2}, Lorg/jaxen/FunctionCallException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6
.end method
