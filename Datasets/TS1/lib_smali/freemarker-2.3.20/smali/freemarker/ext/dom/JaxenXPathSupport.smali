.class Lfreemarker/ext/dom/JaxenXPathSupport;
.super Ljava/lang/Object;
.source "JaxenXPathSupport.java"

# interfaces
.implements Lfreemarker/ext/dom/XPathSupport;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/ext/dom/JaxenXPathSupport$FmEntityResolver;
    }
.end annotation


# static fields
.field private static final EMPTY_ARRAYLIST:Ljava/util/ArrayList;

.field private static final cache:Lfreemarker/core/CustomAttribute;

.field private static final cachedTree:Lfreemarker/core/CustomAttribute;

.field private static final customNamespaceContext:Lorg/jaxen/NamespaceContext;

.field private static final fmDomNavigator:Lorg/jaxen/Navigator;

.field private static final fmFunctionContext:Lorg/jaxen/FunctionContext;

.field private static final fmVariableContext:Lorg/jaxen/VariableContext;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x1

    .line 103
    new-instance v0, Lfreemarker/ext/dom/JaxenXPathSupport$1;

    invoke-direct {v0, v1}, Lfreemarker/ext/dom/JaxenXPathSupport$1;-><init>(I)V

    sput-object v0, Lfreemarker/ext/dom/JaxenXPathSupport;->cache:Lfreemarker/core/CustomAttribute;

    .line 110
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lfreemarker/ext/dom/JaxenXPathSupport;->EMPTY_ARRAYLIST:Ljava/util/ArrayList;

    .line 144
    new-instance v0, Lfreemarker/ext/dom/JaxenXPathSupport$2;

    invoke-direct {v0}, Lfreemarker/ext/dom/JaxenXPathSupport$2;-><init>()V

    sput-object v0, Lfreemarker/ext/dom/JaxenXPathSupport;->customNamespaceContext:Lorg/jaxen/NamespaceContext;

    .line 154
    new-instance v0, Lfreemarker/ext/dom/JaxenXPathSupport$3;

    invoke-direct {v0}, Lfreemarker/ext/dom/JaxenXPathSupport$3;-><init>()V

    sput-object v0, Lfreemarker/ext/dom/JaxenXPathSupport;->fmVariableContext:Lorg/jaxen/VariableContext;

    .line 184
    new-instance v0, Lfreemarker/ext/dom/JaxenXPathSupport$4;

    invoke-direct {v0}, Lfreemarker/ext/dom/JaxenXPathSupport$4;-><init>()V

    sput-object v0, Lfreemarker/ext/dom/JaxenXPathSupport;->fmFunctionContext:Lorg/jaxen/FunctionContext;

    .line 196
    new-instance v0, Lfreemarker/core/CustomAttribute;

    invoke-direct {v0, v1}, Lfreemarker/core/CustomAttribute;-><init>(I)V

    sput-object v0, Lfreemarker/ext/dom/JaxenXPathSupport;->cachedTree:Lfreemarker/core/CustomAttribute;

    .line 198
    new-instance v0, Lfreemarker/ext/dom/JaxenXPathSupport$5;

    invoke-direct {v0}, Lfreemarker/ext/dom/JaxenXPathSupport$5;-><init>()V

    sput-object v0, Lfreemarker/ext/dom/JaxenXPathSupport;->fmDomNavigator:Lorg/jaxen/Navigator;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 256
    return-void
.end method

.method static access$000()Lfreemarker/core/CustomAttribute;
    .registers 1

    .prologue
    .line 101
    sget-object v0, Lfreemarker/ext/dom/JaxenXPathSupport;->cachedTree:Lfreemarker/core/CustomAttribute;

    return-object v0
.end method

.method static access$200(Ljava/lang/String;Lfreemarker/template/Template;)Lorg/xml/sax/InputSource;
    .registers 3
    .param p0, "x0"    # Ljava/lang/String;
    .param p1, "x1"    # Lfreemarker/template/Template;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 101
    invoke-static {p0, p1}, Lfreemarker/ext/dom/JaxenXPathSupport;->createInputSource(Ljava/lang/String;Lfreemarker/template/Template;)Lorg/xml/sax/InputSource;

    move-result-object v0

    return-object v0
