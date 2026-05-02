.class public Lfr/ganfra/materialspinner/MaterialSpinner;
.super Landroid/widget/Spinner;
.source "MaterialSpinner.java"

# interfaces
.implements Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;
    }
.end annotation


# static fields
.field public static final DEFAULT_ARROW_WIDTH_DP:I = 0xc

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private alignLabels:Z

.field private arrowColor:I

.field private arrowSize:F

.field private baseAlpha:I

.field private baseColor:I

.field private currentNbErrorLines:F

.field private disabledColor:I

.field private error:Ljava/lang/CharSequence;

.field private errorAnimationReverse:Z

.field private errorColor:I

.field private errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

.field private errorLabelPosX:I

.field private errorLabelSpacing:I

.field private extraPaddingBottom:I

.field private extraPaddingTop:I

.field private floatingLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

.field private floatingLabelBottomSpacing:I

.field private floatingLabelColor:I

.field private floatingLabelInsideSpacing:I

.field private floatingLabelPercent:F

.field private floatingLabelText:Ljava/lang/CharSequence;

.field private floatingLabelTopSpacing:I

.field private floatingLabelVisible:Z

.field private highlightColor:I

.field private hint:Ljava/lang/CharSequence;

.field private innerPaddingBottom:I

.field private innerPaddingLeft:I

.field private innerPaddingRight:I

.field private innerPaddingTop:I

.field private isSelected:Z

.field private lastPosition:I

.field private minNbErrorLines:I

.field private multiline:Z

.field private paint:Landroid/graphics/Paint;

.field private rightLeftSpinnerPadding:I

.field private selectorPath:Landroid/graphics/Path;

