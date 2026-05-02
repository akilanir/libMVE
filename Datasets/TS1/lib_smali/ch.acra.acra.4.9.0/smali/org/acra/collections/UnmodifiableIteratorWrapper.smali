.class Lorg/acra/collections/UnmodifiableIteratorWrapper;
.super Ljava/lang/Object;
.source "UnmodifiableIteratorWrapper.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private final mIterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<TE;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Iterator;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<TE;>;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lorg/acra/collections/UnmodifiableIteratorWrapper;, "Lorg/acra/collections/UnmodifiableIteratorWrapper<TE;>;"
    .local p1, "mIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lorg/acra/collections/UnmodifiableIteratorWrapper;->mIterator:Ljava/util/Iterator;

    .line 31
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .prologue
    .line 35
    .local p0, "this":Lorg/acra/collections/UnmodifiableIteratorWrapper;, "Lorg/acra/collections/UnmodifiableIteratorWrapper<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/UnmodifiableIteratorWrapper;->mIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lorg/acra/collections/UnmodifiableIteratorWrapper;, "Lorg/acra/collections/UnmodifiableIteratorWrapper<TE;>;"
    iget-object v0, p0, Lorg/acra/collections/UnmodifiableIteratorWrapper;->mIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 45
    .local p0, "this":Lorg/acra/collections/UnmodifiableIteratorWrapper;, "Lorg/acra/collections/UnmodifiableIteratorWrapper<TE;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
