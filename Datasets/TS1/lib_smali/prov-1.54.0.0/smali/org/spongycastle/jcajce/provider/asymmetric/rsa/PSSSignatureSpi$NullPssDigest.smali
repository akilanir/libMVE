.class Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;
.super Ljava/lang/Object;
.source "PSSSignatureSpi.java"

# interfaces
.implements Lorg/spongycastle/crypto/Digest;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NullPssDigest"
.end annotation


# instance fields
.field private bOut:Ljava/io/ByteArrayOutputStream;

.field private baseDigest:Lorg/spongycastle/crypto/Digest;

.field private oddTime:Z

.field final synthetic this$0:Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi;


# direct methods
.method public constructor <init>(Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi;Lorg/spongycastle/crypto/Digest;)V
    .registers 4
    .param p2, "mgfDigest"    # Lorg/spongycastle/crypto/Digest;

    .prologue
    .line 358
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->this$0:Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 353
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->bOut:Ljava/io/ByteArrayOutputStream;

    .line 355
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->oddTime:Z

    .line 359
    iput-object p2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->baseDigest:Lorg/spongycastle/crypto/Digest;

    .line 360
    return-void
.end method


# virtual methods
.method public doFinal([BI)I
    .registers 7
    .param p1, "out"    # [B
    .param p2, "outOff"    # I

    .prologue
    const/4 v1, 0x0

    .line 384
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->bOut:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 386
    .local v0, "res":[B
    iget-boolean v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->oddTime:Z

    if-eqz v2, :cond_1b

    .line 388
    array-length v2, v0

    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 397
    :goto_f
    invoke-virtual {p0}, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->reset()V

    .line 399
    iget-boolean v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->oddTime:Z

    if-nez v2, :cond_17

    const/4 v1, 0x1

    :cond_17
    iput-boolean v1, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->oddTime:Z

    .line 401
    array-length v1, v0

    return v1

    .line 392
    :cond_1b
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->baseDigest:Lorg/spongycastle/crypto/Digest;

    array-length v3, v0

    invoke-interface {v2, v0, v1, v3}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 394
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->baseDigest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v2, p1, p2}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    goto :goto_f
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 364
    const-string v0, "NULL"

    return-object v0
.end method

.method public getByteLength()I
    .registers 2

    .prologue
    .line 412
    const/4 v0, 0x0

    return v0
.end method

.method public getDigestSize()I
    .registers 2

    .prologue
    .line 369
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->baseDigest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    move-result v0

    return v0
.end method

.method public reset()V
    .registers 2

    .prologue
    .line 406
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->bOut:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 407
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->baseDigest:Lorg/spongycastle/crypto/Digest;

    invoke-interface {v0}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 408
    return-void
.end method

.method public update(B)V
    .registers 3
    .param p1, "in"    # B

    .prologue
    .line 374
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->bOut:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 375
    return-void
.end method

.method public update([BII)V
    .registers 5
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "len"    # I

    .prologue
    .line 379
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/asymmetric/rsa/PSSSignatureSpi$NullPssDigest;->bOut:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 380
    return-void
.end method
