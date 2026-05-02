.class public Lzmq/Pub;
.super Lzmq/XPub;
.source "Pub.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Pub$PubSession;
    }
.end annotation


# direct methods
.method public constructor <init>(Lzmq/Ctx;II)V
    .registers 6
    .param p1, "parent"    # Lzmq/Ctx;
    .param p2, "tid"    # I
    .param p3, "sid"    # I

    .prologue
    .line 35
    invoke-direct {p0, p1, p2, p3}, Lzmq/XPub;-><init>(Lzmq/Ctx;II)V

    .line 36
    iget-object v0, p0, Lzmq/Pub;->options:Lzmq/Options;

    const/4 v1, 0x1

    iput v1, v0, Lzmq/Options;->type:I

    .line 37
    return-void
.end method


# virtual methods
.method protected xhasIn()Z
    .registers 2

    .prologue
    .line 49
    const/4 v0, 0x0

    return v0
.end method

.method protected xrecv()Lzmq/Msg;
    .registers 2

    .prologue
    .line 43
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public bridge synthetic xsetsockopt(ILjava/lang/Object;)Z
    .registers 4
    .param p1, "x0"    # I
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 22
    invoke-super {p0, p1, p2}, Lzmq/XPub;->xsetsockopt(ILjava/lang/Object;)Z

    move-result v0

    return v0
.end method
