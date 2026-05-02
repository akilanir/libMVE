.class public final Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
.super Ljava/lang/Object;
.source "SubsamplingScaleImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "AnimationBuilder"
.end annotation


# instance fields
.field private duration:J

.field private easing:I

.field private interruptible:Z

.field private panLimited:Z

.field private final targetSCenter:Landroid/graphics/PointF;

.field private final targetScale:F

.field final synthetic this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

.field private final vFocus:Landroid/graphics/PointF;


# direct methods
.method private constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;F)V
    .registers 6
    .param p2, "scale"    # F

    .prologue
    const/4 v2, 0x1

    .line 2518
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2507
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    .line 2508
    const/4 v0, 0x2

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    .line 2509
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 2510
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    .line 2519
    iput p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetScale:F

    .line 2520
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    .line 2521
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    .line 2522
    return-void
.end method

.method private constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;)V
    .registers 7
    .param p2, "scale"    # F
    .param p3, "sCenter"    # Landroid/graphics/PointF;

    .prologue
    const/4 v2, 0x1

    .line 2524
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2507
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    .line 2508
    const/4 v0, 0x2

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    .line 2509
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 2510
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    .line 2525
    iput p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetScale:F

    .line 2526
    iput-object p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    .line 2527
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    .line 2528
    return-void
.end method

.method private constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;Landroid/graphics/PointF;)V
    .registers 8
    .param p2, "scale"    # F
    .param p3, "sCenter"    # Landroid/graphics/PointF;
    .param p4, "vFocus"    # Landroid/graphics/PointF;

    .prologue
    const/4 v2, 0x1

    .line 2530
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2507
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    .line 2508
    const/4 v0, 0x2

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    .line 2509
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 2510
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    .line 2531
    iput p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetScale:F

    .line 2532
    iput-object p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    .line 2533
    iput-object p4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    .line 2534
    return-void
.end method

.method synthetic constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;Landroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V
    .registers 6
    .param p1, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p2, "x1"    # F
    .param p3, "x2"    # Landroid/graphics/PointF;
    .param p4, "x3"    # Landroid/graphics/PointF;
    .param p5, "x4"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;

    .prologue
    .line 2502
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;Landroid/graphics/PointF;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V
    .registers 5
    .param p1, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p2, "x1"    # F
    .param p3, "x2"    # Landroid/graphics/PointF;
    .param p4, "x3"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;

    .prologue
    .line 2502
    invoke-direct {p0, p1, p2, p3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V
    .registers 4
    .param p1, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p2, "x1"    # F
    .param p3, "x2"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;

    .prologue
    .line 2502
    invoke-direct {p0, p1, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;F)V

    return-void
.end method

.method private constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)V
    .registers 6
    .param p2, "sCenter"    # Landroid/graphics/PointF;

    .prologue
    const/4 v2, 0x1

    .line 2512
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2507
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    .line 2508
    const/4 v0, 0x2

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    .line 2509
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 2510
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    .line 2513
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F
    invoke-static {p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)F

    move-result v0

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetScale:F

    .line 2514
    iput-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    .line 2515
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    .line 2516
    return-void
.end method

.method synthetic constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V
    .registers 4
    .param p1, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p2, "x1"    # Landroid/graphics/PointF;
    .param p3, "x2"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;

    .prologue
    .line 2502
    invoke-direct {p0, p1, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;Z)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .registers 3
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .param p1, "x1"    # Z

    .prologue
    .line 2502
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->withPanLimited(Z)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    move-result-object v0

    return-object v0
.end method

.method private withPanLimited(Z)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .registers 2
    .param p1, "panLimited"    # Z

    .prologue
    .line 2576
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    .line 2577
    return-object p0
.end method


