.class public Lcom/rey/material/widget/LinearLayout;
.super Landroid/widget/LinearLayout;
.source "LinearLayout.java"

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

    .line 23
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 20
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/LinearLayout;->mCurrentStyle:I

    .line 25
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v1, v1}, Lcom/rey/material/widget/LinearLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 26
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/LinearLayout;->mCurrentStyle:I

    .line 31
    invoke-virtual {p0, p1, p2, v1, v1}, Lcom/rey/material/widget/LinearLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 20
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/LinearLayout;->mCurrentStyle:I

    .line 38
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/rey/material/widget/LinearLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 39
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
    .line 43
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 20
    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/rey/material/widget/LinearLayout;->mCurrentStyle:I

    .line 45
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/LinearLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 46
    return-void
.end method


# virtual methods
.method public applyStyle(I)V
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 55
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyStyle(Landroid/view/View;I)V

    .line 56
    invoke-virtual {p0}, Lcom/rey/material/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/rey/material/widget/LinearLayout;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 57
    return-void
.end method

.method protected applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 60
    invoke-virtual {p0}, Lcom/rey/material/widget/LinearLayout;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Lcom/rey/material/widget/RippleManager;->onCreate(Landroid/view/View;Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 61
    return-void
.end method

.method protected getRippleManager()Lcom/rey/material/widget/RippleManager;
    .registers 3

    .prologue
    .line 99
    iget-object v0, p0, Lcom/rey/material/widget/LinearLayout;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    if-nez v0, :cond_13

    .line 100
    const-class v1, Lcom/rey/material/widget/RippleManager;

    monitor-enter v1

    .line 101
    :try_start_7
    iget-object v0, p0, Lcom/rey/material/widget/LinearLayout;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    if-nez v0, :cond_12

    .line 102
    new-instance v0, Lcom/rey/material/widget/RippleManager;

    invoke-direct {v0}, Lcom/rey/material/widget/RippleManager;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/LinearLayout;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    .line 103
    :cond_12
    monitor-exit v1
    :try_end_13
    .catchall {:try_start_7 .. :try_end_13} :catchall_16

    .line 106
    :cond_13
    iget-object v0, p0, Lcom/rey/material/widget/LinearLayout;->mRippleManager:Lcom/rey/material/widget/RippleManager;

    return-object v0

    .line 103
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
    .line 49
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/LinearLayout;->applyStyle(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 50
    invoke-virtual {p0}, Lcom/rey/material/widget/LinearLayout;->isInEditMode()Z

    move-result v0

    if-nez v0, :cond_f

    .line 51
    invoke-static {p1, p2, p3, p4}, Lcom/rey/material/app/ThemeManager;->getStyleId(Landroid/content/Context;Landroid/util/AttributeSet;II)I

    move-result v0

    iput v0, p0, Lcom/rey/material/widget/LinearLayout;->mStyleId:I

    .line 52
    :cond_f
    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 74
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 75
    iget v0, p0, Lcom/rey/material/widget/LinearLayout;->mStyleId:I

    if-eqz v0, :cond_12

    .line 76
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->registerOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 77
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/LinearLayout;->onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V

    .line 79
    :cond_12
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    .prologue
    .line 83
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 84
    invoke-static {p0}, Lcom/rey/material/widget/RippleManager;->cancelRipple(Landroid/view/View;)V

    .line 85
    iget v0, p0, Lcom/rey/material/widget/LinearLayout;->mStyleId:I

    if-eqz v0, :cond_11

    .line 86
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/rey/material/app/ThemeManager;->unregisterOnThemeChangedListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V

    .line 87
    :cond_11
    return-void
.end method

.method public onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V
    .registers 5
    .param p1, "event"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;

    .prologue
    .line 65
    invoke-static {}, Lcom/rey/material/app/ThemeManager;->getInstance()Lcom/rey/material/app/ThemeManager;

    move-result-object v1

    iget v2, p0, Lcom/rey/material/widget/LinearLayout;->mStyleId:I

    invoke-virtual {v1, v2}, Lcom/rey/material/app/ThemeManager;->getCurrentStyle(I)I

    move-result v0

    .line 66
    .local v0, "style":I
    iget v1, p0, Lcom/rey/material/widget/LinearLayout;->mCurrentStyle:I

    if-eq v1, v0, :cond_15

    .line 67
    iput v0, p0, Lcom/rey/material/widget/LinearLayout;->mCurrentStyle:I

    .line 68
    iget v1, p0, Lcom/rey/material/widget/LinearLayout;->mCurrentStyle:I

    invoke-virtual {p0, v1}, Lcom/rey/material/widget/LinearLayout;->applyStyle(I)V

    .line 70
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
    .line 122
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 123
    .local v0, "result":Z
    invoke-virtual {p0}, Lcom/rey/material/widget/LinearLayout;->getRippleManager()Lcom/rey/material/widget/RippleManager;

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
    .line 91
    invoke-virtual {p0}, Lcom/rey/material/widget/LinearLayout;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 92
    .local v0, "background":Landroid/graphics/drawable/Drawable;
    instance-of v1, v0, Lcom/rey/material/drawable/RippleDrawable;

    if-eqz v1, :cond_12

    instance-of v1, p1, Lcom/rey/material/drawable/RippleDrawable;

    if-nez v1, :cond_12

    .line 93
    check-cast v0, Lcom/rey/material/drawable/RippleDrawable;

    .end local v0    # "background":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/RippleDrawable;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 96
    :goto_11
    return-void

    .line 95
    .restart local v0    # "background":Landroid/graphics/drawable/Drawable;
    :cond_12
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_11
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .registers 3
    .param p1, "l"    # Landroid/view/View$OnClickListener;

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/rey/material/widget/LinearLayout;->getRippleManager()Lcom/rey/material/widget/RippleManager;

    move-result-object v0

    .line 112
    .local v0, "rippleManager":Lcom/rey/material/widget/RippleManager;
    if-ne p1, v0, :cond_a

    .line 113
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 118
    :goto_9
    return-void

    .line 115
    :cond_a
    invoke-virtual {v0, p1}, Lcom/rey/material/widget/RippleManager;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    invoke-virtual {p0, v0}, Lcom/rey/material/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_9
.end method
