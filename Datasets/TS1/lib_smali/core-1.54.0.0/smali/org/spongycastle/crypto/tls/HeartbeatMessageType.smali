.class public Lorg/spongycastle/crypto/tls/HeartbeatMessageType;
.super Ljava/lang/Object;
.source "HeartbeatMessageType.java"


# static fields
.field public static final heartbeat_request:S = 0x1s

.field public static final heartbeat_response:S = 0x2s


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isValid(S)Z
    .registers 3
    .param p0, "heartbeatMessageType"    # S

    .prologue
    const/4 v0, 0x1

    .line 13
    if-lt p0, v0, :cond_7

    const/4 v1, 0x2

    if-gt p0, v1, :cond_7

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method
