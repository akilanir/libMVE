.class Lcom/balysv/materialripple/MaterialRippleLayout$PerformClickEvent;
.super Ljava/lang/Object;
.source "MaterialRippleLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/balysv/materialripple/MaterialRippleLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PerformClickEvent"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/balysv/materialripple/MaterialRippleLayout;


# direct methods
.method private constructor <init>(Lcom/balysv/materialripple/MaterialRippleLayout;)V
    .registers 2

    .prologue
    .line 635
    iput-object p1, p0, Lcom/balysv/materialripple/MaterialRippleLayout$PerformClickEvent;->this$0:Lcom/balysv/materialripple/MaterialRippleLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/balysv/materialripple/MaterialRippleLayout;Lcom/balysv/materialripple/MaterialRippleLayout$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/balysv/materialripple/MaterialRippleLayout;
    .param p2, "x1"    # Lcom/balysv/materialripple/MaterialRippleLayout$1;

    .prologue
    .line 635
    invoke-direct {p0, p1}, Lcom/balysv/materialripple/MaterialRippleLayout$PerformClickEvent;-><init>(Lcom/balysv/materialripple/MaterialRippleLayout;)V

    return-void
.end method

.method private clickAdapterView(Landroid/widget/AdapterView;)V
    .registers 6
    .param p1, "parent"    # Landroid/widget/AdapterView;

    .prologue
    .line 653
    iget-object v3, p0, Lcom/balysv/materialripple/MaterialRippleLayout$PerformClickEvent;->this$0:Lcom/balysv/materialripple/MaterialRippleLayout;

    invoke-virtual {p1, v3}, Landroid/widget/AdapterView;->getPositionForView(Landroid/view/View;)I

    move-result v2

    .line 654
    .local v2, "position":I
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v3

    if-eqz v3, :cond_1d

    .line 655
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getAdapter()Landroid/widget/Adapter;

    move-result-object v3

    invoke-interface {v3, v2}, Landroid/widget/Adapter;->getItemId(I)J

    move-result-wide v0

    .line 657
    .local v0, "itemId":J
    :goto_14
    const/4 v3, -0x1

    if-eq v2, v3, :cond_1c

    .line 658
    iget-object v3, p0, Lcom/balysv/materialripple/MaterialRippleLayout$PerformClickEvent;->this$0:Lcom/balysv/materialripple/MaterialRippleLayout;

    invoke-virtual {p1, v3, v2, v0, v1}, Landroid/widget/AdapterView;->performItemClick(Landroid/view/View;IJ)Z

    .line 660
    :cond_1c
    return-void

    .line 655
    .end local v0    # "itemId":J
    :cond_1d
    const-wide/16 v0, 0x0

    goto :goto_14
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 638
    iget-object v0, p0, Lcom/balysv/materialripple/MaterialRippleLayout$PerformClickEvent;->this$0:Lcom/balysv/materialripple/MaterialRippleLayout;

    # getter for: Lcom/balysv/materialripple/MaterialRippleLayout;->hasPerformedLongPress:Z
    invoke-static {v0}, Lcom/balysv/materialripple/MaterialRippleLayout;->access$200(Lcom/balysv/materialripple/MaterialRippleLayout;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 650
    :goto_8
    return-void

    .line 641
    :cond_9
    iget-object v0, p0, Lcom/balysv/materialripple/MaterialRippleLayout$PerformClickEvent;->this$0:Lcom/balysv/materialripple/MaterialRippleLayout;

    invoke-virtual {v0}, Lcom/balysv/materialripple/MaterialRippleLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/widget/AdapterView;

    if-eqz v0, :cond_1f

    .line 642
    iget-object v0, p0, Lcom/balysv/materialripple/MaterialRippleLayout$PerformClickEvent;->this$0:Lcom/balysv/materialripple/MaterialRippleLayout;

    invoke-virtual {v0}, Lcom/balysv/materialripple/MaterialRippleLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/AdapterView;

    invoke-direct {p0, v0}, Lcom/balysv/materialripple/MaterialRippleLayout$PerformClickEvent;->clickAdapterView(Landroid/widget/AdapterView;)V

    goto :goto_8

    .line 643
    :cond_1f
    iget-object v0, p0, Lcom/balysv/materialripple/MaterialRippleLayout$PerformClickEvent;->this$0:Lcom/balysv/materialripple/MaterialRippleLayout;

    # getter for: Lcom/balysv/materialripple/MaterialRippleLayout;->rippleInAdapter:Z
    invoke-static {v0}, Lcom/balysv/materialripple/MaterialRippleLayout;->access$1000(Lcom/balysv/materialripple/MaterialRippleLayout;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 645
    iget-object v0, p0, Lcom/balysv/materialripple/MaterialRippleLayout$PerformClickEvent;->this$0:Lcom/balysv/materialripple/MaterialRippleLayout;

    # invokes: Lcom/balysv/materialripple/MaterialRippleLayout;->findParentAdapterView()Landroid/widget/AdapterView;
    invoke-static {v0}, Lcom/balysv/materialripple/MaterialRippleLayout;->access$1100(Lcom/balysv/materialripple/MaterialRippleLayout;)Landroid/widget/AdapterView;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/balysv/materialripple/MaterialRippleLayout$PerformClickEvent;->clickAdapterView(Landroid/widget/AdapterView;)V

    goto :goto_8

    .line 648
    :cond_31
    iget-object v0, p0, Lcom/balysv/materialripple/MaterialRippleLayout$PerformClickEvent;->this$0:Lcom/balysv/materialripple/MaterialRippleLayout;

    # getter for: Lcom/balysv/materialripple/MaterialRippleLayout;->childView:Landroid/view/View;
    invoke-static {v0}, Lcom/balysv/materialripple/MaterialRippleLayout;->access$100(Lcom/balysv/materialripple/MaterialRippleLayout;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->performClick()Z

    goto :goto_8
.end method
