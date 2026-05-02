.class public abstract Lcom/koushikdutta/ion/bitmap/ReferenceHashtable;
.super Ljava/lang/Object;
.source "ReferenceHashtable.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/ref/Reference",
        "<TV;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field mTable:Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Hashtable",
            "<TK;TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 7
    .local p0, "this":Lcom/koushikdutta/ion/bitmap/ReferenceHashtable;, "Lcom/koushikdutta/ion/bitmap/ReferenceHashtable<TK;TV;TR;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/ion/bitmap/ReferenceHashtable;->mTable:Ljava/util/Hashtable;

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 37
    .local p0, "this":Lcom/koushikdutta/ion/bitmap/ReferenceHashtable;, "Lcom/koushikdutta/ion/bitmap/ReferenceHashtable<TK;TV;TR;>;"
    iget-object v0, p0, Lcom/koushikdutta/ion/bitmap/ReferenceHashtable;->mTable:Ljava/util/Hashtable;

    invoke-virtual {v0}, Ljava/util/Hashtable;->clear()V

    .line 38
    return-void
.end method

.method protected abstract create(Ljava/lang/Object;)Ljava/lang/ref/Reference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TR;"
        }
    .end annotation
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .line 20
    .local p0, "this":Lcom/koushikdutta/ion/bitmap/ReferenceHashtable;, "Lcom/koushikdutta/ion/bitmap/ReferenceHashtable<TK;TV;TR;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    iget-object v2, p0, Lcom/koushikdutta/ion/bitmap/ReferenceHashtable;->mTable:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/Reference;

    .line 21
    .local v1, "val":Ljava/lang/ref/Reference;, "TR;"
    if-nez v1, :cond_c

    .line 22
    const/4 v0, 0x0

    .line 26
    :cond_b
    :goto_b
    return-object v0

    .line 23
    :cond_c
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 24
    .local v0, "ret":Ljava/lang/Object;, "TV;"
    if-nez v0, :cond_b

    .line 25
    iget-object v2, p0, Lcom/koushikdutta/ion/bitmap/ReferenceHashtable;->mTable:Ljava/util/Hashtable;

    invoke-virtual {v2, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .prologue
    .line 13
    .local p0, "this":Lcom/koushikdutta/ion/bitmap/ReferenceHashtable;, "Lcom/koushikdutta/ion/bitmap/ReferenceHashtable<TK;TV;TR;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    iget-object v1, p0, Lcom/koushikdutta/ion/bitmap/ReferenceHashtable;->mTable:Ljava/util/Hashtable;

    invoke-virtual {p0, p2}, Lcom/koushikdutta/ion/bitmap/ReferenceHashtable;->create(Ljava/lang/Object;)Ljava/lang/ref/Reference;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/Reference;

    .line 14
    .local v0, "old":Ljava/lang/ref/Reference;, "TR;"
    if-nez v0, :cond_10

    .line 15
    const/4 v1, 0x0

    .line 16
    :goto_f
    return-object v1

    :cond_10
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    goto :goto_f
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lcom/koushikdutta/ion/bitmap/ReferenceHashtable;, "Lcom/koushikdutta/ion/bitmap/ReferenceHashtable<TK;TV;TR;>;"
    .local p1, "k":Ljava/lang/Object;, "TK;"
    iget-object v1, p0, Lcom/koushikdutta/ion/bitmap/ReferenceHashtable;->mTable:Ljava/util/Hashtable;

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/Reference;

    .line 31
    .local v0, "v":Ljava/lang/ref/Reference;, "TR;"
    if-nez v0, :cond_c

    .line 32
    const/4 v1, 0x0

    .line 33
    :goto_b
    return-object v1

    :cond_c
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    goto :goto_b
.end method
