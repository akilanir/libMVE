.class Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
.super Ljava/lang/Object;
.source "SubsamplingScaleImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Tile"
.end annotation


# instance fields
.field private bitmap:Landroid/graphics/Bitmap;

.field private fileSRect:Landroid/graphics/Rect;

.field private loading:Z

.field private sRect:Landroid/graphics/Rect;

.field private sampleSize:I

.field private vRect:Landroid/graphics/Rect;

.field private visible:Z


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 1716
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$1;

    .prologue
    .line 1716
    invoke-direct {p0}, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;-><init>()V

    return-void
.end method

.method static synthetic access$3700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .prologue
    .line 1716
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z

    return v0
.end method

.method static synthetic access$3702(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .param p1, "x1"    # Z

    .prologue
    .line 1716
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->loading:Z

    return p1
.end method

.method static synthetic access$3800(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .prologue
    .line 1716
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$3802(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .param p1, "x1"    # Landroid/graphics/Rect;

    .prologue
    .line 1716
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sRect:Landroid/graphics/Rect;

    return-object p1
.end method

.method static synthetic access$3900(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .prologue
    .line 1716
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$3902(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .param p1, "x1"    # Landroid/graphics/Rect;

    .prologue
    .line 1716
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->vRect:Landroid/graphics/Rect;

    return-object p1
.end method

.method static synthetic access$400(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .prologue
    .line 1716
    iget-boolean v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z

    return v0
.end method

.method static synthetic access$4000(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)I
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .prologue
    .line 1716
    iget v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I

    return v0
.end method

.method static synthetic access$4002(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;I)I
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .param p1, "x1"    # I

    .prologue
    .line 1716
    iput p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->sampleSize:I

    return p1
.end method

.method static synthetic access$402(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .param p1, "x1"    # Z

    .prologue
    .line 1716
    iput-boolean p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->visible:Z

    return p1
.end method

.method static synthetic access$4700(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .prologue
    .line 1716
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->fileSRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$4702(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .param p1, "x1"    # Landroid/graphics/Rect;

    .prologue
    .line 1716
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->fileSRect:Landroid/graphics/Rect;

    return-object p1
.end method

.method static synthetic access$500(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;)Landroid/graphics/Bitmap;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;

    .prologue
    .line 1716
    iget-object v0, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic access$502(Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 2
    .param p0, "x0"    # Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;
    .param p1, "x1"    # Landroid/graphics/Bitmap;

    .prologue
    .line 1716
    iput-object p1, p0, Lcom/davemorrissey/labs/subscaleview/SubsamplingScaleImageView$Tile;->bitmap:Landroid/graphics/Bitmap;

    return-object p1
.end method
