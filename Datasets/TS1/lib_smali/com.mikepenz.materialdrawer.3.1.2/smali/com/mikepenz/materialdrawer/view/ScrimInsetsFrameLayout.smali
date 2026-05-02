.class public Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;
.super Landroid/widget/FrameLayout;
.source "ScrimInsetsFrameLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout$OnInsetsCallback;
    }
.end annotation


# instance fields
.field private mEnabled:Z

.field private mInsetForeground:Landroid/graphics/drawable/Drawable;

.field private mInsets:Landroid/graphics/Rect;

.field private mOnInsetsCallback:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout$OnInsetsCallback;

.field private mTempRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 46
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 40
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mEnabled:Z

    .line 47
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 40
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mEnabled:Z

    .line 52
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 53
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 56
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 40
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    .line 43
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mEnabled:Z

    .line 57
    invoke-direct {p0, p1, p2, p3}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->init(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 58
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 61
    sget-object v1, Lcom/mikepenz/materialdrawer/R$styleable;->ScrimInsetsView:[I

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 63
    .local v0, "a":Landroid/content/res/TypedArray;
    if-nez v0, :cond_a

    .line 70
    :goto_9
    return-void

    .line 66
    :cond_a
    sget v1, Lcom/mikepenz/materialdrawer/R$styleable;->ScrimInsetsView_siv_insetForeground:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    .line 67
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 69
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->setWillNotDraw(Z)V

    goto :goto_9
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .registers 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v7, 0x0

    .line 85
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 87
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->getWidth()I

    move-result v2

    .line 88
    .local v2, "width":I
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->getHeight()I

    move-result v0

    .line 89
    .local v0, "height":I
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    if-eqz v3, :cond_94

    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_94

    .line 90
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v1

    .line 91
    .local v1, "sc":I
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->getScrollX()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->getScrollY()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 94
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    invoke-virtual {v3, v7, v7, v2, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 95
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 96
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 99
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    sub-int v4, v0, v4

    invoke-virtual {v3, v7, v4, v2, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 100
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 101
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 104
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->left:I

    iget-object v6, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    sub-int v6, v0, v6

    invoke-virtual {v3, v7, v4, v5, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 105
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 106
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 109
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    sub-int v4, v2, v4

    iget-object v5, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    iget-object v6, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    sub-int v6, v0, v6

    invoke-virtual {v3, v4, v5, v2, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 110
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 111
    iget-object v3, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 113
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 115
    .end local v1    # "sc":I
    :cond_94
    return-void
.end method

.method protected fitSystemWindows(Landroid/graphics/Rect;)Z
    .registers 4
    .param p1, "insets"    # Landroid/graphics/Rect;

    .prologue
    const/4 v1, 0x1

    .line 74
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsets:Landroid/graphics/Rect;

    .line 75
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_1d

    move v0, v1

    :goto_d
    invoke-virtual {p0, v0}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->setWillNotDraw(Z)V

    .line 76
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 77
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mOnInsetsCallback:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout$OnInsetsCallback;

    if-eqz v0, :cond_1c

    .line 78
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mOnInsetsCallback:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout$OnInsetsCallback;

    invoke-interface {v0, p1}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout$OnInsetsCallback;->onInsetsChanged(Landroid/graphics/Rect;)V

    .line 80
    :cond_1c
    return v1

    .line 75
    :cond_1d
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public getInsetForeground()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 135
    iget-boolean v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mEnabled:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 2

    .prologue
    .line 119
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 120
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_c

    .line 121
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 123
    :cond_c
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 3

    .prologue
    .line 127
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 128
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_d

    .line 129
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 131
    :cond_d
    return-void
.end method

.method public setEnabled(Z)V
    .registers 2
    .param p1, "enabled"    # Z

    .prologue
    .line 139
    iput-boolean p1, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mEnabled:Z

    .line 141
    invoke-virtual {p0}, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->invalidate()V

    .line 142
    return-void
.end method

.method public setInsetForeground(I)V
    .registers 3
    .param p1, "mInsetForegroundColor"    # I

    .prologue
    .line 154
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v0, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    .line 155
    return-void
.end method

.method public setInsetForeground(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1, "mInsetForeground"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 150
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mInsetForeground:Landroid/graphics/drawable/Drawable;

    .line 151
    return-void
.end method

.method public setOnInsetsCallback(Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout$OnInsetsCallback;)V
    .registers 2
    .param p1, "onInsetsCallback"    # Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout$OnInsetsCallback;

    .prologue
    .line 164
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout;->mOnInsetsCallback:Lcom/mikepenz/materialdrawer/view/ScrimInsetsFrameLayout$OnInsetsCallback;

    .line 165
    return-void
.end method
