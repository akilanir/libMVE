.class public Lcom/drew/lang/ByteTrie;
.super Ljava/lang/Object;
.source "ByteTrie.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/drew/lang/ByteTrie$ByteTrieNode;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private _maxDepth:I

.field private final _root:Lcom/drew/lang/ByteTrie$ByteTrieNode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/drew/lang/ByteTrie$ByteTrieNode",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 33
    .local p0, "this":Lcom/drew/lang/ByteTrie;, "Lcom/drew/lang/ByteTrie<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    new-instance v0, Lcom/drew/lang/ByteTrie$ByteTrieNode;

    invoke-direct {v0}, Lcom/drew/lang/ByteTrie$ByteTrieNode;-><init>()V

    iput-object v0, p0, Lcom/drew/lang/ByteTrie;->_root:Lcom/drew/lang/ByteTrie$ByteTrieNode;

    return-void
.end method


# virtual methods
.method public varargs addPath(Ljava/lang/Object;[[B)V
    .registers 16
    .param p2, "parts"    # [[B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;[[B)V"
        }
    .end annotation

    .prologue
    .line 76
    .local p0, "this":Lcom/drew/lang/ByteTrie;, "Lcom/drew/lang/ByteTrie<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    const/4 v4, 0x0

    .line 77
    .local v4, "depth":I
    iget-object v9, p0, Lcom/drew/lang/ByteTrie;->_root:Lcom/drew/lang/ByteTrie$ByteTrieNode;

    .line 78
    .local v9, "node":Lcom/drew/lang/ByteTrie$ByteTrieNode;, "Lcom/drew/lang/ByteTrie$ByteTrieNode<TT;>;"
    move-object v0, p2

    .local v0, "arr$":[[B
    array-length v7, v0

    .local v7, "len$":I
    const/4 v5, 0x0

    .local v5, "i$":I
    move v6, v5

    .end local v0    # "arr$":[[B
    .end local v5    # "i$":I
    .end local v7    # "len$":I
    .local v6, "i$":I
    :goto_7
    if-ge v6, v7, :cond_3c

    aget-object v10, v0, v6

    .line 79
    .local v10, "part":[B
    move-object v1, v10

    .local v1, "arr$":[B
    array-length v8, v1

    .local v8, "len$":I
    const/4 v5, 0x0

    .end local v6    # "i$":I
    .restart local v5    # "i$":I
    :goto_e
    if-ge v5, v8, :cond_38

    aget-byte v2, v1, v5

    .line 80
    .local v2, "b":B
    # getter for: Lcom/drew/lang/ByteTrie$ByteTrieNode;->_children:Ljava/util/Map;
    invoke-static {v9}, Lcom/drew/lang/ByteTrie$ByteTrieNode;->access$100(Lcom/drew/lang/ByteTrie$ByteTrieNode;)Ljava/util/Map;

    move-result-object v11

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v12

    invoke-interface {v11, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/drew/lang/ByteTrie$ByteTrieNode;

    .line 81
    .local v3, "child":Lcom/drew/lang/ByteTrie$ByteTrieNode;, "Lcom/drew/lang/ByteTrie$ByteTrieNode<TT;>;"
    if-nez v3, :cond_32

    .line 82
    new-instance v3, Lcom/drew/lang/ByteTrie$ByteTrieNode;

    .end local v3    # "child":Lcom/drew/lang/ByteTrie$ByteTrieNode;, "Lcom/drew/lang/ByteTrie$ByteTrieNode<TT;>;"
    invoke-direct {v3}, Lcom/drew/lang/ByteTrie$ByteTrieNode;-><init>()V

    .line 83
    .restart local v3    # "child":Lcom/drew/lang/ByteTrie$ByteTrieNode;, "Lcom/drew/lang/ByteTrie$ByteTrieNode<TT;>;"
    # getter for: Lcom/drew/lang/ByteTrie$ByteTrieNode;->_children:Ljava/util/Map;
    invoke-static {v9}, Lcom/drew/lang/ByteTrie$ByteTrieNode;->access$100(Lcom/drew/lang/ByteTrie$ByteTrieNode;)Ljava/util/Map;

    move-result-object v11

    invoke-static {v2}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v12

    invoke-interface {v11, v12, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    :cond_32
    move-object v9, v3

    .line 86
    add-int/lit8 v4, v4, 0x1

    .line 79
    add-int/lit8 v5, v5, 0x1

    goto :goto_e

    .line 78
    .end local v2    # "b":B
    .end local v3    # "child":Lcom/drew/lang/ByteTrie$ByteTrieNode;, "Lcom/drew/lang/ByteTrie$ByteTrieNode<TT;>;"
    :cond_38
    add-int/lit8 v5, v6, 0x1

    move v6, v5

    .end local v5    # "i$":I
    .restart local v6    # "i$":I
    goto :goto_7

    .line 89
    .end local v1    # "arr$":[B
    .end local v8    # "len$":I
    .end local v10    # "part":[B
    :cond_3c
    invoke-virtual {v9, p1}, Lcom/drew/lang/ByteTrie$ByteTrieNode;->setValue(Ljava/lang/Object;)V

    .line 90
    iget v11, p0, Lcom/drew/lang/ByteTrie;->_maxDepth:I

    invoke-static {v11, v4}, Ljava/lang/Math;->max(II)I

    move-result v11

    iput v11, p0, Lcom/drew/lang/ByteTrie;->_maxDepth:I

    .line 91
    return-void
.end method

.method public find([B)Ljava/lang/Object;
    .registers 11
    .param p1, "bytes"    # [B
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)TT;"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, "this":Lcom/drew/lang/ByteTrie;, "Lcom/drew/lang/ByteTrie<TT;>;"
    iget-object v5, p0, Lcom/drew/lang/ByteTrie;->_root:Lcom/drew/lang/ByteTrie$ByteTrieNode;

    .line 61
    .local v5, "node":Lcom/drew/lang/ByteTrie$ByteTrieNode;, "Lcom/drew/lang/ByteTrie$ByteTrieNode<TT;>;"
    # getter for: Lcom/drew/lang/ByteTrie$ByteTrieNode;->_value:Ljava/lang/Object;
    invoke-static {v5}, Lcom/drew/lang/ByteTrie$ByteTrieNode;->access$000(Lcom/drew/lang/ByteTrie$ByteTrieNode;)Ljava/lang/Object;

    move-result-object v6

    .line 62
    .local v6, "value":Ljava/lang/Object;, "TT;"
    move-object v0, p1

    .local v0, "arr$":[B
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_9
    if-ge v3, v4, :cond_1d

    aget-byte v1, v0, v3

    .line 63
    .local v1, "b":B
    # getter for: Lcom/drew/lang/ByteTrie$ByteTrieNode;->_children:Ljava/util/Map;
    invoke-static {v5}, Lcom/drew/lang/ByteTrie$ByteTrieNode;->access$100(Lcom/drew/lang/ByteTrie$ByteTrieNode;)Ljava/util/Map;

    move-result-object v7

    invoke-static {v1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/drew/lang/ByteTrie$ByteTrieNode;

    .line 64
    .local v2, "child":Lcom/drew/lang/ByteTrie$ByteTrieNode;, "Lcom/drew/lang/ByteTrie$ByteTrieNode<TT;>;"
    if-nez v2, :cond_1e

    .line 70
    .end local v1    # "b":B
    .end local v2    # "child":Lcom/drew/lang/ByteTrie$ByteTrieNode;, "Lcom/drew/lang/ByteTrie$ByteTrieNode<TT;>;"
    :cond_1d
    return-object v6

    .line 66
    .restart local v1    # "b":B
    .restart local v2    # "child":Lcom/drew/lang/ByteTrie$ByteTrieNode;, "Lcom/drew/lang/ByteTrie$ByteTrieNode<TT;>;"
    :cond_1e
    move-object v5, v2

    .line 67
    # getter for: Lcom/drew/lang/ByteTrie$ByteTrieNode;->_value:Ljava/lang/Object;
    invoke-static {v5}, Lcom/drew/lang/ByteTrie$ByteTrieNode;->access$000(Lcom/drew/lang/ByteTrie$ByteTrieNode;)Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_29

    .line 68
    # getter for: Lcom/drew/lang/ByteTrie$ByteTrieNode;->_value:Ljava/lang/Object;
    invoke-static {v5}, Lcom/drew/lang/ByteTrie$ByteTrieNode;->access$000(Lcom/drew/lang/ByteTrie$ByteTrieNode;)Ljava/lang/Object;

    move-result-object v6

    .line 62
    :cond_29
    add-int/lit8 v3, v3, 0x1

    goto :goto_9
.end method

.method public getMaxDepth()I
    .registers 2

    .prologue
    .line 102
    .local p0, "this":Lcom/drew/lang/ByteTrie;, "Lcom/drew/lang/ByteTrie<TT;>;"
    iget v0, p0, Lcom/drew/lang/ByteTrie;->_maxDepth:I

    return v0
.end method

.method public setDefaultValue(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 96
    .local p0, "this":Lcom/drew/lang/ByteTrie;, "Lcom/drew/lang/ByteTrie<TT;>;"
    .local p1, "defaultValue":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/drew/lang/ByteTrie;->_root:Lcom/drew/lang/ByteTrie$ByteTrieNode;

    invoke-virtual {v0, p1}, Lcom/drew/lang/ByteTrie$ByteTrieNode;->setValue(Ljava/lang/Object;)V

    .line 97
    return-void
.end method
