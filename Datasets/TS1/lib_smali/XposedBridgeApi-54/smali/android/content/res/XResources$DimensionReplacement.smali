.class public Landroid/content/res/XResources$DimensionReplacement;
.super Ljava/lang/Object;
.source "XResources.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/content/res/XResources;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DimensionReplacement"
.end annotation


# instance fields
.field private final mUnit:I

.field private final mValue:F


# direct methods
.method public constructor <init>(FI)V
    .registers 3
    .param p1, "value"    # F
    .param p2, "unit"    # I

    .prologue
    .line 1112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1113
    iput p1, p0, Landroid/content/res/XResources$DimensionReplacement;->mValue:F

    .line 1114
    iput p2, p0, Landroid/content/res/XResources$DimensionReplacement;->mUnit:I

    .line 1115
    return-void
.end method


# virtual methods
.method public getDimension(Landroid/util/DisplayMetrics;)F
    .registers 4
    .param p1, "metrics"    # Landroid/util/DisplayMetrics;

    .prologue
    .line 1119
    iget v0, p0, Landroid/content/res/XResources$DimensionReplacement;->mUnit:I

    iget v1, p0, Landroid/content/res/XResources$DimensionReplacement;->mValue:F

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    return v0
.end method

.method public getDimensionPixelOffset(Landroid/util/DisplayMetrics;)I
    .registers 4
    .param p1, "metrics"    # Landroid/util/DisplayMetrics;

    .prologue
    .line 1124
    iget v0, p0, Landroid/content/res/XResources$DimensionReplacement;->mUnit:I

    iget v1, p0, Landroid/content/res/XResources$DimensionReplacement;->mValue:F

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method public getDimensionPixelSize(Landroid/util/DisplayMetrics;)I
    .registers 7
    .param p1, "metrics"    # Landroid/util/DisplayMetrics;

    .prologue
    const/4 v4, 0x0

    .line 1129
    iget v2, p0, Landroid/content/res/XResources$DimensionReplacement;->mUnit:I

    iget v3, p0, Landroid/content/res/XResources$DimensionReplacement;->mValue:F

    invoke-static {v2, v3, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    .line 1130
    .local v0, "f":F
    const/high16 v2, 0x3f000000    # 0.5f

    add-float/2addr v2, v0

    float-to-int v1, v2

    .line 1131
    .local v1, "res":I
    if-eqz v1, :cond_10

    .line 1134
    .end local v1    # "res":I
    :goto_f
    return v1

    .line 1132
    .restart local v1    # "res":I
    :cond_10
    iget v2, p0, Landroid/content/res/XResources$DimensionReplacement;->mValue:F

    cmpl-float v2, v2, v4

    if-nez v2, :cond_18

    const/4 v1, 0x0

    goto :goto_f

    .line 1133
    :cond_18
    iget v2, p0, Landroid/content/res/XResources$DimensionReplacement;->mValue:F

    cmpl-float v2, v2, v4

    if-lez v2, :cond_20

    const/4 v1, 0x1

    goto :goto_f

    .line 1134
    :cond_20
    const/4 v1, -0x1

    goto :goto_f
.end method