.field private selectorPoints:[Landroid/graphics/Point;

.field private staticLayout:Landroid/text/StaticLayout;

.field private textPaint:Landroid/text/TextPaint;

.field private thickness:F

.field private thicknessError:F

.field private typeface:Landroid/graphics/Typeface;

.field private underlineBottomSpacing:I

.field private underlineTopSpacing:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 37
    const-class v0, Lfr/ganfra/materialspinner/MaterialSpinner;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lfr/ganfra/materialspinner/MaterialSpinner;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 109
    invoke-direct {p0, p1}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .line 110
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 114
    invoke-direct {p0, p1, p2}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 115
    invoke-direct {p0, p1, p2}, Lfr/ganfra/materialspinner/MaterialSpinner;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 117
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 120
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 121
    invoke-direct {p0, p1, p2}, Lfr/ganfra/materialspinner/MaterialSpinner;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 122
    return-void
.end method

.method static synthetic access$000(Lfr/ganfra/materialspinner/MaterialSpinner;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "x0"    # Lfr/ganfra/materialspinner/MaterialSpinner;

    .prologue
    .line 33
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$100(Lfr/ganfra/materialspinner/MaterialSpinner;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "x0"    # Lfr/ganfra/materialspinner/MaterialSpinner;

    .prologue
    .line 33
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$200(Lfr/ganfra/materialspinner/MaterialSpinner;)Z
    .registers 2
    .param p0, "x0"    # Lfr/ganfra/materialspinner/MaterialSpinner;

    .prologue
    .line 33
    iget-boolean v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelVisible:Z

    return v0
.end method

.method static synthetic access$300(Lfr/ganfra/materialspinner/MaterialSpinner;)V
    .registers 1
    .param p0, "x0"    # Lfr/ganfra/materialspinner/MaterialSpinner;

    .prologue
    .line 33
    invoke-direct {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->showFloatingLabel()V

    return-void
.end method

.method static synthetic access$400(Lfr/ganfra/materialspinner/MaterialSpinner;)V
    .registers 1
    .param p0, "x0"    # Lfr/ganfra/materialspinner/MaterialSpinner;

    .prologue
    .line 33
    invoke-direct {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->hideFloatingLabel()V

    return-void
.end method

.method static synthetic access$500(Lfr/ganfra/materialspinner/MaterialSpinner;)I
    .registers 2
    .param p0, "x0"    # Lfr/ganfra/materialspinner/MaterialSpinner;

    .prologue
    .line 33
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->lastPosition:I

    return v0
.end method

.method static synthetic access$502(Lfr/ganfra/materialspinner/MaterialSpinner;I)I
    .registers 2
    .param p0, "x0"    # Lfr/ganfra/materialspinner/MaterialSpinner;
    .param p1, "x1"    # I

    .prologue
    .line 33
    iput p1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->lastPosition:I

    return p1
.end method

.method static synthetic access$600(Lfr/ganfra/materialspinner/MaterialSpinner;)Ljava/lang/CharSequence;
    .registers 2
    .param p0, "x0"    # Lfr/ganfra/materialspinner/MaterialSpinner;

    .prologue
    .line 33
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    return-object v0
.end method

.method static synthetic access$700(Lfr/ganfra/materialspinner/MaterialSpinner;)I
    .registers 2
    .param p0, "x0"    # Lfr/ganfra/materialspinner/MaterialSpinner;

    .prologue
    .line 33
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->baseColor:I

    return v0
.end method

.method static synthetic access$800(Lfr/ganfra/materialspinner/MaterialSpinner;)I
    .registers 2
    .param p0, "x0"    # Lfr/ganfra/materialspinner/MaterialSpinner;

    .prologue
    .line 33
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->disabledColor:I

    return v0
.end method

.method private dpToPx(F)I
    .registers 5
    .param p1, "dp"    # F

    .prologue
    .line 316
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 317
    .local v0, "displayMetrics":Landroid/util/DisplayMetrics;
    const/4 v2, 0x1

    invoke-static {v2, p1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    .line 318
    .local v1, "px":F
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v2

    return v2
.end method

.method private drawSelector(Landroid/graphics/Canvas;II)V
    .registers 11
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "posX"    # I
    .param p3, "posY"    # I

    .prologue
    const/high16 v6, 0x40000000    # 2.0f

    .line 427
    iget-boolean v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->isSelected:Z

    if-eqz v3, :cond_69

    .line 428
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->paint:Landroid/graphics/Paint;

    iget v4, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->highlightColor:I

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 433
    :goto_d
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->selectorPoints:[Landroid/graphics/Point;

    const/4 v4, 0x0

    aget-object v0, v3, v4

    .line 434
    .local v0, "point1":Landroid/graphics/Point;
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->selectorPoints:[Landroid/graphics/Point;

    const/4 v4, 0x1

    aget-object v1, v3, v4

    .line 435
    .local v1, "point2":Landroid/graphics/Point;
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->selectorPoints:[Landroid/graphics/Point;

    const/4 v4, 0x2

    aget-object v2, v3, v4

    .line 437
    .local v2, "point3":Landroid/graphics/Point;
    invoke-virtual {v0, p2, p3}, Landroid/graphics/Point;->set(II)V

    .line 438
    int-to-float v3, p2

    iget v4, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->arrowSize:F

    sub-float/2addr v3, v4

    float-to-int v3, v3

    invoke-virtual {v1, v3, p3}, Landroid/graphics/Point;->set(II)V

    .line 439
    int-to-float v3, p2

    iget v4, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->arrowSize:F

    div-float/2addr v4, v6

    sub-float/2addr v3, v4

    float-to-int v3, v3

    int-to-float v4, p3

    iget v5, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->arrowSize:F

    div-float/2addr v5, v6

    add-float/2addr v4, v5

    float-to-int v4, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Point;->set(II)V

    .line 441
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->selectorPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 442
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->selectorPath:Landroid/graphics/Path;

    iget v4, v0, Landroid/graphics/Point;->x:I

    int-to-float v4, v4

    iget v5, v0, Landroid/graphics/Point;->y:I

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    .line 443
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->selectorPath:Landroid/graphics/Path;

    iget v4, v1, Landroid/graphics/Point;->x:I

    int-to-float v4, v4

    iget v5, v1, Landroid/graphics/Point;->y:I

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 444
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->selectorPath:Landroid/graphics/Path;

    iget v4, v2, Landroid/graphics/Point;->x:I

    int-to-float v4, v4

    iget v5, v2, Landroid/graphics/Point;->y:I

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 445
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->selectorPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 446
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->selectorPath:Landroid/graphics/Path;

    iget-object v4, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 447
    return-void

    .line 430
    .end local v0    # "point1":Landroid/graphics/Point;
    .end local v1    # "point2":Landroid/graphics/Point;
    .end local v2    # "point3":Landroid/graphics/Point;
    :cond_69
    iget-object v4, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_77

    iget v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->arrowColor:I

    :goto_73
    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_d

    :cond_77
    iget v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->disabledColor:I

    goto :goto_73
.end method

.method private getCurrentNbErrorLines()F
    .registers 2

    .prologue
    .line 655
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->currentNbErrorLines:F

    return v0
.end method

.method private getErrorLabelPosX()I
    .registers 2

    .prologue
    .line 647
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelPosX:I

    return v0
.end method

.method private getFloatingLabelPercent()F
    .registers 2

    .prologue
    .line 639
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelPercent:F

    return v0
.end method

.method private hideFloatingLabel()V
    .registers 2

    .prologue
    .line 275
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    if-eqz v0, :cond_c

    .line 276
    const/4 v0, 0x0

    iput-boolean v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelVisible:Z

    .line 277
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->reverse()V

    .line 279
    :cond_c
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 134
    invoke-direct {p0, p1, p2}, Lfr/ganfra/materialspinner/MaterialSpinner;->initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 135
    invoke-direct {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->initPaintObjects()V

    .line 136
    invoke-direct {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->initDimensions()V

    .line 137
    invoke-direct {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->initPadding()V

    .line 138
    invoke-direct {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->initFloatingLabelAnimator()V

    .line 139
    invoke-direct {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->initOnItemSelectedListener()V

    .line 140
    invoke-direct {p0, p1}, Lfr/ganfra/materialspinner/MaterialSpinner;->initAdapter(Landroid/content/Context;)V

    .line 143
    sget v0, Lfr/ganfra/materialspinner/R$drawable;->my_background:I

    invoke-virtual {p0, v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->setBackgroundResource(I)V

    .line 145
    return-void
.end method

.method private initAdapter(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 242
    new-instance v0, Landroid/widget/ArrayAdapter;

    const v1, 0x1090008

    invoke-direct {v0, p1, v1}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 243
    .local v0, "adapter":Landroid/widget/SpinnerAdapter;
    invoke-virtual {p0, v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 244
    return-void
.end method

.method private initAttributes(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 149
    const/4 v6, 0x2

    new-array v6, v6, [I

    sget v7, Lfr/ganfra/materialspinner/R$attr;->colorControlNormal:I

    aput v7, v6, v8

    sget v7, Lfr/ganfra/materialspinner/R$attr;->colorAccent:I

    aput v7, v6, v9

    invoke-virtual {p1, v6}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 150
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v8, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    .line 151
    .local v2, "defaultBaseColor":I
    invoke-virtual {v0, v9, v8}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v4

    .line 152
    .local v4, "defaultHighlightColor":I
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lfr/ganfra/materialspinner/R$color;->error_color:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    .line 154
    .local v3, "defaultErrorColor":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 156
    sget-object v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner:[I

    invoke-virtual {p1, p2, v6}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 157
    .local v1, "array":Landroid/content/res/TypedArray;
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_baseColor:I

    invoke-virtual {v1, v6, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    iput v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->baseColor:I

    .line 158
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_highlightColor:I

    invoke-virtual {v1, v6, v4}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    iput v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->highlightColor:I

    .line 159
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_errorColor:I

    invoke-virtual {v1, v6, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    iput v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorColor:I

    .line 160
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    sget v7, Lfr/ganfra/materialspinner/R$color;->disabled_color:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v6

    iput v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->disabledColor:I

    .line 161
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_error:I

    invoke-virtual {v1, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    .line 162
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_hint:I

    invoke-virtual {v1, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;

    .line 163
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_floatingLabelText:I

    invoke-virtual {v1, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelText:Ljava/lang/CharSequence;

    .line 164
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_floatingLabelColor:I

    iget v7, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->baseColor:I

    invoke-virtual {v1, v6, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    iput v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelColor:I

    .line 165
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_multiline:I

    invoke-virtual {v1, v6, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    iput-boolean v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->multiline:Z

    .line 166
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_nbErrorLines:I

    invoke-virtual {v1, v6, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v6

    iput v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->minNbErrorLines:I

    .line 167
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_alignLabels:I

    invoke-virtual {v1, v6, v9}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    iput-boolean v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->alignLabels:Z

    .line 168
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_thickness:I

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-virtual {v1, v6, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v6

    iput v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->thickness:F

    .line 169
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_thickness_error:I

    const/high16 v7, 0x40000000    # 2.0f

    invoke-virtual {v1, v6, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v6

    iput v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->thicknessError:F

    .line 170
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_arrowColor:I

    iget v7, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->baseColor:I

    invoke-virtual {v1, v6, v7}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v6

    iput v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->arrowColor:I

    .line 171
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_arrowSize:I

    const/high16 v7, 0x41400000    # 12.0f

    invoke-direct {p0, v7}, Lfr/ganfra/materialspinner/MaterialSpinner;->dpToPx(F)I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v1, v6, v7}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v6

    iput v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->arrowSize:F

    .line 173
    sget v6, Lfr/ganfra/materialspinner/R$styleable;->MaterialSpinner_ms_typeface:I

    invoke-virtual {v1, v6}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 174
    .local v5, "typefacePath":Ljava/lang/String;
    if-eqz v5, :cond_cd

    .line 175
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    invoke-static {v6, v5}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v6

    iput-object v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->typeface:Landroid/graphics/Typeface;

    .line 178
    :cond_cd
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 180
    const/4 v6, 0x0

    iput v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelPercent:F

    .line 181
    iput v8, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelPosX:I

    .line 182
    iput-boolean v8, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->isSelected:Z

    .line 183
    iput-boolean v8, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelVisible:Z

    .line 184
    const/4 v6, -0x1

    iput v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->lastPosition:I

    .line 185
    iget v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->minNbErrorLines:I

    int-to-float v6, v6

    iput v6, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->currentNbErrorLines:F

    .line 187
    return-void
.end method

.method private initDimensions()V
    .registers 3

    .prologue
    .line 231
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lfr/ganfra/materialspinner/R$dimen;->underline_top_spacing:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->underlineTopSpacing:I

    .line 232
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lfr/ganfra/materialspinner/R$dimen;->underline_bottom_spacing:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->underlineBottomSpacing:I

    .line 233
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lfr/ganfra/materialspinner/R$dimen;->floating_label_top_spacing:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelTopSpacing:I

    .line 234
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lfr/ganfra/materialspinner/R$dimen;->floating_label_bottom_spacing:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelBottomSpacing:I

    .line 235
    iget-boolean v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->alignLabels:Z

    if-eqz v0, :cond_5a

    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lfr/ganfra/materialspinner/R$dimen;->right_left_spinner_padding:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    :goto_3e
    iput v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->rightLeftSpinnerPadding:I

    .line 236
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lfr/ganfra/materialspinner/R$dimen;->floating_label_inside_spacing:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelInsideSpacing:I

    .line 237
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lfr/ganfra/materialspinner/R$dimen;->error_label_spacing:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelSpacing:I

    .line 239
    return-void

    .line 235
    :cond_5a
    const/4 v0, 0x0

    goto :goto_3e
.end method

.method private initFloatingLabelAnimator()V
    .registers 3

    .prologue
    .line 257
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    if-nez v0, :cond_17

    .line 258
    const-string v0, "floatingLabelPercent"

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_18

    invoke-static {p0, v0, v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    .line 259
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-virtual {v0, p0}, Lcom/nineoldandroids/animation/ObjectAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 261
    :cond_17
    return-void

    .line 258
    :array_18
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private initOnItemSelectedListener()V
    .registers 2

    .prologue
    .line 247
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 248
    return-void
.end method

.method private initPadding()V
    .registers 3

    .prologue
    .line 214
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getPaddingTop()I

    move-result v0

    iput v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->innerPaddingTop:I

    .line 215
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getPaddingLeft()I

    move-result v0

    iput v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->innerPaddingLeft:I

    .line 216
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getPaddingRight()I

    move-result v0

    iput v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->innerPaddingRight:I

    .line 217
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getPaddingBottom()I

    move-result v0

    iput v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->innerPaddingBottom:I

    .line 219
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelTopSpacing:I

    iget v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelInsideSpacing:I

    add-int/2addr v0, v1

    iget v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelBottomSpacing:I

    add-int/2addr v0, v1

    iput v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->extraPaddingTop:I

    .line 220
    invoke-direct {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->updateBottomPadding()V

    .line 222
    return-void
.end method

.method private initPaintObjects()V
    .registers 7

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x1

    .line 191
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lfr/ganfra/materialspinner/R$dimen;->label_text_size:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 193
    .local v1, "labelTextSize":I
    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->paint:Landroid/graphics/Paint;

    .line 195
    new-instance v2, Landroid/text/TextPaint;

    invoke-direct {v2, v4}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    .line 196
    iget-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    int-to-float v3, v1

    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 197
    iget-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->typeface:Landroid/graphics/Typeface;

    if-eqz v2, :cond_2b

    .line 198
    iget-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 200
    :cond_2b
    iget-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    iget v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->baseColor:I

    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->setColor(I)V

    .line 201
    iget-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {v2}, Landroid/text/TextPaint;->getAlpha()I

    move-result v2

    iput v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->baseAlpha:I

    .line 203
    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    iput-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->selectorPath:Landroid/graphics/Path;

    .line 204
    iget-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->selectorPath:Landroid/graphics/Path;

    sget-object v3, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    invoke-virtual {v2, v3}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 206
    new-array v2, v5, [Landroid/graphics/Point;

    iput-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->selectorPoints:[Landroid/graphics/Point;

    .line 207
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4d
    if-ge v0, v5, :cond_5b

    .line 208
    iget-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->selectorPoints:[Landroid/graphics/Point;

    new-instance v3, Landroid/graphics/Point;

    invoke-direct {v3}, Landroid/graphics/Point;-><init>()V

    aput-object v3, v2, v0

    .line 207
    add-int/lit8 v0, v0, 0x1

    goto :goto_4d

    .line 210
    :cond_5b
    return-void
.end method

.method private needScrollingAnimation()Z
    .registers 7

    .prologue
    const/4 v2, 0x0

    .line 335
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    if-eqz v3, :cond_24

    .line 336
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getWidth()I

    move-result v3

    iget v4, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->rightLeftSpinnerPadding:I

    sub-int/2addr v3, v4

    int-to-float v1, v3

    .line 337
    .local v1, "screenWidth":F
    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    iget-object v4, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-virtual {v3, v4, v2, v5}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;II)F

    move-result v0

    .line 338
    .local v0, "errorTextWidth":F
    cmpl-float v3, v0, v1

    if-lez v3, :cond_24

    const/4 v2, 0x1

    .line 340
    .end local v0    # "errorTextWidth":F
    .end local v1    # "screenWidth":F
    :cond_24
    return v2
.end method

.method private prepareBottomPadding()I
    .registers 11

    .prologue
    .line 345
    iget v9, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->minNbErrorLines:I

    .line 346
    .local v9, "targetNbLines":I
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    if-eqz v0, :cond_31

    .line 347
    new-instance v0, Landroid/text/StaticLayout;

    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    iget-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getPaddingLeft()I

    move-result v4

    sub-int/2addr v3, v4

    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-direct/range {v0 .. v7}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZ)V

    iput-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->staticLayout:Landroid/text/StaticLayout;

    .line 348
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->staticLayout:Landroid/text/StaticLayout;

    invoke-virtual {v0}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v8

    .line 349
    .local v8, "nbErrorLines":I
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->minNbErrorLines:I

    invoke-static {v0, v8}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 351
    .end local v8    # "nbErrorLines":I
    :cond_31
    return v9
.end method

.method private pxToDp(F)F
    .registers 4
    .param p1, "px"    # F

    .prologue
    .line 322
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 323
    .local v0, "displayMetrics":Landroid/util/DisplayMetrics;
    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v1, p1

    return v1
.end method

.method private setCurrentNbErrorLines(F)V
    .registers 2
    .param p1, "currentNbErrorLines"    # F

    .prologue
    .line 659
    iput p1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->currentNbErrorLines:F

    .line 660
    invoke-direct {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->updateBottomPadding()V

    .line 661
    return-void
.end method

.method private setErrorLabelPosX(I)V
    .registers 2
    .param p1, "errorLabelPosX"    # I

    .prologue
    .line 651
    iput p1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelPosX:I

    .line 652
    return-void
.end method

.method private setFloatingLabelPercent(F)V
    .registers 2
    .param p1, "floatingLabelPercent"    # F

    .prologue
    .line 643
    iput p1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelPercent:F

    .line 644
    return-void
.end method

.method private setPadding()V
    .registers 7

    .prologue
    .line 327
    iget v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->innerPaddingLeft:I

    .line 328
    .local v1, "left":I
    iget v4, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->innerPaddingTop:I

    iget v5, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->extraPaddingTop:I

    add-int v3, v4, v5

    .line 329
    .local v3, "top":I
    iget v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->innerPaddingRight:I

    .line 330
    .local v2, "right":I
    iget v4, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->innerPaddingBottom:I

    iget v5, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->extraPaddingBottom:I

    add-int v0, v4, v5

    .line 331
    .local v0, "bottom":I
    invoke-super {p0, v1, v3, v2, v0}, Landroid/widget/Spinner;->setPadding(IIII)V

    .line 332
    return-void
.end method

.method private showFloatingLabel()V
    .registers 2

    .prologue
    .line 264
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    if-eqz v0, :cond_14

    .line 265
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelVisible:Z

    .line 266
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 267
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->reverse()V

    .line 272
    :cond_14
    :goto_14
    return-void

    .line 269
    :cond_15
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->start()V

    goto :goto_14
.end method

.method private startErrorMultilineAnimator(F)V
    .registers 5
    .param p1, "destLines"    # F

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 299
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    if-nez v0, :cond_18

    .line 300
    const-string v0, "currentNbErrorLines"

    new-array v1, v1, [F

    aput p1, v1, v2

    invoke-static {p0, v0, v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    .line 305
    :goto_12
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->start()V

    .line 306
    return-void

    .line 303
    :cond_18
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    new-array v1, v1, [F

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->setFloatValues([F)V

    goto :goto_12
.end method

.method private startErrorScrollingAnimator()V
    .registers 7

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 283
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    iget-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 284
    .local v0, "textWidth":I
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    if-nez v1, :cond_5c

    .line 285
    const-string v1, "errorLabelPosX"

    new-array v2, v5, [I

    aput v3, v2, v3

    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v3, v0

    aput v3, v2, v4

    invoke-static {p0, v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Lcom/nineoldandroids/animation/ObjectAnimator;

    move-result-object v1

    iput-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    .line 286
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    const-wide/16 v2, 0x3e8

    invoke-virtual {v1, v2, v3}, Lcom/nineoldandroids/animation/ObjectAnimator;->setStartDelay(J)V

    .line 287
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    new-instance v2, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 288
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    iget-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    mul-int/lit16 v2, v2, 0x96

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Lcom/nineoldandroids/animation/ObjectAnimator;->setDuration(J)Lcom/nineoldandroids/animation/ObjectAnimator;

    .line 289
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-virtual {v1, p0}, Lcom/nineoldandroids/animation/ObjectAnimator;->addUpdateListener(Lcom/nineoldandroids/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 290
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 294
    :goto_56
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-virtual {v1}, Lcom/nineoldandroids/animation/ObjectAnimator;->start()V

    .line 295
    return-void

    .line 292
    :cond_5c
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    new-array v2, v5, [I

    aput v3, v2, v3

    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v3, v0

    aput v3, v2, v4

    invoke-virtual {v1, v2}, Lcom/nineoldandroids/animation/ObjectAnimator;->setIntValues([I)V

    goto :goto_56
.end method

.method private updateBottomPadding()V
    .registers 4

    .prologue
    .line 225
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {v1}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v0

    .line 226
    .local v0, "textMetrics":Landroid/graphics/Paint$FontMetrics;
    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->descent:F

    iget v2, v0, Landroid/graphics/Paint$FontMetrics;->ascent:F

    sub-float/2addr v1, v2

    iget v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->currentNbErrorLines:F

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iget v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->underlineTopSpacing:I

    add-int/2addr v1, v2

    iget v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->underlineBottomSpacing:I

    add-int/2addr v1, v2

    iput v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->extraPaddingBottom:I

    .line 227
    invoke-direct {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->setPadding()V

    .line 228
    return-void
.end method


# virtual methods
.method public getBaseColor()I
    .registers 2

    .prologue
    .line 526
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->baseColor:I

    return v0
.end method

.method public getError()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 611
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getErrorColor()I
    .registers 2

    .prologue
    .line 546
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorColor:I

    return v0
.end method

.method public getFloatingLabelText()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 579
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getHighlightColor()I
    .registers 2

    .prologue
    .line 537
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->highlightColor:I

    return v0
.end method

.method public getHint()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 565
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public onAnimationUpdate(Lcom/nineoldandroids/animation/ValueAnimator;)V
    .registers 2
    .param p1, "animation"    # Lcom/nineoldandroids/animation/ValueAnimator;

    .prologue
    .line 514
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->invalidate()V

    .line 515
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 15
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 365
    invoke-super {p0, p1}, Landroid/widget/Spinner;->onDraw(Landroid/graphics/Canvas;)V

    .line 367
    const/4 v8, 0x0

    .line 368
    .local v8, "startX":I
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getWidth()I

    move-result v6

    .line 371
    .local v6, "endX":I
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    iget v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->underlineTopSpacing:I

    add-int v11, v0, v1

    .line 372
    .local v11, "startYLine":I
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getPaddingTop()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelPercent:F

    iget v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelBottomSpacing:I

    int-to-float v2, v2

    mul-float/2addr v1, v2

    sub-float/2addr v0, v1

    float-to-int v10, v0

    .line 374
    .local v10, "startYFloatingLabel":I
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    if-eqz v0, :cond_112

    .line 375
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->thicknessError:F

    invoke-direct {p0, v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->dpToPx(F)I

    move-result v7

    .line 376
    .local v7, "lineHeight":I
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelSpacing:I

    add-int/2addr v0, v11

    add-int v9, v0, v7

    .line 377
    .local v9, "startYErrorLabel":I
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 378
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    iget v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorColor:I

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setColor(I)V

    .line 380
    iget-boolean v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->multiline:Z

    if-eqz v0, :cond_cc

    .line 381
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 382
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->rightLeftSpinnerPadding:I

    add-int/2addr v0, v8

    int-to-float v0, v0

    iget v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelSpacing:I

    sub-int v1, v9, v1

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 383
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->staticLayout:Landroid/text/StaticLayout;

    invoke-virtual {v0, p1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 384
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 405
    .end local v9    # "startYErrorLabel":I
    :goto_5a
    int-to-float v1, v8

    int-to-float v2, v11

    int-to-float v3, v6

    add-int v0, v11, v7

    int-to-float v4, v0

    iget-object v5, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->paint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 408
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;

    if-nez v0, :cond_6e

    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelText:Ljava/lang/CharSequence;

    if-eqz v0, :cond_b6

    .line 409
    :cond_6e
    iget-boolean v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->isSelected:Z

    if-eqz v0, :cond_137

    .line 410
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    iget v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->highlightColor:I

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setColor(I)V

    .line 414
    :goto_79
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-nez v0, :cond_85

    iget-boolean v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelVisible:Z

    if-nez v0, :cond_a2

    .line 415
    :cond_85
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    const-wide v1, 0x3fe999999999999aL    # 0.8

    iget v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelPercent:F

    float-to-double v3, v3

    mul-double/2addr v1, v3

    const-wide v3, 0x3fc999999999999aL    # 0.2

    add-double/2addr v1, v3

    iget v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->baseAlpha:I

    int-to-double v3, v3

    mul-double/2addr v1, v3

    iget v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelPercent:F

    float-to-double v3, v3

    mul-double/2addr v1, v3

    double-to-int v1, v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setAlpha(I)V

    .line 417
    :cond_a2
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelText:Ljava/lang/CharSequence;

    if-eqz v0, :cond_149

    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelText:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v12

    .line 418
    .local v12, "textToDraw":Ljava/lang/String;
    :goto_ac
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->rightLeftSpinnerPadding:I

    add-int/2addr v0, v8

    int-to-float v0, v0

    int-to-float v1, v10

    iget-object v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {p1, v12, v0, v1, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 421
    .end local v12    # "textToDraw":Ljava/lang/String;
    :cond_b6
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getWidth()I

    move-result v0

    iget v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->rightLeftSpinnerPadding:I

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getPaddingTop()I

    move-result v1

    const/high16 v2, 0x41000000    # 8.0f

    invoke-direct {p0, v2}, Lfr/ganfra/materialspinner/MaterialSpinner;->dpToPx(F)I

    move-result v2

    add-int/2addr v1, v2

    invoke-direct {p0, p1, v0, v1}, Lfr/ganfra/materialspinner/MaterialSpinner;->drawSelector(Landroid/graphics/Canvas;II)V

    .line 424
    return-void

    .line 388
    .restart local v9    # "startYErrorLabel":I
    :cond_cc
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->rightLeftSpinnerPadding:I

    add-int/2addr v1, v8

    iget v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelPosX:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    int-to-float v2, v9

    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 389
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 390
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v0

    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    add-float/2addr v0, v1

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 391
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->rightLeftSpinnerPadding:I

    add-int/2addr v1, v8

    iget v2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelPosX:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    int-to-float v2, v9

    iget-object v3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 392
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto/16 :goto_5a

    .line 396
    .end local v7    # "lineHeight":I
    .end local v9    # "startYErrorLabel":I
    :cond_112
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->thickness:F

    invoke-direct {p0, v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->dpToPx(F)I

    move-result v7

    .line 397
    .restart local v7    # "lineHeight":I
    iget-boolean v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->isSelected:Z

    if-eqz v0, :cond_125

    .line 398
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->highlightColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_5a

    .line 400
    :cond_125
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->paint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_134

    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->baseColor:I

    :goto_12f
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    goto/16 :goto_5a

    :cond_134
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->disabledColor:I

    goto :goto_12f

    .line 412
    :cond_137
    iget-object v1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_146

    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelColor:I

    :goto_141
    invoke-virtual {v1, v0}, Landroid/text/TextPaint;->setColor(I)V

    goto/16 :goto_79

    :cond_146
    iget v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->disabledColor:I

    goto :goto_141

    .line 417
    :cond_149
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v12

    goto/16 :goto_ac
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 457
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 458
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    packed-switch v0, :pswitch_data_1e

    .line 468
    :goto_d
    :pswitch_d
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->invalidate()V

    .line 470
    :cond_10
    invoke-super {p0, p1}, Landroid/widget/Spinner;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 460
    :pswitch_15
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->isSelected:Z

    goto :goto_d

    .line 465
    :pswitch_19
    const/4 v0, 0x0

    iput-boolean v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->isSelected:Z

    goto :goto_d

    .line 458
    nop

    :pswitch_data_1e
    .packed-switch 0x0
        :pswitch_15
        :pswitch_19
        :pswitch_d
        :pswitch_19
    .end packed-switch
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .registers 2

    .prologue
    .line 33
    check-cast p1, Landroid/widget/SpinnerAdapter;

    invoke-virtual {p0, p1}, Lfr/ganfra/materialspinner/MaterialSpinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/SpinnerAdapter;)V
    .registers 4
    .param p1, "adapter"    # Landroid/widget/SpinnerAdapter;

    .prologue
    .line 635
    new-instance v0, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;

    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1}, Lfr/ganfra/materialspinner/MaterialSpinner$HintAdapter;-><init>(Lfr/ganfra/materialspinner/MaterialSpinner;Landroid/widget/SpinnerAdapter;Landroid/content/Context;)V

    invoke-super {p0, v0}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 636
    return-void
.end method

.method public setBaseColor(I)V
    .registers 3
    .param p1, "baseColor"    # I

    .prologue
    .line 530
    iput p1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->baseColor:I

    .line 531
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setColor(I)V

    .line 532
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->textPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getAlpha()I

    move-result v0

    iput v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->baseAlpha:I

    .line 533
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->invalidate()V

    .line 534
    return-void
.end method

.method public setEnabled(Z)V
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 603
    if-nez p1, :cond_8

    .line 604
    const/4 v0, 0x0

    iput-boolean v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->isSelected:Z

    .line 605
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->invalidate()V

    .line 607
    :cond_8
    invoke-super {p0, p1}, Landroid/widget/Spinner;->setEnabled(Z)V

    .line 608
    return-void
.end method

.method public setError(I)V
    .registers 4
    .param p1, "resid"    # I

    .prologue
    .line 597
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 598
    .local v0, "error":Ljava/lang/CharSequence;
    invoke-virtual {p0, v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->setError(Ljava/lang/CharSequence;)V

    .line 599
    return-void
.end method

.method public setError(Ljava/lang/CharSequence;)V
    .registers 3
    .param p1, "error"    # Ljava/lang/CharSequence;

    .prologue
    .line 583
    iput-object p1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->error:Ljava/lang/CharSequence;

    .line 584
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    if-eqz v0, :cond_b

    .line 585
    iget-object v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorLabelAnimator:Lcom/nineoldandroids/animation/ObjectAnimator;

    invoke-virtual {v0}, Lcom/nineoldandroids/animation/ObjectAnimator;->end()V

    .line 588
    :cond_b
    iget-boolean v0, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->multiline:Z

    if-eqz v0, :cond_1b

    .line 589
    invoke-direct {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->prepareBottomPadding()I

    move-result v0

    int-to-float v0, v0

    invoke-direct {p0, v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->startErrorMultilineAnimator(F)V

    .line 593
    :cond_17
    :goto_17
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->requestLayout()V

    .line 594
    return-void

    .line 590
    :cond_1b
    invoke-direct {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->needScrollingAnimation()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 591
    invoke-direct {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->startErrorScrollingAnimator()V

    goto :goto_17
.end method

.method public setErrorColor(I)V
    .registers 2
    .param p1, "errorColor"    # I

    .prologue
    .line 550
    iput p1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->errorColor:I

    .line 551
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->invalidate()V

    .line 552
    return-void
.end method

.method public setFloatingLabelText(I)V
    .registers 4
    .param p1, "resid"    # I

    .prologue
    .line 574
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 575
    .local v0, "floatingLabelText":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->setFloatingLabelText(Ljava/lang/CharSequence;)V

    .line 576
    return-void
.end method

.method public setFloatingLabelText(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "floatingLabelText"    # Ljava/lang/CharSequence;

    .prologue
    .line 569
    iput-object p1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->floatingLabelText:Ljava/lang/CharSequence;

    .line 570
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->invalidate()V

    .line 571
    return-void
.end method

.method public setHighlightColor(I)V
    .registers 2
    .param p1, "highlightColor"    # I

    .prologue
    .line 541
    iput p1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->highlightColor:I

    .line 542
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->invalidate()V

    .line 543
    return-void
.end method

.method public setHint(I)V
    .registers 4
    .param p1, "resid"    # I

    .prologue
    .line 560
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 561
    .local v0, "hint":Ljava/lang/CharSequence;
    invoke-virtual {p0, v0}, Lfr/ganfra/materialspinner/MaterialSpinner;->setHint(Ljava/lang/CharSequence;)V

    .line 562
    return-void
.end method

.method public setHint(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "hint"    # Ljava/lang/CharSequence;

    .prologue
    .line 555
    iput-object p1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->hint:Ljava/lang/CharSequence;

    .line 556
    invoke-virtual {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->invalidate()V

    .line 557
    return-void
.end method

.method public setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V
    .registers 3
    .param p1, "listener"    # Landroid/widget/AdapterView$OnItemSelectedListener;

    .prologue
    .line 477
    new-instance v0, Lfr/ganfra/materialspinner/MaterialSpinner$1;

    invoke-direct {v0, p0, p1}, Lfr/ganfra/materialspinner/MaterialSpinner$1;-><init>(Lfr/ganfra/materialspinner/MaterialSpinner;Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 508
    .local v0, "onItemSelectedListener":Landroid/widget/AdapterView$OnItemSelectedListener;
    invoke-super {p0, v0}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 509
    return-void
.end method

.method public setPadding(IIII)V
    .registers 5
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 620
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/Spinner;->setPadding(IIII)V

    .line 621
    return-void
.end method

.method public setPaddingSafe(IIII)V
    .registers 5
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .prologue
    .line 625
    iput p3, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->innerPaddingRight:I

    .line 626
    iput p1, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->innerPaddingLeft:I

    .line 627
    iput p2, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->innerPaddingTop:I

    .line 628
    iput p4, p0, Lfr/ganfra/materialspinner/MaterialSpinner;->innerPaddingBottom:I

    .line 630
    invoke-direct {p0}, Lfr/ganfra/materialspinner/MaterialSpinner;->setPadding()V

    .line 631
    return-void
.end method
