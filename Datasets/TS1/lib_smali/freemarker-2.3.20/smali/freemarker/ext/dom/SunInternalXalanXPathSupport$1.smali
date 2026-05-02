.class final Lfreemarker/ext/dom/SunInternalXalanXPathSupport$1;
.super Ljava/lang/Object;
.source "SunInternalXalanXPathSupport.java"

# interfaces
.implements Lcom/sun/org/apache/xml/internal/utils/PrefixResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/dom/SunInternalXalanXPathSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBaseIdentifier()Ljava/lang/String;
    .registers 2

    .prologue
    .line 153
    const/4 v0, 0x0

    return-object v0
.end method

.method public getNamespaceForPrefix(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 146
    const-string v0, "D"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 147
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v0

    invoke-virtual {v0}, Lfreemarker/core/Environment;->getDefaultNS()Ljava/lang/String;

    move-result-object v0

    .line 149
    :goto_10
    return-object v0

    :cond_11
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfreemarker/core/Environment;->getNamespaceForPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_10
.end method

.method public getNamespaceForPrefix(Ljava/lang/String;Lorg/w3c/dom/Node;)Ljava/lang/String;
    .registers 4
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 142
    invoke-virtual {p0, p1}, Lfreemarker/ext/dom/SunInternalXalanXPathSupport$1;->getNamespaceForPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public handlesNullPrefixes()Z
    .registers 2

    .prologue
    .line 157
    const/4 v0, 0x0

    return v0
.end method
