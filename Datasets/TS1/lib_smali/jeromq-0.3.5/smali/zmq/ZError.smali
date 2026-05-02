.class public Lzmq/ZError;
.super Ljava/lang/Object;
.source "ZError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lzmq/ZError$IOException;,
        Lzmq/ZError$InstantiationException;,
        Lzmq/ZError$CtxTerminatedException;
    }
.end annotation


# static fields
.field public static final EACCESS:I = 0xd

.field public static final EADDRINUSE:I = 0x30

.field public static final EADDRNOTAVAIL:I = 0x31

.field public static final EAGAIN:I = 0x23

.field public static final ECONNREFUSED:I = 0x3d

.field public static final EFAULT:I = 0xe

.field public static final EFSM:I = 0x9523dfb

.field public static final EHOSTUNREACH:I = 0x41

.field public static final EINPROGRESS:I = 0x24

.field public static final EINTR:I = 0x4

.field public static final EINVAL:I = 0x16

.field public static final EIOEXC:I = 0x9523e31

.field public static final EISCONN:I = 0x38

.field public static final EMFILE:I = 0x9523e33

.field public static final EMTHREAD:I = 0x9523dfe

.field public static final ENETDOWN:I = 0x32

.field public static final ENOBUFS:I = 0x37

.field public static final ENOCOMPATPROTO:I = 0x9523dfc

.field public static final ENOTCONN:I = 0x39

.field public static final ENOTSOCK:I = 0x9523dcd

.field public static final ENOTSUP:I = 0x2d

.field public static final EPROTONOSUPPORT:I = 0x2b

.field public static final ESOCKET:I = 0x9523e32

.field public static final ETERM:I = 0x9523dfd

.field private static final ZMQ_HAUSNUMERO:I = 0x9523dc8


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    return-void
.end method

.method static exccode(Ljava/io/IOException;)I
    .registers 2
    .param p0, "e"    # Ljava/io/IOException;

    .prologue
    .line 92
    instance-of v0, p0, Ljava/net/SocketException;

    if-eqz v0, :cond_8

    .line 93
    const v0, 0x9523e32

    .line 99
    :goto_7
    return v0

    .line 95
    :cond_8
    instance-of v0, p0, Ljava/nio/channels/ClosedChannelException;

    if-eqz v0, :cond_f

    .line 96
    const/16 v0, 0x39

    goto :goto_7

    .line 99
    :cond_f
    const v0, 0x9523e31

    goto :goto_7
.end method

.method public static toString(I)Ljava/lang/String;
    .registers 2
    .param p0, "code"    # I

    .prologue
    .line 105
    sparse-switch p0, :sswitch_data_16

    .line 117
    const-string v0, ""

    :goto_5
    return-object v0

    .line 107
    :sswitch_6
    const-string v0, "Address already in use"

    goto :goto_5

    .line 109
    :sswitch_9
    const-string v0, "Operation cannot be accomplished in current state"

    goto :goto_5

    .line 111
    :sswitch_c
    const-string v0, "The protocol is not compatible with the socket type"

    goto :goto_5

    .line 113
    :sswitch_f
    const-string v0, "Context was terminated"

    goto :goto_5

    .line 115
    :sswitch_12
    const-string v0, "No thread available"

    goto :goto_5

    .line 105
    nop

    :sswitch_data_16
    .sparse-switch
        0x30 -> :sswitch_6
        0x9523dfb -> :sswitch_9
        0x9523dfc -> :sswitch_c
        0x9523dfd -> :sswitch_f
        0x9523dfe -> :sswitch_12
    .end sparse-switch
.end method
