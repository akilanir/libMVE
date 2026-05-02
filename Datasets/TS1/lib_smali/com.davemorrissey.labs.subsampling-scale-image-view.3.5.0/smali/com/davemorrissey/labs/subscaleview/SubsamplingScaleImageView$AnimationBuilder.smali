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

.field private listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

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

    .line 2549
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2537
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    .line 2538
    const/4 v0, 0x2

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    .line 2539
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 2540
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    .line 2550
    iput p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetScale:F

    .line 2551
    invoke-virtual {p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    .line 2552
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    .line 2553
    return-void
.end method

.method private constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;)V
    .registers 7
    .param p2, "scale"    # F
    .param p3, "sCenter"    # Landroid/graphics/PointF;

    .prologue
    const/4 v2, 0x1

    .line 2555
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2537
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    .line 2538
    const/4 v0, 0x2

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    .line 2539
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 2540
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    .line 2556
    iput p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetScale:F

    .line 2557
    iput-object p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    .line 2558
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    .line 2559
    return-void
.end method

.method private constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;Landroid/graphics/PointF;)V
    .registers 8
    .param p2, "scale"    # F
    .param p3, "sCenter"    # Landroid/graphics/PointF;
    .param p4, "vFocus"    # Landroid/graphics/PointF;

    .prologue
    const/4 v2, 0x1

    .line 2561
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2537
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    .line 2538
    const/4 v0, 0x2

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    .line 2539
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 2540
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    .line 2562
    iput p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetScale:F

    .line 2563
    iput-object p3, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    .line 2564
    iput-object p4, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    .line 2565
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
    .line 2532
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
    .line 2532
    invoke-direct {p0, p1, p2, p3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLandroid/graphics/PointF;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V
    .registers 4
    .param p1, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p2, "x1"    # F
    .param p3, "x2"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;

    .prologue
    .line 2532
    invoke-direct {p0, p1, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;F)V

    return-void
.end method

.method private constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)V
    .registers 6
    .param p2, "sCenter"    # Landroid/graphics/PointF;

    .prologue
    const/4 v2, 0x1

    .line 2543
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2537
    const-wide/16 v0, 0x1f4

    iput-wide v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    .line 2538
    const/4 v0, 0x2

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    .line 2539
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 2540
    iput-boolean v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    .line 2544
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F
    invoke-static {p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)F

    move-result v0

    iput v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetScale:F

    .line 2545
    iput-object p2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    .line 2546
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    .line 2547
    return-void
.end method

