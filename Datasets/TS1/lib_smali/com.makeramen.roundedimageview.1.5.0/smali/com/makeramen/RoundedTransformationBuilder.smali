.class public final Lcom/makeramen/RoundedTransformationBuilder;
.super Ljava/lang/Object;
.source "RoundedTransformationBuilder.java"


# instance fields
.field private mBorderColor:Landroid/content/res/ColorStateList;

.field private mBorderWidth:F

.field private mCornerRadius:F

.field private final mDisplayMetrics:Landroid/util/DisplayMetrics;

.field private mOval:Z

.field private mScaleType:Landroid/widget/ImageView$ScaleType;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput v1, p0, Lcom/makeramen/RoundedTransformationBuilder;->mCornerRadius:F

    .line 17
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/makeramen/RoundedTransformationBuilder;->mOval:Z

    .line 18
    iput v1, p0, Lcom/makeramen/RoundedTransformationBuilder;->mBorderWidth:F

    .line 19
    const/high16 v0, -0x1000000

    .line 20
    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/RoundedTransformationBuilder;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 21
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object v0, p0, Lcom/makeramen/RoundedTransformationBuilder;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 24
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/RoundedTransformationBuilder;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    .line 25
    return-void
.end method

.method static synthetic access$000(Lcom/makeramen/RoundedTransformationBuilder;)Z
    .registers 2
    .param p0, "x0"    # Lcom/makeramen/RoundedTransformationBuilder;

    .prologue
    .line 11
    iget-boolean v0, p0, Lcom/makeramen/RoundedTransformationBuilder;->mOval:Z

    return v0
.end method

.method static synthetic access$100(Lcom/makeramen/RoundedTransformationBuilder;)Landroid/content/res/ColorStateList;
    .registers 2
    .param p0, "x0"    # Lcom/makeramen/RoundedTransformationBuilder;

    .prologue
    .line 11
    iget-object v0, p0, Lcom/makeramen/RoundedTransformationBuilder;->mBorderColor:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/makeramen/RoundedTransformationBuilder;)F
    .registers 2
    .param p0, "x0"    # Lcom/makeramen/RoundedTransformationBuilder;

    .prologue
    .line 11
    iget v0, p0, Lcom/makeramen/RoundedTransformationBuilder;->mBorderWidth:F

    return v0
.end method

.method static synthetic access$300(Lcom/makeramen/RoundedTransformationBuilder;)F
    .registers 2
    .param p0, "x0"    # Lcom/makeramen/RoundedTransformationBuilder;

    .prologue
    .line 11
    iget v0, p0, Lcom/makeramen/RoundedTransformationBuilder;->mCornerRadius:F

    return v0
.end method

.method static synthetic access$400(Lcom/makeramen/RoundedTransformationBuilder;)Landroid/widget/ImageView$ScaleType;
    .registers 2
    .param p0, "x0"    # Lcom/makeramen/RoundedTransformationBuilder;

    .prologue
    .line 11
    iget-object v0, p0, Lcom/makeramen/RoundedTransformationBuilder;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method


# virtual methods
.method public borderColor(I)Lcom/makeramen/RoundedTransformationBuilder;
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 69
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    iput-object v0, p0, Lcom/makeramen/RoundedTransformationBuilder;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 70
    return-object p0
.end method

.method public borderColor(Landroid/content/res/ColorStateList;)Lcom/makeramen/RoundedTransformationBuilder;
    .registers 2
    .param p1, "colors"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/makeramen/RoundedTransformationBuilder;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 75
    return-object p0
.end method

.method public borderWidth(F)Lcom/makeramen/RoundedTransformationBuilder;
    .registers 2
    .param p1, "widthPx"    # F

    .prologue
    .line 52
    iput p1, p0, Lcom/makeramen/RoundedTransformationBuilder;->mBorderWidth:F

    .line 53
    return-object p0
.end method

.method public borderWidthDp(F)Lcom/makeramen/RoundedTransformationBuilder;
    .registers 4
    .param p1, "widthDp"    # F

    .prologue
    .line 60
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/makeramen/RoundedTransformationBuilder;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    invoke-static {v0, p1, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    iput v0, p0, Lcom/makeramen/RoundedTransformationBuilder;->mBorderWidth:F

    .line 61
    return-object p0
.end method

.method public build()Lcom/squareup/picasso/Transformation;
    .registers 2

    .prologue
    .line 84
    new-instance v0, Lcom/makeramen/RoundedTransformationBuilder$1;

    invoke-direct {v0, p0}, Lcom/makeramen/RoundedTransformationBuilder$1;-><init>(Lcom/makeramen/RoundedTransformationBuilder;)V

    return-object v0
.end method

.method public cornerRadius(F)Lcom/makeramen/RoundedTransformationBuilder;
    .registers 2
    .param p1, "radiusPx"    # F

    .prologue
    .line 36
    iput p1, p0, Lcom/makeramen/RoundedTransformationBuilder;->mCornerRadius:F

    .line 37
    return-object p0
.end method

.method public cornerRadiusDp(F)Lcom/makeramen/RoundedTransformationBuilder;
    .registers 4
    .param p1, "radiusDp"    # F

    .prologue
    .line 44
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/makeramen/RoundedTransformationBuilder;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    invoke-static {v0, p1, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    iput v0, p0, Lcom/makeramen/RoundedTransformationBuilder;->mCornerRadius:F

    .line 45
    return-object p0
.end method

.method public oval(Z)Lcom/makeramen/RoundedTransformationBuilder;
    .registers 2
    .param p1, "oval"    # Z

    .prologue
    .line 79
    iput-boolean p1, p0, Lcom/makeramen/RoundedTransformationBuilder;->mOval:Z

    .line 80
    return-object p0
.end method

.method public scaleType(Landroid/widget/ImageView$ScaleType;)Lcom/makeramen/RoundedTransformationBuilder;
    .registers 2
    .param p1, "scaleType"    # Landroid/widget/ImageView$ScaleType;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/makeramen/RoundedTransformationBuilder;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 29
    return-object p0
.end method
