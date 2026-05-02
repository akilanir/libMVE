.class public Lcom/rey/material/widget/CircleCheckedTextView;
.super Landroid/widget/CheckedTextView;
.source "CircleCheckedTextView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/rey/material/widget/CircleCheckedTextView$OnCheckedChangeListener;
    }
.end annotation


# instance fields
.field private mBackground:Lcom/rey/material/drawable/CircleDrawable;

.field private mCheckedChangeListener:Lcom/rey/material/widget/CircleCheckedTextView$OnCheckedChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 27
    invoke-direct {p0, p1}, Landroid/widget/CheckedTextView;-><init>(Landroid/content/Context;)V

    .line 29
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v1, v1}, Lcom/rey/material/widget/CircleCheckedTextView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v0, 0x0

    .line 33
    invoke-direct {p0, p1, p2}, Landroid/widget/CheckedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/rey/material/widget/CircleCheckedTextView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 36
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 39
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/CheckedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/rey/material/widget/CircleCheckedTextView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 46
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/CheckedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 48
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/rey/material/widget/CircleCheckedTextView;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 49
    return-void
.end method


# virtual methods
.method protected init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v2, 0x0

    .line 52
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/rey/material/widget/CircleCheckedTextView;->setGravity(I)V

    .line 53
    invoke-virtual {p0, v2, v2, v2, v2}, Lcom/rey/material/widget/CircleCheckedTextView;->setPadding(IIII)V

    .line 55
    new-instance v0, Lcom/rey/material/drawable/CircleDrawable;

    invoke-direct {v0}, Lcom/rey/material/drawable/CircleDrawable;-><init>()V

    iput-object v0, p0, Lcom/rey/material/widget/CircleCheckedTextView;->mBackground:Lcom/rey/material/drawable/CircleDrawable;

    .line 56
    iget-object v0, p0, Lcom/rey/material/widget/CircleCheckedTextView;->mBackground:Lcom/rey/material/drawable/CircleDrawable;

    invoke-virtual {p0}, Lcom/rey/material/widget/CircleCheckedTextView;->isInEditMode()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/CircleDrawable;->setInEditMode(Z)V

    .line 57
    iget-object v0, p0, Lcom/rey/material/widget/CircleCheckedTextView;->mBackground:Lcom/rey/material/drawable/CircleDrawable;

    invoke-virtual {v0, v2}, Lcom/rey/material/drawable/CircleDrawable;->setAnimEnable(Z)V

    .line 58
    iget-object v0, p0, Lcom/rey/material/widget/CircleCheckedTextView;->mBackground:Lcom/rey/material/drawable/CircleDrawable;

    invoke-static {p0, v0}, Lcom/rey/material/util/ViewUtil;->setBackground(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 59
    iget-object v0, p0, Lcom/rey/material/widget/CircleCheckedTextView;->mBackground:Lcom/rey/material/drawable/CircleDrawable;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/CircleDrawable;->setAnimEnable(Z)V

    .line 60
    return-void
.end method

.method public setAnimDuration(I)V
    .registers 3
    .param p1, "duration"    # I

    .prologue
    .line 86
    iget-object v0, p0, Lcom/rey/material/widget/CircleCheckedTextView;->mBackground:Lcom/rey/material/drawable/CircleDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/CircleDrawable;->setAnimDuration(I)V

    .line 87
    return-void
.end method

.method public setBackgroundColor(I)V
    .registers 3
    .param p1, "color"    # I

    .prologue
    .line 78
    iget-object v0, p0, Lcom/rey/material/widget/CircleCheckedTextView;->mBackground:Lcom/rey/material/drawable/CircleDrawable;

    invoke-virtual {v0, p1}, Lcom/rey/material/drawable/CircleDrawable;->setColor(I)V

    .line 79
    return-void
.end method

.method public setChecked(Z)V
    .registers 4
    .param p1, "checked"    # Z

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/rey/material/widget/CircleCheckedTextView;->isChecked()Z

    move-result v0

    .line 97
    .local v0, "oldCheck":Z
    if-eq v0, p1, :cond_12

    .line 98
    invoke-super {p0, p1}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    .line 100
    iget-object v1, p0, Lcom/rey/material/widget/CircleCheckedTextView;->mCheckedChangeListener:Lcom/rey/material/widget/CircleCheckedTextView$OnCheckedChangeListener;

    if-eqz v1, :cond_12

    .line 101
    iget-object v1, p0, Lcom/rey/material/widget/CircleCheckedTextView;->mCheckedChangeListener:Lcom/rey/material/widget/CircleCheckedTextView$OnCheckedChangeListener;

    invoke-interface {v1, p0, p1}, Lcom/rey/material/widget/CircleCheckedTextView$OnCheckedChangeListener;->onCheckedChanged(Lcom/rey/material/widget/CircleCheckedTextView;Z)V

    .line 103
    :cond_12
    return-void
.end method

.method public setCheckedImmediately(Z)V
    .registers 4
    .param p1, "checked"    # Z

    .prologue
    .line 106
    iget-object v0, p0, Lcom/rey/material/widget/CircleCheckedTextView;->mBackground:Lcom/rey/material/drawable/CircleDrawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/CircleDrawable;->setAnimEnable(Z)V

    .line 107
    invoke-virtual {p0, p1}, Lcom/rey/material/widget/CircleCheckedTextView;->setChecked(Z)V

    .line 108
    iget-object v0, p0, Lcom/rey/material/widget/CircleCheckedTextView;->mBackground:Lcom/rey/material/drawable/CircleDrawable;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/rey/material/drawable/CircleDrawable;->setAnimEnable(Z)V

    .line 109
    return-void
.end method

.method public setInterpolator(Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;)V
    .registers 4
    .param p1, "in"    # Landroid/view/animation/Interpolator;
    .param p2, "out"    # Landroid/view/animation/Interpolator;

    .prologue
    .line 90
    iget-object v0, p0, Lcom/rey/material/widget/CircleCheckedTextView;->mBackground:Lcom/rey/material/drawable/CircleDrawable;

    invoke-virtual {v0, p1, p2}, Lcom/rey/material/drawable/CircleDrawable;->setInterpolator(Landroid/view/animation/Interpolator;Landroid/view/animation/Interpolator;)V

    .line 91
    return-void
.end method

.method public setOnCheckedChangeListener(Lcom/rey/material/widget/CircleCheckedTextView$OnCheckedChangeListener;)V
    .registers 2
    .param p1, "listener"    # Lcom/rey/material/widget/CircleCheckedTextView$OnCheckedChangeListener;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/rey/material/widget/CircleCheckedTextView;->mCheckedChangeListener:Lcom/rey/material/widget/CircleCheckedTextView$OnCheckedChangeListener;

    .line 64
    return-void
.end method

.method public setTextAppearance(I)V
    .registers 2
    .param p1, "resId"    # I

    .prologue
    .line 68
    invoke-static {p0, p1}, Lcom/rey/material/util/ViewUtil;->applyTextAppearance(Landroid/widget/TextView;I)V

    .line 69
    return-void
.end method

.method public setTextAppearance(Landroid/content/Context;I)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resId"    # I

    .prologue
    .line 73
    invoke-static {p0, p2}, Lcom/rey/material/util/ViewUtil;->applyTextAppearance(Landroid/widget/TextView;I)V

    .line 74
    return-void
.end method
