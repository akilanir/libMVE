.class public final Lcz/msebera/android/httpclient/params/DefaultedHttpParams;
.super Lcz/msebera/android/httpclient/params/AbstractHttpParams;
.source "DefaultedHttpParams.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final defaults:Lcz/msebera/android/httpclient/params/HttpParams;

.field private final local:Lcz/msebera/android/httpclient/params/HttpParams;


# direct methods
.method public constructor <init>(Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;)V
    .registers 4
    .param p1, "local"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .param p2, "defaults"    # Lcz/msebera/android/httpclient/params/HttpParams;

    .prologue
    .line 59
    invoke-direct {p0}, Lcz/msebera/android/httpclient/params/AbstractHttpParams;-><init>()V

    .line 60
    const-string v0, "Local HTTP parameters"

    invoke-static {p1, v0}, Lcz/msebera/android/httpclient/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/params/HttpParams;

    iput-object v0, p0, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->local:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 61
    iput-object p2, p0, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->defaults:Lcz/msebera/android/httpclient/params/HttpParams;

    .line 62
    return-void
.end method

.method private getNames(Lcz/msebera/android/httpclient/params/HttpParams;)Ljava/util/Set;
    .registers 4
    .param p1, "params"    # Lcz/msebera/android/httpclient/params/HttpParams;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcz/msebera/android/httpclient/params/HttpParams;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 157
    instance-of v0, p1, Lcz/msebera/android/httpclient/params/HttpParamsNames;

    if-eqz v0, :cond_b

    .line 158
    check-cast p1, Lcz/msebera/android/httpclient/params/HttpParamsNames;

    .end local p1    # "params":Lcz/msebera/android/httpclient/params/HttpParams;
    invoke-interface {p1}, Lcz/msebera/android/httpclient/params/HttpParamsNames;->getNames()Ljava/util/Set;

    move-result-object v0

    return-object v0

    .line 160
    .restart local p1    # "params":Lcz/msebera/android/httpclient/params/HttpParams;
    :cond_b
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "HttpParams instance does not implement HttpParamsNames"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public copy()Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 4

    .prologue
    .line 68
    iget-object v1, p0, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->local:Lcz/msebera/android/httpclient/params/HttpParams;

    invoke-interface {v1}, Lcz/msebera/android/httpclient/params/HttpParams;->copy()Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v0

    .line 69
    .local v0, "clone":Lcz/msebera/android/httpclient/params/HttpParams;
    new-instance v1, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;

    iget-object v2, p0, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->defaults:Lcz/msebera/android/httpclient/params/HttpParams;

    invoke-direct {v1, v0, v2}, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;-><init>(Lcz/msebera/android/httpclient/params/HttpParams;Lcz/msebera/android/httpclient/params/HttpParams;)V

    return-object v1
.end method

.method public getDefaultNames()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 138
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->defaults:Lcz/msebera/android/httpclient/params/HttpParams;

    invoke-direct {p0, v1}, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->getNames(Lcz/msebera/android/httpclient/params/HttpParams;)Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getDefaults()Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->defaults:Lcz/msebera/android/httpclient/params/HttpParams;

    return-object v0
.end method

.method public getLocalNames()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 152
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->local:Lcz/msebera/android/httpclient/params/HttpParams;

    invoke-direct {p0, v1}, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->getNames(Lcz/msebera/android/httpclient/params/HttpParams;)Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getNames()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 122
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->defaults:Lcz/msebera/android/httpclient/params/HttpParams;

    invoke-direct {p0, v1}, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->getNames(Lcz/msebera/android/httpclient/params/HttpParams;)Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 123
    .local v0, "combined":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v1, p0, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->local:Lcz/msebera/android/httpclient/params/HttpParams;

    invoke-direct {p0, v1}, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->getNames(Lcz/msebera/android/httpclient/params/HttpParams;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 124
    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 78
    iget-object v1, p0, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->local:Lcz/msebera/android/httpclient/params/HttpParams;

    invoke-interface {v1, p1}, Lcz/msebera/android/httpclient/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 79
    .local v0, "obj":Ljava/lang/Object;
    if-nez v0, :cond_12

    iget-object v1, p0, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->defaults:Lcz/msebera/android/httpclient/params/HttpParams;

    if-eqz v1, :cond_12

    .line 80
    iget-object v1, p0, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->defaults:Lcz/msebera/android/httpclient/params/HttpParams;

    invoke-interface {v1, p1}, Lcz/msebera/android/httpclient/params/HttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 82
    :cond_12
    return-object v0
.end method

.method public removeParameter(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 90
    iget-object v0, p0, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->local:Lcz/msebera/android/httpclient/params/HttpParams;

    invoke-interface {v0, p1}, Lcz/msebera/android/httpclient/params/HttpParams;->removeParameter(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/params/HttpParams;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 98
    iget-object v0, p0, Lcz/msebera/android/httpclient/params/DefaultedHttpParams;->local:Lcz/msebera/android/httpclient/params/HttpParams;

    invoke-interface {v0, p1, p2}, Lcz/msebera/android/httpclient/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lcz/msebera/android/httpclient/params/HttpParams;

    move-result-object v0

    return-object v0
.end method
