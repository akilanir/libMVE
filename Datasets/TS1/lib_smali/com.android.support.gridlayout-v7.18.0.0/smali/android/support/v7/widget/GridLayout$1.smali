.class final Landroid/support/v7/widget/GridLayout$1;
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
    .line 2461
    invoke-direct {p0}, Landroid/support/v7/widget/GridLayout$Alignment;-><init>()V

    return-void
.end method


# virtual methods
.method public getAlignmentValue(Landroid/view/View;I)I
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "viewSize"    # I

    .prologue
    .line 2469
    const/high16 v0, -0x80000000

    return v0
.end method

.method getGravityOffset(Landroid/view/View;I)I
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "cellDelta"    # I

    .prologue
    .line 2464
    const/high16 v0, -0x80000000

    return v0
.end method
