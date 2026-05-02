.class public Lcom/alibaba/fastjson/util/IdentityHashMap;
.super Ljava/lang/Object;
.source "IdentityHashMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final buckets:[Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/alibaba/fastjson/util/IdentityHashMap$Entry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field private final indexMask:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 29
    .local p0, "this":Lcom/alibaba/fastjson/util/IdentityHashMap;, "Lcom/alibaba/fastjson/util/IdentityHashMap<TK;TV;>;"
    const/16 v0, 0x400

    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/util/IdentityHashMap;-><init>(I)V

    .line 30
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "tableSize"    # I

    .prologue
    .line 32
    .local p0, "this":Lcom/alibaba/fastjson/util/IdentityHashMap;, "Lcom/alibaba/fastjson/util/IdentityHashMap<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    add-int/lit8 v0, p1, -0x1

    iput v0, p0, Lcom/alibaba/fastjson/util/IdentityHashMap;->indexMask:I

    .line 34
    new-array v0, p1, [Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;

    iput-object v0, p0, Lcom/alibaba/fastjson/util/IdentityHashMap;->buckets:[Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;

    .line 35
    return-void
.end method


# virtual methods
.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "this":Lcom/alibaba/fastjson/util/IdentityHashMap;, "Lcom/alibaba/fastjson/util/IdentityHashMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    .line 39
    .local v2, "hash":I
    iget v3, p0, Lcom/alibaba/fastjson/util/IdentityHashMap;->indexMask:I

    and-int v0, v2, v3

    .line 41
    .local v0, "bucket":I
    iget-object v3, p0, Lcom/alibaba/fastjson/util/IdentityHashMap;->buckets:[Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;

    aget-object v1, v3, v0

    .local v1, "entry":Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;, "Lcom/alibaba/fastjson/util/IdentityHashMap$Entry<TK;TV;>;"
    :goto_c
    if-eqz v1, :cond_18

    .line 42
    iget-object v3, v1, Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    if-ne p1, v3, :cond_15

    .line 43
    iget-object v3, v1, Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    .line 47
    :goto_14
    return-object v3

    .line 41
    :cond_15
    iget-object v1, v1, Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;->next:Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;

    goto :goto_c

    .line 47
    :cond_18
    const/4 v3, 0x0

    goto :goto_14
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)Z"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "this":Lcom/alibaba/fastjson/util/IdentityHashMap;, "Lcom/alibaba/fastjson/util/IdentityHashMap<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v2

    .line 52
    .local v2, "hash":I
    iget v3, p0, Lcom/alibaba/fastjson/util/IdentityHashMap;->indexMask:I

    and-int v0, v2, v3

    .line 54
    .local v0, "bucket":I
    iget-object v3, p0, Lcom/alibaba/fastjson/util/IdentityHashMap;->buckets:[Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;

    aget-object v1, v3, v0

    .local v1, "entry":Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;, "Lcom/alibaba/fastjson/util/IdentityHashMap$Entry<TK;TV;>;"
    :goto_c
    if-eqz v1, :cond_19

    .line 55
    iget-object v3, v1, Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;->key:Ljava/lang/Object;

    if-ne p1, v3, :cond_16

    .line 56
    iput-object p2, v1, Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;->value:Ljava/lang/Object;

    .line 57
    const/4 v3, 0x1

    .line 64
    :goto_15
    return v3

    .line 54
    :cond_16
    iget-object v1, v1, Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;->next:Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;

    goto :goto_c

    .line 61
    :cond_19
    new-instance v1, Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;

    .end local v1    # "entry":Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;, "Lcom/alibaba/fastjson/util/IdentityHashMap$Entry<TK;TV;>;"
    iget-object v3, p0, Lcom/alibaba/fastjson/util/IdentityHashMap;->buckets:[Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;

    aget-object v3, v3, v0

    invoke-direct {v1, p1, p2, v2, v3}, Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;-><init>(Ljava/lang/Object;Ljava/lang/Object;ILcom/alibaba/fastjson/util/IdentityHashMap$Entry;)V

    .line 62
    .restart local v1    # "entry":Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;, "Lcom/alibaba/fastjson/util/IdentityHashMap$Entry<TK;TV;>;"
    iget-object v3, p0, Lcom/alibaba/fastjson/util/IdentityHashMap;->buckets:[Lcom/alibaba/fastjson/util/IdentityHashMap$Entry;

    aput-object v1, v3, v0

    .line 64
    const/4 v3, 0x0

    goto :goto_15
.end method
