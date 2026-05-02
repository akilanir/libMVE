.class final Lfreemarker/ext/xml/_JdomNavigator$JDOMXPathEx;
.super Lorg/jaxen/jdom/JDOMXPath;
.source "_JdomNavigator.java"

# interfaces
.implements Lfreemarker/ext/xml/Navigator$XPathEx;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/xml/_JdomNavigator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "JDOMXPathEx"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 383
    invoke-direct {p0, p1}, Lorg/jaxen/jdom/JDOMXPath;-><init>(Ljava/lang/String;)V

    .line 384
    return-void
.end method


# virtual methods
.method public selectNodes(Ljava/lang/Object;Lorg/jaxen/NamespaceContext;)Ljava/util/List;
    .registers 6
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "namespaces"    # Lorg/jaxen/NamespaceContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 390
    invoke-virtual {p0, p1}, Lfreemarker/ext/xml/_JdomNavigator$JDOMXPathEx;->getContext(Ljava/lang/Object;)Lorg/jaxen/Context;

    move-result-object v0

    .line 391
    .local v0, "context":Lorg/jaxen/Context;
    invoke-virtual {v0}, Lorg/jaxen/Context;->getContextSupport()Lorg/jaxen/ContextSupport;

    move-result-object v2

    invoke-virtual {v2, p2}, Lorg/jaxen/ContextSupport;->setNamespaceContext(Lorg/jaxen/NamespaceContext;)V

    .line 393
    :try_start_b
    invoke-virtual {p0, v0}, Lfreemarker/ext/xml/_JdomNavigator$JDOMXPathEx;->selectNodesForContext(Lorg/jaxen/Context;)Ljava/util/List;
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_e} :catch_10

    move-result-object v2

    return-object v2

    .line 395
    :catch_10
    move-exception v1

    .line 396
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Lfreemarker/template/TemplateModelException;

    invoke-direct {v2, v1}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/Exception;)V

    throw v2
.end method
