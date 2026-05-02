.class Lcom/drew/lang/ByteTrie$ByteTrieNode;
.super Ljava/lang/Object;
.source "ByteTrie.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/drew/lang/ByteTrie;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ByteTrieNode"
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
.field private final _children:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Byte;",
            "Lcom/drew/lang/ByteTrie$ByteTrieNode",
            "<TT;>;>;"
        }
    .end annotation
.end field

.field private _value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 36
    .local p0, "this":Lcom/drew/lang/ByteTrie$ByteTrieNode;, "Lcom/drew/lang/ByteTrie$ByteTrieNode<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/drew/lang/ByteTrie$ByteTrieNode;->_children:Ljava/util/Map;

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/drew/lang/ByteTrie$ByteTrieNode;->_value:Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$000(Lcom/drew/lang/ByteTrie$ByteTrieNode;)Ljava/lang/Object;
    .registers 2
    .param p0, "x0"    # Lcom/drew/lang/ByteTrie$ByteTrieNode;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/drew/lang/ByteTrie$ByteTrieNode;->_value:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Lcom/drew/lang/ByteTrie$ByteTrieNode;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lcom/drew/lang/ByteTrie$ByteTrieNode;

    .prologue
    .line 36
    iget-object v0, p0, Lcom/drew/lang/ByteTrie$ByteTrieNode;->_children:Ljava/util/Map;

    return-object v0
.end method


# virtual methods
.method public setValue(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p0, "this":Lcom/drew/lang/ByteTrie$ByteTrieNode;, "Lcom/drew/lang/ByteTrie$ByteTrieNode<TT;>;"
    .local p1, "value":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/drew/lang/ByteTrie$ByteTrieNode;->_value:Ljava/lang/Object;

    if-eqz v0, :cond_c

    .line 44
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Value already set for this trie node"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_c
    iput-object p1, p0, Lcom/drew/lang/ByteTrie$ByteTrieNode;->_value:Ljava/lang/Object;

    .line 46
    return-void
.end method
