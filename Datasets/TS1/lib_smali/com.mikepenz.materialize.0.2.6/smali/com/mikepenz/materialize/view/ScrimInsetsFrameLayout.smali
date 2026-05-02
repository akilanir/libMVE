.class public Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;
.super Landroid/widget/FrameLayout;
.source "ScrimInsetsFrameLayout.java"

# interfaces
.implements Lcom/mikepenz/materialize/view/IScrimInsetsLayout;


# instance fields
.field private mInsetForeground:Landroid/graphics/drawable/Drawable;

.field private mInsets:Landroid/graphics/Rect;

.field private mOnInsetsCallback:Lcom/mikepenz/materialize/view/OnInsetsCallback;

.field private mSystemUIVisible:Z

.field private mTempRect:Landroid/graphics/Rect;

.field private mTintNavigationBar:Z

.field private mTintStatusBar:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x1

    .line 49
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 41
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    .line 44
    iput-boolean v1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTintStatusBar:Z

    .line 45
    iput-boolean v1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTintNavigationBar:Z

    .line 46
    iput-boolean v1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mSystemUIVisible:Z

    .line 50
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 51
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x1

    .line 54
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 41
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    .line 44
    iput-boolean v1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTintStatusBar:Z

    .line 45
    iput-boolean v1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTintNavigationBar:Z

    .line 46
    iput-boolean v1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mSystemUIVisible:Z

    .line 55
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v1, 0x1

    .line 59
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    .line 44
    iput-boolean v1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTintStatusBar:Z

    .line 45
    iput-boolean v1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTintNavigationBar:Z

    .line 46
    iput-boolean v1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mSystemUIVisible:Z

    .line 60
    invoke-direct {p0, p1, p2, p3}, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 61
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 64
    sget-object v1, Lcom/mikepenz/materialize/R$styleable;->ScrimInsetsView:[I

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 66
    .local v0, "a":Landroid/content/res/TypedArray;
    if-nez v0, :cond_a

    .line 73
    :goto_9
    return-void

    .line 69
    :cond_a
    sget v1, Lcom/mikepenz/materialize/R$styleable;->ScrimInsetsView_siv_insetForeground:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    .line 70
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 72
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->setWillNotDraw(Z)V

    goto :goto_9
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v7, 0x0

    .line 88
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 90
    invoke-virtual {p0}, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->getWidth()I

    move-result v2

    .line 91
    .local v2, "width":I
    invoke-virtual {p0}, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->getHeight()I

    move-result v0

    .line 92
    .local v0, "height":I
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    if-eqz v3, :cond_b0

    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_b0

    .line 93
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v1

    .line 94
    .local v1, "sc":I
    invoke-virtual {p0}, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->getScrollX()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p0}, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->getScrollY()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 96
    iget-boolean v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mSystemUIVisible:Z

    if-nez v3, :cond_39

    .line 97
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iput v7, v3, Landroid/graphics/Rect;->top:I

    .line 98
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iput v7, v3, Landroid/graphics/Rect;->right:I

    .line 99
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iput v7, v3, Landroid/graphics/Rect;->bottom:I

    .line 100
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iput v7, v3, Landroid/graphics/Rect;->left:I

    .line 104
    :cond_39
    iget-boolean v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTintStatusBar:Z

    if-eqz v3, :cond_52

    .line 105
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    invoke-virtual {v3, v7, v7, v2, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 106
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 107
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 111
    :cond_52
    iget-boolean v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTintNavigationBar:Z

    if-eqz v3, :cond_6d

    .line 112
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    sub-int v4, v0, v4

    invoke-virtual {v3, v7, v4, v2, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 113
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 114
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 118
    :cond_6d
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    iget-object v5, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    iget-object v6, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    sub-int v6, v0, v6

    invoke-virtual {v3, v7, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 119
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 120
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 123
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    sub-int v4, v2, v4

    iget-object v5, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    iget-object v6, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    sub-int v6, v0, v6

    invoke-virtual {v3, v4, v5, v2, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 124
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 125
    iget-object v3, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 127
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 129
    .end local v1    # "sc":I
    :cond_b0
    return-void
.end method

.method protected fitSystemWindows(Landroid/graphics/Rect;)Z
    .registers 4
    .param p1, "insets"    # Landroid/graphics/Rect;

    .prologue
    const/4 v1, 0x1

    .line 77
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    .line 78
    iget-object v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_1d

    move v0, v1

    :goto_d
    invoke-virtual {p0, v0}, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->setWillNotDraw(Z)V

    .line 79
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 80
    iget-object v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mOnInsetsCallback:Lcom/mikepenz/materialize/view/OnInsetsCallback;

    if-eqz v0, :cond_1c

    .line 81
    iget-object v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mOnInsetsCallback:Lcom/mikepenz/materialize/view/OnInsetsCallback;

    invoke-interface {v0, p1}, Lcom/mikepenz/materialize/view/OnInsetsCallback;->onInsetsChanged(Landroid/graphics/Rect;)V

    .line 83
    :cond_1c
    return v1

    .line 78
    :cond_1d
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public getInsetForeground()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 154
    iget-object v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getOnInsetsCallback()Lcom/mikepenz/materialize/view/OnInsetsCallback;
    .registers 2

    .prologue
    .line 208
    iget-object v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mOnInsetsCallback:Lcom/mikepenz/materialize/view/OnInsetsCallback;

    return-object v0
.end method

.method public getView()Landroid/view/ViewGroup;
    .registers 1

    .prologue
    .line 149
    return-object p0
.end method

.method public isSystemUIVisible()Z
    .registers 2

    .prologue
    .line 188
    iget-boolean v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mSystemUIVisible:Z

    return v0
.end method

.method public isTintNavigationBar()Z
    .registers 2

    .prologue
    .line 179
    iget-boolean v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTintNavigationBar:Z

    return v0
.end method

.method public isTintStatusBar()Z
    .registers 2

    .prologue
    .line 169
    iget-boolean v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTintStatusBar:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 133
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 134
    iget-object v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_c

    .line 135
    iget-object v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 137
    :cond_c
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 141
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 142
    iget-object v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_d

    .line 143
    iget-object v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 145
    :cond_d
    return-void
.end method

.method public setInsetForeground(I)V
    .registers 3
    .param p1, "mInsetForegroundColor"    # I

    .prologue
    .line 164
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    .line 165
    return-void
.end method

.method public setInsetForeground(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "mInsetForeground"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 159
    iput-object p1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    .line 160
    return-void
.end method

.method public setOnInsetsCallback(Lcom/mikepenz/materialize/view/OnInsetsCallback;)V
    .registers 2
    .param p1, "onInsetsCallback"    # Lcom/mikepenz/materialize/view/OnInsetsCallback;

    .prologue
    .line 203
    iput-object p1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mOnInsetsCallback:Lcom/mikepenz/materialize/view/OnInsetsCallback;

    .line 204
    return-void
.end method

.method public setSystemUIVisible(Z)V
    .registers 2
    .param p1, "systemUIVisible"    # Z

    .prologue
    .line 192
    iput-boolean p1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mSystemUIVisible:Z

    .line 193
    return-void
.end method

.method public setTintNavigationBar(Z)V
    .registers 2
    .param p1, "mTintNavigationBar"    # Z

    .prologue
    .line 184
    iput-boolean p1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTintNavigationBar:Z

    .line 185
    return-void
.end method

.method public setTintStatusBar(Z)V
    .registers 2
    .param p1, "mTintStatusBar"    # Z

    .prologue
    .line 174
    iput-boolean p1, p0, Lcom/mikepenz/materialize/view/ScrimInsetsFrameLayout;->mTintStatusBar:Z

    .line 175
    return-void
.end method
