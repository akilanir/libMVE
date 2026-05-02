.class public Lcom/rey/material/widget/PopupWindow;
.super Landroid/widget/PopupWindow;
.source "PopupWindow.java"


# instance fields
.field private final mOverlapAnchor:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v2, 0x0

    .line 17
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 19
    sget-object v1, Lcom/rey/material/R$styleable;->PopupWindow:[I

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 20
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Lcom/rey/material/R$styleable;->PopupWindow_overlapAnchor:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Lcom/rey/material/widget/PopupWindow;->mOverlapAnchor:Z

    .line 21
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 23
    return-void
.end method


# virtual methods
.method public showAsDropDown(Landroid/view/View;II)V
    .registers 6
    .param p1, "anchor"    # Landroid/view/View;
    .param p2, "xoff"    # I
    .param p3, "yoff"    # I

    .prologue
    .line 27
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_f

    iget-boolean v0, p0, Lcom/rey/material/widget/PopupWindow;->mOverlapAnchor:Z

    if-eqz v0, :cond_f

    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    sub-int/2addr p3, v0

    .line 31
    :cond_f
    invoke-super {p0, p1, p2, p3}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;II)V

    .line 32
    return-void
.end method

.method public showAsDropDown(Landroid/view/View;III)V
    .registers 7
    .param p1, "anchor"    # Landroid/view/View;
    .param p2, "xoff"    # I
    .param p3, "yoff"    # I
    .param p4, "gravity"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x13
    .end annotation

    .prologue
    .line 37
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_f

    iget-boolean v0, p0, Lcom/rey/material/widget/PopupWindow;->mOverlapAnchor:Z

    if-eqz v0, :cond_f

    .line 39
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    sub-int/2addr p3, v0

    .line 41
    :cond_f
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/PopupWindow;->showAsDropDown(Landroid/view/View;III)V

    .line 42
    return-void
.end method

.method public update(Landroid/view/View;IIII)V
    .registers 8
    .param p1, "anchor"    # Landroid/view/View;
    .param p2, "xoff"    # I
    .param p3, "yoff"    # I
    .param p4, "width"    # I
    .param p5, "height"    # I

    .prologue
    .line 46
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_f

    iget-boolean v0, p0, Lcom/rey/material/widget/PopupWindow;->mOverlapAnchor:Z

    if-eqz v0, :cond_f

    .line 48
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    sub-int/2addr p3, v0

    .line 50
    :cond_f
    invoke-super/range {p0 .. p5}, Landroid/widget/PopupWindow;->update(Landroid/view/View;IIII)V

    .line 51
    return-void
.end method
