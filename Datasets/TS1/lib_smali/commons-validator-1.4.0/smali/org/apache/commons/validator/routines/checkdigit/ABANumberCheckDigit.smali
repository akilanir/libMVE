.class public final Lorg/apache/commons/validator/routines/checkdigit/ABANumberCheckDigit;
.super Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;
.source "ABANumberCheckDigit.java"


# static fields
.field public static final ABAN_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

.field private static final POSITION_WEIGHT:[I

.field private static final serialVersionUID:J = -0x7292fb5aae1e2571L


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 47
    new-instance v0, Lorg/apache/commons/validator/routines/checkdigit/ABANumberCheckDigit;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/checkdigit/ABANumberCheckDigit;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/ABANumberCheckDigit;->ABAN_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .line 50
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_10

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/ABANumberCheckDigit;->POSITION_WEIGHT:[I

    return-void

    :array_10
    .array-data 4
        0x3
        0x1
        0x7
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 56
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;-><init>(I)V

    .line 57
    return-void
.end method


# virtual methods
.method protected weightedValue(III)I
    .registers 7
    .param p1, "charValue"    # I
    .param p2, "leftPos"    # I
    .param p3, "rightPos"    # I

    .prologue
    .line 75
    sget-object v1, Lorg/apache/commons/validator/routines/checkdigit/ABANumberCheckDigit;->POSITION_WEIGHT:[I

    rem-int/lit8 v2, p3, 0x3

    aget v0, v1, v2

    .line 76
    .local v0, "weight":I
    mul-int v1, p1, v0

    return v1
.end method