# virtual methods
.method public start()V
    .registers 13

    .prologue
    const/4 v11, 0x0

    .line 2584
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingLeft()I

    move-result v7

    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v8

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingRight()I

    move-result v9

    sub-int/2addr v8, v9

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingLeft()I

    move-result v9

    sub-int/2addr v8, v9

    div-int/lit8 v8, v8, 0x2

    add-int v5, v7, v8

    .line 2585
    .local v5, "vxCenter":I
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingTop()I

    move-result v7

    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v8

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingBottom()I

    move-result v9

    sub-int/2addr v8, v9

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingTop()I

    move-result v9

    sub-int/2addr v8, v9

    div-int/lit8 v8, v8, 0x2

    add-int v6, v7, v8

    .line 2586
    .local v6, "vyCenter":I
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetScale:F

    # invokes: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->limitedScale(F)F
    invoke-static {v7, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$5900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;F)F

    move-result v2

    .line 2587
    .local v2, "targetScale":F
    iget-boolean v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    if-eqz v7, :cond_15f

    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->x:F

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->y:F

    new-instance v10, Landroid/graphics/PointF;

    invoke-direct {v10}, Landroid/graphics/PointF;-><init>()V

    # invokes: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->limitedSCenter(FFFLandroid/graphics/PointF;)Landroid/graphics/PointF;
    invoke-static {v7, v8, v9, v2, v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FFFLandroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v1

    .line 2588
    .local v1, "targetSCenter":Landroid/graphics/PointF;
    :goto_5c
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    new-instance v8, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    invoke-direct {v8, v11}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v7, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6102(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 2589
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v7

    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)F

    move-result v8

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleStart:F
    invoke-static {v7, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3102(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;F)F

    .line 2590
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v7

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleEnd:F
    invoke-static {v7, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3202(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;F)F

    .line 2591
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->time:J
    invoke-static {v7, v8, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2802(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;J)J

    .line 2592
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v7

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEndRequested:Landroid/graphics/PointF;
    invoke-static {v7, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$4102(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 2593
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v7

    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v8

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterStart:Landroid/graphics/PointF;
    invoke-static {v7, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$4002(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 2594
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v7

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEnd:Landroid/graphics/PointF;
    invoke-static {v7, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 2595
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v7

    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v8, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v8

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;
    invoke-static {v7, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3302(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 2596
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v7

    new-instance v8, Landroid/graphics/PointF;

    int-to-float v9, v5

    int-to-float v10, v6

    invoke-direct {v8, v9, v10}, Landroid/graphics/PointF;-><init>(FF)V

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusEnd:Landroid/graphics/PointF;
    invoke-static {v7, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 2600
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v7

    iget-wide v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J
    invoke-static {v7, v8, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2902(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;J)J

    .line 2601
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v7

    iget-boolean v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->interruptible:Z
    invoke-static {v7, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Z)Z

    .line 2602
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v7

    iget v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I
    invoke-static {v7, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3002(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;I)I

    .line 2603
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->time:J
    invoke-static {v7, v8, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2802(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;J)J

    .line 2605
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    if-eqz v7, :cond_159

    .line 2607
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->x:F

    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterStart:Landroid/graphics/PointF;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$4000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v8

    iget v8, v8, Landroid/graphics/PointF;->x:F

    mul-float/2addr v8, v2

    sub-float v3, v7, v8

    .line 2608
    .local v3, "vTranslateXEnd":F
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    iget v7, v7, Landroid/graphics/PointF;->y:F

    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterStart:Landroid/graphics/PointF;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$4000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v8

    iget v8, v8, Landroid/graphics/PointF;->y:F

    mul-float/2addr v8, v2

    sub-float v4, v7, v8

    .line 2609
    .local v4, "vTranslateYEnd":F
    new-instance v0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    new-instance v7, Landroid/graphics/PointF;

    invoke-direct {v7, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-direct {v0, v2, v7, v11}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;-><init>(FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    .line 2611
    .local v0, "satEnd":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    const/4 v8, 0x1

    # invokes: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V
    invoke-static {v7, v8, v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6300(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V

    .line 2613
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v7

    new-instance v8, Landroid/graphics/PointF;

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->x:F

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/PointF;->x:F

    sub-float/2addr v10, v3

    add-float/2addr v9, v10

    iget-object v10, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    iget v10, v10, Landroid/graphics/PointF;->y:F

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;

    move-result-object v11

    iget v11, v11, Landroid/graphics/PointF;->y:F

    sub-float/2addr v11, v4

    add-float/2addr v10, v11

    invoke-direct {v8, v9, v10}, Landroid/graphics/PointF;-><init>(FF)V

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusEnd:Landroid/graphics/PointF;
    invoke-static {v7, v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 2619
    .end local v0    # "satEnd":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;
    .end local v3    # "vTranslateXEnd":F
    .end local v4    # "vTranslateYEnd":F
    :cond_159
    iget-object v7, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v7}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2620
    return-void

    .line 2587
    .end local v1    # "targetSCenter":Landroid/graphics/PointF;
    :cond_15f
    iget-object v1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    goto/16 :goto_5c
.end method

.method public withDuration(J)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .registers 3
    .param p1, "duration"    # J

    .prologue
    .line 2542
    iput-wide p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    .line 2543
    return-object p0
.end method

.method public withEasing(I)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .registers 5
    .param p1, "easing"    # I

    .prologue
    .line 2562
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_EASING_STYLES:Ljava/util/List;
    invoke-static {}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$5800()Ljava/util/List;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_27

    .line 2563
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown easing type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2565
    :cond_27
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    .line 2566
    return-object p0
.end method

.method public withInterruptible(Z)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .registers 2
    .param p1, "interruptible"    # Z

    .prologue
    .line 2552
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 2553
    return-object p0
.end method
