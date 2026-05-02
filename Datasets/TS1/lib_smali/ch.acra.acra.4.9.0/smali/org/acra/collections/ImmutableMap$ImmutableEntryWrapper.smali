.class public Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper;
.super Ljava/lang/Object;
.source "ImmutableMap.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/acra/collections/ImmutableMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImmutableEntryWrapper"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field private final mEntry:Ljava/util/Map$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map$Entry",
            "<TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Map$Entry;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<TK;TV;>;)V"
        }
    .end annotation

    .prologue
    .line 111
    .local p0, "this":Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper;, "Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper<TK;TV;>;"
    .local p1, "mEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<TK;TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iput-object p1, p0, Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper;->mEntry:Ljava/util/Map$Entry;

    .line 113
    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 117
    .local p0, "this":Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper;, "Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper<TK;TV;>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper;->mEntry:Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

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
    .line 122
    .local p0, "this":Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper;, "Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper<TK;TV;>;"
    iget-object v0, p0, Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper;->mEntry:Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 127
    .local p0, "this":Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper;, "Lorg/acra/collections/ImmutableMap$ImmutableEntryWrapper<TK;TV;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
