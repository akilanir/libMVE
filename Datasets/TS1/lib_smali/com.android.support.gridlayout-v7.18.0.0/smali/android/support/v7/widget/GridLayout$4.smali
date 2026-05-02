.class final Landroid/support/v7/widget/GridLayout$4;
.super Landroid/support/v7/widget/GridLayout$Alignment;
.source "GridLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v7/widget/GridLayout;->createSwitchingAlignment(Landroid/support/v7/widget/GridLayout$Alignment;Landroid/support/v7/widget/GridLayout$Alignment;)Landroid/support/v7/widget/GridLayout$Alignment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$ltr:Landroid/support/v7/widget/GridLayout$Alignment;

.field final synthetic val$rtl:Landroid/support/v7/widget/GridLayout$Alignment;


# direct methods
.method constructor <init>(Landroid/support/v7/widget/GridLayout$Alignment;Landroid/support/v7/widget/GridLayout$Alignment;)V
    .registers 3

    .prologue
    .line 2530
    iput-object p1, p0, Landroid/support/v7/widget/GridLayout$4;->val$ltr:Landroid/support/v7/widget/GridLayout$Alignment;

    iput-object p2, p0, Landroid/support/v7/widget/GridLayout$4;->val$rtl:Landroid/support/v7/widget/GridLayout$Alignment;

    invoke-direct {p0}, Landroid/support/v7/widget/GridLayout$Alignment;-><init>()V

    return-void
.end method


# virtual methods
.method public getAlignmentValue(Landroid/view/View;I)I
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "viewSize"    # I

    .prologue
    .line 2538
    invoke-static {p1}, Landroid/support/v7/widget/ViewGroup;->isLayoutRtl(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$4;->val$ltr:Landroid/support/v7/widget/GridLayout$Alignment;

    :goto_8
    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/GridLayout$Alignment;->getAlignmentValue(Landroid/view/View;I)I

    move-result v0

    return v0

    :cond_d
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$4;->val$rtl:Landroid/support/v7/widget/GridLayout$Alignment;

    goto :goto_8
.end method

.method getGravityOffset(Landroid/view/View;I)I
    .registers 4
    .param p1, "view"    # Landroid/view/View;
    .param p2, "cellDelta"    # I

    .prologue
    .line 2533
    invoke-static {p1}, Landroid/support/v7/widget/ViewGroup;->isLayoutRtl(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_d

    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$4;->val$ltr:Landroid/support/v7/widget/GridLayout$Alignment;

    :goto_8
    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/GridLayout$Alignment;->getGravityOffset(Landroid/view/View;I)I

    move-result v0

    return v0

    :cond_d
    iget-object v0, p0, Landroid/support/v7/widget/GridLayout$4;->val$rtl:Landroid/support/v7/widget/GridLayout$Alignment;

    goto :goto_8
.end method
