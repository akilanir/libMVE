.class Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;
.super Ljava/lang/Object;
.source "SubsamplingScaleImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ScaleAndTranslate"
.end annotation


# instance fields
.field private scale:F

.field private vTranslate:Landroid/graphics/PointF;


# direct methods
.method private constructor <init>(FLandroid/graphics/PointF;)V
    .registers 3
    .param p1, "scale"    # F
    .param p2, "vTranslate"    # Landroid/graphics/PointF;

    .prologue
    .line 1748
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1749
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F

    .line 1750
    iput-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;

    .line 1751
    return-void
.end method

.method synthetic constructor <init>(FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V
    .registers 4
    .param p1, "x0"    # F
    .param p2, "x1"    # Landroid/graphics/PointF;
    .param p3, "x2"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;

    .prologue
    .line 1747
    invoke-direct {p0, p1, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;-><init>(FLandroid/graphics/PointF;)V

    return-void
.end method

.method static synthetic access$4400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)F
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .prologue
    .line 1747
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F

    return v0
.end method

.method static synthetic access$4402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;F)F
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;
    .param p1, "x1"    # F

    .prologue
    .line 1747
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->scale:F

    return p1
.end method

.method static synthetic access$4500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    .prologue
    .line 1747
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;

    return-object v0
.end method
