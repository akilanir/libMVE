.class final Lzmq/XPub$2;
.super Ljava/lang/Object;
.source "XPub.java"

# interfaces
.implements Lzmq/Mtrie$IMtrieHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/XPub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Lzmq/Pipe;[BILjava/lang/Object;)V
    .registers 10
    .param p1, "pipe"    # Lzmq/Pipe;
    .param p2, "data"    # [B
    .param p3, "size"    # I
    .param p4, "arg"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 74
    move-object v0, p4

    check-cast v0, Lzmq/XPub;

    .line 76
    .local v0, "self":Lzmq/XPub;
    iget-object v2, v0, Lzmq/XPub;->options:Lzmq/Options;

    iget v2, v2, Lzmq/Options;->type:I

    if-eq v2, v3, :cond_2a

    .line 79
    add-int/lit8 v2, p3, 0x1

    new-array v1, v2, [B

    .line 80
    .local v1, "unsub":[B
    aput-byte v4, v1, v4

    .line 81
    invoke-static {p2, v4, v1, v3, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 82
    # getter for: Lzmq/XPub;->pendingData:Ljava/util/Deque;
    invoke-static {v0}, Lzmq/XPub;->access$100(Lzmq/XPub;)Ljava/util/Deque;

    move-result-object v2

    invoke-static {v1, v4}, Lzmq/Blob;->createBlob([BZ)Lzmq/Blob;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 83
    # getter for: Lzmq/XPub;->pendingFlags:Ljava/util/Deque;
    invoke-static {v0}, Lzmq/XPub;->access$200(Lzmq/XPub;)Ljava/util/Deque;

    move-result-object v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 85
    .end local v1    # "unsub":[B
    :cond_2a
    return-void
.end method
