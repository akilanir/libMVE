.class public Lcom/afollestad/materialdialogs/internal/MDButton;
.super Landroid/widget/TextView;
.source "MDButton.java"


# instance fields
.field private mDefaultBackground:Landroid/graphics/drawable/Drawable;

.field private mStacked:Z

.field private mStackedBackground:Landroid/graphics/drawable/Drawable;

.field private mStackedEndPadding:I

.field private mStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x0

    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStacked:Z

    .line 30
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v0, 0x0

    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 21
    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStacked:Z

    .line 35
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 40
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 21
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStacked:Z

    .line 41
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/afollestad/materialdialogs/internal/MDButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 42
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 45
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/afollestad/materialdialogs/R$dimen;->md_dialog_frame_margin:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStackedEndPadding:I

    .line 47
    sget-object v0, Lcom/afollestad/materialdialogs/GravityEnum;->END:Lcom/afollestad/materialdialogs/GravityEnum;

    iput-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 48
    return-void
.end method


# virtual methods
.method public setAllCapsCompat(Z)V
    .registers 4
    .param p1, "allCaps"    # Z

    .prologue
    .line 90
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_a

    .line 91
    invoke-virtual {p0, p1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setAllCaps(Z)V

    .line 98
    :goto_9
    return-void

    .line 93
    :cond_a
    if-eqz p1, :cond_19

    .line 94
    new-instance v0, Landroid/support/v7/internal/text/AllCapsTransformationMethod;

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/internal/MDButton;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/internal/text/AllCapsTransformationMethod;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    goto :goto_9

    .line 96
    :cond_19
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    goto :goto_9
.end method

.method public setDefaultSelector(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mDefaultBackground:Landroid/graphics/drawable/Drawable;

    .line 85
    iget-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStacked:Z

    if-nez v0, :cond_b

    .line 86
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setStacked(ZZ)V

    .line 87
    :cond_b
    return-void
.end method

.method setStacked(ZZ)V
    .registers 7
    .param p1, "stacked"    # Z
    .param p2, "force"    # Z

    .prologue
    const/16 v1, 0x11

    .line 56
    iget-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStacked:Z

    if-ne v0, p1, :cond_8

    if-eqz p2, :cond_3e

    .line 58
    :cond_8
    if-eqz p1, :cond_3f

    iget-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/GravityEnum;->getGravityInt()I

    move-result v0

    or-int/lit8 v0, v0, 0x10

    :goto_12
    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setGravity(I)V

    .line 59
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v0, v1, :cond_24

    .line 61
    if-eqz p1, :cond_41

    iget-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    invoke-virtual {v0}, Lcom/afollestad/materialdialogs/GravityEnum;->getTextAlignment()I

    move-result v0

    :goto_21
    invoke-virtual {p0, v0}, Lcom/afollestad/materialdialogs/internal/MDButton;->setTextAlignment(I)V

    .line 64
    :cond_24
    if-eqz p1, :cond_43

    iget-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    :goto_28
    invoke-static {p0, v0}, Lcom/afollestad/materialdialogs/util/DialogUtils;->setBackgroundCompat(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 65
    if-eqz p1, :cond_3c

    .line 66
    iget v0, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStackedEndPadding:I

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/internal/MDButton;->getPaddingTop()I

    move-result v1

    iget v2, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStackedEndPadding:I

    invoke-virtual {p0}, Lcom/afollestad/materialdialogs/internal/MDButton;->getPaddingBottom()I

    move-result v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/afollestad/materialdialogs/internal/MDButton;->setPadding(IIII)V

    .line 69
    :cond_3c
    iput-boolean p1, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStacked:Z

    .line 71
    :cond_3e
    return-void

    :cond_3f
    move v0, v1

    .line 58
    goto :goto_12

    .line 61
    :cond_41
    const/4 v0, 0x4

    goto :goto_21

    .line 64
    :cond_43
    iget-object v0, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mDefaultBackground:Landroid/graphics/drawable/Drawable;

    goto :goto_28
.end method

.method public setStackedGravity(Lcom/afollestad/materialdialogs/GravityEnum;)V
    .registers 2
    .param p1, "gravity"    # Lcom/afollestad/materialdialogs/GravityEnum;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStackedGravity:Lcom/afollestad/materialdialogs/GravityEnum;

    .line 75
    return-void
.end method

.method public setStackedSelector(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "d"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v1, 0x1

    .line 78
    iput-object p1, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStackedBackground:Landroid/graphics/drawable/Drawable;

    .line 79
    iget-boolean v0, p0, Lcom/afollestad/materialdialogs/internal/MDButton;->mStacked:Z

    if-eqz v0, :cond_a

    .line 80
    invoke-virtual {p0, v1, v1}, Lcom/afollestad/materialdialogs/internal/MDButton;->setStacked(ZZ)V

    .line 81
    :cond_a
    return-void
.end method
