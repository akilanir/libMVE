.class public final Lorg/apache/commons/validator/routines/checkdigit/LuhnCheckDigit;
.super Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;
.source "LuhnCheckDigit.java"


# static fields
.field public static final LUHN_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

.field private static final POSITION_WEIGHT:[I

.field private static final serialVersionUID:J = -0x295012e19f628f5fL


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 43
    new-instance v0, Lorg/apache/commons/validator/routines/checkdigit/LuhnCheckDigit;

    invoke-direct {v0}, Lorg/apache/commons/validator/routines/checkdigit/LuhnCheckDigit;-><init>()V

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/LuhnCheckDigit;->LUHN_CHECK_DIGIT:Lorg/apache/commons/validator/routines/checkdigit/CheckDigit;

    .line 46
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_10

    sput-object v0, Lorg/apache/commons/validator/routines/checkdigit/LuhnCheckDigit;->POSITION_WEIGHT:[I

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
    .line 52
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lorg/apache/commons/validator/routines/checkdigit/ModulusCheckDigit;-><init>(I)V

    .line 53
    return-void
.end method


# virtual methods
.method protected weightedValue(III)I
    .registers 8
    .param p1, "charValue"    # I
    .param p2, "leftPos"    # I
    .param p3, "rightPos"    # I

    .prologue
    .line 69
    sget-object v2, Lorg/apache/commons/validator/routines/checkdigit/LuhnCheckDigit;->POSITION_WEIGHT:[I

    rem-int/lit8 v3, p3, 0x2

    aget v0, v2, v3

    .line 70
    .local v0, "weight":I
    mul-int v1, p1, v0

    .line 71
    .local v1, "weightedValue":I
    const/16 v2, 0x9

    if-le v1, v2, :cond_e

    add-int/lit8 v1, v1, -0x9

    .end local v1    # "weightedValue":I
    :cond_e
    return v1
.end method
