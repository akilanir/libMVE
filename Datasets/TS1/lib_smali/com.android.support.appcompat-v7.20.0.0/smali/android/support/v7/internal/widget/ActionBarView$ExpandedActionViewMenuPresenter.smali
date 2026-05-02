.class Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;
.super Ljava/lang/Object;
.source "ActionBarView.java"

# interfaces
.implements Landroid/support/v7/internal/view/menu/MenuPresenter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/internal/widget/ActionBarView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExpandedActionViewMenuPresenter"
.end annotation


# instance fields
.field mCurrentExpandedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

.field mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

.field final synthetic this$0:Landroid/support/v7/internal/widget/ActionBarView;


# direct methods
.method private constructor <init>(Landroid/support/v7/internal/widget/ActionBarView;)V
    .registers 2

    .prologue
    .line 1377
    iput-object p1, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v7/internal/widget/ActionBarView;Landroid/support/v7/internal/widget/ActionBarView$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v7/internal/widget/ActionBarView;
    .param p2, "x1"    # Landroid/support/v7/internal/widget/ActionBarView$1;

    .prologue
    .line 1377
    invoke-direct {p0, p1}, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;-><init>(Landroid/support/v7/internal/widget/ActionBarView;)V

    return-void
.end method


# virtual methods
.method public collapseItemActionView(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/support/v7/internal/view/menu/MenuItemImpl;)Z
    .registers 8
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "item"    # Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 1476
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarView;->mExpandedActionView:Landroid/view/View;

    instance-of v0, v0, Landroid/support/v7/view/CollapsibleActionView;

    if-eqz v0, :cond_14

    .line 1477
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarView;->mExpandedActionView:Landroid/view/View;

    check-cast v0, Landroid/support/v7/view/CollapsibleActionView;

    invoke-interface {v0}, Landroid/support/v7/view/CollapsibleActionView;->onActionViewCollapsed()V

    .line 1480
    :cond_14
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    iget-object v1, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    iget-object v1, v1, Landroid/support/v7/internal/widget/ActionBarView;->mExpandedActionView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ActionBarView;->removeView(Landroid/view/View;)V

    .line 1481
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    iget-object v1, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mExpandedHomeLayout:Landroid/support/v7/internal/widget/ActionBarView$HomeView;
    invoke-static {v1}, Landroid/support/v7/internal/widget/ActionBarView;->access$600(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/ActionBarView$HomeView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ActionBarView;->removeView(Landroid/view/View;)V

    .line 1482
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    iput-object v3, v0, Landroid/support/v7/internal/widget/ActionBarView;->mExpandedActionView:Landroid/view/View;

    .line 1483
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mDisplayOptions:I
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$1200(Landroid/support/v7/internal/widget/ActionBarView;)I

    move-result v0

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_3f

    .line 1484
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mHomeLayout:Landroid/support/v7/internal/widget/ActionBarView$HomeView;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$700(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/ActionBarView$HomeView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/support/v7/internal/widget/ActionBarView$HomeView;->setVisibility(I)V

    .line 1486
    :cond_3f
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mDisplayOptions:I
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$1200(Landroid/support/v7/internal/widget/ActionBarView;)I

    move-result v0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_56

    .line 1487
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mTitleLayout:Landroid/widget/LinearLayout;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$800(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/widget/LinearLayout;

    move-result-object v0

    if-nez v0, :cond_b8

    .line 1488
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # invokes: Landroid/support/v7/internal/widget/ActionBarView;->initTitle()V
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$1300(Landroid/support/v7/internal/widget/ActionBarView;)V

    .line 1493
    :cond_56
    :goto_56
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mTabScrollView:Landroid/support/v7/internal/widget/ScrollingTabContainerView;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$900(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/ScrollingTabContainerView;

    move-result-object v0

    if-eqz v0, :cond_70

    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mNavigationMode:I
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$1400(Landroid/support/v7/internal/widget/ActionBarView;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_70

    .line 1494
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mTabScrollView:Landroid/support/v7/internal/widget/ScrollingTabContainerView;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$900(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/ScrollingTabContainerView;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/support/v7/internal/widget/ScrollingTabContainerView;->setVisibility(I)V

    .line 1496
    :cond_70
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mSpinner:Landroid/support/v7/internal/widget/SpinnerICS;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$1000(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/SpinnerICS;

    move-result-object v0

    if-eqz v0, :cond_89

    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mNavigationMode:I
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$1400(Landroid/support/v7/internal/widget/ActionBarView;)I

    move-result v0

    if-ne v0, v4, :cond_89

    .line 1497
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mSpinner:Landroid/support/v7/internal/widget/SpinnerICS;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$1000(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/SpinnerICS;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/support/v7/internal/widget/SpinnerICS;->setVisibility(I)V

    .line 1499
    :cond_89
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mCustomNavView:Landroid/view/View;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$1100(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_a4

    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mDisplayOptions:I
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$1200(Landroid/support/v7/internal/widget/ActionBarView;)I

    move-result v0

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_a4

    .line 1500
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mCustomNavView:Landroid/view/View;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$1100(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 1502
    :cond_a4
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mExpandedHomeLayout:Landroid/support/v7/internal/widget/ActionBarView$HomeView;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$600(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/ActionBarView$HomeView;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/support/v7/internal/widget/ActionBarView$HomeView;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 1503
    iput-object v3, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->mCurrentExpandedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .line 1504
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarView;->requestLayout()V

    .line 1505
    invoke-virtual {p2, v2}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setActionViewExpanded(Z)V

    .line 1507
    return v4

    .line 1490
    :cond_b8
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mTitleLayout:Landroid/widget/LinearLayout;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$800(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    goto :goto_56
.end method

.method public expandItemActionView(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/support/v7/internal/view/menu/MenuItemImpl;)Z
    .registers 8
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "item"    # Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .prologue
    const/4 v4, 0x1

    const/16 v3, 0x8

    .line 1440
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    invoke-virtual {p2}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getActionView()Landroid/view/View;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v7/internal/widget/ActionBarView;->mExpandedActionView:Landroid/view/View;

    .line 1441
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mExpandedHomeLayout:Landroid/support/v7/internal/widget/ActionBarView$HomeView;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$600(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/ActionBarView$HomeView;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mIcon:Landroid/graphics/drawable/Drawable;
    invoke-static {v1}, Landroid/support/v7/internal/widget/ActionBarView;->access$500(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    invoke-virtual {v2}, Landroid/support/v7/internal/widget/ActionBarView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ActionBarView$HomeView;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 1442
    iput-object p2, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->mCurrentExpandedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .line 1443
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarView;->mExpandedActionView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    if-eq v0, v1, :cond_3f

    .line 1444
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    iget-object v1, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    iget-object v1, v1, Landroid/support/v7/internal/widget/ActionBarView;->mExpandedActionView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ActionBarView;->addView(Landroid/view/View;)V

    .line 1446
    :cond_3f
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mExpandedHomeLayout:Landroid/support/v7/internal/widget/ActionBarView$HomeView;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$600(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/ActionBarView$HomeView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarView$HomeView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    if-eq v0, v1, :cond_58

    .line 1447
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    iget-object v1, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mExpandedHomeLayout:Landroid/support/v7/internal/widget/ActionBarView$HomeView;
    invoke-static {v1}, Landroid/support/v7/internal/widget/ActionBarView;->access$600(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/ActionBarView$HomeView;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/widget/ActionBarView;->addView(Landroid/view/View;)V

    .line 1449
    :cond_58
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mHomeLayout:Landroid/support/v7/internal/widget/ActionBarView$HomeView;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$700(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/ActionBarView$HomeView;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/support/v7/internal/widget/ActionBarView$HomeView;->setVisibility(I)V

    .line 1450
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mTitleLayout:Landroid/widget/LinearLayout;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$800(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/widget/LinearLayout;

    move-result-object v0

    if-eqz v0, :cond_72

    .line 1451
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mTitleLayout:Landroid/widget/LinearLayout;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$800(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 1453
    :cond_72
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mTabScrollView:Landroid/support/v7/internal/widget/ScrollingTabContainerView;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$900(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/ScrollingTabContainerView;

    move-result-object v0

    if-eqz v0, :cond_83

    .line 1454
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mTabScrollView:Landroid/support/v7/internal/widget/ScrollingTabContainerView;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$900(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/ScrollingTabContainerView;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/support/v7/internal/widget/ScrollingTabContainerView;->setVisibility(I)V

    .line 1456
    :cond_83
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mSpinner:Landroid/support/v7/internal/widget/SpinnerICS;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$1000(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/SpinnerICS;

    move-result-object v0

    if-eqz v0, :cond_94

    .line 1457
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mSpinner:Landroid/support/v7/internal/widget/SpinnerICS;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$1000(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/support/v7/internal/widget/SpinnerICS;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/support/v7/internal/widget/SpinnerICS;->setVisibility(I)V

    .line 1459
    :cond_94
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mCustomNavView:Landroid/view/View;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$1100(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_a5

    .line 1460
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    # getter for: Landroid/support/v7/internal/widget/ActionBarView;->mCustomNavView:Landroid/view/View;
    invoke-static {v0}, Landroid/support/v7/internal/widget/ActionBarView;->access$1100(Landroid/support/v7/internal/widget/ActionBarView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 1462
    :cond_a5
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    invoke-virtual {v0}, Landroid/support/v7/internal/widget/ActionBarView;->requestLayout()V

    .line 1463
    invoke-virtual {p2, v4}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setActionViewExpanded(Z)V

    .line 1465
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarView;->mExpandedActionView:Landroid/view/View;

    instance-of v0, v0, Landroid/support/v7/view/CollapsibleActionView;

    if-eqz v0, :cond_be

    .line 1466
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->this$0:Landroid/support/v7/internal/widget/ActionBarView;

    iget-object v0, v0, Landroid/support/v7/internal/widget/ActionBarView;->mExpandedActionView:Landroid/view/View;

    check-cast v0, Landroid/support/v7/view/CollapsibleActionView;

    invoke-interface {v0}, Landroid/support/v7/view/CollapsibleActionView;->onActionViewExpanded()V

    .line 1469
    :cond_be
    return v4
.end method

.method public flagActionItems()Z
    .registers 2

    .prologue
    .line 1435
    const/4 v0, 0x0

    return v0
.end method

.method public getId()I
    .registers 2

    .prologue
    .line 1512
    const/4 v0, 0x0

    return v0
.end method

.method public getMenuView(Landroid/view/ViewGroup;)Landroid/support/v7/internal/view/menu/MenuView;
    .registers 3
    .param p1, "root"    # Landroid/view/ViewGroup;

    .prologue
    .line 1393
    const/4 v0, 0x0

    return-object v0
.end method

.method public initForMenu(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;

    .prologue
    .line 1385
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eqz v0, :cond_f

    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->mCurrentExpandedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    if-eqz v0, :cond_f

    .line 1386
    iget-object v0, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v1, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->mCurrentExpandedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->collapseItemActionView(Landroid/support/v7/internal/view/menu/MenuItemImpl;)Z

    .line 1388
    :cond_f
    iput-object p2, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    .line 1389
    return-void
.end method

.method public onCloseMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;Z)V
    .registers 3
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "allMenusAreClosing"    # Z

    .prologue
    .line 1431
    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 1522
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 2

    .prologue
    .line 1517
    const/4 v0, 0x0

    return-object v0
.end method

.method public onSubMenuSelected(Landroid/support/v7/internal/view/menu/SubMenuBuilder;)Z
    .registers 3
    .param p1, "subMenu"    # Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    .prologue
    .line 1426
    const/4 v0, 0x0

    return v0
.end method

.method public setCallback(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;)V
    .registers 2
    .param p1, "cb"    # Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

    .prologue
    .line 1422
    return-void
.end method

.method public updateMenuView(Z)V
    .registers 8
    .param p1, "cleared"    # Z

    .prologue
    .line 1399
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->mCurrentExpandedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    if-eqz v4, :cond_28

    .line 1400
    const/4 v1, 0x0

    .line 1402
    .local v1, "found":Z
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eqz v4, :cond_1f

    .line 1403
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v4}, Landroid/support/v7/internal/view/menu/MenuBuilder;->size()I

    move-result v0

    .line 1404
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_10
    if-ge v2, v0, :cond_1f

    .line 1405
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v4, v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getItem(I)Landroid/view/MenuItem;

    move-result-object v3

    check-cast v3, Landroid/support/v4/internal/view/SupportMenuItem;

    .line 1406
    .local v3, "item":Landroid/support/v4/internal/view/SupportMenuItem;
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->mCurrentExpandedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    if-ne v3, v4, :cond_29

    .line 1407
    const/4 v1, 0x1

    .line 1413
    .end local v0    # "count":I
    .end local v2    # "i":I
    .end local v3    # "item":Landroid/support/v4/internal/view/SupportMenuItem;
    :cond_1f
    if-nez v1, :cond_28

    .line 1415
    iget-object v4, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v5, p0, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->mCurrentExpandedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    invoke-virtual {p0, v4, v5}, Landroid/support/v7/internal/widget/ActionBarView$ExpandedActionViewMenuPresenter;->collapseItemActionView(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/support/v7/internal/view/menu/MenuItemImpl;)Z

    .line 1418
    .end local v1    # "found":Z
    :cond_28
    return-void

    .line 1404
    .restart local v0    # "count":I
    .restart local v1    # "found":Z
    .restart local v2    # "i":I
    .restart local v3    # "item":Landroid/support/v4/internal/view/SupportMenuItem;
    :cond_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_10
.end method
