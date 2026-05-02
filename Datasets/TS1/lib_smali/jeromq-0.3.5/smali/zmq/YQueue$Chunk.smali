.class Lzmq/YQueue$Chunk;
.super Ljava/lang/Object;
.source "YQueue.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/YQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Chunk"
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
.field next:Lzmq/YQueue$Chunk;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lzmq/YQueue$Chunk",
            "<TT;>;"
        }
    .end annotation
.end field

.field final pos:[I

.field prev:Lzmq/YQueue$Chunk;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lzmq/YQueue$Chunk",
            "<TT;>;"
        }
    .end annotation
.end field

.field final values:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(II)V
    .registers 5
    .param p1, "size"    # I
    .param p2, "memoryPtr"    # I

    .prologue
    .line 34
    .local p0, "this":Lzmq/YQueue$Chunk;, "Lzmq/YQueue$Chunk<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-array v1, p1, [Ljava/lang/Object;

    check-cast v1, [Ljava/lang/Object;

    iput-object v1, p0, Lzmq/YQueue$Chunk;->values:[Ljava/lang/Object;

    .line 36
    new-array v1, p1, [I

    iput-object v1, p0, Lzmq/YQueue$Chunk;->pos:[I

    .line 37
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    iget-object v1, p0, Lzmq/YQueue$Chunk;->values:[Ljava/lang/Object;

    array-length v1, v1

    if-eq v0, v1, :cond_1c

    .line 38
    iget-object v1, p0, Lzmq/YQueue$Chunk;->pos:[I

    aput p2, v1, v0

    .line 39
    add-int/lit8 p2, p2, 0x1

    .line 37
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 41
    :cond_1c
    return-void
.end method
