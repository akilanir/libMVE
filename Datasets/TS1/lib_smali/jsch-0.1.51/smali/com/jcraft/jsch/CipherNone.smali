.class public Lcom/jcraft/jsch/CipherNone;
.super Ljava/lang/Object;
.source "CipherNone.java"

# interfaces
.implements Lcom/jcraft/jsch/Cipher;


# static fields
.field private static final bsize:I = 0x10

.field private static final ivsize:I = 0x8


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBlockSize()I
    .registers 2

    .prologue
    .line 36
    const/16 v0, 0x10

    return v0
.end method

.method public getIVSize()I
    .registers 2

    .prologue
    .line 35
    const/16 v0, 0x8

    return v0
.end method

.method public init(I[B[B)V
    .registers 4
    .param p1, "mode"    # I
    .param p2, "key"    # [B
    .param p3, "iv"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 38
    return-void
.end method

.method public isCBC()Z
    .registers 2

    .prologue
    .line 41
    const/4 v0, 0x0

    return v0
.end method

.method public update([BII[BI)V
    .registers 6
    .param p1, "foo"    # [B
    .param p2, "s1"    # I
    .param p3, "len"    # I
    .param p4, "bar"    # [B
    .param p5, "s2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 40
    return-void
.end method
