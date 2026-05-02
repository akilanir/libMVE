.class final Lzmq/XSub$1;
.super Ljava/lang/Object;
.source "XSub.java"

# interfaces
.implements Lzmq/Trie$ITrieHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/XSub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public added([BILjava/lang/Object;)V
    .registers 9
    .param p1, "data"    # [B
    .param p2, "size"    # I
    .param p3, "arg"    # Ljava/lang/Object;

    .prologue
    .line 58
    move-object v1, p3

    check-cast v1, Lzmq/Pipe;

    .line 61
    .local v1, "pipe":Lzmq/Pipe;
    new-instance v0, Lzmq/Msg;

    add-int/lit8 v3, p2, 0x1

    invoke-direct {v0, v3}, Lzmq/Msg;-><init>(I)V

    .line 62
    .local v0, "msg":Lzmq/Msg;
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lzmq/Msg;->put(B)Lzmq/Msg;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, p1, v4, p2}, Lzmq/Msg;->put([BII)Lzmq/Msg;

    .line 65
    invoke-virtual {v1, v0}, Lzmq/Pipe;->write(Lzmq/Msg;)Z

    move-result v2

    .line 73
    .local v2, "sent":Z
    return-void
.end method
