.class Lzmq/Poller$PollSet;
.super Ljava/lang/Object;
.source "Poller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/Poller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PollSet"
.end annotation


# instance fields
.field protected cancelled:Z

.field protected handler:Lzmq/IPollEvents;

.field protected key:Ljava/nio/channels/SelectionKey;

.field protected ops:I


# direct methods
.method protected constructor <init>(Lzmq/IPollEvents;)V
    .registers 4
    .param p1, "handler"    # Lzmq/IPollEvents;

    .prologue
    const/4 v1, 0x0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Lzmq/Poller$PollSet;->handler:Lzmq/IPollEvents;

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lzmq/Poller$PollSet;->key:Ljava/nio/channels/SelectionKey;

    .line 46
    iput-boolean v1, p0, Lzmq/Poller$PollSet;->cancelled:Z

    .line 47
    iput v1, p0, Lzmq/Poller$PollSet;->ops:I

    .line 48
    return-void
.end method
