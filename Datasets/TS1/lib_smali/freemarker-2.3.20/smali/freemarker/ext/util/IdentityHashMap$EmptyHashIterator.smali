.class Lfreemarker/ext/util/IdentityHashMap$EmptyHashIterator;
.super Ljava/lang/Object;
.source "IdentityHashMap.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lfreemarker/ext/util/IdentityHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EmptyHashIterator"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 766
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 768
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .prologue
    .line 772
    const/4 v0, 0x0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 777
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 782
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method
