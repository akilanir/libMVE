.class Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;
.super Ljava/lang/Object;
.source "BaseBlockCipher.java"

# interfaces
.implements Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AEADGenericBlockCipher"
.end annotation


# static fields
.field private static final aeadBadTagConstructor:Ljava/lang/reflect/Constructor;


# instance fields
.field private cipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 1189
    const-string v1, "javax.crypto.AEADBadTagException"

    # invokes: Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->lookup(Ljava/lang/String;)Ljava/lang/Class;
    invoke-static {v1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->access$000(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 1190
    .local v0, "aeadBadTagClass":Ljava/lang/Class;
    if-eqz v0, :cond_f

    .line 1192
    invoke-static {v0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->findExceptionConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v1

    sput-object v1, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->aeadBadTagConstructor:Ljava/lang/reflect/Constructor;

    .line 1198
    :goto_e
    return-void

    .line 1196
    :cond_f
    const/4 v1, 0x0

    sput-object v1, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->aeadBadTagConstructor:Ljava/lang/reflect/Constructor;

    goto :goto_e
.end method

.method constructor <init>(Lorg/spongycastle/crypto/modes/AEADBlockCipher;)V
    .registers 2
    .param p1, "cipher"    # Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .prologue
    .line 1215
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1216
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->cipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .line 1217
    return-void
.end method

.method private static findExceptionConstructor(Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    .registers 5
    .param p0, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 1204
    const/4 v1, 0x1

    :try_start_1
    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-virtual {p0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_b} :catch_d

    move-result-object v1

    .line 1208
    :goto_c
    return-object v1

    .line 1206
    :catch_d
    move-exception v0

    .line 1208
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_c
.end method


# virtual methods
.method public doFinal([BI)I
    .registers 10
    .param p1, "out"    # [B
    .param p2, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    .line 1269
    :try_start_0
    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->cipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    invoke-interface {v3, p1, p2}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->doFinal([BI)I
    :try_end_5
    .catch Lorg/spongycastle/crypto/InvalidCipherTextException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v3

    return v3

    .line 1271
    :catch_7
    move-exception v2

    .line 1273
    .local v2, "e":Lorg/spongycastle/crypto/InvalidCipherTextException;
    sget-object v3, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->aeadBadTagConstructor:Ljava/lang/reflect/Constructor;

    if-eqz v3, :cond_24

    .line 1275
    const/4 v1, 0x0

    .line 1278
    .local v1, "aeadBadTag":Ljavax/crypto/BadPaddingException;
    :try_start_d
    sget-object v3, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->aeadBadTagConstructor:Ljava/lang/reflect/Constructor;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 1279
    invoke-virtual {v2}, Lorg/spongycastle/crypto/InvalidCipherTextException;->getMessage()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    move-object v0, v3

    check-cast v0, Ljavax/crypto/BadPaddingException;

    move-object v1, v0
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_21} :catch_2e

    .line 1285
    :goto_21
    if-eqz v1, :cond_24

    .line 1287
    throw v1

    .line 1290
    .end local v1    # "aeadBadTag":Ljavax/crypto/BadPaddingException;
    :cond_24
    new-instance v3, Ljavax/crypto/BadPaddingException;

    invoke-virtual {v2}, Lorg/spongycastle/crypto/InvalidCipherTextException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljavax/crypto/BadPaddingException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 1281
    .restart local v1    # "aeadBadTag":Ljavax/crypto/BadPaddingException;
    :catch_2e
    move-exception v3

    goto :goto_21
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1227
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->cipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    invoke-interface {v0}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v0

    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOutputSize(I)I
    .registers 3
    .param p1, "len"    # I

    .prologue
    .line 1242
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->cipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->getOutputSize(I)I

    move-result v0

    return v0
.end method

.method public getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;
    .registers 2

    .prologue
    .line 1237
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->cipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    invoke-interface {v0}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v0

    return-object v0
.end method

.method public getUpdateOutputSize(I)I
    .registers 3
    .param p1, "len"    # I

    .prologue
    .line 1247
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->cipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    invoke-interface {v0, p1}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->getUpdateOutputSize(I)I

    move-result v0

    return v0
.end method

.method public init(ZLorg/spongycastle/crypto/CipherParameters;)V
    .registers 4
    .param p1, "forEncryption"    # Z
    .param p2, "params"    # Lorg/spongycastle/crypto/CipherParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 1222
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->cipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    invoke-interface {v0, p1, p2}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 1223
    return-void
.end method

.method public processByte(B[BI)I
    .registers 5
    .param p1, "in"    # B
    .param p2, "out"    # [B
    .param p3, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;
        }
    .end annotation

    .prologue
    .line 1257
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->cipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    invoke-interface {v0, p1, p2, p3}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->processByte(B[BI)I

    move-result v0

    return v0
.end method

.method public processBytes([BII[BI)I
    .registers 12
    .param p1, "in"    # [B
    .param p2, "inOff"    # I
    .param p3, "len"    # I
    .param p4, "out"    # [B
    .param p5, "outOff"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;
        }
    .end annotation

    .prologue
    .line 1262
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->cipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->processBytes([BII[BI)I

    move-result v0

    return v0
.end method

.method public updateAAD([BII)V
    .registers 5
    .param p1, "input"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 1252
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;->cipher:Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    invoke-interface {v0, p1, p2, p3}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->processAADBytes([BII)V

    .line 1253
    return-void
.end method

.method public wrapOnNoPadding()Z
    .registers 2

    .prologue
    .line 1232
    const/4 v0, 0x0

    return v0
.end method
