.class public final Lorg/apache/commons/net/ntp/NtpUtils;
.super Ljava/lang/Object;
.source "NtpUtils.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getHostAddress(I)Ljava/lang/String;
    .registers 3
    .param p0, "address"    # I

    .prologue
    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    ushr-int/lit8 v1, p0, 0x18

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    ushr-int/lit8 v1, p0, 0x10

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    ushr-int/lit8 v1, p0, 0x8

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    ushr-int/lit8 v1, p0, 0x0

    and-int/lit16 v1, v1, 0xff

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getModeName(I)Ljava/lang/String;
    .registers 2
    .param p0, "mode"    # I

    .prologue
    .line 96
    packed-switch p0, :pswitch_data_1e

    .line 114
    const-string v0, "Unknown"

    :goto_5
    return-object v0

    .line 98
    :pswitch_6
    const-string v0, "Reserved"

    goto :goto_5

    .line 100
    :pswitch_9
    const-string v0, "Symmetric Active"

    goto :goto_5

    .line 102
    :pswitch_c
    const-string v0, "Symmetric Passive"

    goto :goto_5

    .line 104
    :pswitch_f
    const-string v0, "Client"

    goto :goto_5

    .line 106
    :pswitch_12
    const-string v0, "Server"

    goto :goto_5

    .line 108
    :pswitch_15
    const-string v0, "Broadcast"

    goto :goto_5

    .line 110
    :pswitch_18
    const-string v0, "Control"

    goto :goto_5

    .line 112
    :pswitch_1b
    const-string v0, "Private"

    goto :goto_5

    .line 96
    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_6
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_12
        :pswitch_15
        :pswitch_18
        :pswitch_1b
    .end packed-switch
.end method

.method public static getRefAddress(Lorg/apache/commons/net/ntp/NtpV3Packet;)Ljava/lang/String;
    .registers 3
    .param p0, "packet"    # Lorg/apache/commons/net/ntp/NtpV3Packet;

    .prologue
    .line 51
    if-nez p0, :cond_8

    const/4 v0, 0x0

    .line 52
    .local v0, "address":I
    :goto_3
    invoke-static {v0}, Lorg/apache/commons/net/ntp/NtpUtils;->getHostAddress(I)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 51
    .end local v0    # "address":I
    :cond_8
    invoke-interface {p0}, Lorg/apache/commons/net/ntp/NtpV3Packet;->getReferenceId()I

    move-result v0

    goto :goto_3
.end method

.method public static getReferenceClock(Lorg/apache/commons/net/ntp/NtpV3Packet;)Ljava/lang/String;
    .registers 6
    .param p0, "message"    # Lorg/apache/commons/net/ntp/NtpV3Packet;

    .prologue
    .line 65
    if-nez p0, :cond_5

    .line 66
    const-string v4, ""

    .line 85
    :goto_4
    return-object v4

    .line 68
    :cond_5
    invoke-interface {p0}, Lorg/apache/commons/net/ntp/NtpV3Packet;->getReferenceId()I

    move-result v2

    .line 69
    .local v2, "refId":I
    if-nez v2, :cond_e

    .line 70
    const-string v4, ""

    goto :goto_4

    .line 72
    :cond_e
    new-instance v0, Ljava/lang/StringBuilder;

    const/4 v4, 0x4

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 74
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/16 v3, 0x18

    .local v3, "shiftBits":I
    :goto_16
    if-ltz v3, :cond_1f

    .line 76
    ushr-int v4, v2, v3

    and-int/lit16 v4, v4, 0xff

    int-to-char v1, v4

    .line 77
    .local v1, "c":C
    if-nez v1, :cond_24

    .line 85
    .end local v1    # "c":C
    :cond_1f
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_4

    .line 80
    .restart local v1    # "c":C
    :cond_24
    invoke-static {v1}, Ljava/lang/Character;->isLetterOrDigit(C)Z

    move-result v4

    if-nez v4, :cond_2d

    .line 81
    const-string v4, ""

    goto :goto_4

    .line 83
    :cond_2d
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 74
    add-int/lit8 v3, v3, -0x8

    goto :goto_16
.end method
