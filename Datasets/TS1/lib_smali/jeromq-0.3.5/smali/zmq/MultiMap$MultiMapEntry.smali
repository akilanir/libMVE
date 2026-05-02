.class public Lzmq/MultiMap$MultiMapEntry;
.super Ljava/lang/Object;
.source "MultiMap.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/MultiMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MultiMapEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field private key:Ljava/lang/Comparable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lzmq/MultiMap;

.field private value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lzmq/MultiMap;Ljava/lang/Comparable;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .prologue
    .line 48
    .local p0, "this":Lzmq/MultiMap$MultiMapEntry;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntry;"
    .local p2, "key":Ljava/lang/Comparable;, "TK;"
    .local p3, "value":Ljava/lang/Object;, "TV;"
    iput-object p1, p0, Lzmq/MultiMap$MultiMapEntry;->this$0:Lzmq/MultiMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    iput-object p2, p0, Lzmq/MultiMap$MultiMapEntry;->key:Ljava/lang/Comparable;

    .line 50
    iput-object p3, p0, Lzmq/MultiMap$MultiMapEntry;->value:Ljava/lang/Object;

    .line 51
    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/Comparable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 55
    .local p0, "this":Lzmq/MultiMap$MultiMapEntry;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntry;"
    iget-object v0, p0, Lzmq/MultiMap$MultiMapEntry;->key:Ljava/lang/Comparable;

    return-object v0
.end method

.method public bridge synthetic getKey()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 43
    .local p0, "this":Lzmq/MultiMap$MultiMapEntry;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntry;"
    invoke-virtual {p0}, Lzmq/MultiMap$MultiMapEntry;->getKey()Ljava/lang/Comparable;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "this":Lzmq/MultiMap$MultiMapEntry;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntry;"
    iget-object v0, p0, Lzmq/MultiMap$MultiMapEntry;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TV;"
        }
    .end annotation

    .prologue
    .line 67
    .local p0, "this":Lzmq/MultiMap$MultiMapEntry;, "Lzmq/MultiMap<TK;TV;>.MultiMapEntry;"
    .local p1, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lzmq/MultiMap$MultiMapEntry;->value:Ljava/lang/Object;

    .line 68
    .local v0, "old":Ljava/lang/Object;, "TV;"
    iput-object p1, p0, Lzmq/MultiMap$MultiMapEntry;->value:Ljava/lang/Object;

    .line 69
    return-object v0
.end method
