.class public Lorg/apache/http/params/BasicHttpParams;
.super Lorg/apache/http/params/AbstractHttpParams;
.source "BasicHttpParams.java"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Cloneable;


# annotations
.annotation build Lorg/apache/http/annotation/NotThreadSafe;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x6257f1e0a974410fL


# instance fields
.field private final parameters:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/apache/http/params/AbstractHttpParams;-><init>()V

    .line 54
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/http/params/BasicHttpParams;->parameters:Ljava/util/HashMap;

    .line 58
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lorg/apache/http/params/BasicHttpParams;->parameters:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 125
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 152
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/params/BasicHttpParams;

    .line 153
    .local v0, "clone":Lorg/apache/http/params/BasicHttpParams;
    invoke-virtual {p0, v0}, Lorg/apache/http/params/BasicHttpParams;->copyParams(Lorg/apache/http/params/HttpParams;)V

    .line 154
    return-object v0
.end method

.method public copy()Lorg/apache/http/params/HttpParams;
    .registers 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 140
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/http/params/BasicHttpParams;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/http/params/HttpParams;
    :try_end_6
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_6} :catch_7

    return-object v1

    .line 141
    :catch_7
    move-exception v0

    .line 142
    .local v0, "ex":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    const-string v2, "Cloning not supported"

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public copyParams(Lorg/apache/http/params/HttpParams;)V
    .registers 6
    .param p1, "target"    # Lorg/apache/http/params/HttpParams;

    .prologue
    .line 165
    iget-object v2, p0, Lorg/apache/http/params/BasicHttpParams;->parameters:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 166
    .local v0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;>;"
    :cond_a
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 167
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 168
    .local v1, "me":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-eqz v2, :cond_a

    .line 169
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {p1, v2, v3}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    goto :goto_a

    .line 171
    .end local v1    # "me":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_2c
    return-void
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
    .line 184
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lorg/apache/http/params/BasicHttpParams;->parameters:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 61
    iget-object v0, p0, Lorg/apache/http/params/BasicHttpParams;->parameters:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isParameterSet(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 103
    invoke-virtual {p0, p1}, Lorg/apache/http/params/BasicHttpParams;->getParameter(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isParameterSetLocally(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 117
    iget-object v0, p0, Lorg/apache/http/params/BasicHttpParams;->parameters:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public removeParameter(Ljava/lang/String;)Z
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/http/params/BasicHttpParams;->parameters:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 72
    iget-object v0, p0, Lorg/apache/http/params/BasicHttpParams;->parameters:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    const/4 v0, 0x1

    .line 75
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 65
    iget-object v0, p0, Lorg/apache/http/params/BasicHttpParams;->parameters:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    return-object p0
.end method

.method public setParameters([Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "names"    # [Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 86
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p1

    if-ge v0, v1, :cond_c

    .line 87
    aget-object v1, p1, v0

    invoke-virtual {p0, v1, p2}, Lorg/apache/http/params/BasicHttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 86
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 89
    :cond_c
    return-void
.end method
