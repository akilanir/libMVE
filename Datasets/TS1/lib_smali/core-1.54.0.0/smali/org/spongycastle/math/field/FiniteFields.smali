.class public abstract Lorg/spongycastle/math/field/FiniteFields;
.super Ljava/lang/Object;
.source "FiniteFields.java"


# static fields
.field static final GF_2:Lorg/spongycastle/math/field/FiniteField;

.field static final GF_3:Lorg/spongycastle/math/field/FiniteField;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 7
    new-instance v0, Lorg/spongycastle/math/field/PrimeField;

    const-wide/16 v1, 0x2

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/math/field/PrimeField;-><init>(Ljava/math/BigInteger;)V

    sput-object v0, Lorg/spongycastle/math/field/FiniteFields;->GF_2:Lorg/spongycastle/math/field/FiniteField;

    .line 8
    new-instance v0, Lorg/spongycastle/math/field/PrimeField;

    const-wide/16 v1, 0x3

    invoke-static {v1, v2}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/spongycastle/math/field/PrimeField;-><init>(Ljava/math/BigInteger;)V

    sput-object v0, Lorg/spongycastle/math/field/FiniteFields;->GF_3:Lorg/spongycastle/math/field/FiniteField;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBinaryExtensionField([I)Lorg/spongycastle/math/field/PolynomialExtensionField;
    .registers 5
    .param p0, "exponents"    # [I

    .prologue
    .line 12
    const/4 v1, 0x0

    aget v1, p0, v1

    if-eqz v1, :cond_d

    .line 14
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Irreducible polynomials in GF(2) must have constant term"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 16
    :cond_d
    const/4 v0, 0x1

    .local v0, "i":I
    :goto_e
    array-length v1, p0

    if-ge v0, v1, :cond_24

    .line 18
    aget v1, p0, v0

    add-int/lit8 v2, v0, -0x1

    aget v2, p0, v2

    if-gt v1, v2, :cond_21

    .line 20
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Polynomial exponents must be montonically increasing"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 16
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 24
    :cond_24
    new-instance v1, Lorg/spongycastle/math/field/GenericPolynomialExtensionField;

    sget-object v2, Lorg/spongycastle/math/field/FiniteFields;->GF_2:Lorg/spongycastle/math/field/FiniteField;

    new-instance v3, Lorg/spongycastle/math/field/GF2Polynomial;

    invoke-direct {v3, p0}, Lorg/spongycastle/math/field/GF2Polynomial;-><init>([I)V

    invoke-direct {v1, v2, v3}, Lorg/spongycastle/math/field/GenericPolynomialExtensionField;-><init>(Lorg/spongycastle/math/field/FiniteField;Lorg/spongycastle/math/field/Polynomial;)V

    return-object v1
.end method

.method public static getPrimeField(Ljava/math/BigInteger;)Lorg/spongycastle/math/field/FiniteField;
    .registers 4
    .param p0, "characteristic"    # Ljava/math/BigInteger;

    .prologue
    .line 34
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    .line 35
    .local v0, "bitLength":I
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    move-result v1

    if-lez v1, :cond_d

    const/4 v1, 0x2

    if-ge v0, v1, :cond_15

    .line 37
    :cond_d
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'characteristic\' must be >= 2"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 40
    :cond_15
    const/4 v1, 0x3

    if-ge v0, v1, :cond_1f

    .line 42
    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    move-result v1

    packed-switch v1, :pswitch_data_2c

    .line 51
    :cond_1f
    new-instance v1, Lorg/spongycastle/math/field/PrimeField;

    invoke-direct {v1, p0}, Lorg/spongycastle/math/field/PrimeField;-><init>(Ljava/math/BigInteger;)V

    :goto_24
    return-object v1

    .line 45
    :pswitch_25
    sget-object v1, Lorg/spongycastle/math/field/FiniteFields;->GF_2:Lorg/spongycastle/math/field/FiniteField;

    goto :goto_24

    .line 47
    :pswitch_28
    sget-object v1, Lorg/spongycastle/math/field/FiniteFields;->GF_3:Lorg/spongycastle/math/field/FiniteField;

    goto :goto_24

    .line 42
    nop

    :pswitch_data_2c
    .packed-switch 0x2
        :pswitch_25
        :pswitch_28
    .end packed-switch
.end method
