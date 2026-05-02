.class public final Lorg/apache/commons/validator/routines/checkdigit/SedolCheckDigit;
.super Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;
.source "SedolCheckDigit.java"


# static fields
.field private static final POSITION_WEIGHT:[I

.field public static final SEDOL_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

.field private static final serialVersionUID:J = -0x7c944a45db4fc66bL


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    new-instance v0, Lorg/apache/commons/validator/routines/checkdigit/SedolCheckDigit;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/checkdigit/SedolCheckDigit;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/SedolCheckDigit;->SEDOL_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .line 47
    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_10

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/SedolCheckDigit;->POSITION_WEIGHT:[I

    return-void

    :array_10
    .array-data 4
        0x1
        0x3
        0x1
        0x7
        0x3
        0x9
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
.method protected calculateModulus(Ljava/lang/String;Z)I
    .registers 6
    .param p1, "code"    # Ljava/lang/String;
    .param p2, "includesCheckDigit"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;
        }
    .end annotation

    .prologue
    .line 66
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x7

    if-le v0, v1, :cond_24

    .line 67
    new-instance v0, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Invalid Code Length = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/validator/routines/checkdigit/CheckDigitException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 69
    :cond_24
    invoke-super {p0, p1, p2}, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;->calculateModulus(Ljava/lang/String;Z)I

    move-result v0

    return v0
.end method

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
    .line 96
    invoke-static {p1}, Ljava/lang/Character;->getNumericValue(C)I

    move-result v0

    .line 97
    .local v0, "charValue":I
    if-ltz v0, :cond_a

    const/16 v1, 0x23

    if-le v0, v1, :cond_33

    .line 98
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

    .line 101
    :cond_33
    return v0
.end method

.method protected weightedValue(III)I
    .registers 6
    .param p1, "charValue"    # I
    .param p2, "leftPos"    # I
    .param p3, "rightPos"    # I

    .prologue
    .line 82
    sget-object v0, Lorg/apache/commons/validator/routines/checkdigit/SedolCheckDigit;->POSITION_WEIGHT:[I

    add-int/lit8 v1, p2, -0x1

    aget v0, v0, v1

    mul-int/2addr v0, p1

    return v0
.end method
