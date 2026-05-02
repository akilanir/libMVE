.class public Lcom/wdullaer/materialdatetimepicker/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field public static final FULL_ALPHA:I = 0xff

.field public static final MONDAY_BEFORE_JULIAN_EPOCH:I = 0x253d89

.field public static final PULSE_ANIMATOR_DURATION:I = 0x220

.field public static final SELECTED_ALPHA:I = 0xff

.field public static final SELECTED_ALPHA_THEME_DARK:I = 0xff


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dpToPx(FLandroid/content/res/Resources;)I
    .registers 5
    .param p0, "dp"    # F
    .param p1, "resources"    # Landroid/content/res/Resources;

    .prologue
    .line 145
    const/4 v1, 0x1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v1, p0, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    .line 146
    .local v0, "px":F
    float-to-int v1, v0

    return v1
.end method

.method public static getDaysInMonth(II)I
    .registers 4
    .param p0, "month"    # I
    .param p1, "year"    # I

    .prologue
    .line 61
    packed-switch p0, :pswitch_data_1c

    .line 78
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid Month"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 69
    :pswitch_b
    const/16 v0, 0x1f

    .line 76
    :goto_d
    return v0

    .line 74
    :pswitch_e
    const/16 v0, 0x1e

    goto :goto_d

    .line 76
    :pswitch_11
    rem-int/lit8 v0, p1, 0x4

    if-nez v0, :cond_18

    const/16 v0, 0x1d

    goto :goto_d

    :cond_18
    const/16 v0, 0x1c

    goto :goto_d

    .line 61
    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_b
        :pswitch_11
        :pswitch_b
        :pswitch_e
        :pswitch_b
        :pswitch_e
        :pswitch_b
        :pswitch_b
        :pswitch_e
        :pswitch_b
        :pswitch_e
        :pswitch_b
    .end packed-switch
.end method

.method public static getJulianMondayFromWeeksSinceEpoch(I)I
    .registers 3
    .param p0, "week"    # I

    .prologue
    .line 94
    const v0, 0x253d89

    mul-int/lit8 v1, p0, 0x7

    add-int/2addr v0, v1

    return v0
.end method

.method public static getPulseAnimator(Landroid/view/View;FF)Landroid/animation/ObjectAnimator;
    .registers 16
    .param p0, "labelToAnimate"    # Landroid/view/View;
    .param p1, "decreaseRatio"    # F
    .param p2, "increaseRatio"    # F

    .prologue
    const/4 v12, 0x3

    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    .line 126
    const/4 v7, 0x0

    invoke-static {v7, v8}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v0

    .line 127
    .local v0, "k0":Landroid/animation/Keyframe;
    const v7, 0x3e8ccccd    # 0.275f

    invoke-static {v7, p1}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v1

    .line 128
    .local v1, "k1":Landroid/animation/Keyframe;
    const v7, 0x3f30a3d7    # 0.69f

    invoke-static {v7, p2}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v2

    .line 129
    .local v2, "k2":Landroid/animation/Keyframe;
    invoke-static {v8, v8}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object v3

    .line 131
    .local v3, "k3":Landroid/animation/Keyframe;
    const-string v7, "scaleX"

    const/4 v8, 0x4

    new-array v8, v8, [Landroid/animation/Keyframe;

    aput-object v0, v8, v9

    aput-object v1, v8, v10

    aput-object v2, v8, v11

    aput-object v3, v8, v12

    invoke-static {v7, v8}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v5

    .line 132
    .local v5, "scaleX":Landroid/animation/PropertyValuesHolder;
    const-string v7, "scaleY"

    const/4 v8, 0x4

    new-array v8, v8, [Landroid/animation/Keyframe;

    aput-object v0, v8, v9

    aput-object v1, v8, v10

    aput-object v2, v8, v11

    aput-object v3, v8, v12

    invoke-static {v7, v8}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v6

    .line 133
    .local v6, "scaleY":Landroid/animation/PropertyValuesHolder;
    new-array v7, v11, [Landroid/animation/PropertyValuesHolder;

    aput-object v5, v7, v9

    aput-object v6, v7, v10

    invoke-static {p0, v7}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 135
    .local v4, "pulseAnimator":Landroid/animation/ObjectAnimator;
    const-wide/16 v7, 0x220

    invoke-virtual {v4, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 137
    return-object v4
.end method

.method public static getWeeksSinceEpochFromJulianDay(II)I
    .registers 5
    .param p0, "julianDay"    # I
    .param p1, "firstDayOfWeek"    # I

    .prologue
    .line 111
    rsub-int/lit8 v0, p1, 0x4

    .line 112
    .local v0, "diff":I
    if-gez v0, :cond_6

    .line 113
    add-int/lit8 v0, v0, 0x7

    .line 115
    :cond_6
    const v2, 0x253d8c    # 3.419992E-39f

    sub-int v1, v2, v0

    .line 116
    .local v1, "refDay":I
    sub-int v2, p0, v1

    div-int/lit8 v2, v2, 0x7

    return v2
.end method

.method public static isJellybeanOrLater()Z
    .registers 2

    .prologue
    .line 46
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public static tryAccessibilityAnnounce(Landroid/view/View;Ljava/lang/CharSequence;)V
    .registers 3
    .param p0, "view"    # Landroid/view/View;
    .param p1, "text"    # Ljava/lang/CharSequence;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 55
    invoke-static {}, Lcom/wdullaer/materialdatetimepicker/Utils;->isJellybeanOrLater()Z

    move-result v0

    if-eqz v0, :cond_d

    if-eqz p0, :cond_d

    if-eqz p1, :cond_d

    .line 56
    invoke-virtual {p0, p1}, Landroid/view/View;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 58
    :cond_d
    return-void
.end method
