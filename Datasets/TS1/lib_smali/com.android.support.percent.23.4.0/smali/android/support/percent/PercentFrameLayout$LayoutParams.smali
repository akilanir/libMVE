.class public Landroid/support/percent/PercentFrameLayout$LayoutParams;
.super Landroid/widget/FrameLayout$LayoutParams;
.source "PercentFrameLayout.java"

# interfaces
.implements Landroid/support/percent/PercentLayoutHelper$PercentLayoutParams;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/percent/PercentFrameLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field private mPercentLayoutInfo:Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    .line 127
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 128
    return-void
.end method

.method public constructor <init>(III)V
    .registers 4
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "gravity"    # I

    .prologue
    .line 131
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 132
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 122
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 123
    invoke-static {p1, p2}, Landroid/support/percent/PercentLayoutHelper;->getPercentLayoutInfo(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    move-result-object v0

    iput-object v0, p0, Landroid/support/percent/PercentFrameLayout$LayoutParams;->mPercentLayoutInfo:Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .line 124
    return-void
.end method

.method public constructor <init>(Landroid/support/percent/PercentFrameLayout$LayoutParams;)V
    .registers 3
    .param p1, "source"    # Landroid/support/percent/PercentFrameLayout$LayoutParams;

    .prologue
    .line 148
    invoke-direct {p0, p1}, Landroid/support/percent/PercentFrameLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 149
    iget-object v0, p1, Landroid/support/percent/PercentFrameLayout$LayoutParams;->mPercentLayoutInfo:Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    iput-object v0, p0, Landroid/support/percent/PercentFrameLayout$LayoutParams;->mPercentLayoutInfo:Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .line 150
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 2
    .param p1, "source"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 135
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 136
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    .registers 2
    .param p1, "source"    # Landroid/view/ViewGroup$MarginLayoutParams;

    .prologue
    .line 139
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 140
    return-void
.end method

.method public constructor <init>(Landroid/widget/FrameLayout$LayoutParams;)V
    .registers 3
    .param p1, "source"    # Landroid/widget/FrameLayout$LayoutParams;

    .prologue
    .line 143
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 144
    iget v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iput v0, p0, Landroid/support/percent/PercentFrameLayout$LayoutParams;->gravity:I

    .line 145
    return-void
.end method


# virtual methods
.method public getPercentLayoutInfo()Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;
    .registers 2

    .prologue
    .line 154
    iget-object v0, p0, Landroid/support/percent/PercentFrameLayout$LayoutParams;->mPercentLayoutInfo:Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    if-nez v0, :cond_b

    .line 155
    new-instance v0, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    invoke-direct {v0}, Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;-><init>()V

    iput-object v0, p0, Landroid/support/percent/PercentFrameLayout$LayoutParams;->mPercentLayoutInfo:Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    .line 158
    :cond_b
    iget-object v0, p0, Landroid/support/percent/PercentFrameLayout$LayoutParams;->mPercentLayoutInfo:Landroid/support/percent/PercentLayoutHelper$PercentLayoutInfo;

    return-object v0
.end method

.method protected setBaseAttributes(Landroid/content/res/TypedArray;II)V
    .registers 4
    .param p1, "a"    # Landroid/content/res/TypedArray;
    .param p2, "widthAttr"    # I
    .param p3, "heightAttr"    # I

    .prologue
    .line 163
    invoke-static {p0, p1, p2, p3}, Landroid/support/percent/PercentLayoutHelper;->fetchWidthAndHeight(Landroid/view/ViewGroup$LayoutParams;Landroid/content/res/TypedArray;II)V

    .line 164
    return-void
.end method
