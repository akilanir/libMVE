.class final Landroid/support/v7/widget/GridLayout$7;
.super Landroid/support/v7/widget/GridLayout$Alignment;
.source "GridLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/GridLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 2632
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayout$Alignment;-><init>()V

    return-void
.end method


# virtual methods
.method public getAlignmentValue(Landroid/view/View;I)I
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "viewSize"    # I

    .prologue
    .line 2640
    const/high16 v0, -0x80000000

    return v0
.end method

.method getGravityOffset(Landroid/view/View;I)I
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "cellDelta"    # I

    .prologue
    .line 2635
    const/4 v0, 0x0

    return v0
.end method

.method public getSizeInCell(Landroid/view/View;II)I
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "viewSize"    # I
    .param p3, "cellSize"    # I

    .prologue
    .line 2645
    return p3
.end method
