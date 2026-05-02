.class public final Lorg/apache/commons/validator/routines/checkdigit/EAN13CheckDigit;
.super Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;
.source "EAN13CheckDigit.java"


# static fields
.field public static final EAN13_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

.field private static final POSITION_WEIGHT:[I

.field private static final serialVersionUID:J = 0x17f53788e307102bL


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 48
    new-instance v0, Lorg/apache/commons/validator/routines/checkdigit/EAN13CheckDigit;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/checkdigit/EAN13CheckDigit;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/EAN13CheckDigit;->EAN13_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .line 51
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_10

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/EAN13CheckDigit;->POSITION_WEIGHT:[I

    return-void

    :array_10
    .array-data 4
        0x3
        0x1
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 57
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;-><init>(I)V

    .line 58
    return-void
.end method


# virtual methods
.method protected weightedValue(III)I
    .registers 7
    .param p1, "charValue"    # I
    .param p2, "leftPos"    # I
    .param p3, "rightPos"    # I

    .prologue
    .line 74
    sget-object v1, Lorg/apache/commons/validator/routines/checkdigit/EAN13CheckDigit;->POSITION_WEIGHT:[I

    rem-int/lit8 v2, p3, 0x2

    aget v0, v1, v2

    .line 75
    .local v0, "weight":I
    mul-int v1, p1, v0

    return v1
.end method
