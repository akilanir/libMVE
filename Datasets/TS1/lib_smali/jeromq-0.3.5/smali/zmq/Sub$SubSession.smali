.class public Lzmq/Sub$SubSession;
.super Lzmq/XSub$XSubSession;
.source "Sub.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lzmq/Sub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SubSession"
.end annotation


# direct methods
.method public constructor <init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V
    .registers 6
    .param p1, "ioThread"    # Lzmq/IOThread;
    .param p2, "connect"    # Z
    .param p3, "socket"    # Lzmq/SocketBase;
    .param p4, "options"    # Lzmq/Options;
    .param p5, "addr"    # Lzmq/Address;

    .prologue
    .line 29
    invoke-direct/range {p0 .. p5}, Lzmq/XSub$XSubSession;-><init>(Lzmq/IOThread;ZLzmq/SocketBase;Lzmq/Options;Lzmq/Address;)V

    .line 30
    return-void
.end method
