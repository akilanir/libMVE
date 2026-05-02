.class Lorg/spongycastle/math/field/GF2Polynomial;
.super Ljava/lang/Object;
.source "GF2Polynomial.java"

# interfaces
.implements Lorg/spongycastle/math/field/Polynomial;


# instance fields
.field protected final exponents:[I


# direct methods
.method constructor <init>([I)V
    .registers 3
    .param p1, "exponents"    # [I

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    invoke-static {p1}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    move-result-object v0

    iput-object v0, p0, Lorg/spongycastle/math/field/GF2Polynomial;->exponents:[I

    .line 12
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 26
    if-ne p0, p1, :cond_4

    .line 28
    const/4 v1, 0x1

    .line 35
    :goto_3
    return v1

    .line 30
    :cond_4
    instance-of v1, p1, Lorg/spongycastle/math/field/GF2Polynomial;

    if-nez v1, :cond_a

    .line 32
    const/4 v1, 0x0

    goto :goto_3

    :cond_a
    move-object v0, p1

    .line 34
    check-cast v0, Lorg/spongycastle/math/field/GF2Polynomial;

    .line 35
    .local v0, "other":Lorg/spongycastle/math/field/GF2Polynomial;
    iget-object v1, p0, Lorg/spongycastle/math/field/GF2Polynomial;->exponents:[I

    iget-object v2, v0, Lorg/spongycastle/math/field/GF2Polynomial;->exponents:[I

    invoke-static {v1, v2}, Lorg/spongycastle/util/Arrays;->areEqual([I[I)Z

    move-result v1

    goto :goto_3
.end method

.method public getDegree()I
    .registers 3

    .prologue
    .line 16
    iget-object v0, p0, Lorg/spongycastle/math/field/GF2Polynomial;->exponents:[I

    iget-object v1, p0, Lorg/spongycastle/math/field/GF2Polynomial;->exponents:[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    aget v0, v0, v1

    return v0
.end method

.method public getExponentsPresent()[I
    .registers 2

    .prologue
    .line 21
    iget-object v0, p0, Lorg/spongycastle/math/field/GF2Polynomial;->exponents:[I

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lorg/spongycastle/math/field/GF2Polynomial;->exponents:[I

    invoke-static {v0}, Lorg/spongycastle/util/Arrays;->hashCode([I)I

    move-result v0

    return v0
.end method
