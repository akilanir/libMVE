.class final Lfreemarker/ext/dom/JaxenXPathSupport$2;
.super Ljava/lang/Object;
.source "JaxenXPathSupport.java"

# interfaces
.implements Lorg/jaxen/NamespaceContext;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public translateNamespacePrefixToUri(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 147
    const-string v0, "D"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 148
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v0

    invoke-virtual {v0}, Lfreemarker/core/Environment;->getDefaultNS()Ljava/lang/String;

    move-result-object v0

    .line 150
    :goto_10
    return-object v0

    :cond_11
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfreemarker/core/Environment;->getNamespaceForPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_10
.end method