.end method

.method private static createInputSource(Ljava/lang/String;Lfreemarker/template/Template;)Lorg/xml/sax/InputSource;
    .registers 7
    .param p0, "publicId"    # Ljava/lang/String;
    .param p1, "raw"    # Lfreemarker/template/Template;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 242
    new-instance v2, Ljava/io/StringWriter;

    invoke-direct {v2}, Ljava/io/StringWriter;-><init>()V

    .line 244
    .local v2, "sw":Ljava/io/StringWriter;
    :try_start_5
    sget-object v3, Lfreemarker/template/utility/Collections12;->EMPTY_MAP:Ljava/util/Map;

    invoke-virtual {p1, v3, v2}, Lfreemarker/template/Template;->process(Ljava/lang/Object;Ljava/io/Writer;)V
    :try_end_a
    .catch Lfreemarker/template/TemplateException; {:try_start_5 .. :try_end_a} :catch_26

    .line 249
    new-instance v1, Lorg/xml/sax/InputSource;

    invoke-direct {v1}, Lorg/xml/sax/InputSource;-><init>()V

    .line 250
    .local v1, "is":Lorg/xml/sax/InputSource;
    invoke-virtual {v1, p0}, Lorg/xml/sax/InputSource;->setPublicId(Ljava/lang/String;)V

    .line 251
    invoke-virtual {p1}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/xml/sax/InputSource;->setSystemId(Ljava/lang/String;)V

    .line 252
    new-instance v3, Ljava/io/StringReader;

    invoke-virtual {v2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Lorg/xml/sax/InputSource;->setCharacterStream(Ljava/io/Reader;)V

    .line 253
    return-object v1

    .line 246
    .end local v1    # "is":Lorg/xml/sax/InputSource;
    :catch_26
    move-exception v0

    .line 247
    .local v0, "e":Lfreemarker/template/TemplateException;
    new-instance v3, Lorg/xml/sax/SAXException;

    invoke-direct {v3, v0}, Lorg/xml/sax/SAXException;-><init>(Ljava/lang/Exception;)V

    throw v3
.end method

.method static getTemplate(Ljava/lang/String;)Lfreemarker/template/Template;
    .registers 9
    .param p0, "systemId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 228
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v1

    .line 229
    .local v1, "env":Lfreemarker/core/Environment;
    invoke-virtual {v1}, Lfreemarker/core/Environment;->getTemplate()Lfreemarker/template/Template;

    move-result-object v5

    invoke-virtual {v5}, Lfreemarker/template/Template;->getEncoding()Ljava/lang/String;

    move-result-object v0

    .line 230
    .local v0, "encoding":Ljava/lang/String;
    if-nez v0, :cond_1b

    .line 231
    invoke-virtual {v1}, Lfreemarker/core/Environment;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v5

    invoke-virtual {v1}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v6

    invoke-virtual {v5, v6}, Lfreemarker/template/Configuration;->getEncoding(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 233
    :cond_1b
    invoke-virtual {v1}, Lfreemarker/core/Environment;->getTemplate()Lfreemarker/template/Template;

    move-result-object v5

    invoke-virtual {v5}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v4

    .line 234
    .local v4, "templatePath":Ljava/lang/String;
    const/16 v5, 0x2f

    invoke-virtual {v4, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 235
    .local v2, "lastSlash":I
    const/4 v5, -0x1

    if-ne v2, v5, :cond_3f

    const-string v4, ""

    .line 236
    :goto_2e
    invoke-static {v1, v4, p0}, Lfreemarker/cache/TemplateCache;->getFullTemplatePath(Lfreemarker/core/Environment;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 237
    invoke-virtual {v1}, Lfreemarker/core/Environment;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v5

    invoke-virtual {v1}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v6

    invoke-virtual {v5, p0, v6, v0, v7}, Lfreemarker/template/Configuration;->getTemplate(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)Lfreemarker/template/Template;

    move-result-object v3

    .line 238
    .local v3, "raw":Lfreemarker/template/Template;
    return-object v3

    .line 235
    .end local v3    # "raw":Lfreemarker/template/Template;
    :cond_3f
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v4, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    goto :goto_2e
.end method


# virtual methods
.method public executeQuery(Ljava/lang/Object;Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 12
    .param p1, "context"    # Ljava/lang/Object;
    .param p2, "xpathQuery"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 115
    :try_start_0
    sget-object v7, Lfreemarker/ext/dom/JaxenXPathSupport;->cache:Lfreemarker/core/CustomAttribute;

    invoke-virtual {v7}, Lfreemarker/core/CustomAttribute;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map;

    .line 116
    .local v6, "xpathCache":Ljava/util/Map;
    monitor-enter v6
    :try_end_9
    .catch Lfreemarker/template/utility/UndeclaredThrowableException; {:try_start_0 .. :try_end_9} :catch_47
    .catch Lorg/jaxen/JaxenException; {:try_start_0 .. :try_end_9} :catch_5f

    .line 117
    :try_start_9
    invoke-interface {v6, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jaxen/BaseXPath;

    .line 118
    .local v5, "xpath":Lorg/jaxen/BaseXPath;
    if-nez v5, :cond_2a

    .line 119
    new-instance v5, Lorg/jaxen/BaseXPath;

    .end local v5    # "xpath":Lorg/jaxen/BaseXPath;
    sget-object v7, Lfreemarker/ext/dom/JaxenXPathSupport;->fmDomNavigator:Lorg/jaxen/Navigator;

    invoke-direct {v5, p2, v7}, Lorg/jaxen/BaseXPath;-><init>(Ljava/lang/String;Lorg/jaxen/Navigator;)V

    .line 120
    .restart local v5    # "xpath":Lorg/jaxen/BaseXPath;
    sget-object v7, Lfreemarker/ext/dom/JaxenXPathSupport;->customNamespaceContext:Lorg/jaxen/NamespaceContext;

    invoke-virtual {v5, v7}, Lorg/jaxen/BaseXPath;->setNamespaceContext(Lorg/jaxen/NamespaceContext;)V

    .line 121
    sget-object v7, Lfreemarker/ext/dom/JaxenXPathSupport;->fmFunctionContext:Lorg/jaxen/FunctionContext;

    invoke-virtual {v5, v7}, Lorg/jaxen/BaseXPath;->setFunctionContext(Lorg/jaxen/FunctionContext;)V

    .line 122
    sget-object v7, Lfreemarker/ext/dom/JaxenXPathSupport;->fmVariableContext:Lorg/jaxen/VariableContext;

    invoke-virtual {v5, v7}, Lorg/jaxen/BaseXPath;->setVariableContext(Lorg/jaxen/VariableContext;)V

    .line 123
    invoke-interface {v6, p2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    :cond_2a
    monitor-exit v6
    :try_end_2b
    .catchall {:try_start_9 .. :try_end_2b} :catchall_44

    .line 126
    if-eqz p1, :cond_53

    .end local p1    # "context":Ljava/lang/Object;
    :goto_2d
    :try_start_2d
    invoke-virtual {v5, p1}, Lorg/jaxen/BaseXPath;->selectNodes(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 127
    .local v3, "result":Ljava/util/List;
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v7

    const/4 v8, 0x1

    if-ne v7, v8, :cond_56

    .line 128
    sget-object v7, Lfreemarker/template/ObjectWrapper;->DEFAULT_WRAPPER:Lfreemarker/template/ObjectWrapper;

    const/4 v8, 0x0

    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v7, v8}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;
    :try_end_42
    .catch Lfreemarker/template/utility/UndeclaredThrowableException; {:try_start_2d .. :try_end_42} :catch_47
    .catch Lorg/jaxen/JaxenException; {:try_start_2d .. :try_end_42} :catch_5f

    move-result-object v2

    .line 132
    :goto_43
    return-object v2

    .line 125
    .end local v3    # "result":Ljava/util/List;
    .end local v5    # "xpath":Lorg/jaxen/BaseXPath;
    .restart local p1    # "context":Ljava/lang/Object;
    :catchall_44
    move-exception v7

    :try_start_45
    monitor-exit v6
    :try_end_46
    .catchall {:try_start_45 .. :try_end_46} :catchall_44

    :try_start_46
    throw v7
    :try_end_47
    .catch Lfreemarker/template/utility/UndeclaredThrowableException; {:try_start_46 .. :try_end_47} :catch_47
    .catch Lorg/jaxen/JaxenException; {:try_start_46 .. :try_end_47} :catch_5f

    .line 133
    .end local v6    # "xpathCache":Ljava/util/Map;
    .end local p1    # "context":Ljava/lang/Object;
    :catch_47
    move-exception v0

    .line 134
    .local v0, "e":Lfreemarker/template/utility/UndeclaredThrowableException;
    invoke-virtual {v0}, Lfreemarker/template/utility/UndeclaredThrowableException;->getUndeclaredThrowable()Ljava/lang/Throwable;

    move-result-object v4

    .line 135
    .local v4, "t":Ljava/lang/Throwable;
    instance-of v7, v4, Lfreemarker/template/TemplateModelException;

    if-eqz v7, :cond_66

    .line 136
    check-cast v4, Lfreemarker/template/TemplateModelException;

    .end local v4    # "t":Ljava/lang/Throwable;
    throw v4

    .line 126
    .end local v0    # "e":Lfreemarker/template/utility/UndeclaredThrowableException;
    .restart local v5    # "xpath":Lorg/jaxen/BaseXPath;
    .restart local v6    # "xpathCache":Ljava/util/Map;
    .restart local p1    # "context":Ljava/lang/Object;
    :cond_53
    :try_start_53
    sget-object p1, Lfreemarker/ext/dom/JaxenXPathSupport;->EMPTY_ARRAYLIST:Ljava/util/ArrayList;

    goto :goto_2d

    .line 130
    .end local p1    # "context":Ljava/lang/Object;
    .restart local v3    # "result":Ljava/util/List;
    :cond_56
    new-instance v2, Lfreemarker/ext/dom/NodeListModel;

    const/4 v7, 0x0

    invoke-direct {v2, v3, v7}, Lfreemarker/ext/dom/NodeListModel;-><init>(Ljava/util/List;Lfreemarker/ext/dom/NodeModel;)V

    .line 131
    .local v2, "nlm":Lfreemarker/ext/dom/NodeListModel;
    iput-object p0, v2, Lfreemarker/ext/dom/NodeListModel;->xpathSupport:Lfreemarker/ext/dom/XPathSupport;
    :try_end_5e
    .catch Lfreemarker/template/utility/UndeclaredThrowableException; {:try_start_53 .. :try_end_5e} :catch_47
    .catch Lorg/jaxen/JaxenException; {:try_start_53 .. :try_end_5e} :catch_5f

    goto :goto_43

    .line 139
    .end local v2    # "nlm":Lfreemarker/ext/dom/NodeListModel;
    .end local v3    # "result":Ljava/util/List;
    .end local v5    # "xpath":Lorg/jaxen/BaseXPath;
    .end local v6    # "xpathCache":Ljava/util/Map;
    :catch_5f
    move-exception v1

    .line 140
    .local v1, "je":Lorg/jaxen/JaxenException;
    new-instance v7, Lfreemarker/template/TemplateModelException;

    invoke-direct {v7, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v7

    .line 138
    .end local v1    # "je":Lorg/jaxen/JaxenException;
    .restart local v0    # "e":Lfreemarker/template/utility/UndeclaredThrowableException;
    .restart local v4    # "t":Ljava/lang/Throwable;
    :cond_66
    throw v0
.end method
