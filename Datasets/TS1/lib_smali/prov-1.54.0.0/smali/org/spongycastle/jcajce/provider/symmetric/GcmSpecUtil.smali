.class Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;
.super Ljava/lang/Object;
.source "GcmSpecUtil.java"


# static fields
.field static final gcmSpecClass:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 14
    const-string v0, "javax.crypto.spec.GCMParameterSpec"

    invoke-static {v0}, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;->lookup(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;->gcmSpecClass:Ljava/lang/Class;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static extractGcmParameters(Ljava/security/spec/AlgorithmParameterSpec;)Lorg/spongycastle/asn1/cms/GCMParameters;
    .registers 7
    .param p0, "paramSpec"    # Ljava/security/spec/AlgorithmParameterSpec;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidParameterSpecException;
        }
    .end annotation

    .prologue
    .line 56
    :try_start_0
    sget-object v3, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;->gcmSpecClass:Ljava/lang/Class;

    const-string v4, "getTLen"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 57
    .local v2, "tLen":Ljava/lang/reflect/Method;
    sget-object v3, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;->gcmSpecClass:Ljava/lang/Class;

    const-string v4, "getIV"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 59
    .local v1, "iv":Ljava/lang/reflect/Method;
    new-instance v5, Lorg/spongycastle/asn1/cms/GCMParameters;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    check-cast v3, [B

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-virtual {v2, p0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    div-int/lit8 v4, v4, 0x8

    invoke-direct {v5, v3, v4}, Lorg/spongycastle/asn1/cms/GCMParameters;-><init>([BI)V
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_35} :catch_36

    return-object v5

    .line 61
    .end local v1    # "iv":Ljava/lang/reflect/Method;
    .end local v2    # "tLen":Ljava/lang/reflect/Method;
    :catch_36
    move-exception v0

    .line 63
    .local v0, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/security/spec/InvalidParameterSpecException;

    const-string v4, "Cannot process GCMParameterSpec"

    invoke-direct {v3, v4}, Ljava/security/spec/InvalidParameterSpecException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method static extractGcmSpec(Lorg/spongycastle/asn1/ASN1Primitive;)Ljava/security/spec/AlgorithmParameterSpec;
    .registers 8
    .param p0, "spec"    # Lorg/spongycastle/asn1/ASN1Primitive;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/spec/InvalidParameterSpecException;
        }
    .end annotation

    .prologue
    .line 36
    :try_start_0
    invoke-static {p0}, Lorg/spongycastle/asn1/cms/GCMParameters;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cms/GCMParameters;

    move-result-object v2

    .line 37
    .local v2, "gcmParams":Lorg/spongycastle/asn1/cms/GCMParameters;
    sget-object v3, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;->gcmSpecClass:Ljava/lang/Class;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, [B

    aput-object v6, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 39
    .local v0, "constructor":Ljava/lang/reflect/Constructor;
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v2}, Lorg/spongycastle/asn1/cms/GCMParameters;->getIcvLen()I

    move-result v5

    mul-int/lit8 v5, v5, 0x8

    invoke-static {v5}, Lorg/spongycastle/util/Integers;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-virtual {v2}, Lorg/spongycastle/asn1/cms/GCMParameters;->getNonce()[B

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/security/spec/AlgorithmParameterSpec;
    :try_end_34
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_34} :catch_35
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_34} :catch_3e

    return-object v3

    .line 41
    .end local v0    # "constructor":Ljava/lang/reflect/Constructor;
    .end local v2    # "gcmParams":Lorg/spongycastle/asn1/cms/GCMParameters;
    :catch_35
    move-exception v1

    .line 43
    .local v1, "e":Ljava/lang/NoSuchMethodException;
    new-instance v3, Ljava/security/spec/InvalidParameterSpecException;

    const-string v4, "No constructor found!"

    invoke-direct {v3, v4}, Ljava/security/spec/InvalidParameterSpecException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 45
    .end local v1    # "e":Ljava/lang/NoSuchMethodException;
    :catch_3e
    move-exception v1

    .line 47
    .local v1, "e":Ljava/lang/Exception;
    new-instance v3, Ljava/security/spec/InvalidParameterSpecException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Construction failed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/security/spec/InvalidParameterSpecException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method static gcmSpecExists()Z
    .registers 1

    .prologue
    .line 18
    sget-object v0, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;->gcmSpecClass:Ljava/lang/Class;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method static isGcmSpec(Ljava/lang/Class;)Z
    .registers 2
    .param p0, "paramSpecClass"    # Ljava/lang/Class;

    .prologue
    .line 28
    sget-object v0, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;->gcmSpecClass:Ljava/lang/Class;

    if-ne v0, p0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method static isGcmSpec(Ljava/security/spec/AlgorithmParameterSpec;)Z
    .registers 2
    .param p0, "paramSpec"    # Ljava/security/spec/AlgorithmParameterSpec;

    .prologue
    .line 23
    sget-object v0, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;->gcmSpecClass:Ljava/lang/Class;

    if-eqz v0, :cond_e

    sget-object v0, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;->gcmSpecClass:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method private static lookup(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .param p0, "className"    # Ljava/lang/String;

    .prologue
    .line 71
    :try_start_0
    const-class v1, Lorg/spongycastle/jcajce/provider/symmetric/GcmSpecUtil;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v1

    .line 75
    :goto_a
    return-object v1

    .line 73
    :catch_b
    move-exception v0

    .line 75
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    goto :goto_a
.end method
