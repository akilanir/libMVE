.class abstract Landroid/support/v7/widget/ViewGroup;
.super Landroid/view/ViewGroup;
.source "ViewGroup.java"


# static fields
.field protected static final MEASURED_STATE_MASK:I = -0x1000000

.field protected static final MEASURED_STATE_TOO_SMALL:I = 0x1000000


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    return-void
.end method

.method protected static isLayoutRtl(Landroid/view/View;)Z
    .registers 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 81
    const/4 v0, 0x0

    return v0
.end method

.method public static resolveSizeAndState(III)I
    .registers 8
    .param p0, "size"    # I
    .param p1, "measureSpec"    # I
    .param p2, "childMeasuredState"    # I

    .prologue
    .line 56
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-lt v3, v4, :cond_b

    .line 57
    invoke-static {p0, p1, p2}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result v3

    .line 77
    :goto_a
    return v3

    .line 59
    :cond_b
    move v0, p0

    .line 60
    .local v0, "result":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    .line 61
    .local v1, "specMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 62
    .local v2, "specSize":I
    sparse-switch v1, :sswitch_data_2a

    .line 77
    :goto_17
    const/high16 v3, -0x1000000

    and-int/2addr v3, p2

    or-int/2addr v3, v0

    goto :goto_a

    .line 64
    :sswitch_1c
    move v0, p0

    .line 65
    goto :goto_17

    .line 67
    :sswitch_1e
    if-ge v2, p0, :cond_25

    .line 68
    const/high16 v3, 0x1000000

    or-int v0, v2, v3

    goto :goto_17

    .line 70
    :cond_25
    move v0, p0

    .line 72
    goto :goto_17

    .line 74
    :sswitch_27
    move v0, v2

    goto :goto_17

    .line 62
    nop

    :sswitch_data_2a
    .sparse-switch
        -0x80000000 -> :sswitch_1e
        0x0 -> :sswitch_1c
        0x40000000 -> :sswitch_27
    .end sparse-switch
.end method
