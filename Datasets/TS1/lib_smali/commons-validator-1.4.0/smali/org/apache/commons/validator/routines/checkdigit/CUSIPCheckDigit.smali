.class public final Lorg/apache/commons/validator/routines/checkdigit/CUSIPCheckDigit;
.super Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;
.source "CUSIPCheckDigit.java"


# static fields
.field public static final CUSIP_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

.field private static final POSITION_WEIGHT:[I

.field private static final serialVersionUID:J = 0x9417424296c4e08L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    new-instance v0, Lorg/apache/commons/validator/routines/checkdigit/CUSIPCheckDigit;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/checkdigit/CUSIPCheckDigit;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/CUSIPCheckDigit;->CUSIP_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .line 47
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_10

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/CUSIPCheckDigit;->POSITION_WEIGHT:[I

    return-void

    :array_10
    .array-data 4
        0x2
        0x1
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 53
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;-><init>(I)V

    .line 54
    return-void
.end method


# virtual methods
.method protected toInt(CII)I
    .registers 8
    .param p1, "character"    # C
    .param p2, "leftPos"    # I
    .param p3, "rightPos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
        }
    .end annotation

    .prologue
    .line 67
    invoke-static {p1}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v0

    .line 68
    .local v0, "charValue":I
    if-ltz v0, :cond_a

    const/16 v1, 0x23

    if-le v0, v1, :cond_33

    .line 69
    :cond_a
    new-instance v1, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Invalid Character["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "] = \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 72
    :cond_33
    return v0
.end method

.method protected weightedValue(III)I
    .registers 8
    .param p1, "charValue"    # I
    .param p2, "leftPos"    # I
    .param p3, "rightPos"    # I

    .prologue
    .line 89
    sget-object v2, Lorg/apache/commons/validator/routines/checkdigit/CUSIPCheckDigit;->POSITION_WEIGHT:[I

    rem-int/lit8 v3, p3, 0x2

    aget v0, v2, v3

    .line 90
    .local v0, "weight":I
    mul-int v1, p1, v0

    .line 91
    .local v1, "weightedValue":I
    invoke-static {v1}, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;->sumDigits(I)I

    move-result v2

    return v2
.end method
