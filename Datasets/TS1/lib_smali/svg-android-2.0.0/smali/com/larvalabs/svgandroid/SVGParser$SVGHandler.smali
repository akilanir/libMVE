.class Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "SVGParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/larvalabs/svgandroid/SVGParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SVGHandler"
.end annotation


# instance fields
.field bounds:Landroid/graphics/RectF;

.field private boundsMode:Z

.field private canvas:Landroid/graphics/Canvas;

.field canvasRestoreCount:Ljava/lang/Integer;

.field fillPaint:Landroid/graphics/Paint;

.field fillPaintStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Landroid/graphics/Paint;",
            ">;"
        }
    .end annotation
.end field

.field fillSet:Z

.field fillSetStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final gradMatrix:Landroid/graphics/Matrix;

.field gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

.field gradientMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/larvalabs/svgandroid/SVGParser$Gradient;",
            ">;"
        }
    .end annotation
.end field

.field private hidden:Z

.field private hiddenLevel:I

.field limits:Landroid/graphics/RectF;

.field private limitsAdjustmentX:Ljava/lang/Float;

.field private limitsAdjustmentY:Ljava/lang/Float;

.field matrixStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Landroid/graphics/Matrix;",
            ">;"
        }
    .end annotation
.end field

.field private picture:Landroid/graphics/Picture;

.field rect:Landroid/graphics/RectF;

.field replaceColor:Ljava/lang/Integer;

.field searchColor:Ljava/lang/Integer;

.field strokePaint:Landroid/graphics/Paint;

.field strokePaintStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Landroid/graphics/Paint;",
            ">;"
        }
    .end annotation
.end field

.field strokeSet:Z

.field strokeSetStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private final tmpLimitRect:Landroid/graphics/RectF;

.field transformStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field whiteMode:Z


# direct methods
.method public constructor <init>()V
    .registers 7

    .prologue
    const/4 v5, 0x1

    const/high16 v4, 0x7f800000    # Float.POSITIVE_INFINITY

    const/high16 v3, -0x800000    # Float.NEGATIVE_INFINITY

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 832
    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    .line 804
    iput-boolean v1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokeSet:Z

    .line 805
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaintStack:Ljava/util/Stack;

    .line 806
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokeSetStack:Ljava/util/Stack;

    .line 809
    iput-boolean v1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillSet:Z

    .line 810
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaintStack:Ljava/util/Stack;

    .line 811
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillSetStack:Ljava/util/Stack;

    .line 814
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    .line 815
    iput-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->bounds:Landroid/graphics/RectF;

    .line 816
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, v4, v4, v3, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    .line 819
    iput-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->searchColor:Ljava/lang/Integer;

    .line 820
    iput-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->replaceColor:Ljava/lang/Integer;

    .line 822
    iput-boolean v1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->whiteMode:Z

    .line 826
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->transformStack:Ljava/util/Stack;

    .line 827
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->matrixStack:Ljava/util/Stack;

    .line 829
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradientMap:Ljava/util/HashMap;

    .line 830
    iput-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    .line 865
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradMatrix:Landroid/graphics/Matrix;

    .line 1108
    iput-boolean v1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hidden:Z

    .line 1109
    iput v1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hiddenLevel:I

    .line 1110
    iput-boolean v1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->boundsMode:Z

    .line 1127
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->tmpLimitRect:Landroid/graphics/RectF;

    .line 833
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    .line 834
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 835
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 836
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    .line 837
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 838
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 839
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->matrixStack:Ljava/util/Stack;

    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 840
    return-void
.end method

.method private doColor(Lcom/larvalabs/svgandroid/SVGParser$Properties;Ljava/lang/Integer;ZLandroid/graphics/Paint;)V
    .registers 9
    .param p1, "atts"    # Lcom/larvalabs/svgandroid/SVGParser$Properties;
    .param p2, "color"    # Ljava/lang/Integer;
    .param p3, "fillMode"    # Z
    .param p4, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 1040
    const v2, 0xffffff

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    and-int/2addr v2, v3

    const/high16 v3, -0x1000000

    or-int v0, v2, v3

    .line 1041
    .local v0, "c":I
    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->searchColor:Ljava/lang/Integer;

    if-eqz v2, :cond_1e

    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->searchColor:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-ne v2, v0, :cond_1e

    .line 1042
    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->replaceColor:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1044
    :cond_1e
    const/4 v2, 0x0

    invoke-virtual {p4, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 1045
    invoke-virtual {p4, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 1046
    const-string v2, "opacity"

    invoke-virtual {p1, v2}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v1

    .line 1047
    .local v1, "opacity":Ljava/lang/Float;
    if-nez v1, :cond_35

    .line 1048
    if-eqz p3, :cond_3d

    const-string v2, "fill-opacity"

    :goto_31
    invoke-virtual {p1, v2}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v1

    .line 1050
    :cond_35
    if-nez v1, :cond_40

    .line 1051
    const/16 v2, 0xff

    invoke-virtual {p4, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1055
    :goto_3c
    return-void

    .line 1048
    :cond_3d
    const-string v2, "stroke-opacity"

    goto :goto_31

    .line 1053
    :cond_40
    const/high16 v2, 0x437f0000    # 255.0f

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v3

    mul-float/2addr v2, v3

    float-to-int v2, v2

    invoke-virtual {p4, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_3c
.end method

.method private doFill(Lcom/larvalabs/svgandroid/SVGParser$Properties;Landroid/graphics/RectF;)Z
    .registers 14
    .param p1, "atts"    # Lcom/larvalabs/svgandroid/SVGParser$Properties;
    .param p2, "bounding_box"    # Landroid/graphics/RectF;

    .prologue
    const/4 v6, 0x0

    const/high16 v10, -0x1000000

    const/4 v9, 0x0

    const/4 v5, 0x1

    .line 868
    const-string v7, "none"

    const-string v8, "display"

    invoke-virtual {p1, v8}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_15

    move v5, v6

    .line 928
    :cond_14
    :goto_14
    return v5

    .line 871
    :cond_15
    iget-boolean v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->whiteMode:Z

    if-eqz v7, :cond_25

    .line 872
    iget-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 873
    iget-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_14

    .line 876
    :cond_25
    const-string v7, "fill"

    invoke-virtual {p1, v7}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 877
    .local v1, "fillString":Ljava/lang/String;
    if-eqz v1, :cond_f5

    .line 878
    const-string v7, "url(#"

    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_aa

    .line 881
    const-string v6, "url(#"

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v1, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 882
    .local v3, "id":Ljava/lang/String;
    iget-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradientMap:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    .line 883
    .local v2, "g":Lcom/larvalabs/svgandroid/SVGParser$Gradient;
    const/4 v4, 0x0

    .line 884
    .local v4, "shader":Landroid/graphics/Shader;
    if-eqz v2, :cond_52

    .line 885
    iget-object v4, v2, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->shader:Landroid/graphics/Shader;

    .line 887
    :cond_52
    if-eqz v4, :cond_82

    .line 889
    iget-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v6, v4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 890
    iget-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradMatrix:Landroid/graphics/Matrix;

    iget-object v7, v2, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->matrix:Landroid/graphics/Matrix;

    invoke-virtual {v6, v7}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    .line 891
    iget-boolean v6, v2, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->boundingBox:Z

    if-eqz v6, :cond_7c

    if-eqz p2, :cond_7c

    .line 893
    iget-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradMatrix:Landroid/graphics/Matrix;

    iget v7, p2, Landroid/graphics/RectF;->left:F

    iget v8, p2, Landroid/graphics/RectF;->top:F

    invoke-virtual {v6, v7, v8}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 894
    iget-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v7

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result v8

    invoke-virtual {v6, v7, v8}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 896
    :cond_7c
    iget-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v4, v6}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    goto :goto_14

    .line 899
    :cond_82
    const-string v6, "SVGAndroid"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Didn\'t find shader, using black: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 900
    iget-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 901
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-direct {p0, p1, v6, v5, v7}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doColor(Lcom/larvalabs/svgandroid/SVGParser$Properties;Ljava/lang/Integer;ZLandroid/graphics/Paint;)V

    goto/16 :goto_14

    .line 904
    .end local v2    # "g":Lcom/larvalabs/svgandroid/SVGParser$Gradient;
    .end local v3    # "id":Ljava/lang/String;
    .end local v4    # "shader":Landroid/graphics/Shader;
    :cond_aa
    const-string v7, "none"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_be

    .line 905
    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v7, v9}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 906
    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v7, v6}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_14

    .line 909
    :cond_be
    iget-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 910
    const-string v6, "fill"

    invoke-virtual {p1, v6}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 911
    .local v0, "color":Ljava/lang/Integer;
    if-eqz v0, :cond_d2

    .line 912
    iget-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-direct {p0, p1, v0, v5, v6}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doColor(Lcom/larvalabs/svgandroid/SVGParser$Properties;Ljava/lang/Integer;ZLandroid/graphics/Paint;)V

    goto/16 :goto_14

    .line 915
    :cond_d2
    const-string v6, "SVGAndroid"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unrecognized fill color, using black: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 916
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-direct {p0, p1, v6, v5, v7}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doColor(Lcom/larvalabs/svgandroid/SVGParser$Properties;Ljava/lang/Integer;ZLandroid/graphics/Paint;)V

    goto/16 :goto_14

    .line 921
    .end local v0    # "color":Ljava/lang/Integer;
    :cond_f5
    iget-boolean v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillSet:Z

    if-eqz v7, :cond_104

    .line 923
    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v7}, Landroid/graphics/Paint;->getColor()I

    move-result v7

    if-nez v7, :cond_14

    move v5, v6

    goto/16 :goto_14

    .line 926
    :cond_104
    iget-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 927
    iget-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v6, v10}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_14
