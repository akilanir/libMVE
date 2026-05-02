.class final Lfreemarker/ext/dom/JaxenXPathSupport$4;
.super Lorg/jaxen/XPathFunctionContext;
.source "JaxenXPathSupport.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 184
    invoke-direct {p0}, Lorg/jaxen/XPathFunctionContext;-><init>()V

    return-void
.end method


# virtual methods
.method public getFunction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/jaxen/Function;
    .registers 6
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "prefix"    # Ljava/lang/String;
    .param p3, "localName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jaxen/UnresolvableException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 188
    :try_start_1
    invoke-super {p0, p1, p2, p3}, Lorg/jaxen/XPathFunctionContext;->getFunction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/jaxen/Function;
    :try_end_4
    .catch Lorg/jaxen/UnresolvableException; {:try_start_1 .. :try_end_4} :catch_6

    move-result-object v1

    .line 191
    :goto_5
    return-object v1

    .line 190
    :catch_6
    move-exception v0

    .line 191
    .local v0, "e":Lorg/jaxen/UnresolvableException;
    invoke-super {p0, v1, v1, p3}, Lorg/jaxen/XPathFunctionContext;->getFunction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/jaxen/Function;

    move-result-object v1

    goto :goto_5
.end method