.method synthetic constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V
    .registers 4
    .param p1, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
    .param p2, "x1"    # Landroid/graphics/PointF;
    .param p3, "x2"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;

    .prologue
    .line 2532
    invoke-direct {p0, p1, p2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Landroid/graphics/PointF;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;Z)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .registers 3
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .param p1, "x1"    # Z

    .prologue
    .line 2532
    invoke-direct {p0, p1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->withPanLimited(Z)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;

    move-result-object v0

    return-object v0
.end method

.method private withPanLimited(Z)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .registers 2
    .param p1, "panLimited"    # Z

    .prologue
    .line 2617
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    .line 2618
    return-object p0
.end method


# virtual methods
.method public start()V
    .registers 14

    .prologue
    const/4 v12, 0x0

    .line 2625
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    if-eqz v8, :cond_22

    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

    move-result-object v8

    if-eqz v8, :cond_22

    .line 2627
    :try_start_15
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2600(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

    move-result-object v8

    invoke-interface {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;->onInterruptedByNewAnim()V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_22} :catch_18b

    .line 2633
    :cond_22
    :goto_22
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingLeft()I

    move-result v8

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getWidth()I

    move-result v9

    iget-object v10, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingRight()I

    move-result v10

    sub-int/2addr v9, v10

    iget-object v10, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingLeft()I

    move-result v10

    sub-int/2addr v9, v10

    div-int/lit8 v9, v9, 0x2

    add-int v6, v8, v9

    .line 2634
    .local v6, "vxCenter":I
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingTop()I

    move-result v8

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getHeight()I

    move-result v9

    iget-object v10, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingBottom()I

    move-result v10

    sub-int/2addr v9, v10

    iget-object v10, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getPaddingTop()I

    move-result v10

    sub-int/2addr v9, v10

    div-int/lit8 v9, v9, 0x2

    add-int v7, v8, v9

    .line 2635
    .local v7, "vyCenter":I
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    iget v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetScale:F

    # invokes: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->limitedScale(F)F
    invoke-static {v8, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;F)F

    move-result v3

    .line 2636
    .local v3, "targetScale":F
    iget-boolean v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->panLimited:Z

    if-eqz v8, :cond_197

    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    iget v9, v9, Landroid/graphics/PointF;->x:F

    iget-object v10, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    iget v10, v10, Landroid/graphics/PointF;->y:F

    new-instance v11, Landroid/graphics/PointF;

    invoke-direct {v11}, Landroid/graphics/PointF;-><init>()V

    # invokes: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->limitedSCenter(FFFLandroid/graphics/PointF;)Landroid/graphics/PointF;
    invoke-static {v8, v9, v10, v3, v11}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6200(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;FFFLandroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v2

    .line 2637
    .local v2, "targetSCenter":Landroid/graphics/PointF;
    :goto_7d
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    new-instance v9, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    invoke-direct {v9, v12}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;-><init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6002(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    .line 2638
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->scale:F
    invoke-static {v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$1000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)F

    move-result v9

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleStart:F
    invoke-static {v8, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3202(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;F)F

    .line 2639
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->scaleEnd:F
    invoke-static {v8, v3}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3302(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;F)F

    .line 2640
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->time:J
    invoke-static {v8, v9, v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2902(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;J)J

    .line 2641
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEndRequested:Landroid/graphics/PointF;
    invoke-static {v8, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$4202(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 2642
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->getCenter()Landroid/graphics/PointF;

    move-result-object v9

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterStart:Landroid/graphics/PointF;
    invoke-static {v8, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$4102(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 2643
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterEnd:Landroid/graphics/PointF;
    invoke-static {v8, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3602(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 2644
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v9, v2}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->sourceToViewCoord(Landroid/graphics/PointF;)Landroid/graphics/PointF;

    move-result-object v9

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusStart:Landroid/graphics/PointF;
    invoke-static {v8, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 2645
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    new-instance v9, Landroid/graphics/PointF;

    int-to-float v10, v6

    int-to-float v11, v7

    invoke-direct {v9, v10, v11}, Landroid/graphics/PointF;-><init>(FF)V

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusEnd:Landroid/graphics/PointF;
    invoke-static {v8, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 2649
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    iget-wide v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->duration:J
    invoke-static {v8, v9, v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3002(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;J)J

    .line 2650
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    iget-boolean v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->interruptible:Z
    invoke-static {v8, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Z)Z

    .line 2651
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    iget v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->easing:I
    invoke-static {v8, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3102(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;I)I

    .line 2652
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->time:J
    invoke-static {v8, v9, v10}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2902(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;J)J

    .line 2653
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;
    invoke-static {v8, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$2602(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

    .line 2655
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    if-eqz v8, :cond_185

    .line 2657
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->x:F

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v9

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterStart:Landroid/graphics/PointF;
    invoke-static {v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$4100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v9

    iget v9, v9, Landroid/graphics/PointF;->x:F

    mul-float/2addr v9, v3

    sub-float v4, v8, v9

    .line 2658
    .local v4, "vTranslateXEnd":F
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    iget v8, v8, Landroid/graphics/PointF;->y:F

    iget-object v9, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v9

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->sCenterStart:Landroid/graphics/PointF;
    invoke-static {v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$4100(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;)Landroid/graphics/PointF;

    move-result-object v9

    iget v9, v9, Landroid/graphics/PointF;->y:F

    mul-float/2addr v9, v3

    sub-float v5, v8, v9

    .line 2659
    .local v5, "vTranslateYEnd":F
    new-instance v1, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;

    new-instance v8, Landroid/graphics/PointF;

    invoke-direct {v8, v4, v5}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-direct {v1, v3, v8, v12}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;-><init>(FLandroid/graphics/PointF;Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V

    .line 2661
    .local v1, "satEnd":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    const/4 v9, 0x1

    # invokes: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->fitToBounds(ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V
    invoke-static {v8, v9, v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;ZLcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)V

    .line 2663
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->anim:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;
    invoke-static {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$6000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;

    move-result-object v8

    new-instance v9, Landroid/graphics/PointF;

    iget-object v10, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    iget v10, v10, Landroid/graphics/PointF;->x:F

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;

    move-result-object v11

    iget v11, v11, Landroid/graphics/PointF;->x:F

    sub-float/2addr v11, v4

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->vFocus:Landroid/graphics/PointF;

    iget v11, v11, Landroid/graphics/PointF;->y:F

    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->vTranslate:Landroid/graphics/PointF;
    invoke-static {v1}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;->access$4500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;)Landroid/graphics/PointF;

    move-result-object v12

    iget v12, v12, Landroid/graphics/PointF;->y:F

    sub-float/2addr v12, v5

    add-float/2addr v11, v12

    invoke-direct {v9, v10, v11}, Landroid/graphics/PointF;-><init>(FF)V

    # setter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->vFocusEnd:Landroid/graphics/PointF;
    invoke-static {v8, v9}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;->access$3502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Anim;Landroid/graphics/PointF;)Landroid/graphics/PointF;

    .line 2669
    .end local v1    # "satEnd":Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$ScaleAndTranslate;
    .end local v4    # "vTranslateXEnd":F
    .end local v5    # "vTranslateYEnd":F
    :cond_185
    iget-object v8, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->this$0:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;

    invoke-virtual {v8}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->invalidate()V

    .line 2670
    return-void

    .line 2628
    .end local v2    # "targetSCenter":Landroid/graphics/PointF;
    .end local v3    # "targetScale":F
    .end local v6    # "vxCenter":I
    .end local v7    # "vyCenter":I
    :catch_18b
    move-exception v0

    .line 2629
    .local v0, "e":Ljava/lang/Exception;
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$5000()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Error thrown by animation listener"

    invoke-static {v8, v9, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_22

    .line 2636
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v3    # "targetScale":F
    .restart local v6    # "vxCenter":I
    .restart local v7    # "vyCenter":I
    :cond_197
    iget-object v2, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->targetSCenter:Landroid/graphics/PointF;

    goto/16 :goto_7d
.end method

.method public withDuration(J)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .registers 3
    .param p1, "duration"    # J

    .prologue
    .line 2573
    iput-wide p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->duration:J

    .line 2574
    return-object p0
.end method

.method public withEasing(I)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .registers 5
    .param p1, "easing"    # I

    .prologue
    .line 2593
    # getter for: Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->VALID_EASING_STYLES:Ljava/util/List;
    invoke-static {}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;->access$5900()Ljava/util/List;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_27

    .line 2594
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

    .line 2596
    :cond_27
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->easing:I

    .line 2597
    return-object p0
.end method

.method public withInterruptible(Z)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .registers 2
    .param p1, "interruptible"    # Z

    .prologue
    .line 2583
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->interruptible:Z

    .line 2584
    return-object p0
.end method

.method public withOnAnimationEventListener(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;)Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;
    .registers 2
    .param p1, "listener"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

    .prologue
    .line 2606
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$AnimationBuilder;->listener:Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$OnAnimationEventListener;

    .line 2607
    return-object p0
.end method