.end method

.method private doGradient(ZLorg/xml/sax/Attributes;)Lcom/larvalabs/svgandroid/SVGParser$Gradient;
    .registers 12
    .param p1, "isLinear"    # Z
    .param p2, "atts"    # Lorg/xml/sax/Attributes;

    .prologue
    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 997
    new-instance v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    const/4 v5, 0x0

    invoke-direct {v0, v5}, Lcom/larvalabs/svgandroid/SVGParser$Gradient;-><init>(Lcom/larvalabs/svgandroid/SVGParser$1;)V

    .line 998
    .local v0, "gradient":Lcom/larvalabs/svgandroid/SVGParser$Gradient;
    const-string v5, "id"

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;
    invoke-static {v5, p2}, Lcom/larvalabs/svgandroid/SVGParser;->access$100(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->id:Ljava/lang/String;

    .line 999
    iput-boolean p1, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->isLinear:Z

    .line 1000
    if-eqz p1, :cond_a6

    .line 1001
    const-string v5, "x1"

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;
    invoke-static {v5, p2, v7}, Lcom/larvalabs/svgandroid/SVGParser;->access$400(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iput v5, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->x1:F

    .line 1002
    const-string v5, "x2"

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;
    invoke-static {v5, p2, v7}, Lcom/larvalabs/svgandroid/SVGParser;->access$400(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iput v5, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->x2:F

    .line 1003
    const-string v5, "y1"

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;
    invoke-static {v5, p2, v7}, Lcom/larvalabs/svgandroid/SVGParser;->access$400(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iput v5, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->y1:F

    .line 1004
    const-string v5, "y2"

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;
    invoke-static {v5, p2, v7}, Lcom/larvalabs/svgandroid/SVGParser;->access$400(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iput v5, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->y2:F

    .line 1010
    :goto_56
    const-string v5, "gradientTransform"

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;
    invoke-static {v5, p2}, Lcom/larvalabs/svgandroid/SVGParser;->access$100(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v2

    .line 1011
    .local v2, "transform":Ljava/lang/String;
    if-eqz v2, :cond_64

    .line 1012
    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->parseTransform(Ljava/lang/String;)Landroid/graphics/Matrix;
    invoke-static {v2}, Lcom/larvalabs/svgandroid/SVGParser;->access$500(Ljava/lang/String;)Landroid/graphics/Matrix;

    move-result-object v5

    iput-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->matrix:Landroid/graphics/Matrix;

    .line 1014
    :cond_64
    const-string v5, "spreadMethod"

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;
    invoke-static {v5, p2}, Lcom/larvalabs/svgandroid/SVGParser;->access$100(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v1

    .line 1015
    .local v1, "spreadMethod":Ljava/lang/String;
    if-nez v1, :cond_6e

    .line 1016
    const-string v1, "pad"

    .line 1019
    :cond_6e
    const-string v5, "reflect"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d7

    sget-object v5, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    :goto_78
    iput-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->tilemode:Landroid/graphics/Shader$TileMode;

    .line 1023
    const-string v5, "gradientUnits"

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;
    invoke-static {v5, p2}, Lcom/larvalabs/svgandroid/SVGParser;->access$100(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v3

    .line 1024
    .local v3, "unit":Ljava/lang/String;
    if-nez v3, :cond_84

    .line 1025
    const-string v3, "objectBoundingBox"

    .line 1027
    :cond_84
    const-string v5, "userSpaceOnUse"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_e5

    move v5, v6

    :goto_8d
    iput-boolean v5, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->boundingBox:Z

    .line 1029
    const-string v5, "href"

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;
    invoke-static {v5, p2}, Lcom/larvalabs/svgandroid/SVGParser;->access$100(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v4

    .line 1030
    .local v4, "xlink":Ljava/lang/String;
    if-eqz v4, :cond_a5

    .line 1031
    const-string v5, "#"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_a3

    .line 1032
    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 1034
    :cond_a3
    iput-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->xlink:Ljava/lang/String;

    .line 1036
    :cond_a5
    return-object v0

    .line 1006
    .end local v1    # "spreadMethod":Ljava/lang/String;
    .end local v2    # "transform":Ljava/lang/String;
    .end local v3    # "unit":Ljava/lang/String;
    .end local v4    # "xlink":Ljava/lang/String;
    :cond_a6
    const-string v5, "cx"

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;
    invoke-static {v5, p2, v7}, Lcom/larvalabs/svgandroid/SVGParser;->access$400(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iput v5, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->x:F

    .line 1007
    const-string v5, "cy"

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;
    invoke-static {v5, p2, v7}, Lcom/larvalabs/svgandroid/SVGParser;->access$400(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iput v5, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->y:F

    .line 1008
    const-string v5, "r"

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;
    invoke-static {v5, p2, v7}, Lcom/larvalabs/svgandroid/SVGParser;->access$400(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    iput v5, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->radius:F

    goto :goto_56

    .line 1019
    .restart local v1    # "spreadMethod":Ljava/lang/String;
    .restart local v2    # "transform":Ljava/lang/String;
    :cond_d7
    const-string v5, "repeat"

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_e2

    sget-object v5, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    goto :goto_78

    :cond_e2
    sget-object v5, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    goto :goto_78

    .line 1027
    .restart local v3    # "unit":Ljava/lang/String;
    :cond_e5
    const/4 v5, 0x0

    goto :goto_8d
.end method

.method private doLimits(Landroid/graphics/RectF;)V
    .registers 3
    .param p1, "box"    # Landroid/graphics/RectF;

    .prologue
    .line 1138
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doLimits(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 1139
    return-void
.end method

.method private doLimits(Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .registers 7
    .param p1, "box"    # Landroid/graphics/RectF;
    .param p2, "paint"    # Landroid/graphics/Paint;

    .prologue
    .line 1130
    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->matrixStack:Ljava/util/Stack;

    invoke-virtual {v2}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Matrix;

    .line 1131
    .local v0, "m":Landroid/graphics/Matrix;
    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->tmpLimitRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v2, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    .line 1132
    if-nez p2, :cond_2b

    const/4 v1, 0x0

    .line 1133
    .local v1, "width2":F
    :goto_10
    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->tmpLimitRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v2, v1

    iget-object v3, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->tmpLimitRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    sub-float/2addr v3, v1

    invoke-direct {p0, v2, v3}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doLimits2(FF)V

    .line 1134
    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->tmpLimitRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    add-float/2addr v2, v1

    iget-object v3, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->tmpLimitRect:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v3, v1

    invoke-direct {p0, v2, v3}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doLimits2(FF)V

    .line 1135
    return-void

    .line 1132
    .end local v1    # "width2":F
    :cond_2b
    invoke-virtual {p2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float v1, v2, v3

    goto :goto_10
.end method

.method private doLimits2(FF)V
    .registers 4
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 1113
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_c

    .line 1114
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    iput p1, v0, Landroid/graphics/RectF;->left:F

    .line 1116
    :cond_c
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_18

    .line 1117
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    iput p1, v0, Landroid/graphics/RectF;->right:F

    .line 1119
    :cond_18
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    cmpg-float v0, p2, v0

    if-gez v0, :cond_24

    .line 1120
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    iput p2, v0, Landroid/graphics/RectF;->top:F

    .line 1122
    :cond_24
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    cmpl-float v0, p2, v0

    if-lez v0, :cond_30

    .line 1123
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    iput p2, v0, Landroid/graphics/RectF;->bottom:F

    .line 1125
    :cond_30
    return-void
.end method

.method private doStroke(Lcom/larvalabs/svgandroid/SVGParser$Properties;)Z
    .registers 11
    .param p1, "atts"    # Lcom/larvalabs/svgandroid/SVGParser$Properties;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 934
    iget-boolean v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->whiteMode:Z

    if-eqz v7, :cond_7

    .line 991
    :cond_6
    :goto_6
    return v6

    .line 938
    :cond_7
    const-string v7, "none"

    const-string v8, "display"

    invoke-virtual {p1, v8}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 943
    const-string v7, "stroke-width"

    invoke-virtual {p1, v7}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getFloat(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v4

    .line 944
    .local v4, "width":Ljava/lang/Float;
    if-eqz v4, :cond_26

    .line 945
    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v8

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 948
    :cond_26
    const-string v7, "stroke-linecap"

    invoke-virtual {p1, v7}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 949
    .local v1, "linecap":Ljava/lang/String;
    const-string v7, "round"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_75

    .line 950
    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 957
    :cond_3b
    :goto_3b
    const-string v7, "stroke-linejoin"

    invoke-virtual {p1, v7}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 958
    .local v2, "linejoin":Ljava/lang/String;
    const-string v7, "miter"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_95

    .line 959
    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 966
    :cond_50
    :goto_50
    const-string v7, "stroke-dasharray"

    invoke-virtual {p1, v7}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "stroke-dashoffset"

    invoke-virtual {p1, v8}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v7, v8}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->pathStyleHelper(Ljava/lang/String;Ljava/lang/String;)V

    .line 968
    const-string v7, "stroke"

    invoke-virtual {p1, v7}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getAttr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 969
    .local v3, "strokeString":Ljava/lang/String;
    if-eqz v3, :cond_e4

    .line 970
    const-string v7, "none"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_b5

    .line 971
    iget-object v5, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_6

    .line 951
    .end local v2    # "linejoin":Ljava/lang/String;
    .end local v3    # "strokeString":Ljava/lang/String;
    :cond_75
    const-string v7, "square"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_85

    .line 952
    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    goto :goto_3b

    .line 953
    :cond_85
    const-string v7, "butt"

    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3b

    .line 954
    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    goto :goto_3b

    .line 960
    .restart local v2    # "linejoin":Ljava/lang/String;
    :cond_95
    const-string v7, "round"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a5

    .line 961
    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    goto :goto_50

    .line 962
    :cond_a5
    const-string v7, "bevel"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_50

    .line 963
    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    sget-object v8, Landroid/graphics/Paint$Join;->BEVEL:Landroid/graphics/Paint$Join;

    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    goto :goto_50

    .line 974
    .restart local v3    # "strokeString":Ljava/lang/String;
    :cond_b5
    const-string v7, "stroke"

    invoke-virtual {p1, v7}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    .line 975
    .local v0, "color":Ljava/lang/Integer;
    if-eqz v0, :cond_c5

    .line 976
    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    invoke-direct {p0, p1, v0, v6, v7}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doColor(Lcom/larvalabs/svgandroid/SVGParser$Properties;Ljava/lang/Integer;ZLandroid/graphics/Paint;)V

    move v6, v5

    .line 977
    goto/16 :goto_6

    .line 979
    :cond_c5
    const-string v5, "SVGAndroid"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unrecognized stroke color, using none: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 980
    iget-object v5, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_6

    .line 985
    .end local v0    # "color":Ljava/lang/Integer;
    :cond_e4
    iget-boolean v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokeSet:Z

    if-eqz v7, :cond_f5

    .line 987
    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v7}, Landroid/graphics/Paint;->getColor()I

    move-result v7

    if-eqz v7, :cond_f3

    :goto_f0
    move v6, v5

    goto/16 :goto_6

    :cond_f3
    move v5, v6

    goto :goto_f0

    .line 990
    :cond_f5
    iget-object v5, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_6
.end method

.method private pathStyleHelper(Ljava/lang/String;Ljava/lang/String;)V
    .registers 14
    .param p1, "style"    # Ljava/lang/String;
    .param p2, "offset"    # Ljava/lang/String;

    .prologue
    .line 1061
    if-nez p1, :cond_3

    .line 1096
    :goto_2
    return-void

    .line 1065
    :cond_3
    const-string v9, "none"

    invoke-virtual {p1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_12

    .line 1066
    iget-object v9, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    goto :goto_2

    .line 1070
    :cond_12
    new-instance v7, Ljava/util/StringTokenizer;

    const-string v9, " ,"

    invoke-direct {v7, p1, v9}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1071
    .local v7, "st":Ljava/util/StringTokenizer;
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v0

    .line 1072
    .local v0, "count":I
    and-int/lit8 v9, v0, 0x1

    const/4 v10, 0x1

    if-ne v9, v10, :cond_24

    mul-int/lit8 v0, v0, 0x2

    .end local v0    # "count":I
    :cond_24
    new-array v4, v0, [F

    .line 1073
    .local v4, "intervals":[F
    const/4 v5, 0x0

    .line 1074
    .local v5, "max":F
    const/high16 v1, 0x3f800000    # 1.0f

    .line 1075
    .local v1, "current":F
    const/4 v2, 0x0

    .line 1076
    .local v2, "i":I
    :goto_2a
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v9

    if-eqz v9, :cond_3f

    .line 1077
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->toFloat(Ljava/lang/String;F)F

    move-result v1

    aput v1, v4, v2

    .line 1078
    add-float/2addr v5, v1

    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_2a

    .line 1082
    :cond_3f
    const/4 v8, 0x0

    .local v8, "start":I
    :goto_40
    array-length v9, v4

    if-ge v2, v9, :cond_4d

    .line 1083
    aget v9, v4, v8

    aput v9, v4, v2

    add-float/2addr v5, v9

    .line 1082
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v8, v8, 0x1

    goto :goto_40

    .line 1086
    :cond_4d
    const/4 v6, 0x0

    .line 1087
    .local v6, "off":F
    if-eqz p2, :cond_56

    .line 1089
    :try_start_50
    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_53
    .catch Ljava/lang/NumberFormatException; {:try_start_50 .. :try_end_53} :catch_61

    move-result v9

    rem-float v6, v9, v5

    .line 1095
    :cond_56
    :goto_56
    iget-object v9, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    new-instance v10, Landroid/graphics/DashPathEffect;

    invoke-direct {v10, v4, v6}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    invoke-virtual {v9, v10}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    goto :goto_2

    .line 1090
    :catch_61
    move-exception v9

    goto :goto_56
.end method

.method private popTransform()V
    .registers 2

    .prologue
    .line 1156
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->transformStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_18

    .line 1157
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    .line 1158
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->matrixStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 1160
    :cond_18
    return-void
.end method

.method private pushTransform(Lorg/xml/sax/Attributes;)V
    .registers 7
    .param p1, "atts"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 1142
    const-string v3, "transform"

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;
    invoke-static {v3, p1}, Lcom/larvalabs/svgandroid/SVGParser;->access$100(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v2

    .line 1143
    .local v2, "transform":Ljava/lang/String;
    if-eqz v2, :cond_33

    const/4 v1, 0x1

    .line 1144
    .local v1, "pushed":Z
    :goto_9
    iget-object v3, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->transformStack:Ljava/util/Stack;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1145
    if-eqz v1, :cond_32

    .line 1146
    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->parseTransform(Ljava/lang/String;)Landroid/graphics/Matrix;
    invoke-static {v2}, Lcom/larvalabs/svgandroid/SVGParser;->access$500(Ljava/lang/String;)Landroid/graphics/Matrix;

    move-result-object v0

    .line 1147
    .local v0, "matrix":Landroid/graphics/Matrix;
    iget-object v3, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v3}, Landroid/graphics/Canvas;->save()I

    .line 1148
    iget-object v3, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v3, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 1149
    iget-object v3, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->matrixStack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/Matrix;

    invoke-virtual {v0, v3}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 1150
    iget-object v3, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->matrixStack:Ljava/util/Stack;

    invoke-virtual {v3, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1153
    .end local v0    # "matrix":Landroid/graphics/Matrix;
    :cond_32
    return-void

    .line 1143
    .end local v1    # "pushed":Z
    :cond_33
    const/4 v1, 0x0

    goto :goto_9
.end method

.method private static toFloat(Ljava/lang/String;F)F
    .registers 4
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "dflt"    # F

    .prologue
    .line 1099
    move v0, p1

    .line 1101
    .local v0, "result":F
    :try_start_1
    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_4} :catch_6

    move-result v0

    .line 1105
    :goto_5
    return v0

    .line 1102
    :catch_6
    move-exception v1

    goto :goto_5
.end method


# virtual methods
.method public characters([CII)V
    .registers 4
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "length"    # I

    .prologue
    .line 1389
    return-void
.end method

.method public endDocument()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 863
    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 15
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1393
    const-string v0, "svg"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5a

    .line 1394
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvasRestoreCount:Ljava/lang/Integer;

    if-eqz v0, :cond_18

    .line 1395
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvasRestoreCount:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 1397
    :cond_18
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limitsAdjustmentX:Ljava/lang/Float;

    if-eqz v0, :cond_36

    .line 1398
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limitsAdjustmentX:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 1399
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->right:F

    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limitsAdjustmentX:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 1401
    :cond_36
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limitsAdjustmentY:Ljava/lang/Float;

    if-eqz v0, :cond_54

    .line 1402
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->top:F

    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limitsAdjustmentY:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 1403
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limits:Landroid/graphics/RectF;

    iget v1, v0, Landroid/graphics/RectF;->bottom:F

    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limitsAdjustmentY:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 1405
    :cond_54
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->picture:Landroid/graphics/Picture;

    invoke-virtual {v0}, Landroid/graphics/Picture;->endRecording()V

    .line 1458
    :cond_59
    :goto_59
    return-void

    .line 1407
    :cond_5a
    const-string v0, "linearGradient"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6a

    const-string v0, "radialGradient"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_124

    .line 1408
    :cond_6a
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget-object v0, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->id:Ljava/lang/String;

    if-eqz v0, :cond_59

    .line 1409
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget-object v0, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->xlink:Ljava/lang/String;

    if-eqz v0, :cond_8c

    .line 1410
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradientMap:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget-object v1, v1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->xlink:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    .line 1411
    .local v9, "parent":Lcom/larvalabs/svgandroid/SVGParser$Gradient;
    if-eqz v9, :cond_8c

    .line 1412
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    invoke-virtual {v9, v0}, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->createChild(Lcom/larvalabs/svgandroid/SVGParser$Gradient;)Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    move-result-object v0

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    .line 1415
    .end local v9    # "parent":Lcom/larvalabs/svgandroid/SVGParser$Gradient;
    :cond_8c
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget-object v0, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->colors:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v5, v0, [I

    .line 1416
    .local v5, "colors":[I
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_97
    array-length v0, v5

    if-ge v8, v0, :cond_ad

    .line 1417
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget-object v0, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->colors:Ljava/util/ArrayList;

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    aput v0, v5, v8

    .line 1416
    add-int/lit8 v8, v8, 0x1

    goto :goto_97

    .line 1419
    :cond_ad
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget-object v0, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->positions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v6, v0, [F

    .line 1420
    .local v6, "positions":[F
    const/4 v8, 0x0

    :goto_b8
    array-length v0, v6

    if-ge v8, v0, :cond_ce

    .line 1421
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget-object v0, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->positions:Ljava/util/ArrayList;

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    aput v0, v6, v8

    .line 1420
    add-int/lit8 v8, v8, 0x1

    goto :goto_b8

    .line 1423
    :cond_ce
    array-length v0, v5

    if-nez v0, :cond_d8

    .line 1424
    const-string v0, "BAD"

    const-string v1, "BAD"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1426
    :cond_d8
    const-string v0, "linearGradient"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10a

    .line 1427
    iget-object v10, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    new-instance v0, Landroid/graphics/LinearGradient;

    iget-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget v1, v1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->x1:F

    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget v2, v2, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->y1:F

    iget-object v3, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget v3, v3, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->x2:F

    iget-object v4, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget v4, v4, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->y2:F

    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget-object v7, v7, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->tilemode:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v0, v10, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->shader:Landroid/graphics/Shader;

    .line 1436
    :goto_fd
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradientMap:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget-object v1, v1, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->id:Ljava/lang/String;

    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_59

    .line 1432
    :cond_10a
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    new-instance v1, Landroid/graphics/RadialGradient;

    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget v2, v2, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->x:F

    iget-object v3, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget v3, v3, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->y:F

    iget-object v4, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget v4, v4, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->radius:F

    iget-object v7, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget-object v7, v7, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->tilemode:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v1 .. v7}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    iput-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->shader:Landroid/graphics/Shader;

    goto :goto_fd

    .line 1438
    .end local v5    # "colors":[I
    .end local v6    # "positions":[F
    .end local v8    # "i":I
    :cond_124
    const-string v0, "g"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_59

    .line 1439
    iget-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->boundsMode:Z

    if-eqz v0, :cond_132

    .line 1440
    iput-boolean v1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->boundsMode:Z

    .line 1443
    :cond_132
    iget-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hidden:Z

    if-eqz v0, :cond_142

    .line 1444
    iget v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hiddenLevel:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hiddenLevel:I

    .line 1446
    iget v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hiddenLevel:I

    if-nez v0, :cond_142

    .line 1447
    iput-boolean v1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hidden:Z

    .line 1452
    :cond_142
    invoke-direct {p0}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->popTransform()V

    .line 1453
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaintStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Paint;

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    .line 1454
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillSetStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillSet:Z

    .line 1455
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaintStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Paint;

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    .line 1456
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokeSetStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokeSet:Z

    goto/16 :goto_59
.end method

.method public setColorSwap(Ljava/lang/Integer;Ljava/lang/Integer;)V
    .registers 3
    .param p1, "searchColor"    # Ljava/lang/Integer;
    .param p2, "replaceColor"    # Ljava/lang/Integer;

    .prologue
    .line 847
    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->searchColor:Ljava/lang/Integer;

    .line 848
    iput-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->replaceColor:Ljava/lang/Integer;

    .line 849
    return-void
.end method

.method setPicture(Landroid/graphics/Picture;)V
    .registers 2
    .param p1, "picture"    # Landroid/graphics/Picture;

    .prologue
    .line 843
    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->picture:Landroid/graphics/Picture;

    .line 844
    return-void
.end method

.method public setWhiteMode(Z)V
    .registers 2
    .param p1, "whiteMode"    # Z

    .prologue
    .line 852
    iput-boolean p1, p0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->whiteMode:Z

    .line 853
    return-void
.end method

.method public startDocument()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 858
    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 39
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "atts"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 1166
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    const/16 v4, 0xff

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1167
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    const/16 v4, 0xff

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 1169
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->boundsMode:Z

    if-eqz v3, :cond_74

    .line 1170
    const-string v3, "rect"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_73

    .line 1171
    const-string v3, "x"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v28

    .line 1172
    .local v28, "x":Ljava/lang/Float;
    if-nez v28, :cond_31

    .line 1173
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v28

    .line 1175
    :cond_31
    const-string v3, "y"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v31

    .line 1176
    .local v31, "y":Ljava/lang/Float;
    if-nez v31, :cond_40

    .line 1177
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v31

    .line 1179
    :cond_40
    const-string v3, "width"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v27

    .line 1180
    .local v27, "width":Ljava/lang/Float;
    const-string v3, "height"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v15

    .line 1181
    .local v15, "height":Ljava/lang/Float;
    new-instance v3, Landroid/graphics/RectF;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual/range {v27 .. v27}, Ljava/lang/Float;->floatValue()F

    move-result v7

    add-float/2addr v6, v7

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v15}, Ljava/lang/Float;->floatValue()F

    move-result v8

    add-float/2addr v7, v8

    invoke-direct {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->bounds:Landroid/graphics/RectF;

    .line 1384
    .end local v15    # "height":Ljava/lang/Float;
    .end local v27    # "width":Ljava/lang/Float;
    .end local v28    # "x":Ljava/lang/Float;
    .end local v31    # "y":Ljava/lang/Float;
    :cond_73
    :goto_73
    return-void

    .line 1185
    :cond_74
    const-string v3, "svg"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_176

    .line 1186
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    .line 1187
    const-string v3, "viewBox"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$100(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v26

    .line 1188
    .local v26, "viewboxStr":Ljava/lang/String;
    if-eqz v26, :cond_137

    .line 1189
    const-string v3, "\\s+"

    move-object/from16 v0, v26

    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    .line 1190
    .local v14, "dims":[Ljava/lang/String;
    array-length v3, v14

    const/4 v4, 0x4

    if-ne v3, v4, :cond_137

    .line 1191
    const/4 v3, 0x0

    aget-object v3, v14, v3

    const/4 v4, 0x0

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->parseFloatValue(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;
    invoke-static {v3, v4}, Lcom/larvalabs/svgandroid/SVGParser;->access$700(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v29

    .line 1192
    .local v29, "x1":Ljava/lang/Float;
    const/4 v3, 0x1

    aget-object v3, v14, v3

    const/4 v4, 0x0

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->parseFloatValue(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;
    invoke-static {v3, v4}, Lcom/larvalabs/svgandroid/SVGParser;->access$700(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v32

    .line 1193
    .local v32, "y1":Ljava/lang/Float;
    const/4 v3, 0x2

    aget-object v3, v14, v3

    const/4 v4, 0x0

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->parseFloatValue(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;
    invoke-static {v3, v4}, Lcom/larvalabs/svgandroid/SVGParser;->access$700(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v30

    .line 1194
    .local v30, "x2":Ljava/lang/Float;
    const/4 v3, 0x3

    aget-object v3, v14, v3

    const/4 v4, 0x0

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->parseFloatValue(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;
    invoke-static {v3, v4}, Lcom/larvalabs/svgandroid/SVGParser;->access$700(Ljava/lang/String;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v33

    .line 1195
    .local v33, "y2":Ljava/lang/Float;
    if-eqz v29, :cond_137

    if-eqz v30, :cond_137

    if-eqz v32, :cond_137

    if-eqz v33, :cond_137

    .line 1196
    invoke-virtual/range {v30 .. v30}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual/range {v29 .. v29}, Ljava/lang/Float;->floatValue()F

    move-result v4

    sub-float/2addr v3, v4

    invoke-static {v3}, Landroid/util/FloatMath;->ceil(F)F

    move-result v27

    .line 1197
    .local v27, "width":F
    invoke-virtual/range {v33 .. v33}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Float;->floatValue()F

    move-result v4

    sub-float/2addr v3, v4

    invoke-static {v3}, Landroid/util/FloatMath;->ceil(F)F

    move-result v15

    .line 1198
    .local v15, "height":F
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->picture:Landroid/graphics/Picture;

    move/from16 v0, v27

    float-to-int v4, v0

    float-to-int v5, v15

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Picture;->beginRecording(II)Landroid/graphics/Canvas;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    .line 1199
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    invoke-virtual {v3}, Landroid/graphics/Canvas;->save()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvasRestoreCount:Ljava/lang/Integer;

    .line 1200
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move/from16 v0, v27

    invoke-virtual {v3, v4, v5, v0, v15}, Landroid/graphics/Canvas;->clipRect(FFFF)Z

    .line 1201
    invoke-virtual/range {v29 .. v29}, Ljava/lang/Float;->floatValue()F

    move-result v3

    neg-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limitsAdjustmentX:Ljava/lang/Float;

    .line 1202
    invoke-virtual/range {v32 .. v32}, Ljava/lang/Float;->floatValue()F

    move-result v3

    neg-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limitsAdjustmentY:Ljava/lang/Float;

    .line 1203
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limitsAdjustmentX:Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->limitsAdjustmentY:Ljava/lang/Float;

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 1208
    .end local v14    # "dims":[Ljava/lang/String;
    .end local v15    # "height":F
    .end local v27    # "width":F
    .end local v29    # "x1":Ljava/lang/Float;
    .end local v30    # "x2":Ljava/lang/Float;
    .end local v32    # "y1":Ljava/lang/Float;
    .end local v33    # "y2":Ljava/lang/Float;
    :cond_137
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    if-nez v3, :cond_73

    .line 1209
    const-string v3, "width"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-static {v3}, Landroid/util/FloatMath;->ceil(F)F

    move-result v3

    float-to-int v0, v3

    move/from16 v27, v0

    .line 1210
    .local v27, "width":I
    const-string v3, "height"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-static {v3}, Landroid/util/FloatMath;->ceil(F)F

    move-result v3

    float-to-int v15, v3

    .line 1211
    .local v15, "height":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->picture:Landroid/graphics/Picture;

    move/from16 v0, v27

    invoke-virtual {v3, v0, v15}, Landroid/graphics/Picture;->beginRecording(II)Landroid/graphics/Canvas;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    .line 1212
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvasRestoreCount:Ljava/lang/Integer;

    goto/16 :goto_73

    .line 1215
    .end local v15    # "height":I
    .end local v26    # "viewboxStr":Ljava/lang/String;
    .end local v27    # "width":I
    :cond_176
    const-string v3, "defs"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_73

    .line 1217
    const-string v3, "linearGradient"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_199

    .line 1218
    const/4 v3, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v3, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doGradient(ZLorg/xml/sax/Attributes;)Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    goto/16 :goto_73

    .line 1219
    :cond_199
    const-string v3, "radialGradient"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b2

    .line 1220
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v3, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doGradient(ZLorg/xml/sax/Attributes;)Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    goto/16 :goto_73

    .line 1221
    :cond_1b2
    const-string v3, "stop"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_219

    .line 1222
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    if-eqz v3, :cond_73

    .line 1223
    new-instance v21, Lcom/larvalabs/svgandroid/SVGParser$Properties;

    const/4 v3, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p4

    invoke-direct {v0, v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$Properties;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    .line 1224
    .local v21, "props":Lcom/larvalabs/svgandroid/SVGParser$Properties;
    const-string v3, "offset"

    const/4 v4, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v3, v4}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getFloat(Ljava/lang/String;F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v18

    .line 1225
    .local v18, "offset":F
    const-string v3, "stop-color"

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getColor(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v13

    .line 1226
    .local v13, "color":I
    const-string v3, "stop-opacity"

    const/high16 v4, 0x3f800000    # 1.0f

    move-object/from16 v0, v21

    invoke-virtual {v0, v3, v4}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getFloat(Ljava/lang/String;F)Ljava/lang/Float;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v9

    .line 1227
    .local v9, "alpha":F
    const/high16 v3, 0x437f0000    # 255.0f

    mul-float/2addr v3, v9

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v10

    .line 1228
    .local v10, "alphaInt":I
    shl-int/lit8 v3, v10, 0x18

    or-int/2addr v13, v3

    .line 1229
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget-object v3, v3, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->positions:Ljava/util/ArrayList;

    invoke-static/range {v18 .. v18}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1230
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->gradient:Lcom/larvalabs/svgandroid/SVGParser$Gradient;

    iget-object v3, v3, Lcom/larvalabs/svgandroid/SVGParser$Gradient;->colors:Ljava/util/ArrayList;

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_73

    .line 1232
    .end local v9    # "alpha":F
    .end local v10    # "alphaInt":I
    .end local v13    # "color":I
    .end local v18    # "offset":F
    .end local v21    # "props":Lcom/larvalabs/svgandroid/SVGParser$Properties;
    :cond_219
    const-string v3, "g"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2f4

    .line 1234
    const-string v3, "bounds"

    const-string v4, "id"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;
    invoke-static {v4, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$100(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_238

    .line 1235
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->boundsMode:Z

    .line 1237
    :cond_238
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hidden:Z

    if-eqz v3, :cond_248

    .line 1238
    move-object/from16 v0, p0

    iget v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hiddenLevel:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hiddenLevel:I

    .line 1242
    :cond_248
    const-string v3, "none"

    const-string v4, "display"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;
    invoke-static {v4, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$100(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_268

    .line 1243
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hidden:Z

    if-nez v3, :cond_268

    .line 1244
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hidden:Z

    .line 1245
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hiddenLevel:I

    .line 1249
    :cond_268
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->pushTransform(Lorg/xml/sax/Attributes;)V

    .line 1250
    new-instance v21, Lcom/larvalabs/svgandroid/SVGParser$Properties;

    const/4 v3, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p4

    invoke-direct {v0, v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$Properties;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    .line 1252
    .restart local v21    # "props":Lcom/larvalabs/svgandroid/SVGParser$Properties;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaintStack:Ljava/util/Stack;

    new-instance v4, Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-direct {v4, v5}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    invoke-virtual {v3, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1253
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaintStack:Ljava/util/Stack;

    new-instance v4, Landroid/graphics/Paint;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    invoke-direct {v4, v5}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    invoke-virtual {v3, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1254
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillSetStack:Ljava/util/Stack;

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillSet:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1255
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokeSetStack:Ljava/util/Stack;

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokeSet:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1257
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doFill(Lcom/larvalabs/svgandroid/SVGParser$Properties;Landroid/graphics/RectF;)Z

    .line 1258
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doStroke(Lcom/larvalabs/svgandroid/SVGParser$Properties;)Z

    .line 1260
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillSet:Z

    const-string v3, "fill"

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2f0

    const/4 v3, 0x1

    :goto_2d5
    or-int/2addr v3, v4

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillSet:Z

    .line 1261
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokeSet:Z

    const-string v3, "stroke"

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Lcom/larvalabs/svgandroid/SVGParser$Properties;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2f2

    const/4 v3, 0x1

    :goto_2e9
    or-int/2addr v3, v4

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokeSet:Z

    goto/16 :goto_73

    .line 1260
    :cond_2f0
    const/4 v3, 0x0

    goto :goto_2d5

    .line 1261
    :cond_2f2
    const/4 v3, 0x0

    goto :goto_2e9

    .line 1263
    .end local v21    # "props":Lcom/larvalabs/svgandroid/SVGParser$Properties;
    :cond_2f4
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hidden:Z

    if-nez v3, :cond_465

    const-string v3, "rect"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_465

    .line 1264
    const-string v3, "x"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v28

    .line 1265
    .restart local v28    # "x":Ljava/lang/Float;
    if-nez v28, :cond_313

    .line 1266
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v28

    .line 1268
    :cond_313
    const-string v3, "y"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v31

    .line 1269
    .restart local v31    # "y":Ljava/lang/Float;
    if-nez v31, :cond_322

    .line 1270
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v31

    .line 1272
    :cond_322
    const-string v3, "width"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v27

    .line 1273
    .local v27, "width":Ljava/lang/Float;
    const-string v3, "height"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v15

    .line 1274
    .local v15, "height":Ljava/lang/Float;
    const-string v3, "rx"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;
    invoke-static {v3, v0, v4}, Lcom/larvalabs/svgandroid/SVGParser;->access$400(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v24

    .line 1275
    .local v24, "rx":Ljava/lang/Float;
    const-string v3, "ry"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;
    invoke-static {v3, v0, v4}, Lcom/larvalabs/svgandroid/SVGParser;->access$400(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object v25

    .line 1276
    .local v25, "ry":Ljava/lang/Float;
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->pushTransform(Lorg/xml/sax/Attributes;)V

    .line 1277
    new-instance v21, Lcom/larvalabs/svgandroid/SVGParser$Properties;

    const/4 v3, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p4

    invoke-direct {v0, v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$Properties;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    .line 1278
    .restart local v21    # "props":Lcom/larvalabs/svgandroid/SVGParser$Properties;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual/range {v27 .. v27}, Ljava/lang/Float;->floatValue()F

    move-result v7

    add-float/2addr v6, v7

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v15}, Ljava/lang/Float;->floatValue()F

    move-result v8

    add-float/2addr v7, v8

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1279
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doFill(Lcom/larvalabs/svgandroid/SVGParser$Properties;Landroid/graphics/RectF;)Z

    move-result v3

    if-eqz v3, :cond_3d7

    .line 1280
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual/range {v27 .. v27}, Ljava/lang/Float;->floatValue()F

    move-result v7

    add-float/2addr v6, v7

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v15}, Ljava/lang/Float;->floatValue()F

    move-result v8

    add-float/2addr v7, v8

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1281
    invoke-virtual/range {v24 .. v24}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/4 v4, 0x0

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_435

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/4 v4, 0x0

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_435

    .line 1282
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 1286
    :goto_3ce
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doLimits(Landroid/graphics/RectF;)V

    .line 1288
    :cond_3d7
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doStroke(Lcom/larvalabs/svgandroid/SVGParser$Properties;)Z

    move-result v3

    if-eqz v3, :cond_430

    .line 1289
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual/range {v27 .. v27}, Ljava/lang/Float;->floatValue()F

    move-result v7

    add-float/2addr v6, v7

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v15}, Ljava/lang/Float;->floatValue()F

    move-result v8

    add-float/2addr v7, v8

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1290
    invoke-virtual/range {v24 .. v24}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/4 v4, 0x0

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_44d

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Float;->floatValue()F

    move-result v3

    const/4 v4, 0x0

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_44d

    .line 1291
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 1295
    :goto_423
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doLimits(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 1297
    :cond_430
    invoke-direct/range {p0 .. p0}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->popTransform()V

    goto/16 :goto_73

    .line 1284
    :cond_435
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Float;->floatValue()F

    move-result v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_3ce

    .line 1293
    :cond_44d
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Float;->floatValue()F

    move-result v6

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_423

    .line 1298
    .end local v15    # "height":Ljava/lang/Float;
    .end local v21    # "props":Lcom/larvalabs/svgandroid/SVGParser$Properties;
    .end local v24    # "rx":Ljava/lang/Float;
    .end local v25    # "ry":Ljava/lang/Float;
    .end local v27    # "width":Ljava/lang/Float;
    .end local v28    # "x":Ljava/lang/Float;
    .end local v31    # "y":Ljava/lang/Float;
    :cond_465
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hidden:Z

    if-nez v3, :cond_4f4

    const-string v3, "line"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4f4

    .line 1299
    const-string v3, "x1"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v29

    .line 1300
    .restart local v29    # "x1":Ljava/lang/Float;
    const-string v3, "x2"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v30

    .line 1301
    .restart local v30    # "x2":Ljava/lang/Float;
    const-string v3, "y1"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v32

    .line 1302
    .restart local v32    # "y1":Ljava/lang/Float;
    const-string v3, "y2"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v33

    .line 1303
    .restart local v33    # "y2":Ljava/lang/Float;
    new-instance v21, Lcom/larvalabs/svgandroid/SVGParser$Properties;

    const/4 v3, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p4

    invoke-direct {v0, v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$Properties;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    .line 1304
    .restart local v21    # "props":Lcom/larvalabs/svgandroid/SVGParser$Properties;
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doStroke(Lcom/larvalabs/svgandroid/SVGParser$Properties;)Z

    move-result v3

    if-eqz v3, :cond_73

    .line 1305
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->pushTransform(Lorg/xml/sax/Attributes;)V

    .line 1306
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    invoke-virtual/range {v29 .. v29}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual/range {v33 .. v33}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1307
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    invoke-virtual/range {v29 .. v29}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual/range {v32 .. v32}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual/range {v30 .. v30}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual/range {v33 .. v33}, Ljava/lang/Float;->floatValue()F

    move-result v7

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 1308
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doLimits(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 1309
    invoke-direct/range {p0 .. p0}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->popTransform()V

    goto/16 :goto_73

    .line 1311
    .end local v21    # "props":Lcom/larvalabs/svgandroid/SVGParser$Properties;
    .end local v29    # "x1":Ljava/lang/Float;
    .end local v30    # "x2":Ljava/lang/Float;
    .end local v32    # "y1":Ljava/lang/Float;
    .end local v33    # "y2":Ljava/lang/Float;
    :cond_4f4
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hidden:Z

    if-nez v3, :cond_5d9

    const-string v3, "circle"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_50e

    const-string v3, "ellipse"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5d9

    .line 1314
    :cond_50e
    const-string v3, "cx"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v11

    .line 1315
    .local v11, "centerX":Ljava/lang/Float;
    const-string v3, "cy"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v12

    .line 1316
    .local v12, "centerY":Ljava/lang/Float;
    const-string v3, "ellipse"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5cd

    .line 1317
    const-string v3, "rx"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v22

    .line 1318
    .local v22, "radiusX":Ljava/lang/Float;
    const-string v3, "ry"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v23

    .line 1323
    .local v23, "radiusY":Ljava/lang/Float;
    :goto_538
    if-eqz v11, :cond_73

    if-eqz v12, :cond_73

    if-eqz v22, :cond_73

    if-eqz v23, :cond_73

    .line 1324
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->pushTransform(Lorg/xml/sax/Attributes;)V

    .line 1325
    new-instance v21, Lcom/larvalabs/svgandroid/SVGParser$Properties;

    const/4 v3, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p4

    invoke-direct {v0, v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$Properties;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    .line 1326
    .restart local v21    # "props":Lcom/larvalabs/svgandroid/SVGParser$Properties;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Float;->floatValue()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Float;->floatValue()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-virtual {v11}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Float;->floatValue()F

    move-result v7

    add-float/2addr v6, v7

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Float;->floatValue()F

    move-result v8

    add-float/2addr v7, v8

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 1327
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doFill(Lcom/larvalabs/svgandroid/SVGParser$Properties;Landroid/graphics/RectF;)Z

    move-result v3

    if-eqz v3, :cond_5a2

    .line 1328
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 1329
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doLimits(Landroid/graphics/RectF;)V

    .line 1331
    :cond_5a2
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doStroke(Lcom/larvalabs/svgandroid/SVGParser$Properties;)Z

    move-result v3

    if-eqz v3, :cond_5c8

    .line 1332
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 1333
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doLimits(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 1335
    :cond_5c8
    invoke-direct/range {p0 .. p0}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->popTransform()V

    goto/16 :goto_73

    .line 1321
    .end local v21    # "props":Lcom/larvalabs/svgandroid/SVGParser$Properties;
    .end local v22    # "radiusX":Ljava/lang/Float;
    .end local v23    # "radiusY":Ljava/lang/Float;
    :cond_5cd
    const-string v3, "r"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getFloatAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$600(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v23

    .restart local v23    # "radiusY":Ljava/lang/Float;
    move-object/from16 v22, v23

    .restart local v22    # "radiusX":Ljava/lang/Float;
    goto/16 :goto_538

    .line 1337
    .end local v11    # "centerX":Ljava/lang/Float;
    .end local v12    # "centerY":Ljava/lang/Float;
    .end local v22    # "radiusX":Ljava/lang/Float;
    .end local v23    # "radiusY":Ljava/lang/Float;
    :cond_5d9
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hidden:Z

    if-nez v3, :cond_6d3

    const-string v3, "polygon"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5f3

    const-string v3, "polyline"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6d3

    .line 1338
    :cond_5f3
    const-string v3, "points"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getNumberParseAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$900(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/larvalabs/svgandroid/SVGParser$NumberParse;

    move-result-object v17

    .line 1339
    .local v17, "numbers":Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    if-eqz v17, :cond_73

    .line 1340
    new-instance v19, Landroid/graphics/Path;

    invoke-direct/range {v19 .. v19}, Landroid/graphics/Path;-><init>()V

    .line 1341
    .local v19, "p":Landroid/graphics/Path;
    # getter for: Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->numbers:Ljava/util/ArrayList;
    invoke-static/range {v17 .. v17}, Lcom/larvalabs/svgandroid/SVGParser$NumberParse;->access$000(Lcom/larvalabs/svgandroid/SVGParser$NumberParse;)Ljava/util/ArrayList;

    move-result-object v20

    .line 1342
    .local v20, "points":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Float;>;"
    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_73

    .line 1343
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->pushTransform(Lorg/xml/sax/Attributes;)V

    .line 1344
    new-instance v21, Lcom/larvalabs/svgandroid/SVGParser$Properties;

    const/4 v3, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p4

    invoke-direct {v0, v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$Properties;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    .line 1345
    .restart local v21    # "props":Lcom/larvalabs/svgandroid/SVGParser$Properties;
    const/4 v3, 0x0

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    const/4 v3, 0x1

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 1346
    const/16 v16, 0x2

    .local v16, "i":I
    :goto_63f
    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->size()I

    move-result v3

    move/from16 v0, v16

    if-ge v0, v3, :cond_66f

    .line 1347
    move-object/from16 v0, v20

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v28

    .line 1348
    .local v28, "x":F
    add-int/lit8 v3, v16, 0x1

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v31

    .line 1349
    .local v31, "y":F
    move-object/from16 v0, v19

    move/from16 v1, v28

    move/from16 v2, v31

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 1346
    add-int/lit8 v16, v16, 0x2

    goto :goto_63f

    .line 1352
    .end local v28    # "x":F
    .end local v31    # "y":F
    :cond_66f
    const-string v3, "polygon"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_67c

    .line 1353
    invoke-virtual/range {v19 .. v19}, Landroid/graphics/Path;->close()V

    .line 1355
    :cond_67c
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    const/4 v4, 0x0

    move-object/from16 v0, v19

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 1356
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doFill(Lcom/larvalabs/svgandroid/SVGParser$Properties;Landroid/graphics/RectF;)Z

    move-result v3

    if-eqz v3, :cond_6aa

    .line 1357
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    move-object/from16 v0, v19

    invoke-virtual {v3, v0, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1358
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doLimits(Landroid/graphics/RectF;)V

    .line 1360
    :cond_6aa
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doStroke(Lcom/larvalabs/svgandroid/SVGParser$Properties;)Z

    move-result v3

    if-eqz v3, :cond_6ce

    .line 1361
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    move-object/from16 v0, v19

    invoke-virtual {v3, v0, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1362
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doLimits(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 1364
    :cond_6ce
    invoke-direct/range {p0 .. p0}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->popTransform()V

    goto/16 :goto_73

    .line 1367
    .end local v16    # "i":I
    .end local v17    # "numbers":Lcom/larvalabs/svgandroid/SVGParser$NumberParse;
    .end local v19    # "p":Landroid/graphics/Path;
    .end local v20    # "points":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Float;>;"
    .end local v21    # "props":Lcom/larvalabs/svgandroid/SVGParser$Properties;
    :cond_6d3
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hidden:Z

    if-nez v3, :cond_757

    const-string v3, "path"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_757

    .line 1368
    const-string v3, "d"

    move-object/from16 v0, p4

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->getStringAttr(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;
    invoke-static {v3, v0}, Lcom/larvalabs/svgandroid/SVGParser;->access$100(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v3

    # invokes: Lcom/larvalabs/svgandroid/SVGParser;->doPath(Ljava/lang/String;)Landroid/graphics/Path;
    invoke-static {v3}, Lcom/larvalabs/svgandroid/SVGParser;->access$1000(Ljava/lang/String;)Landroid/graphics/Path;

    move-result-object v19

    .line 1369
    .restart local v19    # "p":Landroid/graphics/Path;
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->pushTransform(Lorg/xml/sax/Attributes;)V

    .line 1370
    new-instance v21, Lcom/larvalabs/svgandroid/SVGParser$Properties;

    const/4 v3, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p4

    invoke-direct {v0, v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$Properties;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    .line 1371
    .restart local v21    # "props":Lcom/larvalabs/svgandroid/SVGParser$Properties;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    const/4 v4, 0x0

    move-object/from16 v0, v19

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 1372
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doFill(Lcom/larvalabs/svgandroid/SVGParser$Properties;Landroid/graphics/RectF;)Z

    move-result v3

    if-eqz v3, :cond_72e

    .line 1373
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->fillPaint:Landroid/graphics/Paint;

    move-object/from16 v0, v19

    invoke-virtual {v3, v0, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1374
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doLimits(Landroid/graphics/RectF;)V

    .line 1376
    :cond_72e
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doStroke(Lcom/larvalabs/svgandroid/SVGParser$Properties;)Z

    move-result v3

    if-eqz v3, :cond_752

    .line 1377
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->canvas:Landroid/graphics/Canvas;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    move-object/from16 v0, v19

    invoke-virtual {v3, v0, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 1378
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->rect:Landroid/graphics/RectF;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->strokePaint:Landroid/graphics/Paint;

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->doLimits(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 1380
    :cond_752
    invoke-direct/range {p0 .. p0}, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->popTransform()V

    goto/16 :goto_73

    .line 1381
    .end local v19    # "p":Landroid/graphics/Path;
    .end local v21    # "props":Lcom/larvalabs/svgandroid/SVGParser$Properties;
    :cond_757
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$SVGHandler;->hidden:Z

    if-nez v3, :cond_73

    .line 1382
    const-string v3, "SVGAndroid"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "UNRECOGNIZED SVG COMMAND: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_73
.end method
