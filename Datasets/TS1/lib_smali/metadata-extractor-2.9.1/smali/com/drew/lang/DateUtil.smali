.class public Lcom/drew/lang/DateUtil;
.super Ljava/lang/Object;
.source "DateUtil.java"


# static fields
.field private static _daysInMonth365:[I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 8
    const/16 v0, 0xc

    new-array v0, v0, [I

    fill-array-data v0, :array_a

    sput-object v0, Lcom/drew/lang/DateUtil;->_daysInMonth365:[I

    return-void

    :array_a
    .array-data 4
        0x1f
        0x1c
        0x1f
        0x1e
        0x1f
        0x1e
        0x1f
        0x1f
        0x1e
        0x1f
        0x1e
        0x1f
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isValidDate(III)Z
    .registers 8
    .param p0, "year"    # I
    .param p1, "month"    # I
    .param p2, "day"    # I

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 12
    if-lt p0, v2, :cond_e

    const/16 v4, 0x270f

    if-gt p0, v4, :cond_e

    if-ltz p1, :cond_e

    const/16 v4, 0xb

    if-le p1, v4, :cond_10

    :cond_e
    move v2, v3

    .line 23
    :cond_f
    :goto_f
    return v2

    .line 15
    :cond_10
    sget-object v4, Lcom/drew/lang/DateUtil;->_daysInMonth365:[I

    aget v0, v4, p1

    .line 16
    .local v0, "daysInMonth":I
    if-ne p1, v2, :cond_27

    .line 18
    rem-int/lit8 v4, p0, 0x4

    if-nez v4, :cond_2d

    rem-int/lit8 v4, p0, 0x64

    if-nez v4, :cond_22

    rem-int/lit16 v4, p0, 0x190

    if-nez v4, :cond_2d

    :cond_22
    move v1, v2

    .line 19
    .local v1, "isLeapYear":Z
    :goto_23
    if-eqz v1, :cond_27

    .line 20
    add-int/lit8 v0, v0, 0x1

    .line 23
    .end local v1    # "isLeapYear":Z
    :cond_27
    if-lt p2, v2, :cond_2b

    if-le p2, v0, :cond_f

    :cond_2b
    move v2, v3

    goto :goto_f

    :cond_2d
    move v1, v3

    .line 18
    goto :goto_23
.end method

.method public static isValidTime(III)Z
    .registers 5
    .param p0, "hours"    # I
    .param p1, "minutes"    # I
    .param p2, "seconds"    # I

    .prologue
    const/16 v1, 0x3c

    .line 28
    if-ltz p0, :cond_12

    const/16 v0, 0x18

    if-ge p0, v0, :cond_12

    if-ltz p1, :cond_12

    if-ge p1, v1, :cond_12

    if-ltz p2, :cond_12

    if-ge p2, v1, :cond_12

    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method
