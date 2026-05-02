.class public Lzmq/IpcConnecter;
.super Lzmq/TcpConnecter;
.source "IpcConnecter.java"


# direct methods
.method public constructor <init>(Lzmq/IOThread;Lzmq/SessionBase;Lzmq/Options;Lzmq/Address;Z)V
    .registers 6
    .param p1, "ioThread"    # Lzmq/IOThread;
    .param p2, "session"    # Lzmq/SessionBase;
    .param p3, "options"    # Lzmq/Options;
    .param p4, "addr"    # Lzmq/Address;
    .param p5, "wait"    # Z

    .prologue
    .line 28
    invoke-direct/range {p0 .. p5}, Lzmq/TcpConnecter;-><init>(Lzmq/IOThread;Lzmq/SessionBase;Lzmq/Options;Lzmq/Address;Z)V

    .line 29
    return-void
.end method
