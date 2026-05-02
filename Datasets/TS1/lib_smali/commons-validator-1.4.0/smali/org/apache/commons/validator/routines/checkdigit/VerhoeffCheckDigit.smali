.class public final Lorg/apache/commons/validator/routines/checkdigit/VerhoeffCheckDigit;
.super Ljava/lang/Object;
.source "VerhoeffCheckDigit.java"

# interfaces
.implements Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;
.implements Ljava/io/Serializable;


# static fields
.field private static final D_TABLE:[[I

.field private static final INV_TABLE:[I

.field private static final P_TABLE:[[I

.field public static final VERHOEFF_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

.field private static final serialVersionUID:J = 0x3970a91c0c47c84aL


# direct methods
.method static constructor <clinit>()V
    .registers 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    const/16 v3, 0xa

    .line 39
    new-instance v0, Lorg/apache/commons/validator/routines/checkdigit/VerhoeffCheckDigit;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/checkdigit/VerhoeffCheckDigit;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/VerhoeffCheckDigit;->VERHOEFF_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .line 42
    new-array v0, v3, [[I

    new-array v1, v3, [I

    fill-array-data v1, :array_aa

    aput-object v1, v0, v4

    new-array v1, v3, [I

    fill-array-data v1, :array_c2

    aput-object v1, v0, v5

    new-array v1, v3, [I

    fill-array-data v1, :array_da

    aput-object v1, v0, v6

    new-array v1, v3, [I

    fill-array-data v1, :array_f2

    aput-object v1, v0, v7

    const/4 v1, 0x4

    new-array v2, v3, [I

    fill-array-data v2, :array_10a

    aput-object v2, v0, v1

    const/4 v1, 0x5

    new-array v2, v3, [I

    fill-array-data v2, :array_122

    aput-object v2, v0, v1

    const/4 v1, 0x6

    new-array v2, v3, [I

    fill-array-data v2, :array_13a

    aput-object v2, v0, v1

    const/4 v1, 0x7

    new-array v2, v3, [I

    fill-array-data v2, :array_152

    aput-object v2, v0, v1

    const/16 v1, 0x8

    new-array v2, v3, [I

    fill-array-data v2, :array_16a

    aput-object v2, v0, v1

    const/16 v1, 0x9

    new-array v2, v3, [I

    fill-array-data v2, :array_182

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/VerhoeffCheckDigit;->D_TABLE:[[I

    .line 55
    const/16 v0, 0x8

    new-array v0, v0, [[I

    new-array v1, v3, [I

    fill-array-data v1, :array_19a

    aput-object v1, v0, v4

    new-array v1, v3, [I

    fill-array-data v1, :array_1b2

    aput-object v1, v0, v5

    new-array v1, v3, [I

    fill-array-data v1, :array_1ca

    aput-object v1, v0, v6

    new-array v1, v3, [I

    fill-array-data v1, :array_1e2

    aput-object v1, v0, v7

    const/4 v1, 0x4

    new-array v2, v3, [I

    fill-array-data v2, :array_1fa

    aput-object v2, v0, v1

    const/4 v1, 0x5

    new-array v2, v3, [I

    fill-array-data v2, :array_212

    aput-object v2, v0, v1

    const/4 v1, 0x6

    new-array v2, v3, [I

    fill-array-data v2, :array_22a

    aput-object v2, v0, v1

    const/4 v1, 0x7

    new-array v2, v3, [I

    fill-array-data v2, :array_242

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/VerhoeffCheckDigit;->P_TABLE:[[I

    .line 66
    new-array v0, v3, [I

    fill-array-data v0, :array_25a

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/VerhoeffCheckDigit;->INV_TABLE:[I

    return-void

    .line 42
    nop

    :array_aa
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
        0x9
    .end array-data

    :array_c2
    .array-data 4
        0x1
        0x2
        0x3
        0x4
        0x0
        0x6
        0x7
        0x8
        0x9
        0x5
    .end array-data

    :array_da
    .array-data 4
        0x2
        0x3
        0x4
        0x0
        0x1
        0x7
        0x8
        0x9
        0x5
        0x6
    .end array-data

    :array_f2
    .array-data 4
        0x3
        0x4
        0x0
        0x1
        0x2
        0x8
        0x9
        0x5
        0x6
        0x7
    .end array-data

    :array_10a
    .array-data 4
        0x4
        0x0
        0x1
        0x2
        0x3
        0x9
        0x5
        0x6
        0x7
        0x8
    .end array-data

    :array_122
    .array-data 4
        0x5
        0x9
        0x8
        0x7
        0x6
        0x0
        0x4
        0x3
        0x2
        0x1
    .end array-data

    :array_13a
    .array-data 4
        0x6
        0x5
        0x9
        0x8
        0x7
        0x1
        0x0
        0x4
        0x3
        0x2
    .end array-data

    :array_152
    .array-data 4
        0x7
        0x6
        0x5
        0x9
        0x8
        0x2
        0x1
        0x0
        0x4
        0x3
    .end array-data

    :array_16a
    .array-data 4
        0x8
        0x7
        0x6
        0x5
        0x9
        0x3
        0x2
        0x1
        0x0
        0x4
    .end array-data

    :array_182
    .array-data 4
        0x9
        0x8
        0x7
        0x6
        0x5
        0x4
        0x3
        0x2
        0x1
        0x0
    .end array-data

    .line 55
    :array_19a
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
        0x8
        0x9
    .end array-data

    :array_1b2
    .array-data 4
        0x1
        0x5
        0x7
        0x6
        0x2
        0x8
        0x3
        0x0
        0x9
        0x4
    .end array-data

    :array_1ca
    .array-data 4
        0x5
        0x8
        0x0
        0x3
        0x7
        0x9
        0x6
        0x1
        0x4
        0x2
    .end array-data

    :array_1e2
    .array-data 4
        0x8
        0x9
        0x1
        0x6
        0x0
        0x4
        0x3
        0x5
        0x2
        0x7
    .end array-data

    :array_1fa
    .array-data 4
        0x9
        0x4
        0x5
        0x3
        0x1
        0x2
        0x6
        0x8
        0x7
        0x0
    .end array-data

    :array_212
    .array-data 4
        0x4
        0x2
        0x8
        0x6
        0x5
        0x7
        0x3
        0x9
        0x0
        0x1
    .end array-data

    :array_22a
    .array-data 4
        0x2
        0x7
        0x9
        0x3
        0x8
        0x0
        0x6
        0x4
        0x1
        0x5
    .end array-data

    :array_242
    .array-data 4
        0x7
        0x0
        0x4
        0x6
        0x9
        0x1
        0x3
        0x2
        0x5
        0x8
    .end array-data

    .line 66
    :array_25a
    .array-data 4
        0x0
        0x4
        0x3
        0x2
        0x1
        0x5
        0x6
        0x7
        0x8
        0x9
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private calculateChecksum(Ljava/lang/String;Z)I
    .registers 11
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "includesCheckDigit"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
        }
    .end annotation

    .prologue
    .line 113
    const/4 v0, 0x0

    .line 114
    .local v0, "checksum":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_62

    .line 115
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v6, v1, 0x1

    sub-int v2, v5, v6

    .line 116
    .local v2, "idx":I
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v3

    .line 117
    .local v3, "num":I
    if-ltz v3, :cond_1e

    const/16 v5, 0x9

    if-le v3, v5, :cond_4b

    .line 118
    :cond_1e
    new-instance v5, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Invalid Character["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "] = \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 121
    :cond_4b
    if-eqz p2, :cond_5f

    move v4, v1

    .line 122
    .local v4, "pos":I
    :goto_4e
    sget-object v5, Lorg/apache/commons/validator/routines/checkdigit/VerhoeffCheckDigit;->D_TABLE:[[I

    aget-object v5, v5, v0

    sget-object v6, Lorg/apache/commons/validator/routines/checkdigit/VerhoeffCheckDigit;->P_TABLE:[[I

    rem-int/lit8 v7, v4, 0x8

    aget-object v6, v6, v7

    aget v6, v6, v3

    aget v0, v5, v6

    .line 114
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 121
    .end local v4    # "pos":I
    :cond_5f
    add-int/lit8 v4, v1, 0x1

    goto :goto_4e

    .line 124
    .end local v2    # "idx":I
    .end local v3    # "num":I
    :cond_62
    return v0
.end method


# virtual methods
.method public calculate(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "code"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
        }
    .end annotation

    .prologue
    .line 97
    if-eqz p1, :cond_8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_10

    .line 98
    :cond_8
    new-instance v1, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;

    const-string v2, "Code is missing"

    invoke-direct {v1, v2}, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 100
    :cond_10
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lorg/apache/commons/validator/routines/checkdigit/VerhoeffCheckDigit;->calculateChecksum(Ljava/lang/String;Z)I

    move-result v0

    .line 101
    .local v0, "checksum":I
    sget-object v1, Lorg/apache/commons/validator/routines/checkdigit/VerhoeffCheckDigit;->INV_TABLE:[I

    aget v1, v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public isValid(Ljava/lang/String;)Z
    .registers 6
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 78
    if-eqz p1, :cond_a

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_b

    .line 84
    :cond_a
    :goto_a
    return v2

    .line 82
    :cond_b
    const/4 v3, 0x1

    :try_start_c
    invoke-direct {p0, p1, v3}, Lorg/apache/commons/validator/routines/checkdigit/VerhoeffCheckDigit;->calculateChecksum(Ljava/lang/String;Z)I
    :try_end_f
    .catch Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException; {:try_start_c .. :try_end_f} :catch_16

    move-result v3

    if-nez v3, :cond_14

    :goto_12
    move v2, v1

    goto :goto_a

    :cond_14
    move v1, v2

    goto :goto_12

    .line 83
    :catch_16
    move-exception v0

    .line 84
    .local v0, "e":Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
    goto :goto_a
.end method
