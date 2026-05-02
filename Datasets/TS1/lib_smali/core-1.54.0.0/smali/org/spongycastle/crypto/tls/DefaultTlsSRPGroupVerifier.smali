.class public Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;
.super Ljava/lang/Object;
.source "DefaultTlsSRPGroupVerifier.java"

# interfaces
.implements Lorg/spongycastle/crypto/tls/TlsSRPGroupVerifier;


# static fields
.field protected static final DEFAULT_GROUPS:Ljava/util/Vector;


# instance fields
.field protected groups:Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 12
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    sput-object v0, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->DEFAULT_GROUPS:Ljava/util/Vector;

    .line 16
    sget-object v0, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->DEFAULT_GROUPS:Ljava/util/Vector;

    sget-object v1, Lorg/spongycastle/crypto/agreement/srp/SRP6StandardGroups;->rfc5054_1024:Lorg/spongycastle/crypto/params/SRP6GroupParameters;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 17
    sget-object v0, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->DEFAULT_GROUPS:Ljava/util/Vector;

    sget-object v1, Lorg/spongycastle/crypto/agreement/srp/SRP6StandardGroups;->rfc5054_1536:Lorg/spongycastle/crypto/params/SRP6GroupParameters;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 18
    sget-object v0, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->DEFAULT_GROUPS:Ljava/util/Vector;

    sget-object v1, Lorg/spongycastle/crypto/agreement/srp/SRP6StandardGroups;->rfc5054_2048:Lorg/spongycastle/crypto/params/SRP6GroupParameters;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 19
    sget-object v0, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->DEFAULT_GROUPS:Ljava/util/Vector;

    sget-object v1, Lorg/spongycastle/crypto/agreement/srp/SRP6StandardGroups;->rfc5054_3072:Lorg/spongycastle/crypto/params/SRP6GroupParameters;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 20
    sget-object v0, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->DEFAULT_GROUPS:Ljava/util/Vector;

    sget-object v1, Lorg/spongycastle/crypto/agreement/srp/SRP6StandardGroups;->rfc5054_4096:Lorg/spongycastle/crypto/params/SRP6GroupParameters;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 21
    sget-object v0, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->DEFAULT_GROUPS:Ljava/util/Vector;

    sget-object v1, Lorg/spongycastle/crypto/agreement/srp/SRP6StandardGroups;->rfc5054_6144:Lorg/spongycastle/crypto/params/SRP6GroupParameters;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 22
    sget-object v0, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->DEFAULT_GROUPS:Ljava/util/Vector;

    sget-object v1, Lorg/spongycastle/crypto/agreement/srp/SRP6StandardGroups;->rfc5054_8192:Lorg/spongycastle/crypto/params/SRP6GroupParameters;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 23
    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 33
    sget-object v0, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->DEFAULT_GROUPS:Ljava/util/Vector;

    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;-><init>(Ljava/util/Vector;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/util/Vector;)V
    .registers 2
    .param p1, "groups"    # Ljava/util/Vector;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->groups:Ljava/util/Vector;

    .line 44
    return-void
.end method


# virtual methods
.method public accept(Lorg/spongycastle/crypto/params/SRP6GroupParameters;)Z
    .registers 4
    .param p1, "group"    # Lorg/spongycastle/crypto/params/SRP6GroupParameters;

    .prologue
    .line 48
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->groups:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-ge v0, v1, :cond_1c

    .line 50
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->groups:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/spongycastle/crypto/params/SRP6GroupParameters;

    invoke-virtual {p0, p1, v1}, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->areGroupsEqual(Lorg/spongycastle/crypto/params/SRP6GroupParameters;Lorg/spongycastle/crypto/params/SRP6GroupParameters;)Z

    move-result v1

    if-eqz v1, :cond_19

    .line 52
    const/4 v1, 0x1

    .line 55
    :goto_18
    return v1

    .line 48
    :cond_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 55
    :cond_1c
    const/4 v1, 0x0

    goto :goto_18
.end method

.method protected areGroupsEqual(Lorg/spongycastle/crypto/params/SRP6GroupParameters;Lorg/spongycastle/crypto/params/SRP6GroupParameters;)Z
    .registers 5
    .param p1, "a"    # Lorg/spongycastle/crypto/params/SRP6GroupParameters;
    .param p2, "b"    # Lorg/spongycastle/crypto/params/SRP6GroupParameters;

    .prologue
    .line 60
    if-eq p1, p2, :cond_1e

    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/SRP6GroupParameters;->getN()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/SRP6GroupParameters;->getN()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->areParametersEqual(Ljava/math/BigInteger;Ljava/math/BigInteger;)Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-virtual {p1}, Lorg/spongycastle/crypto/params/SRP6GroupParameters;->getG()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p2}, Lorg/spongycastle/crypto/params/SRP6GroupParameters;->getG()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/spongycastle/crypto/tls/DefaultTlsSRPGroupVerifier;->areParametersEqual(Ljava/math/BigInteger;Ljava/math/BigInteger;)Z

    move-result v0

    if-eqz v0, :cond_20

    :cond_1e
    const/4 v0, 0x1

    :goto_1f
    return v0

    :cond_20
    const/4 v0, 0x0

    goto :goto_1f
.end method

.method protected areParametersEqual(Ljava/math/BigInteger;Ljava/math/BigInteger;)Z
    .registers 4
    .param p1, "a"    # Ljava/math/BigInteger;
    .param p2, "b"    # Ljava/math/BigInteger;

    .prologue
    .line 65
    if-eq p1, p2, :cond_8

    invoke-virtual {p1, p2}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
