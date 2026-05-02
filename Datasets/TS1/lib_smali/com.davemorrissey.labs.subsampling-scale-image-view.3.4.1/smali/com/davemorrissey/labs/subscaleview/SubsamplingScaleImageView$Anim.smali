.class Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
.super Ljava/lang/Object;
.source "SubsamplingScaleImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Anim"
.end annotation


# instance fields
.field private duration:J

.field private easing:I

.field private interruptible:Z

.field private sCenterEnd:Landroid/graphics/PointF;

.field private sCenterEndRequested:Landroid/graphics/PointF;

.field private sCenterStart:Landroid/graphics/PointF;

.field private scaleEnd:F

.field private scaleStart:F

.field private time:J

.field private vFocusEnd:Landroid/graphics/PointF;

.field private vFocusStart:Landroid/graphics/PointF;


# direct methods
.method private constructor <init>()V
    .registers 3

    .prologue
    .line 1709
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1718
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J

    .line 1719
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->interruptible:Z

    .line 1720
    const/4 v0, 0x2

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I

    .line 1721
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->time:J

    return-void
.end method

.method synthetic constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;

    .prologue
    .line 1709
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;-><init>()V

    return-void
.end method

.method static synthetic access$2500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .prologue
    .line 1709
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->interruptible:Z

    return v0
.end method

.method static synthetic access$2502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .param p1, "x1"    # Z

    .prologue
    .line 1709
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->interruptible:Z

    return p1
.end method

.method static synthetic access$2800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)J
    .registers 3
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .prologue
    .line 1709
    iget-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->time:J

    return-wide v0
.end method

.method static synthetic access$2802(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;J)J
    .registers 3
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .param p1, "x1"    # J

    .prologue
    .line 1709
    iput-wide p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->time:J

    return-wide p1
.end method

.method static synthetic access$2900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)J
    .registers 3
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .prologue
    .line 1709
    iget-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J

    return-wide v0
.end method

.method static synthetic access$2902(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;J)J
    .registers 3
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .param p1, "x1"    # J

    .prologue
    .line 1709
    iput-wide p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J

    return-wide p1
.end method

.method static synthetic access$3000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)I
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .prologue
    .line 1709
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I

    return v0
.end method

.method static synthetic access$3002(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;I)I
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .param p1, "x1"    # I

    .prologue
    .line 1709
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I

    return p1
.end method

.method static synthetic access$3100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)F
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .prologue
    .line 1709
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleStart:F

    return v0
.end method

.method static synthetic access$3102(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;F)F
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .param p1, "x1"    # F

    .prologue
    .line 1709
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleStart:F

    return p1
.end method

.method static synthetic access$3200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)F
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .prologue
    .line 1709
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleEnd:F

    return v0
.end method

.method static synthetic access$3202(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;F)F
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .param p1, "x1"    # F

    .prologue
    .line 1709
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleEnd:F

    return p1
.end method

.method static synthetic access$3300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .prologue
    .line 1709
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;

    return-object v0
.end method

.method static synthetic access$3302(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .param p1, "x1"    # Landroid/graphics/PointF;

    .prologue
    .line 1709
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;

    return-object p1
.end method

.method static synthetic access$3400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .prologue
    .line 1709
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusEnd:Landroid/graphics/PointF;

    return-object v0
.end method

.method static synthetic access$3402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .param p1, "x1"    # Landroid/graphics/PointF;

    .prologue
    .line 1709
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusEnd:Landroid/graphics/PointF;

    return-object p1
.end method

.method static synthetic access$3500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .prologue
    .line 1709
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEnd:Landroid/graphics/PointF;

    return-object v0
.end method

.method static synthetic access$3502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .param p1, "x1"    # Landroid/graphics/PointF;

    .prologue
    .line 1709
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEnd:Landroid/graphics/PointF;

    return-object p1
.end method

.method static synthetic access$4000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .prologue
    .line 1709
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterStart:Landroid/graphics/PointF;

    return-object v0
.end method

.method static synthetic access$4002(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .param p1, "x1"    # Landroid/graphics/PointF;

    .prologue
    .line 1709
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterStart:Landroid/graphics/PointF;

    return-object p1
.end method

.method static synthetic access$4100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .prologue
    .line 1709
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEndRequested:Landroid/graphics/PointF;

    return-object v0
.end method

.method static synthetic access$4102(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    .param p1, "x1"    # Landroid/graphics/PointF;

    .prologue
    .line 1709
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEndRequested:Landroid/graphics/PointF;

    return-object p1
.end method
