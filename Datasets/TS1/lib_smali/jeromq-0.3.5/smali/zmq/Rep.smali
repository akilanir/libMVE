.class public Lzmq/Rep;
.super Lzmq/Router;
.source "Rep.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/Rep$RepSession;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private requestBegins:Z

.field private sendingReply:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 22
    const-class v0, Lzmq/Rep;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, Lzmq/Rep;->$assertionsDisabled:Z

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
    .line 43
    invoke-direct {p0, p1, p2, p3}, Lzmq/Router;-><init>(Lzmq/Ctx;II)V

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lzmq/Rep;->sendingReply:Z

    .line 45
    const/4 v0, 0x1

    iput-boolean v0, p0, Lzmq/Rep;->requestBegins:Z

    .line 47
    iget-object v0, p0, Lzmq/Rep;->options:Lzmq/Options;

    const/4 v1, 0x4

    iput v1, v0, Lzmq/Options;->type:I

    .line 48
    return-void
.end method


# virtual methods
.method protected xhasIn()Z
    .registers 2

    .prologue
    .line 130
    iget-boolean v0, p0, Lzmq/Rep;->sendingReply:Z

    if-nez v0, :cond_c

    invoke-super {p0}, Lzmq/Router;->xhasIn()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method protected xhasOut()Z
    .registers 2

    .prologue
    .line 136
    iget-boolean v0, p0, Lzmq/Rep;->sendingReply:Z

    if-eqz v0, :cond_c

    invoke-super {p0}, Lzmq/Router;->xhasOut()Z

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
    .registers 8

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 78
    iget-boolean v6, p0, Lzmq/Rep;->sendingReply:Z

    if-eqz v6, :cond_f

    .line 79
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Cannot receive another request"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 82
    :cond_f
    const/4 v1, 0x0

    .line 85
    .local v1, "msg":Lzmq/Msg;
    iget-boolean v6, p0, Lzmq/Rep;->requestBegins:Z

    if-eqz v6, :cond_3f

    .line 87
    :cond_14
    :goto_14
    invoke-super {p0}, Lzmq/Router;->xrecv()Lzmq/Msg;

    move-result-object v1

    .line 88
    if-nez v1, :cond_1c

    move-object v3, v5

    .line 124
    :goto_1b
    return-object v3

    .line 92
    :cond_1c
    invoke-virtual {v1}, Lzmq/Msg;->hasMore()Z

    move-result v6

    if-eqz v6, :cond_47

    .line 94
    invoke-virtual {v1}, Lzmq/Msg;->size()I

    move-result v6

    if-nez v6, :cond_39

    move v0, v3

    .line 97
    .local v0, "bottom":Z
    :goto_29
    invoke-super {p0, v1}, Lzmq/Router;->xsend(Lzmq/Msg;)Z

    move-result v2

    .line 98
    .local v2, "rc":Z
    sget-boolean v6, Lzmq/Rep;->$assertionsDisabled:Z

    if-nez v6, :cond_3b

    if-nez v2, :cond_3b

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .end local v0    # "bottom":Z
    .end local v2    # "rc":Z
    :cond_39
    move v0, v4

    .line 94
    goto :goto_29

    .line 99
    .restart local v0    # "bottom":Z
    .restart local v2    # "rc":Z
    :cond_3b
    if-eqz v0, :cond_14

    .line 109
    iput-boolean v4, p0, Lzmq/Rep;->requestBegins:Z

    .line 113
    .end local v0    # "bottom":Z
    .end local v2    # "rc":Z
    :cond_3f
    invoke-super {p0}, Lzmq/Router;->xrecv()Lzmq/Msg;

    move-result-object v1

    .line 114
    if-nez v1, :cond_4b

    move-object v3, v5

    .line 115
    goto :goto_1b

    .line 106
    :cond_47
    invoke-super {p0}, Lzmq/Router;->rollback()V

    goto :goto_14

    .line 119
    :cond_4b
    invoke-virtual {v1}, Lzmq/Msg;->hasMore()Z

    move-result v4

    if-nez v4, :cond_55

    .line 120
    iput-boolean v3, p0, Lzmq/Rep;->sendingReply:Z

    .line 121
    iput-boolean v3, p0, Lzmq/Rep;->requestBegins:Z

    :cond_55
    move-object v3, v1

    .line 124
    goto :goto_1b
.end method

.method protected xsend(Lzmq/Msg;)Z
    .registers 6
    .param p1, "msg"    # Lzmq/Msg;

    .prologue
    .line 54
    iget-boolean v2, p0, Lzmq/Rep;->sendingReply:Z

    if-nez v2, :cond_c

    .line 55
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "Cannot send another reply"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 58
    :cond_c
    invoke-virtual {p1}, Lzmq/Msg;->hasMore()Z

    move-result v0

    .line 61
    .local v0, "more":Z
    invoke-super {p0, p1}, Lzmq/Router;->xsend(Lzmq/Msg;)Z

    move-result v1

    .line 62
    .local v1, "rc":Z
    if-nez v1, :cond_17

    .line 71
    .end local v1    # "rc":Z
    :goto_16
    return v1

    .line 67
    .restart local v1    # "rc":Z
    :cond_17
    if-nez v0, :cond_1c

    .line 68
    const/4 v2, 0x0

    iput-boolean v2, p0, Lzmq/Rep;->sendingReply:Z

    .line 71
    :cond_1c
    const/4 v1, 0x1

    goto :goto_16
.end method
