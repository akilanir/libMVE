.class final Lzmq/XPub$1;
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
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Lzmq/Pipe;[BILjava/lang/Object;)V
    .registers 7
    .param p1, "pipe"    # Lzmq/Pipe;
    .param p2, "data"    # [B
    .param p3, "size"    # I
    .param p4, "arg"    # Ljava/lang/Object;

    .prologue
    .line 64
    move-object v0, p4

    check-cast v0, Lzmq/XPub;

    .line 65
    .local v0, "self":Lzmq/XPub;
    # getter for: Lzmq/XPub;->dist:Lzmq/Dist;
    invoke-static {v0}, Lzmq/XPub;->access$000(Lzmq/XPub;)Lzmq/Dist;

    move-result-object v1

    invoke-virtual {v1, p1}, Lzmq/Dist;->match(Lzmq/Pipe;)V

    .line 66
    return-void
.end method
