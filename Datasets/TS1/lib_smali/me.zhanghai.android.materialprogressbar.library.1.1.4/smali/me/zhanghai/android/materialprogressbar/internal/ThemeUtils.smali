.class public Lme/zhanghai/android/materialprogressbar/internal/ThemeUtils;
.super Ljava/lang/Object;
.source "ThemeUtils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getColorFromAttrRes(ILandroid/content/Context;)I
    .registers 5
    .param p0, "attr"    # I
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 16
    const/4 v1, 0x1

    new-array v1, v1, [I

    aput p0, v1, v2

    invoke-virtual {p1, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 18
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_c
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I
    :try_end_f
    .catchall {:try_start_c .. :try_end_f} :catchall_14

    move-result v1

    .line 20
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    return v1

    :catchall_14
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method

.method public static getFloatFromAttrRes(ILandroid/content/Context;)F
    .registers 5
    .param p0, "attrRes"    # I
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    .line 25
    const/4 v1, 0x1

    new-array v1, v1, [I

    aput p0, v1, v2

    invoke-virtual {p1, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 27
    .local v0, "a":Landroid/content/res/TypedArray;
    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_c
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F
    :try_end_f
    .catchall {:try_start_c .. :try_end_f} :catchall_14

    move-result v1

    .line 29
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    return v1

    :catchall_14
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method
