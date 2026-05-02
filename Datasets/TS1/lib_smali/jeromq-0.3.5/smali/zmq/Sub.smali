.class public Lzmq/Sub;
.super Lzmq/XSub;
.source "Sub.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Sub$SubSession;
    }
.end annotation


# direct methods
.method public constructor <init>(Lzmq/Ctx;II)V
    .registers 6
    .param p1, "parent"    # Lzmq/Ctx;
    .param p2, "tid"    # I
    .param p3, "sid"    # I

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3}, Lzmq/XSub;-><init>(Lzmq/Ctx;II)V

    .line 38
    iget-object v0, p0, Lzmq/Sub;->options:Lzmq/Options;

    const/4 v1, 0x2

    iput v1, v0, Lzmq/Options;->type:I

    .line 42
    iget-object v0, p0, Lzmq/Sub;->options:Lzmq/Options;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lzmq/Options;->filter:Z

    .line 43
    return-void
.end method


# virtual methods
.method protected xhasOut()Z
    .registers 2

    .prologue
    .line 94
    const/4 v0, 0x0

    return v0
.end method

.method protected xsend(Lzmq/Msg;)Z
    .registers 3
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    .line 87
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public xsetsockopt(ILjava/lang/Object;)Z
    .registers 10
    .param p1, "option"    # I
    .param p2, "optval"    # Ljava/lang/Object;

    .prologue
    const/4 v6, 0x6

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 48
    if-eq p1, v6, :cond_9

    const/4 v5, 0x7

    if-eq p1, v5, :cond_9

    .line 80
    .end local p2    # "optval":Ljava/lang/Object;
    :goto_8
    return v3

    .line 54
    .restart local p2    # "optval":Ljava/lang/Object;
    :cond_9
    instance-of v5, p2, Ljava/lang/String;

    if-eqz v5, :cond_33

    .line 55
    check-cast p2, Ljava/lang/String;

    .end local p2    # "optval":Ljava/lang/Object;
    sget-object v5, Lzmq/ZMQ;->CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    .line 65
    .local v2, "val":[B
    :goto_15
    new-instance v0, Lzmq/Msg;

    array-length v5, v2

    add-int/lit8 v5, v5, 0x1

    invoke-direct {v0, v5}, Lzmq/Msg;-><init>(I)V

    .line 66
    .local v0, "msg":Lzmq/Msg;
    if-ne p1, v6, :cond_43

    .line 67
    invoke-virtual {v0, v4}, Lzmq/Msg;->put(B)Lzmq/Msg;

    .line 73
    :goto_22
    invoke-virtual {v0, v2}, Lzmq/Msg;->put([B)Lzmq/Msg;

    .line 75
    invoke-super {p0, v0}, Lzmq/XSub;->xsend(Lzmq/Msg;)Z

    move-result v1

    .line 76
    .local v1, "rc":Z
    if-nez v1, :cond_47

    .line 77
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Failed to send subscribe/unsubscribe message"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 57
    .end local v0    # "msg":Lzmq/Msg;
    .end local v1    # "rc":Z
    .end local v2    # "val":[B
    .restart local p2    # "optval":Ljava/lang/Object;
    :cond_33
    instance-of v5, p2, [B

    if-eqz v5, :cond_3d

    .line 58
    check-cast p2, [B

    .end local p2    # "optval":Ljava/lang/Object;
    move-object v2, p2

    check-cast v2, [B

    .restart local v2    # "val":[B
    goto :goto_15

    .line 61
    .end local v2    # "val":[B
    .restart local p2    # "optval":Ljava/lang/Object;
    :cond_3d
    new-instance v3, Ljava/lang/IllegalArgumentException;

    invoke-direct {v3}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v3

    .line 71
    .end local p2    # "optval":Ljava/lang/Object;
    .restart local v0    # "msg":Lzmq/Msg;
    .restart local v2    # "val":[B
    :cond_43
    invoke-virtual {v0, v3}, Lzmq/Msg;->put(B)Lzmq/Msg;

    goto :goto_22

    .restart local v1    # "rc":Z
    :cond_47
    move v3, v4

    .line 80
    goto :goto_8
.end method
