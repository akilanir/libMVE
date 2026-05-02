.class public Lcom/rey/material/widget/ImageButton;
.super Landroid/widget/ImageButton;
.source "ImageButton.java"

# interfaces
.implements Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;


# instance fields
.field protected mCurrentStyle:I

.field private mRippleManager:Lcom/rey/material/widget/RippleManager;

.field protected mStyleId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 22
    invoke-direct {p0, p1}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 19
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/ImageButton;->mCurrentStyle:I

    .line 24
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v1, v1}, Lcom/rey/material/widget/ImageButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 28
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 19
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/ImageButton;->mCurrentStyle:I

    .line 30
    invoke-virtual {p0, p1, p2, v1, v1}, Lcom/rey/material/widget/ImageButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/ImageButton;->mCurrentStyle:I

    .line 36
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/rey/material/widget/ImageButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 37
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
    .line 41
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 19
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/ImageButton;->mCurrentStyle:I

    .line 43
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/ImageButton;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 44
    return-void
.end method


# virtual methods
.method public applyStyle(I)V
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 53
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyStyle(Landroid/view/View;I)V

    .line 54
    invoke-virtual {p0}, Lcom/rey/material/widget/ImageButton;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/rey/material/widget/ImageButton;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 55
    return-void
.end method

.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/rey/material/widget/ImageButton;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/rey/material/widget/RippleManager;->onCreate(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 59
    return-void
.end method

.method protected getRippleManager()Lcom/rey/material/widget/RippleManager;
    .registers 3

    .prologue
    .line 97
    iget-object v0, p0, Lcom/rey/material/widget/ImageButton;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    if-nez v0, :cond_13

    .line 98
    const-class v1, Lcom/rey/material/widget/RippleManager;

    monitor-enter v1

    .line 99
    :try_start_7
    iget-object v0, p0, Lcom/rey/material/widget/ImageButton;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    if-nez v0, :cond_12

    .line 100
    new-instance v0, Lcom/rey/material/widget/RippleManager;

    invoke-direct {v0}, Lcom/rey/material/widget/RippleManager;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/ImageButton;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    .line 101
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 104
    :cond_13
    iget-object v0, p0, Lcom/rey/material/widget/ImageButton;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    return-object v0

    .line 101
    :catchall_16
    move-exception v0

    :try_start_17
    monitor-exit v1
    :try_end_18
    .catchall {:try_start_17 .. :try_end_18} :catchall_16

    throw v0
.end method

.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 47
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/ImageButton;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 48
    invoke-virtual {p0}, Lcom/rey/material/widget/ImageButton;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_f

    .line 49
    invoke-static {p1, p2, p3, p4}, Lcom/rey/material/app/ThemeManager;->getStyleId(Landroid/content/Context;Landroid/util/AttributeSet;II)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/ImageButton;->mStyleId:I

    .line 50
    :cond_f
    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 72
    invoke-super {p0}, Landroid/widget/ImageButton;->onAttachedToWindow()V

    .line 73
    iget v0, p0, Lcom/rey/material/widget/ImageButton;->mStyleId:I

    if-eqz v0, :cond_12

    .line 74
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->registerOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 75
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/ImageButton;->onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V

    .line 77
    :cond_12
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 81
    invoke-super {p0}, Landroid/widget/ImageButton;->onDetachedFromWindow()V

    .line 82
    invoke-static {p0}, Lcom/rey/material/widget/RippleManager;->cancelRipple(Landroid/view/View;)V

    .line 83
    iget v0, p0, Lcom/rey/material/widget/ImageButton;->mStyleId:I

    if-eqz v0, :cond_11

    .line 84
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->unregisterOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 85
    :cond_11
    return-void
.end method

.method public onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V
    .registers 5
    .param p1, "event"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;

    .prologue
    .line 63
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/ImageButton;->mStyleId:I

    invoke-virtual {v1, v2}, Lcom/rey/material/app/ThemeManager;->getCurrentStyle(I)I

    move-result v0

    .line 64
    .local v0, "style":I
    iget v1, p0, Lcom/rey/material/widget/ImageButton;->mCurrentStyle:I

    if-eq v1, v0, :cond_15

    .line 65
    iput v0, p0, Lcom/rey/material/widget/ImageButton;->mCurrentStyle:I

    .line 66
    iget v1, p0, Lcom/rey/material/widget/ImageButton;->mCurrentStyle:I

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/ImageButton;->applyStyle(I)V

    .line 68
    :cond_15
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4
    .param p1, "event"    # Landroid/view/MotionEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 120
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 121
    .local v0, "result":Z
    invoke-virtual {p0}, Lcom/rey/material/widget/ImageButton;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v1

    invoke-virtual {v1, p0, p1}, Lcom/rey/material/widget/RippleManager;->onTouchEvent(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v1

    if-nez v1, :cond_10

    if-eqz v0, :cond_12

    :cond_10
    const/4 v1, 0x1

    :goto_11
    return v1

    :cond_12
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 4
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/rey/material/widget/ImageButton;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 90
    .local v0, "background":Landroid/graphics/drawable/Drawable;
    instance-of v1, v0, Lcom/rey/material/drawable/RippleDrawable;

    if-eqz v1, :cond_12

    instance-of v1, p1, Lcom/rey/material/drawable/RippleDrawable;

    if-nez v1, :cond_12

    .line 91
    check-cast v0, Lcom/rey/material/drawable/RippleDrawable;

    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/RippleDrawable;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 94
    :goto_11
    return-void

    .line 93
    .restart local v0    # "background":Landroid/graphics/drawable/Drawable;
    :cond_12
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_11
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 3
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 109
    invoke-virtual {p0}, Lcom/rey/material/widget/ImageButton;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v0

    .line 110
    .local v0, "rippleManager":Lcom/rey/material/widget/RippleManager;
    if-ne p1, v0, :cond_a

    .line 111
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    :goto_9
    return-void

    .line 113
    :cond_a
    invoke-virtual {v0, p1}, Lcom/rey/material/widget/RippleManager;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_9
.end method
