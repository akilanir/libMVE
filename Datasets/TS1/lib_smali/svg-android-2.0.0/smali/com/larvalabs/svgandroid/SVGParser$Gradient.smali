.class Lcom/larvalabs/svgandroid/SVGParser$Gradient;
.super Ljava/lang/Object;
.source "SVGParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/larvalabs/svgandroid/SVGParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Gradient"
.end annotation


# instance fields
.field public boundingBox:Z

.field colors:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field id:Ljava/lang/String;

.field isLinear:Z

.field matrix:Landroid/graphics/Matrix;

.field positions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field radius:F

.field public shader:Landroid/graphics/Shader;

.field public tilemode:Landroid/graphics/Shader$TileMode;

.field x:F

.field x1:F

.field x2:F

.field xlink:Ljava/lang/String;

.field y:F

.field y1:F

.field y2:F


# direct methods
.method private constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 642
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 648
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->positions:Ljava/util/ArrayList;

    .line 649
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->colors:Ljava/util/ArrayList;

    .line 650
    iput-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->matrix:Landroid/graphics/Matrix;

    .line 651
    iput-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->shader:Landroid/graphics/Shader;

    .line 652
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->boundingBox:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/larvalabs/svgandroid/SVGParser$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/larvalabs/svgandroid/SVGParser$1;

    .prologue
    .line 642
    invoke-direct {p0}, Lcom/larvalabs/svgandroid/SVGParser$Gradient;-><init>()V

    return-void
.end method


# virtual methods
.method public createChild(Lcom/larvalabs/svgandroid/SVGParser$Gradient;)Lcom/larvalabs/svgandroid/SVGParser$Gradient;
    .registers 5
    .param p1, "g"    # Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    .prologue
    .line 656
    new-instance v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    invoke-direct {v0}, Lcom/larvalabs/svgandroid/SVGParser$Gradient;-><init>()V

    .line 657
    .local v0, "child":Lcom/larvalabs/svgandroid/SVGParser$Gradient;
    iget-object v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->id:Ljava/lang/String;

    iput-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->id:Ljava/lang/String;

    .line 658
    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->id:Ljava/lang/String;

    iput-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->xlink:Ljava/lang/String;

    .line 659
    iget-boolean v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->isLinear:Z

    iput-boolean v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->isLinear:Z

    .line 660
    iget v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->x1:F

    iput v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->x1:F

    .line 661
    iget v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->x2:F

    iput v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->x2:F

    .line 662
    iget v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->y1:F

    iput v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->y1:F

    .line 663
    iget v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->y2:F

    iput v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->y2:F

    .line 664
    iget v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->x:F

    iput v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->x:F

    .line 665
    iget v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->y:F

    iput v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->y:F

    .line 666
    iget v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->radius:F

    iput v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->radius:F

    .line 667
    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->positions:Ljava/util/ArrayList;

    iput-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->positions:Ljava/util/ArrayList;

    .line 668
    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->colors:Ljava/util/ArrayList;

    iput-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->colors:Ljava/util/ArrayList;

    .line 669
    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->matrix:Landroid/graphics/Matrix;

    iput-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->matrix:Landroid/graphics/Matrix;

    .line 670
    iget-object v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->matrix:Landroid/graphics/Matrix;

    if-eqz v2, :cond_45

    .line 671
    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->matrix:Landroid/graphics/Matrix;

    if-nez v2, :cond_52

    .line 672
    iget-object v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->matrix:Landroid/graphics/Matrix;

    iput-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->matrix:Landroid/graphics/Matrix;

    .line 679
    :cond_45
    :goto_45
    iget-boolean v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->boundingBox:Z

    iput-boolean v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->boundingBox:Z

    .line 680
    iget-object v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->shader:Landroid/graphics/Shader;

    iput-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->shader:Landroid/graphics/Shader;

    .line 681
    iget-object v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->tilemode:Landroid/graphics/Shader$TileMode;

    iput-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->tilemode:Landroid/graphics/Shader$TileMode;

    .line 682
    return-object v0

    .line 674
    :cond_52
    new-instance v1, Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->matrix:Landroid/graphics/Matrix;

    invoke-direct {v1, v2}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 675
    .local v1, "m":Landroid/graphics/Matrix;
    iget-object v2, p1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 676
    iput-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->matrix:Landroid/graphics/Matrix;

    goto :goto_45
.end method
