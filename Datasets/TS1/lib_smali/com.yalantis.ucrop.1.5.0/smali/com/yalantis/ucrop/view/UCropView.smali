.class public Lcom/yalantis/ucrop/view/UCropView;
.super Landroid/widget/FrameLayout;
.source "UCropView.java"


# instance fields
.field private final mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

.field private final mViewOverlay:Lcom/yalantis/ucrop/view/OverlayView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 21
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/yalantis/ucrop/view/UCropView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 25
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/yalantis/ucrop/R$layout;->ucrop_view:I

    const/4 v3, 0x1

    invoke-virtual {v1, v2, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 28
    sget v1, Lcom/yalantis/ucrop/R$id;->image_view_crop:I

    invoke-virtual {p0, v1}, Lcom/yalantis/ucrop/view/UCropView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/yalantis/ucrop/view/GestureCropImageView;

    iput-object v1, p0, Lcom/yalantis/ucrop/view/UCropView;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    .line 29
    sget v1, Lcom/yalantis/ucrop/R$id;->view_overlay:I

    invoke-virtual {p0, v1}, Lcom/yalantis/ucrop/view/UCropView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/yalantis/ucrop/view/OverlayView;

    iput-object v1, p0, Lcom/yalantis/ucrop/view/UCropView;->mViewOverlay:Lcom/yalantis/ucrop/view/OverlayView;

    .line 31
    sget-object v1, Lcom/yalantis/ucrop/R$styleable;->ucrop_UCropView:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 32
    .local v0, "a":Landroid/content/res/TypedArray;
    iget-object v1, p0, Lcom/yalantis/ucrop/view/UCropView;->mViewOverlay:Lcom/yalantis/ucrop/view/OverlayView;

    invoke-virtual {v1, v0}, Lcom/yalantis/ucrop/view/OverlayView;->processStyledAttributes(Landroid/content/res/TypedArray;)V

    .line 33
    iget-object v1, p0, Lcom/yalantis/ucrop/view/UCropView;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    invoke-virtual {v1, v0}, Lcom/yalantis/ucrop/view/GestureCropImageView;->processStyledAttributes(Landroid/content/res/TypedArray;)V

    .line 34
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 37
    iget-object v1, p0, Lcom/yalantis/ucrop/view/UCropView;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    new-instance v2, Lcom/yalantis/ucrop/view/UCropView$1;

    invoke-direct {v2, p0}, Lcom/yalantis/ucrop/view/UCropView$1;-><init>(Lcom/yalantis/ucrop/view/UCropView;)V

    invoke-virtual {v1, v2}, Lcom/yalantis/ucrop/view/GestureCropImageView;->setCropBoundsChangeListener(Lcom/yalantis/ucrop/callback/CropBoundsChangeListener;)V

    .line 43
    iget-object v1, p0, Lcom/yalantis/ucrop/view/UCropView;->mViewOverlay:Lcom/yalantis/ucrop/view/OverlayView;

    new-instance v2, Lcom/yalantis/ucrop/view/UCropView$2;

    invoke-direct {v2, p0}, Lcom/yalantis/ucrop/view/UCropView$2;-><init>(Lcom/yalantis/ucrop/view/UCropView;)V

    invoke-virtual {v1, v2}, Lcom/yalantis/ucrop/view/OverlayView;->setOverlayViewChangeListener(Lcom/yalantis/ucrop/callback/OverlayViewChangeListener;)V

    .line 49
    return-void
.end method

.method static synthetic access$000(Lcom/yalantis/ucrop/view/UCropView;)Lcom/yalantis/ucrop/view/OverlayView;
    .registers 2
    .param p0, "x0"    # Lcom/yalantis/ucrop/view/UCropView;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/yalantis/ucrop/view/UCropView;->mViewOverlay:Lcom/yalantis/ucrop/view/OverlayView;

    return-object v0
.end method

.method static synthetic access$100(Lcom/yalantis/ucrop/view/UCropView;)Lcom/yalantis/ucrop/view/GestureCropImageView;
    .registers 2
    .param p0, "x0"    # Lcom/yalantis/ucrop/view/UCropView;

    .prologue
    .line 15
    iget-object v0, p0, Lcom/yalantis/ucrop/view/UCropView;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    return-object v0
.end method


# virtual methods
.method public getCropImageView()Lcom/yalantis/ucrop/view/GestureCropImageView;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 58
    iget-object v0, p0, Lcom/yalantis/ucrop/view/UCropView;->mGestureCropImageView:Lcom/yalantis/ucrop/view/GestureCropImageView;

    return-object v0
.end method

.method public getOverlayView()Lcom/yalantis/ucrop/view/OverlayView;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 63
    iget-object v0, p0, Lcom/yalantis/ucrop/view/UCropView;->mViewOverlay:Lcom/yalantis/ucrop/view/OverlayView;

    return-object v0
.end method

.method public shouldDelayChildPressedState()Z
    .registers 2

    .prologue
    .line 53
    const/4 v0, 0x0

    return v0
.end method
