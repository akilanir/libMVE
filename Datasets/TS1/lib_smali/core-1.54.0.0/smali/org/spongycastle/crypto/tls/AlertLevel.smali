.class public Lorg/spongycastle/crypto/tls/AlertLevel;
.super Ljava/lang/Object;
.source "AlertLevel.java"


# static fields
.field public static final fatal:S = 0x2s

.field public static final warning:S = 0x1s


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getName(S)Ljava/lang/String;
    .registers 2
    .param p0, "alertDescription"    # S

    .prologue
    .line 13
    packed-switch p0, :pswitch_data_c

    .line 20
    const-string v0, "UNKNOWN"

    :goto_5
    return-object v0

    .line 16
    :pswitch_6
    const-string v0, "warning"

    goto :goto_5

    .line 18
    :pswitch_9
    const-string v0, "fatal"

    goto :goto_5

    .line 13
    :pswitch_data_c
    .packed-switch 0x1
        :pswitch_6
        :pswitch_9
    .end packed-switch
.end method

.method public static getText(S)Ljava/lang/String;
    .registers 3
    .param p0, "alertDescription"    # S

    .prologue
    .line 26
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lorg/spongycastle/crypto/tls/AlertLevel;->getName(S)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
