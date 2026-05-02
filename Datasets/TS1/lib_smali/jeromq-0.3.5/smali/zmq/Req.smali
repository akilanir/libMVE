.class public Lzmq/Req;
.super Lzmq/Dealer;
.source "Req.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Req$1;,
        Lzmq/Req$ReqSession;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private messageBegins:Z

.field private receivingReply:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 22
    const-class v0, Lzmq/Req;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/Req;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>(Lzmq/Ctx;II)V
    .registers 6
    .param p1, "parent"    # Lzmq/Ctx;
    .param p2, "tid"    # I
    .param p3, "sid"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3}, Lzmq/Dealer;-><init>(Lzmq/Ctx;II)V

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lzmq/Req;->receivingReply:Z

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lzmq/Req;->messageBegins:Z

    .line 38
    iget-object v0, p0, Lzmq/Req;->options:Lzmq/Options;

    const/4 v1, 0x3

    iput v1, v0, Lzmq/Options;->type:I

    .line 39
    return-void
.end method


# virtual methods
.method public xhasIn()Z
    .registers 2

    .prologue
    .line 129
    iget-boolean v0, p0, Lzmq/Req;->receivingReply:Z

    if-eqz v0, :cond_c

    invoke-super {p0}, Lzmq/Dealer;->xhasIn()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public xhasOut()Z
    .registers 2

    .prologue
    .line 135
    iget-boolean v0, p0, Lzmq/Req;->receivingReply:Z

    if-nez v0, :cond_c

    invoke-super {p0}, Lzmq/Dealer;->xhasOut()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected xrecv()Lzmq/Msg;
    .registers 5

    .prologue
    const/4 v3, 0x0

    const/4 v1, 0x0

    .line 82
    iget-boolean v2, p0, Lzmq/Req;->receivingReply:Z

    if-nez v2, :cond_14

    .line 83
    iget-object v2, p0, Lzmq/Req;->errno:Lzmq/ValueReference;

    const v3, 0x9523dfb

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    move-object v0, v1

    .line 121
    :cond_13
    :goto_13
    return-object v0

    .line 86
    :cond_14
    const/4 v0, 0x0

    .line 88
    .local v0, "msg":Lzmq/Msg;
    iget-boolean v2, p0, Lzmq/Req;->messageBegins:Z

    if-eqz v2, :cond_52

    .line 89
    invoke-super {p0}, Lzmq/Dealer;->xrecv()Lzmq/Msg;

    move-result-object v0

    .line 90
    if-nez v0, :cond_21

    move-object v0, v1

    .line 91
    goto :goto_13

    .line 95
    :cond_21
    invoke-virtual {v0}, Lzmq/Msg;->hasMore()Z

    move-result v2

    if-eqz v2, :cond_2d

    invoke-virtual {v0}, Lzmq/Msg;->size()I

    move-result v2

    if-eqz v2, :cond_50

    .line 97
    :cond_2d
    invoke-super {p0}, Lzmq/Dealer;->xrecv()Lzmq/Msg;

    move-result-object v0

    .line 98
    sget-boolean v2, Lzmq/Req;->$assertionsDisabled:Z

    if-nez v2, :cond_3d

    if-nez v0, :cond_3d

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 99
    :cond_3d
    invoke-virtual {v0}, Lzmq/Msg;->hasMore()Z

    move-result v2

    if-nez v2, :cond_2d

    .line 103
    iget-object v2, p0, Lzmq/Req;->errno:Lzmq/ValueReference;

    const/16 v3, 0x23

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    move-object v0, v1

    .line 104
    goto :goto_13

    .line 107
    :cond_50
    iput-boolean v3, p0, Lzmq/Req;->messageBegins:Z

    .line 110
    :cond_52
    invoke-super {p0}, Lzmq/Dealer;->xrecv()Lzmq/Msg;

    move-result-object v0

    .line 111
    if-nez v0, :cond_5a

    move-object v0, v1

    .line 112
    goto :goto_13

    .line 116
    :cond_5a
    invoke-virtual {v0}, Lzmq/Msg;->hasMore()Z

    move-result v1

    if-nez v1, :cond_13

    .line 117
    iput-boolean v3, p0, Lzmq/Req;->receivingReply:Z

    .line 118
    const/4 v1, 0x1

    iput-boolean v1, p0, Lzmq/Req;->messageBegins:Z

    goto :goto_13
.end method

.method public xsend(Lzmq/Msg;)Z
    .registers 8
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 46
    iget-boolean v5, p0, Lzmq/Req;->receivingReply:Z

    if-eqz v5, :cond_14

    .line 47
    iget-object v4, p0, Lzmq/Req;->errno:Lzmq/ValueReference;

    const v5, 0x9523dfb

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Lzmq/ValueReference;->set(Ljava/lang/Object;)V

    move v2, v3

    .line 75
    :cond_13
    :goto_13
    return v2

    .line 52
    :cond_14
    iget-boolean v5, p0, Lzmq/Req;->messageBegins:Z

    if-eqz v5, :cond_28

    .line 53
    new-instance v0, Lzmq/Msg;

    invoke-direct {v0}, Lzmq/Msg;-><init>()V

    .line 54
    .local v0, "bottom":Lzmq/Msg;
    invoke-virtual {v0, v4}, Lzmq/Msg;->setFlags(I)V

    .line 55
    invoke-super {p0, v0}, Lzmq/Dealer;->xsend(Lzmq/Msg;)Z

    move-result v2

    .line 56
    .local v2, "rc":Z
    if-eqz v2, :cond_13

    .line 59
    iput-boolean v3, p0, Lzmq/Req;->messageBegins:Z

    .line 62
    .end local v0    # "bottom":Lzmq/Msg;
    .end local v2    # "rc":Z
    :cond_28
    invoke-virtual {p1}, Lzmq/Msg;->hasMore()Z

    move-result v1

    .line 64
    .local v1, "more":Z
    invoke-super {p0, p1}, Lzmq/Dealer;->xsend(Lzmq/Msg;)Z

    move-result v2

    .line 65
    .restart local v2    # "rc":Z
    if-eqz v2, :cond_13

    .line 70
    if-nez v1, :cond_38

    .line 71
    iput-boolean v4, p0, Lzmq/Req;->receivingReply:Z

    .line 72
    iput-boolean v4, p0, Lzmq/Req;->messageBegins:Z

    :cond_38
    move v2, v4

    .line 75
    goto :goto_13
.end method
