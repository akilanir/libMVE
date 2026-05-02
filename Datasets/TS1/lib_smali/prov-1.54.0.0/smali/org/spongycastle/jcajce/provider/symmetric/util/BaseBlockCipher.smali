.class public Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;
.super Lorg/spongycastle/jcajce/provider/symmetric/util/BaseWrapCipher;
.source "BaseBlockCipher.java"

# interfaces
.implements Lorg/spongycastle/jcajce/provider/symmetric/util/PBE;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;,
        Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;,
        Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;
    }
.end annotation


# static fields
.field private static final gcmSpecClass:Ljava/lang/Class;


# instance fields
.field private aeadParams:Lorg/spongycastle/crypto/params/AEADParameters;

.field private availableSpecs:[Ljava/lang/Class;

.field private baseEngine:Lorg/spongycastle/crypto/BlockCipher;

.field private cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

.field private digest:I

.field private engineProvider:Lorg/spongycastle/jcajce/provider/symmetric/util/BlockCipherProvider;

.field private fixedIv:Z

.field private ivLength:I

.field private ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

.field private keySizeInBits:I

.field private modeName:Ljava/lang/String;

.field private padded:Z

.field private pbeAlgorithm:Ljava/lang/String;

.field private pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

.field private scheme:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 74
    const-string v0, "javax.crypto.spec.GCMParameterSpec"

    invoke-static {v0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->lookup(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->gcmSpecClass:Ljava/lang/Class;

    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/crypto/BlockCipher;)V
    .registers 8
    .param p1, "engine"    # Lorg/spongycastle/crypto/BlockCipher;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 124
    invoke-direct {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseWrapCipher;-><init>()V

    .line 79
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v1, v0, v4

    const-class v1, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v1, v0, v5

    const/4 v1, 0x2

    sget-object v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->gcmSpecClass:Ljava/lang/Class;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-class v2, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-class v2, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->availableSpecs:[Ljava/lang/Class;

    .line 96
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->scheme:I

    .line 99
    iput v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 102
    iput-boolean v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->fixedIv:Z

    .line 103
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 104
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 106
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    .line 125
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    .line 127
    new-instance v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    invoke-direct {v0, p1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    .line 128
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/crypto/BlockCipher;I)V
    .registers 9
    .param p1, "engine"    # Lorg/spongycastle/crypto/BlockCipher;
    .param p2, "ivLength"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 178
    invoke-direct {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseWrapCipher;-><init>()V

    .line 79
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v1, v0, v4

    const-class v1, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v1, v0, v5

    const/4 v1, 0x2

    sget-object v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->gcmSpecClass:Ljava/lang/Class;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-class v2, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-class v2, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->availableSpecs:[Ljava/lang/Class;

    .line 96
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->scheme:I

    .line 99
    iput v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 102
    iput-boolean v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->fixedIv:Z

    .line 103
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 104
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 106
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    .line 179
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    .line 181
    new-instance v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    invoke-direct {v0, p1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    .line 182
    div-int/lit8 v0, p2, 0x8

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 183
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/crypto/BlockCipher;IIII)V
    .registers 12
    .param p1, "engine"    # Lorg/spongycastle/crypto/BlockCipher;
    .param p2, "scheme"    # I
    .param p3, "digest"    # I
    .param p4, "keySizeInBits"    # I
    .param p5, "ivLength"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 136
    invoke-direct {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseWrapCipher;-><init>()V

    .line 79
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v1, v0, v4

    const-class v1, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v1, v0, v5

    const/4 v1, 0x2

    sget-object v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->gcmSpecClass:Ljava/lang/Class;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-class v2, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-class v2, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->availableSpecs:[Ljava/lang/Class;

    .line 96
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->scheme:I

    .line 99
    iput v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 102
    iput-boolean v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->fixedIv:Z

    .line 103
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 104
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 106
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    .line 137
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    .line 139
    iput p2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->scheme:I

    .line 140
    iput p3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->digest:I

    .line 141
    iput p4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->keySizeInBits:I

    .line 142
    iput p5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 144
    new-instance v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    invoke-direct {v0, p1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    .line 145
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/crypto/BufferedBlockCipher;I)V
    .registers 9
    .param p1, "engine"    # Lorg/spongycastle/crypto/BufferedBlockCipher;
    .param p2, "ivLength"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 188
    invoke-direct {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseWrapCipher;-><init>()V

    .line 79
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v1, v0, v4

    const-class v1, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v1, v0, v5

    const/4 v1, 0x2

    sget-object v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->gcmSpecClass:Ljava/lang/Class;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-class v2, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-class v2, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->availableSpecs:[Ljava/lang/Class;

    .line 96
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->scheme:I

    .line 99
    iput v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 102
    iput-boolean v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->fixedIv:Z

    .line 103
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 104
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 106
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    .line 189
    invoke-virtual {p1}, Lorg/spongycastle/crypto/BufferedBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    .line 191
    new-instance v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    invoke-direct {v0, p1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BufferedBlockCipher;)V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    .line 192
    div-int/lit8 v0, p2, 0x8

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 193
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/crypto/modes/AEADBlockCipher;)V
    .registers 8
    .param p1, "engine"    # Lorg/spongycastle/crypto/modes/AEADBlockCipher;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 158
    invoke-direct {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseWrapCipher;-><init>()V

    .line 79
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v1, v0, v4

    const-class v1, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v1, v0, v5

    const/4 v1, 0x2

    sget-object v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->gcmSpecClass:Ljava/lang/Class;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-class v2, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-class v2, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->availableSpecs:[Ljava/lang/Class;

    .line 96
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->scheme:I

    .line 99
    iput v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 102
    iput-boolean v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->fixedIv:Z

    .line 103
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 104
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 106
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    .line 159
    invoke-interface {p1}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    .line 160
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 161
    new-instance v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;

    invoke-direct {v0, p1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/modes/AEADBlockCipher;)V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    .line 162
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/crypto/modes/AEADBlockCipher;ZI)V
    .registers 10
    .param p1, "engine"    # Lorg/spongycastle/crypto/modes/AEADBlockCipher;
    .param p2, "fixedIv"    # Z
    .param p3, "ivLength"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 168
    invoke-direct {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseWrapCipher;-><init>()V

    .line 79
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v1, v0, v4

    const-class v1, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v1, v0, v5

    const/4 v1, 0x2

    sget-object v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->gcmSpecClass:Ljava/lang/Class;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-class v2, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-class v2, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->availableSpecs:[Ljava/lang/Class;

    .line 96
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->scheme:I

    .line 99
    iput v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 102
    iput-boolean v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->fixedIv:Z

    .line 103
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 104
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 106
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    .line 169
    invoke-interface {p1}, Lorg/spongycastle/crypto/modes/AEADBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    .line 170
    iput-boolean p2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->fixedIv:Z

    .line 171
    iput p3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 172
    new-instance v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;

    invoke-direct {v0, p1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/modes/AEADBlockCipher;)V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    .line 173
    return-void
.end method

.method protected constructor <init>(Lorg/spongycastle/jcajce/provider/symmetric/util/BlockCipherProvider;)V
    .registers 8
    .param p1, "provider"    # Lorg/spongycastle/jcajce/provider/symmetric/util/BlockCipherProvider;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 149
    invoke-direct {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseWrapCipher;-><init>()V

    .line 79
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Ljavax/crypto/spec/RC2ParameterSpec;

    aput-object v1, v0, v4

    const-class v1, Ljavax/crypto/spec/RC5ParameterSpec;

    aput-object v1, v0, v5

    const/4 v1, 0x2

    sget-object v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->gcmSpecClass:Ljava/lang/Class;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-class v2, Ljavax/crypto/spec/IvParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-class v2, Ljavax/crypto/spec/PBEParameterSpec;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-class v2, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->availableSpecs:[Ljava/lang/Class;

    .line 96
    const/4 v0, -0x1

    iput v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->scheme:I

    .line 99
    iput v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 102
    iput-boolean v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->fixedIv:Z

    .line 103
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 104
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 106
    iput-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    .line 150
    invoke-interface {p1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BlockCipherProvider;->get()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    .line 151
    iput-object p1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineProvider:Lorg/spongycastle/jcajce/provider/symmetric/util/BlockCipherProvider;

    .line 153
    new-instance v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    invoke-interface {p1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BlockCipherProvider;->get()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    .line 154
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)Ljava/lang/Class;
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-static {p0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->lookup(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method private adjustParameters(Ljava/security/spec/AlgorithmParameterSpec;Lorg/spongycastle/crypto/CipherParameters;)Lorg/spongycastle/crypto/CipherParameters;
    .registers 9
    .param p1, "params"    # Ljava/security/spec/AlgorithmParameterSpec;
    .param p2, "param"    # Lorg/spongycastle/crypto/CipherParameters;

    .prologue
    .line 822
    instance-of v4, p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v4, :cond_48

    move-object v4, p2

    .line 824
    check-cast v4, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v4}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v2

    .line 825
    .local v2, "key":Lorg/spongycastle/crypto/CipherParameters;
    instance-of v4, p1, Ljavax/crypto/spec/IvParameterSpec;

    if-eqz v4, :cond_20

    move-object v1, p1

    .line 827
    check-cast v1, Ljavax/crypto/spec/IvParameterSpec;

    .line 829
    .local v1, "iv":Ljavax/crypto/spec/IvParameterSpec;
    new-instance v4, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v1}, Ljavax/crypto/spec/IvParameterSpec;->getIV()[B

    move-result-object v5

    invoke-direct {v4, v2, v5}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    iput-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 830
    iget-object p2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 868
    .end local v1    # "iv":Ljavax/crypto/spec/IvParameterSpec;
    .end local v2    # "key":Lorg/spongycastle/crypto/CipherParameters;
    :cond_1f
    :goto_1f
    return-object p2

    .line 832
    .restart local v2    # "key":Lorg/spongycastle/crypto/CipherParameters;
    :cond_20
    instance-of v4, p1, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    if-eqz v4, :cond_1f

    move-object v0, p1

    .line 835
    check-cast v0, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    .line 837
    .local v0, "gost28147Param":Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;
    new-instance v3, Lorg/spongycastle/crypto/params/ParametersWithSBox;

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;->getSbox()[B

    move-result-object v4

    invoke-direct {v3, p2, v4}, Lorg/spongycastle/crypto/params/ParametersWithSBox;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 839
    .end local p2    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .local v3, "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual {v0}, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;->getIV()[B

    move-result-object v4

    if-eqz v4, :cond_81

    iget v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    if-eqz v4, :cond_81

    .line 841
    new-instance v4, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;->getIV()[B

    move-result-object v5

    invoke-direct {v4, v2, v5}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    iput-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 842
    iget-object p2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .end local v3    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p2    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_1f

    .line 848
    .end local v0    # "gost28147Param":Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;
    .end local v2    # "key":Lorg/spongycastle/crypto/CipherParameters;
    :cond_48
    instance-of v4, p1, Ljavax/crypto/spec/IvParameterSpec;

    if-eqz v4, :cond_5d

    move-object v1, p1

    .line 850
    check-cast v1, Ljavax/crypto/spec/IvParameterSpec;

    .line 852
    .restart local v1    # "iv":Ljavax/crypto/spec/IvParameterSpec;
    new-instance v4, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v1}, Ljavax/crypto/spec/IvParameterSpec;->getIV()[B

    move-result-object v5

    invoke-direct {v4, p2, v5}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    iput-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 853
    iget-object p2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 854
    goto :goto_1f

    .line 855
    .end local v1    # "iv":Ljavax/crypto/spec/IvParameterSpec;
    :cond_5d
    instance-of v4, p1, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    if-eqz v4, :cond_1f

    move-object v0, p1

    .line 858
    check-cast v0, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    .line 860
    .restart local v0    # "gost28147Param":Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;
    new-instance v3, Lorg/spongycastle/crypto/params/ParametersWithSBox;

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;->getSbox()[B

    move-result-object v4

    invoke-direct {v3, p2, v4}, Lorg/spongycastle/crypto/params/ParametersWithSBox;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 862
    .end local p2    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v3    # "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual {v0}, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;->getIV()[B

    move-result-object v4

    if-eqz v4, :cond_81

    iget v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    if-eqz v4, :cond_81

    .line 864
    new-instance p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v0}, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;->getIV()[B

    move-result-object v4

    invoke-direct {p2, v3, v4}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .end local v3    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p2    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_1f

    .end local p2    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v3    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_81
    move-object p2, v3

    .end local v3    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local p2    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_1f
.end method

.method private isAEADModeName(Ljava/lang/String;)Z
    .registers 3
    .param p1, "modeName"    # Ljava/lang/String;

    .prologue
    .line 1069
    const-string v0, "CCM"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "EAX"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "GCM"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_20

    const-string v0, "OCB"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    :cond_20
    const/4 v0, 0x1

    :goto_21
    return v0

    :cond_22
    const/4 v0, 0x0

    goto :goto_21
.end method

.method private static lookup(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "className"    # Ljava/lang/String;

    .prologue
    .line 112
    :try_start_0
    const-class v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v0

    .line 118
    :goto_a
    return-object v0

    .line 116
    :catch_b
    move-exception v1

    .line 118
    .local v1, "e":Ljava/lang/Exception;
    const/4 v0, 0x0

    goto :goto_a
.end method


# virtual methods
.method protected engineDoFinal([BII[BI)I
    .registers 14
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Ljavax/crypto/ShortBufferException;
        }
    .end annotation

    .prologue
    .line 1040
    const/4 v7, 0x0

    .line 1042
    .local v7, "len":I
    invoke-virtual {p0, p3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineGetOutputSize(I)I

    move-result v0

    add-int/2addr v0, p5

    array-length v1, p4

    if-le v0, v1, :cond_11

    .line 1044
    new-instance v0, Ljavax/crypto/ShortBufferException;

    const-string v1, "output buffer too short for input."

    invoke-direct {v0, v1}, Ljavax/crypto/ShortBufferException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1049
    :cond_11
    if-eqz p3, :cond_1e

    .line 1051
    :try_start_13
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->processBytes([BII[BI)I

    move-result v7

    .line 1054
    :cond_1e
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    add-int v1, p5, v7

    invoke-interface {v0, p4, v1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->doFinal([BI)I
    :try_end_25
    .catch Lorg/spongycastle/crypto/OutputLengthException; {:try_start_13 .. :try_end_25} :catch_28
    .catch Lorg/spongycastle/crypto/DataLengthException; {:try_start_13 .. :try_end_25} :catch_33

    move-result v0

    add-int/2addr v0, v7

    return v0

    .line 1056
    :catch_28
    move-exception v6

    .line 1058
    .local v6, "e":Lorg/spongycastle/crypto/OutputLengthException;
    new-instance v0, Ljavax/crypto/IllegalBlockSizeException;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/OutputLengthException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/IllegalBlockSizeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1060
    .end local v6    # "e":Lorg/spongycastle/crypto/OutputLengthException;
    :catch_33
    move-exception v6

    .line 1062
    .local v6, "e":Lorg/spongycastle/crypto/DataLengthException;
    new-instance v0, Ljavax/crypto/IllegalBlockSizeException;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/DataLengthException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/IllegalBlockSizeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineDoFinal([BII)[B
    .registers 13
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 1003
    const/4 v7, 0x0

    .line 1004
    .local v7, "len":I
    invoke-virtual {p0, p3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineGetOutputSize(I)I

    move-result v0

    new-array v4, v0, [B

    .line 1006
    .local v4, "tmp":[B
    if-eqz p3, :cond_13

    .line 1008
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-interface/range {v0 .. v5}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->processBytes([BII[BI)I

    move-result v7

    .line 1013
    :cond_13
    :try_start_13
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v0, v4, v7}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->doFinal([BI)I
    :try_end_18
    .catch Lorg/spongycastle/crypto/DataLengthException; {:try_start_13 .. :try_end_18} :catch_1e

    move-result v0

    add-int/2addr v7, v0

    .line 1020
    array-length v0, v4

    if-ne v7, v0, :cond_29

    .line 1029
    .end local v4    # "tmp":[B
    :goto_1d
    return-object v4

    .line 1015
    .restart local v4    # "tmp":[B
    :catch_1e
    move-exception v6

    .line 1017
    .local v6, "e":Lorg/spongycastle/crypto/DataLengthException;
    new-instance v0, Ljavax/crypto/IllegalBlockSizeException;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/DataLengthException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavax/crypto/IllegalBlockSizeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1025
    .end local v6    # "e":Lorg/spongycastle/crypto/DataLengthException;
    :cond_29
    new-array v8, v7, [B

    .line 1027
    .local v8, "out":[B
    invoke-static {v4, v5, v8, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v4, v8

    .line 1029
    goto :goto_1d
.end method

.method protected engineGetBlockSize()I
    .registers 2

    .prologue
    .line 197
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v0

    return v0
.end method

.method protected engineGetIV()[B
    .registers 2

    .prologue
    .line 202
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->aeadParams:Lorg/spongycastle/crypto/params/AEADParameters;

    if-eqz v0, :cond_b

    .line 204
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->aeadParams:Lorg/spongycastle/crypto/params/AEADParameters;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/AEADParameters;->getNonce()[B

    move-result-object v0

    .line 207
    :goto_a
    return-object v0

    :cond_b
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v0}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object v0

    goto :goto_a

    :cond_16
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected engineGetKeySize(Ljava/security/Key;)I
    .registers 3
    .param p1, "key"    # Ljava/security/Key;

    .prologue
    .line 213
    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object v0

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x8

    return v0
.end method

.method protected engineGetOutputSize(I)I
    .registers 3
    .param p1, "inputLen"    # I

    .prologue
    .line 219
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v0, p1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getOutputSize(I)I

    move-result v0

    return v0
.end method

.method protected engineGetParameters()Ljava/security/AlgorithmParameters;
    .registers 7

    .prologue
    const/16 v3, 0x2f

    .line 224
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    if-nez v2, :cond_19

    .line 226
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    if-eqz v2, :cond_1f

    .line 230
    :try_start_a
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->createParametersInstance(Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 231
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    invoke-virtual {v2, v3}, Ljava/security/AlgorithmParameters;->init(Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_19} :catch_1c

    .line 271
    :cond_19
    :goto_19
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    :goto_1b
    return-object v2

    .line 233
    :catch_1c
    move-exception v0

    .line 235
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_1b

    .line 238
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1f
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v2, :cond_59

    .line 240
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v1

    .line 242
    .local v1, "name":Ljava/lang/String;
    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_3c

    .line 244
    const/4 v2, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 249
    :cond_3c
    :try_start_3c
    invoke-virtual {p0, v1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->createParametersInstance(Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 250
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v3}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getIV()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/AlgorithmParameters;->init([B)V
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_4d} :catch_4e

    goto :goto_19

    .line 252
    :catch_4e
    move-exception v0

    .line 254
    .restart local v0    # "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 257
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "name":Ljava/lang/String;
    :cond_59
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->aeadParams:Lorg/spongycastle/crypto/params/AEADParameters;

    if-eqz v2, :cond_19

    .line 261
    :try_start_5d
    const-string v2, "GCM"

    invoke-virtual {p0, v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->createParametersInstance(Ljava/lang/String;)Ljava/security/AlgorithmParameters;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 262
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    new-instance v3, Lorg/spongycastle/asn1/cms/GCMParameters;

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->aeadParams:Lorg/spongycastle/crypto/params/AEADParameters;

    invoke-virtual {v4}, Lorg/spongycastle/crypto/params/AEADParameters;->getNonce()[B

    move-result-object v4

    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->aeadParams:Lorg/spongycastle/crypto/params/AEADParameters;

    invoke-virtual {v5}, Lorg/spongycastle/crypto/params/AEADParameters;->getMacSize()I

    move-result v5

    div-int/lit8 v5, v5, 0x8

    invoke-direct {v3, v4, v5}, Lorg/spongycastle/asn1/cms/GCMParameters;-><init>([BI)V

    invoke-virtual {v3}, Lorg/spongycastle/asn1/cms/GCMParameters;->getEncoded()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/AlgorithmParameters;->init([B)V
    :try_end_81
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_81} :catch_82

    goto :goto_19

    .line 264
    :catch_82
    move-exception v0

    .line 266
    .restart local v0    # "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/AlgorithmParameters;Ljava/security/SecureRandom;)V
    .registers 10
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "params"    # Ljava/security/AlgorithmParameters;
    .param p4, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 878
    const/4 v1, 0x0

    .line 880
    .local v1, "paramSpec":Ljava/security/spec/AlgorithmParameterSpec;
    if-eqz p3, :cond_39

    .line 882
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->availableSpecs:[Ljava/lang/Class;

    array-length v2, v2

    if-eq v0, v2, :cond_1a

    .line 884
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->availableSpecs:[Ljava/lang/Class;

    aget-object v2, v2, v0

    if-nez v2, :cond_12

    .line 882
    :goto_f
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 891
    :cond_12
    :try_start_12
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->availableSpecs:[Ljava/lang/Class;

    aget-object v2, v2, v0

    invoke-virtual {p3, v2}, Ljava/security/AlgorithmParameters;->getParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_19} :catch_3f

    move-result-object v1

    .line 900
    :cond_1a
    if-nez v1, :cond_39

    .line 902
    new-instance v2, Ljava/security/InvalidAlgorithmParameterException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can\'t handle parameter "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p3}, Ljava/security/AlgorithmParameters;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 906
    .end local v0    # "i":I
    :cond_39
    invoke-virtual {p0, p1, p2, v1, p4}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V

    .line 908
    iput-object p3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 909
    return-void

    .line 894
    .restart local v0    # "i":I
    :catch_3f
    move-exception v2

    goto :goto_f
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/SecureRandom;)V
    .registers 7
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    .prologue
    .line 919
    const/4 v1, 0x0

    :try_start_1
    check-cast v1, Ljava/security/spec/AlgorithmParameterSpec;

    invoke-virtual {p0, p1, p2, v1, p3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    :try_end_6
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_1 .. :try_end_6} :catch_7

    .line 925
    return-void

    .line 921
    :catch_7
    move-exception v0

    .line 923
    .local v0, "e":Ljava/security/InvalidAlgorithmParameterException;
    new-instance v1, Ljava/security/InvalidKeyException;

    invoke-virtual {v0}, Ljava/security/InvalidAlgorithmParameterException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected engineInit(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;Ljava/security/SecureRandom;)V
    .registers 27
    .param p1, "opmode"    # I
    .param p2, "key"    # Ljava/security/Key;
    .param p3, "params"    # Ljava/security/spec/AlgorithmParameterSpec;
    .param p4, "random"    # Ljava/security/SecureRandom;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;,
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 473
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 474
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 475
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineParams:Ljava/security/AlgorithmParameters;

    .line 476
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->aeadParams:Lorg/spongycastle/crypto/params/AEADParameters;

    .line 481
    move-object/from16 v0, p2

    instance-of v3, v0, Ljavax/crypto/SecretKey;

    if-nez v3, :cond_3d

    .line 483
    new-instance v3, Ljava/security/InvalidKeyException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Key for algorithm "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface/range {p2 .. p2}, Ljava/security/Key;->getAlgorithm()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " not suitable for symmetric enryption."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 489
    :cond_3d
    if-nez p3, :cond_57

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v3}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "RC5-64"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_57

    .line 491
    new-instance v3, Ljava/security/InvalidAlgorithmParameterException;

    const-string v4, "RC5 requires an RC5ParametersSpec to be passed in."

    invoke-direct {v3, v4}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 497
    :cond_57
    move-object/from16 v0, p0

    iget v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->scheme:I

    const/4 v4, 0x2

    if-eq v3, v4, :cond_64

    move-object/from16 v0, p2

    instance-of v3, v0, Lorg/spongycastle/jcajce/PKCS12Key;

    if-eqz v3, :cond_16e

    .line 502
    :cond_64
    :try_start_64
    move-object/from16 v0, p2

    check-cast v0, Ljavax/crypto/SecretKey;

    move-object v14, v0
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_69} :catch_aa

    .line 509
    .local v14, "k":Ljavax/crypto/SecretKey;
    move-object/from16 v0, p3

    instance-of v3, v0, Ljavax/crypto/spec/PBEParameterSpec;

    if-eqz v3, :cond_77

    move-object/from16 v3, p3

    .line 511
    check-cast v3, Ljavax/crypto/spec/PBEParameterSpec;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 514
    :cond_77
    instance-of v3, v14, Ljavax/crypto/interfaces/PBEKey;

    if-eqz v3, :cond_98

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    if-nez v3, :cond_98

    .line 516
    new-instance v4, Ljavax/crypto/spec/PBEParameterSpec;

    move-object v3, v14

    check-cast v3, Ljavax/crypto/interfaces/PBEKey;

    invoke-interface {v3}, Ljavax/crypto/interfaces/PBEKey;->getSalt()[B

    move-result-object v5

    move-object v3, v14

    check-cast v3, Ljavax/crypto/interfaces/PBEKey;

    invoke-interface {v3}, Ljavax/crypto/interfaces/PBEKey;->getIterationCount()I

    move-result v3

    invoke-direct {v4, v5, v3}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 519
    :cond_98
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    if-nez v3, :cond_b3

    instance-of v3, v14, Ljavax/crypto/interfaces/PBEKey;

    if-nez v3, :cond_b3

    .line 521
    new-instance v3, Ljava/security/InvalidKeyException;

    const-string v4, "Algorithm requires a PBE key"

    invoke-direct {v3, v4}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 504
    .end local v14    # "k":Ljavax/crypto/SecretKey;
    :catch_aa
    move-exception v10

    .line 506
    .local v10, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/security/InvalidKeyException;

    const-string v4, "PKCS12 requires a SecretKey/PBEKey"

    invoke-direct {v3, v4}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 523
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v14    # "k":Ljavax/crypto/SecretKey;
    :cond_b3
    move-object/from16 v0, p2

    instance-of v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;

    if-eqz v3, :cond_149

    move-object/from16 v3, p2

    .line 525
    check-cast v3, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;

    invoke-virtual {v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getParam()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v3

    if-eqz v3, :cond_125

    move-object/from16 v3, p2

    .line 527
    check-cast v3, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;

    invoke-virtual {v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getParam()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v17

    .line 538
    .local v17, "param":Lorg/spongycastle/crypto/CipherParameters;
    :goto_cb
    move-object/from16 v0, v17

    instance-of v3, v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v3, :cond_d9

    move-object/from16 v3, v17

    .line 540
    check-cast v3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 622
    .end local v14    # "k":Ljavax/crypto/SecretKey;
    :cond_d9
    :goto_d9
    move-object/from16 v0, p3

    instance-of v3, v0, Ljavax/crypto/spec/IvParameterSpec;

    if-eqz v3, :cond_3b6

    .line 624
    move-object/from16 v0, p0

    iget v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    if-eqz v3, :cond_39c

    move-object/from16 v16, p3

    .line 626
    check-cast v16, Ljavax/crypto/spec/IvParameterSpec;

    .line 628
    .local v16, "p":Ljavax/crypto/spec/IvParameterSpec;
    invoke-virtual/range {v16 .. v16}, Ljavax/crypto/spec/IvParameterSpec;->getIV()[B

    move-result-object v3

    array-length v3, v3

    move-object/from16 v0, p0

    iget v4, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    if-eq v3, v4, :cond_2e7

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    instance-of v3, v3, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;

    if-nez v3, :cond_2e7

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->fixedIv:Z

    if-eqz v3, :cond_2e7

    .line 630
    new-instance v3, Ljava/security/InvalidAlgorithmParameterException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "IV must be "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " bytes long."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 531
    .end local v16    # "p":Ljavax/crypto/spec/IvParameterSpec;
    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v14    # "k":Ljavax/crypto/SecretKey;
    :cond_125
    invoke-interface {v14}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v3

    const/4 v4, 0x2

    move-object/from16 v0, p0

    iget v5, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->digest:I

    move-object/from16 v0, p0

    iget v6, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->keySizeInBits:I

    move-object/from16 v0, p0

    iget v7, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    mul-int/lit8 v7, v7, 0x8

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v9}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v9

    invoke-static/range {v3 .. v9}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEParameters([BIIIILjava/security/spec/AlgorithmParameterSpec;Ljava/lang/String;)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v17

    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_cb

    .line 536
    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_149
    invoke-interface {v14}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v3

    const/4 v4, 0x2

    move-object/from16 v0, p0

    iget v5, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->digest:I

    move-object/from16 v0, p0

    iget v6, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->keySizeInBits:I

    move-object/from16 v0, p0

    iget v7, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    mul-int/lit8 v7, v7, 0x8

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v9}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v9

    invoke-static/range {v3 .. v9}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEParameters([BIIIILjava/security/spec/AlgorithmParameterSpec;Ljava/lang/String;)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v17

    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto/16 :goto_cb

    .line 543
    .end local v14    # "k":Ljavax/crypto/SecretKey;
    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_16e
    move-object/from16 v0, p2

    instance-of v3, v0, Lorg/spongycastle/jcajce/PBKDF1Key;

    if-eqz v3, :cond_1da

    move-object/from16 v14, p2

    .line 545
    check-cast v14, Lorg/spongycastle/jcajce/PBKDF1Key;

    .line 547
    .local v14, "k":Lorg/spongycastle/jcajce/PBKDF1Key;
    move-object/from16 v0, p3

    instance-of v3, v0, Ljavax/crypto/spec/PBEParameterSpec;

    if-eqz v3, :cond_186

    move-object/from16 v3, p3

    .line 549
    check-cast v3, Ljavax/crypto/spec/PBEParameterSpec;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 551
    :cond_186
    instance-of v3, v14, Lorg/spongycastle/jcajce/PBKDF1KeyWithParameters;

    if-eqz v3, :cond_1a7

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    if-nez v3, :cond_1a7

    .line 553
    new-instance v4, Ljavax/crypto/spec/PBEParameterSpec;

    move-object v3, v14

    check-cast v3, Lorg/spongycastle/jcajce/PBKDF1KeyWithParameters;

    invoke-virtual {v3}, Lorg/spongycastle/jcajce/PBKDF1KeyWithParameters;->getSalt()[B

    move-result-object v5

    move-object v3, v14

    check-cast v3, Lorg/spongycastle/jcajce/PBKDF1KeyWithParameters;

    invoke-virtual {v3}, Lorg/spongycastle/jcajce/PBKDF1KeyWithParameters;->getIterationCount()I

    move-result v3

    invoke-direct {v4, v5, v3}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    move-object/from16 v0, p0

    iput-object v4, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 556
    :cond_1a7
    invoke-virtual {v14}, Lorg/spongycastle/jcajce/PBKDF1Key;->getEncoded()[B

    move-result-object v3

    const/4 v4, 0x0

    move-object/from16 v0, p0

    iget v5, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->digest:I

    move-object/from16 v0, p0

    iget v6, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->keySizeInBits:I

    move-object/from16 v0, p0

    iget v7, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    mul-int/lit8 v7, v7, 0x8

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v9}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v9

    invoke-static/range {v3 .. v9}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEParameters([BIIIILjava/security/spec/AlgorithmParameterSpec;Ljava/lang/String;)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v17

    .line 557
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object/from16 v0, v17

    instance-of v3, v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v3, :cond_d9

    move-object/from16 v3, v17

    .line 559
    check-cast v3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    goto/16 :goto_d9

    .line 562
    .end local v14    # "k":Lorg/spongycastle/jcajce/PBKDF1Key;
    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_1da
    move-object/from16 v0, p2

    instance-of v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;

    if-eqz v3, :cond_24a

    move-object/from16 v14, p2

    .line 564
    check-cast v14, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;

    .line 566
    .local v14, "k":Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;
    invoke-virtual {v14}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getOID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    if-eqz v3, :cond_218

    .line 568
    invoke-virtual {v14}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getOID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    move-result-object v3

    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    .line 575
    :goto_1f6
    invoke-virtual {v14}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getParam()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v3

    if-eqz v3, :cond_221

    .line 577
    invoke-virtual {v14}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getParam()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->adjustParameters(Ljava/security/spec/AlgorithmParameterSpec;Lorg/spongycastle/crypto/CipherParameters;)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v17

    .line 589
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :goto_208
    move-object/from16 v0, v17

    instance-of v3, v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v3, :cond_d9

    move-object/from16 v3, v17

    .line 591
    check-cast v3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    goto/16 :goto_d9

    .line 572
    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_218
    invoke-virtual {v14}, Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;->getAlgorithm()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeAlgorithm:Ljava/lang/String;

    goto :goto_1f6

    .line 579
    :cond_221
    move-object/from16 v0, p3

    instance-of v3, v0, Ljavax/crypto/spec/PBEParameterSpec;

    if-eqz v3, :cond_242

    move-object/from16 v3, p3

    .line 581
    check-cast v3, Ljavax/crypto/spec/PBEParameterSpec;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 582
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v3

    invoke-interface {v3}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p3

    invoke-static {v14, v0, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEParameters(Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;Ljava/security/spec/AlgorithmParameterSpec;Ljava/lang/String;)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v17

    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_208

    .line 586
    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_242
    new-instance v3, Ljava/security/InvalidAlgorithmParameterException;

    const-string v4, "PBE requires PBE parameters to be set."

    invoke-direct {v3, v4}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 594
    .end local v14    # "k":Lorg/spongycastle/jcajce/provider/symmetric/util/BCPBEKey;
    :cond_24a
    move-object/from16 v0, p2

    instance-of v3, v0, Ljavax/crypto/interfaces/PBEKey;

    if-eqz v3, :cond_2ad

    move-object/from16 v14, p2

    .line 596
    check-cast v14, Ljavax/crypto/interfaces/PBEKey;

    .local v14, "k":Ljavax/crypto/interfaces/PBEKey;
    move-object/from16 v3, p3

    .line 597
    check-cast v3, Ljavax/crypto/spec/PBEParameterSpec;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 598
    instance-of v3, v14, Lorg/spongycastle/jcajce/PKCS12KeyWithParameters;

    if-eqz v3, :cond_277

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    if-nez v3, :cond_277

    .line 600
    new-instance v3, Ljavax/crypto/spec/PBEParameterSpec;

    invoke-interface {v14}, Ljavax/crypto/interfaces/PBEKey;->getSalt()[B

    move-result-object v4

    invoke-interface {v14}, Ljavax/crypto/interfaces/PBEKey;->getIterationCount()I

    move-result v5

    invoke-direct {v3, v4, v5}, Ljavax/crypto/spec/PBEParameterSpec;-><init>([BI)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    .line 603
    :cond_277
    invoke-interface {v14}, Ljavax/crypto/interfaces/PBEKey;->getEncoded()[B

    move-result-object v3

    move-object/from16 v0, p0

    iget v4, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->scheme:I

    move-object/from16 v0, p0

    iget v5, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->digest:I

    move-object/from16 v0, p0

    iget v6, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->keySizeInBits:I

    move-object/from16 v0, p0

    iget v7, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    mul-int/lit8 v7, v7, 0x8

    move-object/from16 v0, p0

    iget-object v8, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->pbeSpec:Ljavax/crypto/spec/PBEParameterSpec;

    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v9}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v9

    invoke-static/range {v3 .. v9}, Lorg/spongycastle/jcajce/provider/symmetric/util/PBE$Util;->makePBEParameters([BIIIILjava/security/spec/AlgorithmParameterSpec;Ljava/lang/String;)Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v17

    .line 604
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object/from16 v0, v17

    instance-of v3, v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v3, :cond_d9

    move-object/from16 v3, v17

    .line 606
    check-cast v3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    goto/16 :goto_d9

    .line 609
    .end local v14    # "k":Ljavax/crypto/interfaces/PBEKey;
    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_2ad
    move-object/from16 v0, p2

    instance-of v3, v0, Lorg/spongycastle/jcajce/spec/RepeatedSecretKeySpec;

    if-nez v3, :cond_2e3

    .line 611
    move-object/from16 v0, p0

    iget v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->scheme:I

    if-eqz v3, :cond_2ce

    move-object/from16 v0, p0

    iget v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->scheme:I

    const/4 v4, 0x4

    if-eq v3, v4, :cond_2ce

    move-object/from16 v0, p0

    iget v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->scheme:I

    const/4 v4, 0x1

    if-eq v3, v4, :cond_2ce

    move-object/from16 v0, p0

    iget v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->scheme:I

    const/4 v4, 0x5

    if-ne v3, v4, :cond_2d6

    .line 613
    :cond_2ce
    new-instance v3, Ljava/security/InvalidKeyException;

    const-string v4, "Algorithm requires a PBE key"

    invoke-direct {v3, v4}, Ljava/security/InvalidKeyException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 615
    :cond_2d6
    new-instance v17, Lorg/spongycastle/crypto/params/KeyParameter;

    invoke-interface/range {p2 .. p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v3

    move-object/from16 v0, v17

    invoke-direct {v0, v3}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto/16 :goto_d9

    .line 619
    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_2e3
    const/16 v17, 0x0

    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto/16 :goto_d9

    .line 633
    .restart local v16    # "p":Ljavax/crypto/spec/IvParameterSpec;
    :cond_2e7
    move-object/from16 v0, v17

    instance-of v3, v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v3, :cond_38b

    .line 635
    new-instance v18, Lorg/spongycastle/crypto/params/ParametersWithIV;

    check-cast v17, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v3

    invoke-virtual/range {v16 .. v16}, Ljavax/crypto/spec/IvParameterSpec;->getIV()[B

    move-result-object v4

    move-object/from16 v0, v18

    invoke-direct {v0, v3, v4}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .local v18, "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object/from16 v17, v18

    .end local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :goto_300
    move-object/from16 v3, v17

    .line 641
    check-cast v3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 762
    .end local v16    # "p":Ljavax/crypto/spec/IvParameterSpec;
    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_308
    :goto_308
    move-object/from16 v0, p0

    iget v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    if-eqz v3, :cond_627

    move-object/from16 v0, v17

    instance-of v3, v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-nez v3, :cond_627

    move-object/from16 v0, v17

    instance-of v3, v0, Lorg/spongycastle/crypto/params/AEADParameters;

    if-nez v3, :cond_627

    .line 764
    move-object/from16 v13, p4

    .line 766
    .local v13, "ivRandom":Ljava/security/SecureRandom;
    if-nez v13, :cond_323

    .line 768
    new-instance v13, Ljava/security/SecureRandom;

    .end local v13    # "ivRandom":Ljava/security/SecureRandom;
    invoke-direct {v13}, Ljava/security/SecureRandom;-><init>()V

    .line 771
    .restart local v13    # "ivRandom":Ljava/security/SecureRandom;
    :cond_323
    const/4 v3, 0x1

    move/from16 v0, p1

    if-eq v0, v3, :cond_32d

    const/4 v3, 0x3

    move/from16 v0, p1

    if-ne v0, v3, :cond_5f1

    .line 773
    :cond_32d
    move-object/from16 v0, p0

    iget v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    new-array v12, v3, [B

    .line 775
    .local v12, "iv":[B
    invoke-virtual {v13, v12}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 776
    new-instance v18, Lorg/spongycastle/crypto/params/ParametersWithIV;

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-direct {v0, v1, v12}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object/from16 v3, v18

    .line 777
    check-cast v3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 785
    .end local v12    # "iv":[B
    .end local v13    # "ivRandom":Ljava/security/SecureRandom;
    :goto_347
    if-eqz p4, :cond_623

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->padded:Z

    if-eqz v3, :cond_623

    .line 787
    new-instance v17, Lorg/spongycastle/crypto/params/ParametersWithRandom;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/crypto/params/ParametersWithRandom;-><init>(Lorg/spongycastle/crypto/CipherParameters;Ljava/security/SecureRandom;)V

    .line 792
    .end local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :goto_35a
    packed-switch p1, :pswitch_data_62c

    .line 803
    :try_start_35d
    new-instance v3, Ljava/security/InvalidParameterException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unknown opmode "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " passed"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_37e
    .catch Ljava/lang/Exception; {:try_start_35d .. :try_end_37e} :catch_37e

    .line 806
    :catch_37e
    move-exception v10

    .line 808
    .restart local v10    # "e":Ljava/lang/Exception;
    new-instance v3, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$1;

    invoke-virtual {v10}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v3, v0, v4, v10}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$1;-><init>(Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3

    .line 639
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v16    # "p":Ljavax/crypto/spec/IvParameterSpec;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_38b
    new-instance v18, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual/range {v16 .. v16}, Ljavax/crypto/spec/IvParameterSpec;->getIV()[B

    move-result-object v3

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-direct {v0, v1, v3}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object/from16 v17, v18

    .end local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto/16 :goto_300

    .line 645
    .end local v16    # "p":Ljavax/crypto/spec/IvParameterSpec;
    :cond_39c
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    if-eqz v3, :cond_308

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v4, "ECB"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_308

    .line 647
    new-instance v3, Ljava/security/InvalidAlgorithmParameterException;

    const-string v4, "ECB mode does not use an IV"

    invoke-direct {v3, v4}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 651
    :cond_3b6
    move-object/from16 v0, p3

    instance-of v3, v0, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    if-eqz v3, :cond_415

    move-object/from16 v11, p3

    .line 653
    check-cast v11, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    .line 655
    .local v11, "gost28147Param":Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;
    new-instance v17, Lorg/spongycastle/crypto/params/ParametersWithSBox;

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    new-instance v3, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 656
    invoke-interface/range {p2 .. p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    check-cast p3, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;

    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual/range {p3 .. p3}, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;->getSbox()[B

    move-result-object v4

    move-object/from16 v0, v17

    invoke-direct {v0, v3, v4}, Lorg/spongycastle/crypto/params/ParametersWithSBox;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 658
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual {v11}, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;->getIV()[B

    move-result-object v3

    if-eqz v3, :cond_308

    move-object/from16 v0, p0

    iget v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    if-eqz v3, :cond_308

    .line 660
    move-object/from16 v0, v17

    instance-of v3, v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v3, :cond_405

    .line 662
    new-instance v18, Lorg/spongycastle/crypto/params/ParametersWithIV;

    check-cast v17, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v3

    invoke-virtual {v11}, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;->getIV()[B

    move-result-object v4

    move-object/from16 v0, v18

    invoke-direct {v0, v3, v4}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .restart local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object/from16 v17, v18

    .end local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :goto_3fb
    move-object/from16 v3, v17

    .line 668
    check-cast v3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    goto/16 :goto_308

    .line 666
    :cond_405
    new-instance v18, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual {v11}, Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;->getIV()[B

    move-result-object v3

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-direct {v0, v1, v3}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object/from16 v17, v18

    .end local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_3fb

    .line 671
    .end local v11    # "gost28147Param":Lorg/spongycastle/jcajce/spec/GOST28147ParameterSpec;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_415
    move-object/from16 v0, p3

    instance-of v3, v0, Ljavax/crypto/spec/RC2ParameterSpec;

    if-eqz v3, :cond_46f

    move-object/from16 v19, p3

    .line 673
    check-cast v19, Ljavax/crypto/spec/RC2ParameterSpec;

    .line 675
    .local v19, "rc2Param":Ljavax/crypto/spec/RC2ParameterSpec;
    new-instance v17, Lorg/spongycastle/crypto/params/RC2Parameters;

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-interface/range {p2 .. p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v3

    check-cast p3, Ljavax/crypto/spec/RC2ParameterSpec;

    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual/range {p3 .. p3}, Ljavax/crypto/spec/RC2ParameterSpec;->getEffectiveKeyBits()I

    move-result v4

    move-object/from16 v0, v17

    invoke-direct {v0, v3, v4}, Lorg/spongycastle/crypto/params/RC2Parameters;-><init>([BI)V

    .line 677
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual/range {v19 .. v19}, Ljavax/crypto/spec/RC2ParameterSpec;->getIV()[B

    move-result-object v3

    if-eqz v3, :cond_308

    move-object/from16 v0, p0

    iget v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    if-eqz v3, :cond_308

    .line 679
    move-object/from16 v0, v17

    instance-of v3, v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v3, :cond_45f

    .line 681
    new-instance v18, Lorg/spongycastle/crypto/params/ParametersWithIV;

    check-cast v17, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v3

    invoke-virtual/range {v19 .. v19}, Ljavax/crypto/spec/RC2ParameterSpec;->getIV()[B

    move-result-object v4

    move-object/from16 v0, v18

    invoke-direct {v0, v3, v4}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .restart local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object/from16 v17, v18

    .end local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :goto_455
    move-object/from16 v3, v17

    .line 687
    check-cast v3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    goto/16 :goto_308

    .line 685
    :cond_45f
    new-instance v18, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual/range {v19 .. v19}, Ljavax/crypto/spec/RC2ParameterSpec;->getIV()[B

    move-result-object v3

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-direct {v0, v1, v3}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object/from16 v17, v18

    .end local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_455

    .line 690
    .end local v19    # "rc2Param":Ljavax/crypto/spec/RC2ParameterSpec;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_46f
    move-object/from16 v0, p3

    instance-of v3, v0, Ljavax/crypto/spec/RC5ParameterSpec;

    if-eqz v3, :cond_557

    move-object/from16 v20, p3

    .line 692
    check-cast v20, Ljavax/crypto/spec/RC5ParameterSpec;

    .line 694
    .local v20, "rc5Param":Ljavax/crypto/spec/RC5ParameterSpec;
    new-instance v17, Lorg/spongycastle/crypto/params/RC5Parameters;

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-interface/range {p2 .. p2}, Ljava/security/Key;->getEncoded()[B

    move-result-object v3

    check-cast p3, Ljavax/crypto/spec/RC5ParameterSpec;

    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    invoke-virtual/range {p3 .. p3}, Ljavax/crypto/spec/RC5ParameterSpec;->getRounds()I

    move-result v4

    move-object/from16 v0, v17

    invoke-direct {v0, v3, v4}, Lorg/spongycastle/crypto/params/RC5Parameters;-><init>([BI)V

    .line 695
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v3}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "RC5"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_510

    .line 697
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v3}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "RC5-32"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4d5

    .line 699
    invoke-virtual/range {v20 .. v20}, Ljavax/crypto/spec/RC5ParameterSpec;->getWordSize()I

    move-result v3

    const/16 v4, 0x20

    if-eq v3, v4, :cond_518

    .line 701
    new-instance v3, Ljava/security/InvalidAlgorithmParameterException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "RC5 already set up for a word size of 32 not "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v20 .. v20}, Ljavax/crypto/spec/RC5ParameterSpec;->getWordSize()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 704
    :cond_4d5
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v3}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "RC5-64"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_518

    .line 706
    invoke-virtual/range {v20 .. v20}, Ljavax/crypto/spec/RC5ParameterSpec;->getWordSize()I

    move-result v3

    const/16 v4, 0x40

    if-eq v3, v4, :cond_518

    .line 708
    new-instance v3, Ljava/security/InvalidAlgorithmParameterException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "RC5 already set up for a word size of 64 not "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v20 .. v20}, Ljavax/crypto/spec/RC5ParameterSpec;->getWordSize()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 714
    :cond_510
    new-instance v3, Ljava/security/InvalidAlgorithmParameterException;

    const-string v4, "RC5 parameters passed to a cipher that is not RC5."

    invoke-direct {v3, v4}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 716
    :cond_518
    invoke-virtual/range {v20 .. v20}, Ljavax/crypto/spec/RC5ParameterSpec;->getIV()[B

    move-result-object v3

    if-eqz v3, :cond_308

    move-object/from16 v0, p0

    iget v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    if-eqz v3, :cond_308

    .line 718
    move-object/from16 v0, v17

    instance-of v3, v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v3, :cond_547

    .line 720
    new-instance v18, Lorg/spongycastle/crypto/params/ParametersWithIV;

    check-cast v17, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v3

    invoke-virtual/range {v20 .. v20}, Ljavax/crypto/spec/RC5ParameterSpec;->getIV()[B

    move-result-object v4

    move-object/from16 v0, v18

    invoke-direct {v0, v3, v4}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .restart local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object/from16 v17, v18

    .end local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :goto_53d
    move-object/from16 v3, v17

    .line 726
    check-cast v3, Lorg/spongycastle/crypto/params/ParametersWithIV;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivParam:Lorg/spongycastle/crypto/params/ParametersWithIV;

    goto/16 :goto_308

    .line 724
    :cond_547
    new-instance v18, Lorg/spongycastle/crypto/params/ParametersWithIV;

    invoke-virtual/range {v20 .. v20}, Ljavax/crypto/spec/RC5ParameterSpec;->getIV()[B

    move-result-object v3

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-direct {v0, v1, v3}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    move-object/from16 v17, v18

    .end local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto :goto_53d

    .line 729
    .end local v20    # "rc5Param":Ljavax/crypto/spec/RC5ParameterSpec;
    .restart local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    :cond_557
    sget-object v3, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->gcmSpecClass:Ljava/lang/Class;

    if-eqz v3, :cond_5e1

    sget-object v3, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->gcmSpecClass:Ljava/lang/Class;

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5e1

    .line 731
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->isAEADModeName(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_581

    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    instance-of v3, v3, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;

    if-nez v3, :cond_581

    .line 733
    new-instance v3, Ljava/security/InvalidAlgorithmParameterException;

    const-string v4, "GCMParameterSpec can only be used with AEAD modes."

    invoke-direct {v3, v4}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 738
    :cond_581
    :try_start_581
    sget-object v3, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->gcmSpecClass:Ljava/lang/Class;

    const-string v4, "getTLen"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v21

    .line 739
    .local v21, "tLen":Ljava/lang/reflect/Method;
    sget-object v3, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->gcmSpecClass:Ljava/lang/Class;

    const-string v4, "getIV"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v12

    .line 742
    .local v12, "iv":Ljava/lang/reflect/Method;
    move-object/from16 v0, v17

    instance-of v3, v0, Lorg/spongycastle/crypto/params/ParametersWithIV;

    if-eqz v3, :cond_5d2

    .line 744
    check-cast v17, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    invoke-virtual/range {v17 .. v17}, Lorg/spongycastle/crypto/params/ParametersWithIV;->getParameters()Lorg/spongycastle/crypto/CipherParameters;

    move-result-object v15

    check-cast v15, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 750
    .local v15, "keyParam":Lorg/spongycastle/crypto/params/KeyParameter;
    :goto_5a5
    new-instance v17, Lorg/spongycastle/crypto/params/AEADParameters;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    move-object/from16 v0, v21

    move-object/from16 v1, p3

    invoke-virtual {v0, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    move-object/from16 v0, p3

    invoke-virtual {v12, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    check-cast v3, [B

    move-object/from16 v0, v17

    invoke-direct {v0, v15, v4, v3}, Lorg/spongycastle/crypto/params/AEADParameters;-><init>(Lorg/spongycastle/crypto/params/KeyParameter;I[B)V

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->aeadParams:Lorg/spongycastle/crypto/params/AEADParameters;

    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto/16 :goto_308

    .line 748
    .end local v15    # "keyParam":Lorg/spongycastle/crypto/params/KeyParameter;
    :cond_5d2
    move-object/from16 v0, v17

    check-cast v0, Lorg/spongycastle/crypto/params/KeyParameter;

    move-object v15, v0
    :try_end_5d7
    .catch Ljava/lang/Exception; {:try_start_581 .. :try_end_5d7} :catch_5d8

    .restart local v15    # "keyParam":Lorg/spongycastle/crypto/params/KeyParameter;
    goto :goto_5a5

    .line 752
    .end local v12    # "iv":Ljava/lang/reflect/Method;
    .end local v15    # "keyParam":Lorg/spongycastle/crypto/params/KeyParameter;
    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .end local v21    # "tLen":Ljava/lang/reflect/Method;
    :catch_5d8
    move-exception v10

    .line 754
    .restart local v10    # "e":Ljava/lang/Exception;
    new-instance v3, Ljava/security/InvalidAlgorithmParameterException;

    const-string v4, "Cannot process GCMParameterSpec."

    invoke-direct {v3, v4}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 757
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_5e1
    if-eqz p3, :cond_308

    move-object/from16 v0, p3

    instance-of v3, v0, Ljavax/crypto/spec/PBEParameterSpec;

    if-nez v3, :cond_308

    .line 759
    new-instance v3, Ljava/security/InvalidAlgorithmParameterException;

    const-string v4, "unknown parameter type."

    invoke-direct {v3, v4}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 779
    .end local p3    # "params":Ljava/security/spec/AlgorithmParameterSpec;
    .restart local v13    # "ivRandom":Ljava/security/SecureRandom;
    :cond_5f1
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v3

    invoke-interface {v3}, Lorg/spongycastle/crypto/BlockCipher;->getAlgorithmName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "PGPCFB"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    if-gez v3, :cond_627

    .line 781
    new-instance v3, Ljava/security/InvalidAlgorithmParameterException;

    const-string v4, "no IV set when one expected"

    invoke-direct {v3, v4}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 796
    .end local v13    # "ivRandom":Ljava/security/SecureRandom;
    :pswitch_60d
    :try_start_60d
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    const/4 v4, 0x1

    move-object/from16 v0, v17

    invoke-interface {v3, v4, v0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 816
    :goto_617
    return-void

    .line 800
    :pswitch_618
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    const/4 v4, 0x0

    move-object/from16 v0, v17

    invoke-interface {v3, v4, v0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V
    :try_end_622
    .catch Ljava/lang/Exception; {:try_start_60d .. :try_end_622} :catch_37e

    goto :goto_617

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    :cond_623
    move-object/from16 v17, v18

    .end local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto/16 :goto_35a

    :cond_627
    move-object/from16 v18, v17

    .end local v17    # "param":Lorg/spongycastle/crypto/CipherParameters;
    .restart local v18    # "param":Lorg/spongycastle/crypto/CipherParameters;
    goto/16 :goto_347

    .line 792
    nop

    :pswitch_data_62c
    .packed-switch 0x1
        :pswitch_60d
        :pswitch_618
        :pswitch_60d
        :pswitch_618
    .end packed-switch
.end method

.method protected engineSetMode(Ljava/lang/String;)V
    .registers 8
    .param p1, "mode"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x0

    .line 278
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    .line 280
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "ECB"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1e

    .line 282
    iput v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 283
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    .line 406
    :goto_1d
    return-void

    .line 285
    :cond_1e
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "CBC"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3f

    .line 287
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 288
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto :goto_1d

    .line 291
    :cond_3f
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "OFB"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_89

    .line 293
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 294
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v2, v5, :cond_72

    .line 296
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 298
    .local v1, "wordSize":I
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/OFBBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v3, v4, v1}, Lorg/spongycastle/crypto/modes/OFBBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;I)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto :goto_1d

    .line 303
    .end local v1    # "wordSize":I
    :cond_72
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/OFBBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    .line 304
    invoke-interface {v5}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v5

    mul-int/lit8 v5, v5, 0x8

    invoke-direct {v3, v4, v5}, Lorg/spongycastle/crypto/modes/OFBBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;I)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto :goto_1d

    .line 307
    :cond_89
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "CFB"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d5

    .line 309
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 310
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v2, v5, :cond_bd

    .line 312
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 314
    .restart local v1    # "wordSize":I
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/CFBBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v3, v4, v1}, Lorg/spongycastle/crypto/modes/CFBBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;I)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_1d

    .line 319
    .end local v1    # "wordSize":I
    :cond_bd
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/CFBBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    .line 320
    invoke-interface {v5}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v5

    mul-int/lit8 v5, v5, 0x8

    invoke-direct {v3, v4, v5}, Lorg/spongycastle/crypto/modes/CFBBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;I)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_1d

    .line 323
    :cond_d5
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "PGP"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_ff

    .line 325
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "PGPCFBwithIV"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    .line 327
    .local v0, "inlineIV":Z
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 328
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/PGPCFBBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v3, v4, v0}, Lorg/spongycastle/crypto/modes/PGPCFBBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;Z)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_1d

    .line 331
    .end local v0    # "inlineIV":Z
    :cond_ff
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "OpenPGPCFB"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_11b

    .line 333
    iput v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 334
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/modes/OpenPGPCFBBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_1d

    .line 337
    :cond_11b
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "SIC"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_152

    .line 339
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 340
    iget v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    const/16 v3, 0x10

    if-ge v2, v3, :cond_13b

    .line 342
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Warning: SIC-Mode can become a twotime-pad if the blocksize of the cipher is too small. Use a cipher with a block size of at least 128 bits (e.g. AES)"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 344
    :cond_13b
    iput-boolean v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->fixedIv:Z

    .line 345
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/BufferedBlockCipher;

    new-instance v4, Lorg/spongycastle/crypto/modes/SICBlockCipher;

    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/modes/SICBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/BufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BufferedBlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_1d

    .line 348
    :cond_152
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "CTR"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_17b

    .line 350
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 351
    iput-boolean v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->fixedIv:Z

    .line 352
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/BufferedBlockCipher;

    new-instance v4, Lorg/spongycastle/crypto/modes/SICBlockCipher;

    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/modes/SICBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/BufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BufferedBlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_1d

    .line 355
    :cond_17b
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "GOFB"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1a2

    .line 357
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 358
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/BufferedBlockCipher;

    new-instance v4, Lorg/spongycastle/crypto/modes/GOFBBlockCipher;

    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/modes/GOFBBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/BufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BufferedBlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_1d

    .line 361
    :cond_1a2
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "GCFB"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1c9

    .line 363
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 364
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/BufferedBlockCipher;

    new-instance v4, Lorg/spongycastle/crypto/modes/GCFBBlockCipher;

    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/modes/GCFBBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/BufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BufferedBlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_1d

    .line 367
    :cond_1c9
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "CTS"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1f0

    .line 369
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 370
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/CTSBlockCipher;

    new-instance v4, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v4, v5}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/modes/CTSBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BufferedBlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_1d

    .line 372
    :cond_1f0
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "CCM"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_20e

    .line 374
    const/16 v2, 0xd

    iput v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 375
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/CCMBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/modes/CCMBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/modes/AEADBlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_1d

    .line 377
    :cond_20e
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "OCB"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_24f

    .line 379
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineProvider:Lorg/spongycastle/jcajce/provider/symmetric/util/BlockCipherProvider;

    if-eqz v2, :cond_236

    .line 384
    const/16 v2, 0xf

    iput v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 385
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/OCBBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    iget-object v5, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineProvider:Lorg/spongycastle/jcajce/provider/symmetric/util/BlockCipherProvider;

    invoke-interface {v5}, Lorg/spongycastle/jcajce/provider/symmetric/util/BlockCipherProvider;->get()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/spongycastle/crypto/modes/OCBBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/modes/AEADBlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_1d

    .line 389
    :cond_236
    new-instance v2, Ljava/security/NoSuchAlgorithmException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can\'t support mode "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/NoSuchAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 392
    :cond_24f
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "EAX"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_271

    .line 394
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 395
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/EAXBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/modes/EAXBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/modes/AEADBlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_1d

    .line 397
    :cond_271
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    const-string v3, "GCM"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_293

    .line 399
    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    move-result v2

    iput v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->ivLength:I

    .line 400
    new-instance v2, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;

    new-instance v3, Lorg/spongycastle/crypto/modes/GCMBlockCipher;

    iget-object v4, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->baseEngine:Lorg/spongycastle/crypto/BlockCipher;

    invoke-direct {v3, v4}, Lorg/spongycastle/crypto/modes/GCMBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$AEADGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/modes/AEADBlockCipher;)V

    iput-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_1d

    .line 404
    :cond_293
    new-instance v2, Ljava/security/NoSuchAlgorithmException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "can\'t support mode "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/security/NoSuchAlgorithmException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method protected engineSetPadding(Ljava/lang/String;)V
    .registers 6
    .param p1, "padding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/NoSuchPaddingException;
        }
    .end annotation

    .prologue
    .line 412
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 414
    .local v0, "paddingName":Ljava/lang/String;
    const-string v1, "NOPADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_27

    .line 416
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->wrapOnNoPadding()Z

    move-result v1

    if-eqz v1, :cond_26

    .line 418
    new-instance v1, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    new-instance v2, Lorg/spongycastle/crypto/BufferedBlockCipher;

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/BufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v1, v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BufferedBlockCipher;)V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    .line 462
    :cond_26
    :goto_26
    return-void

    .line 421
    :cond_27
    const-string v1, "WITHCTS"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_42

    .line 423
    new-instance v1, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    new-instance v2, Lorg/spongycastle/crypto/modes/CTSBlockCipher;

    iget-object v3, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/spongycastle/crypto/modes/CTSBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    invoke-direct {v1, v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BufferedBlockCipher;)V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto :goto_26

    .line 427
    :cond_42
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->padded:Z

    .line 429
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->modeName:Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->isAEADModeName(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_55

    .line 431
    new-instance v1, Ljavax/crypto/NoSuchPaddingException;

    const-string v2, "Only NoPadding can be used with AEAD modes."

    invoke-direct {v1, v2}, Ljavax/crypto/NoSuchPaddingException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 433
    :cond_55
    const-string v1, "PKCS5PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_65

    const-string v1, "PKCS7PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_73

    .line 435
    :cond_65
    new-instance v1, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto :goto_26

    .line 437
    :cond_73
    const-string v1, "ZEROBYTEPADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8e

    .line 439
    new-instance v1, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    new-instance v3, Lorg/spongycastle/crypto/paddings/ZeroBytePadding;

    invoke-direct {v3}, Lorg/spongycastle/crypto/paddings/ZeroBytePadding;-><init>()V

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/paddings/BlockCipherPadding;)V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto :goto_26

    .line 441
    :cond_8e
    const-string v1, "ISO10126PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9e

    const-string v1, "ISO10126-2PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b2

    .line 443
    :cond_9e
    new-instance v1, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    new-instance v3, Lorg/spongycastle/crypto/paddings/ISO10126d2Padding;

    invoke-direct {v3}, Lorg/spongycastle/crypto/paddings/ISO10126d2Padding;-><init>()V

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/paddings/BlockCipherPadding;)V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_26

    .line 445
    :cond_b2
    const-string v1, "X9.23PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c2

    const-string v1, "X923PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d6

    .line 447
    :cond_c2
    new-instance v1, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    new-instance v3, Lorg/spongycastle/crypto/paddings/X923Padding;

    invoke-direct {v3}, Lorg/spongycastle/crypto/paddings/X923Padding;-><init>()V

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/paddings/BlockCipherPadding;)V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_26

    .line 449
    :cond_d6
    const-string v1, "ISO7816-4PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_e6

    const-string v1, "ISO9797-1PADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_fa

    .line 451
    :cond_e6
    new-instance v1, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    new-instance v3, Lorg/spongycastle/crypto/paddings/ISO7816d4Padding;

    invoke-direct {v3}, Lorg/spongycastle/crypto/paddings/ISO7816d4Padding;-><init>()V

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/paddings/BlockCipherPadding;)V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_26

    .line 453
    :cond_fa
    const-string v1, "TBCPADDING"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_116

    .line 455
    new-instance v1, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;

    iget-object v2, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v2}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getUnderlyingCipher()Lorg/spongycastle/crypto/BlockCipher;

    move-result-object v2

    new-instance v3, Lorg/spongycastle/crypto/paddings/TBCPadding;

    invoke-direct {v3}, Lorg/spongycastle/crypto/paddings/TBCPadding;-><init>()V

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$BufferedGenericBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/paddings/BlockCipherPadding;)V

    iput-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    goto/16 :goto_26

    .line 459
    :cond_116
    new-instance v1, Ljavax/crypto/NoSuchPaddingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Padding "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " unknown."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavax/crypto/NoSuchPaddingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected engineUpdate([BII[BI)I
    .registers 13
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I
    .param p4, "output"    # [B
    .param p5, "outputOffset"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/ShortBufferException;
        }
    .end annotation

    .prologue
    .line 981
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v0, p3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getUpdateOutputSize(I)I

    move-result v0

    add-int/2addr v0, p5

    array-length v1, p4

    if-le v0, v1, :cond_12

    .line 983
    new-instance v0, Ljavax/crypto/ShortBufferException;

    const-string v1, "output buffer too short for input."

    invoke-direct {v0, v1}, Ljavax/crypto/ShortBufferException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 988
    :cond_12
    :try_start_12
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v4, p4

    move v5, p5

    invoke-interface/range {v0 .. v5}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->processBytes([BII[BI)I
    :try_end_1c
    .catch Lorg/spongycastle/crypto/DataLengthException; {:try_start_12 .. :try_end_1c} :catch_1e

    move-result v0

    return v0

    .line 990
    :catch_1e
    move-exception v6

    .line 993
    .local v6, "e":Lorg/spongycastle/crypto/DataLengthException;
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {v6}, Lorg/spongycastle/crypto/DataLengthException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected engineUpdate([BII)[B
    .registers 19
    .param p1, "input"    # [B
    .param p2, "inputOffset"    # I
    .param p3, "inputLen"    # I

    .prologue
    .line 944
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    move/from16 v0, p3

    invoke-interface {v1, v0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->getUpdateOutputSize(I)I

    move-result v13

    .line 946
    .local v13, "length":I
    if-lez v13, :cond_2a

    .line 948
    new-array v5, v13, [B

    .line 950
    .local v5, "out":[B
    iget-object v1, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    const/4 v6, 0x0

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    invoke-interface/range {v1 .. v6}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->processBytes([BII[BI)I

    move-result v12

    .line 952
    .local v12, "len":I
    if-nez v12, :cond_1d

    .line 954
    const/4 v14, 0x0

    .line 970
    .end local v5    # "out":[B
    .end local v12    # "len":I
    :goto_1c
    return-object v14

    .line 956
    .restart local v5    # "out":[B
    .restart local v12    # "len":I
    :cond_1d
    array-length v1, v5

    if-eq v12, v1, :cond_28

    .line 958
    new-array v14, v12, [B

    .line 960
    .local v14, "tmp":[B
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v5, v1, v14, v2, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_1c

    .end local v14    # "tmp":[B
    :cond_28
    move-object v14, v5

    .line 965
    goto :goto_1c

    .line 968
    .end local v5    # "out":[B
    .end local v12    # "len":I
    :cond_2a
    iget-object v6, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v7, p1

    move/from16 v8, p2

    move/from16 v9, p3

    invoke-interface/range {v6 .. v11}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->processBytes([BII[BI)I

    .line 970
    const/4 v14, 0x0

    goto :goto_1c
.end method

.method protected engineUpdateAAD(Ljava/nio/ByteBuffer;)V
    .registers 6
    .param p1, "bytebuffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 934
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    add-int v1, v2, v3

    .line 935
    .local v1, "offset":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    sub-int v0, v2, v3

    .line 936
    .local v0, "length":I
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    invoke-virtual {p0, v2, v1, v0}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->engineUpdateAAD([BII)V

    .line 937
    return-void
.end method

.method protected engineUpdateAAD([BII)V
    .registers 5
    .param p1, "input"    # [B
    .param p2, "offset"    # I
    .param p3, "length"    # I

    .prologue
    .line 929
    iget-object v0, p0, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher;->cipher:Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;

    invoke-interface {v0, p1, p2, p3}, Lorg/spongycastle/jcajce/provider/symmetric/util/BaseBlockCipher$GenericBlockCipher;->updateAAD([BII)V

    .line 930
    return-void
.end method
