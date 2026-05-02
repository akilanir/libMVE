.class Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "NavigationMenuPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/internal/NavigationMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NavigationMenuAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field private static final STATE_ACTION_VIEWS:Ljava/lang/String; = "android:menu:action_views"

.field private static final STATE_CHECKED_ITEM:Ljava/lang/String; = "android:menu:checked"

.field private static final VIEW_TYPE_HEADER:I = 0x3

.field private static final VIEW_TYPE_NORMAL:I = 0x0

.field private static final VIEW_TYPE_SEPARATOR:I = 0x2

.field private static final VIEW_TYPE_SUBHEADER:I = 0x1


# instance fields
.field private mCheckedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

.field private final mItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;",
            ">;"
        }
    .end annotation
.end field

.field private mTransparentIcon:Landroid/graphics/drawable/ColorDrawable;

.field private mUpdateSuspended:Z

.field final synthetic this$0:Landroid/support/design/internal/NavigationMenuPresenter;


# direct methods
.method constructor <init>(Landroid/support/design/internal/NavigationMenuPresenter;)V
    .registers 3

    .prologue
    .line 325
    iput-object p1, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 320
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    .line 326
    invoke-direct {p0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->prepareMenuItems()V

    .line 327
    return-void
.end method

.method private appendTransparentIconIfMissing(II)V
    .registers 8
    .param p1, "startIndex"    # I
    .param p2, "endIndex"    # I

    .prologue
    .line 498
    move v0, p1

    .local v0, "i":I
    :goto_1
    if-ge v0, p2, :cond_2b

    .line 499
    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;

    .line 500
    .local v2, "textItem":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;
    invoke-virtual {v2}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;->getMenuItem()Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v1

    .line 501
    .local v1, "item":Landroid/view/MenuItem;
    invoke-interface {v1}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-nez v3, :cond_28

    .line 502
    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mTransparentIcon:Landroid/graphics/drawable/ColorDrawable;

    if-nez v3, :cond_23

    .line 503
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    const v4, 0x106000d

    invoke-direct {v3, v4}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    iput-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mTransparentIcon:Landroid/graphics/drawable/ColorDrawable;

    .line 505
    :cond_23
    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mTransparentIcon:Landroid/graphics/drawable/ColorDrawable;

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    .line 498
    :cond_28
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 508
    .end local v1    # "item":Landroid/view/MenuItem;
    .end local v2    # "textItem":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;
    :cond_2b
    return-void
.end method

.method private prepareMenuItems()V
    .registers 19

    .prologue
    .line 427
    move-object/from16 v0, p0

    iget-boolean v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mUpdateSuspended:Z

    if-eqz v14, :cond_7

    .line 495
    :goto_6
    return-void

    .line 430
    :cond_7
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mUpdateSuspended:Z

    .line 431
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->clear()V

    .line 432
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    new-instance v15, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuHeaderItem;

    const/16 v16, 0x0

    invoke-direct/range {v15 .. v16}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuHeaderItem;-><init>(Landroid/support/design/internal/NavigationMenuPresenter$1;)V

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 434
    const/4 v2, -0x1

    .line 435
    .local v2, "currentGroupId":I
    const/4 v3, 0x0

    .line 436
    .local v3, "currentGroupStart":I
    const/4 v1, 0x0

    .line 437
    .local v1, "currentGroupHasIcon":Z
    const/4 v5, 0x0

    .local v5, "i":I
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;
    invoke-static {v14}, Landroid/support/design/internal/NavigationMenuPresenter;->access$000(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-result-object v14

    invoke-virtual {v14}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v13

    .local v13, "totalSize":I
    :goto_35
    if-ge v5, v13, :cond_16a

    .line 438
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;
    invoke-static {v14}, Landroid/support/design/internal/NavigationMenuPresenter;->access$000(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-result-object v14

    invoke-virtual {v14}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .line 439
    .local v6, "item":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->isChecked()Z

    move-result v14

    if-eqz v14, :cond_54

    .line 440
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->setCheckedItem(Landroid/support/v7/internal/view/menu/MenuItemImpl;)V

    .line 442
    :cond_54
    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->isCheckable()Z

    move-result v14

    if-eqz v14, :cond_5e

    .line 443
    const/4 v14, 0x0

    invoke-virtual {v6, v14}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setExclusiveCheckable(Z)V

    .line 445
    :cond_5e
    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->hasSubMenu()Z

    move-result v14

    if-eqz v14, :cond_f8

    .line 446
    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v9

    .line 447
    .local v9, "subMenu":Landroid/view/SubMenu;
    invoke-interface {v9}, Landroid/view/SubMenu;->hasVisibleItems()Z

    move-result v14

    if-eqz v14, :cond_f4

    .line 448
    if-eqz v5, :cond_88

    .line 449
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    new-instance v15, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuSeparatorItem;

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    move-object/from16 v16, v0

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mPaddingSeparator:I
    invoke-static/range {v16 .. v16}, Landroid/support/design/internal/NavigationMenuPresenter;->access$1100(Landroid/support/design/internal/NavigationMenuPresenter;)I

    move-result v16

    const/16 v17, 0x0

    invoke-direct/range {v15 .. v17}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuSeparatorItem;-><init>(II)V

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 451
    :cond_88
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    new-instance v15, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;

    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-direct {v15, v6, v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;-><init>(Landroid/support/v7/internal/view/menu/MenuItemImpl;Landroid/support/design/internal/NavigationMenuPresenter$1;)V

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 452
    const/4 v10, 0x0

    .line 453
    .local v10, "subMenuHasIcon":Z
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v12

    .line 454
    .local v12, "subMenuStart":I
    const/4 v7, 0x0

    .local v7, "j":I
    invoke-interface {v9}, Landroid/view/SubMenu;->size()I

    move-result v8

    .local v8, "size":I
    :goto_a6
    if-ge v7, v8, :cond_e5

    .line 455
    invoke-interface {v9, v7}, Landroid/view/SubMenu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v11

    check-cast v11, Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .line 456
    .local v11, "subMenuItem":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    invoke-virtual {v11}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->isVisible()Z

    move-result v14

    if-eqz v14, :cond_e2

    .line 457
    if-nez v10, :cond_bd

    invoke-virtual {v11}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v14

    if-eqz v14, :cond_bd

    .line 458
    const/4 v10, 0x1

    .line 460
    :cond_bd
    invoke-virtual {v11}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->isCheckable()Z

    move-result v14

    if-eqz v14, :cond_c7

    .line 461
    const/4 v14, 0x0

    invoke-virtual {v11, v14}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setExclusiveCheckable(Z)V

    .line 463
    :cond_c7
    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->isChecked()Z

    move-result v14

    if-eqz v14, :cond_d2

    .line 464
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->setCheckedItem(Landroid/support/v7/internal/view/menu/MenuItemImpl;)V

    .line 466
    :cond_d2
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    new-instance v15, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;

    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-direct {v15, v11, v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;-><init>(Landroid/support/v7/internal/view/menu/MenuItemImpl;Landroid/support/design/internal/NavigationMenuPresenter$1;)V

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 454
    :cond_e2
    add-int/lit8 v7, v7, 0x1

    goto :goto_a6

    .line 469
    .end local v11    # "subMenuItem":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    :cond_e5
    if-eqz v10, :cond_f4

    .line 470
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v14}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->appendTransparentIconIfMissing(II)V

    .line 437
    .end local v7    # "j":I
    .end local v8    # "size":I
    .end local v9    # "subMenu":Landroid/view/SubMenu;
    .end local v10    # "subMenuHasIcon":Z
    .end local v12    # "subMenuStart":I
    :cond_f4
    :goto_f4
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_35

    .line 474
    :cond_f8
    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getGroupId()I

    move-result v4

    .line 475
    .local v4, "groupId":I
    if-eq v4, v2, :cond_153

    .line 476
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 477
    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v14

    if-eqz v14, :cond_151

    const/4 v1, 0x1

    .line 478
    :goto_10d
    if-eqz v5, :cond_131

    .line 479
    add-int/lit8 v3, v3, 0x1

    .line 480
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    new-instance v15, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuSeparatorItem;

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    move-object/from16 v16, v0

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mPaddingSeparator:I
    invoke-static/range {v16 .. v16}, Landroid/support/design/internal/NavigationMenuPresenter;->access$1100(Landroid/support/design/internal/NavigationMenuPresenter;)I

    move-result v16

    move-object/from16 v0, p0

    iget-object v0, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    move-object/from16 v17, v0

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mPaddingSeparator:I
    invoke-static/range {v17 .. v17}, Landroid/support/design/internal/NavigationMenuPresenter;->access$1100(Landroid/support/design/internal/NavigationMenuPresenter;)I

    move-result v17

    invoke-direct/range {v15 .. v17}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuSeparatorItem;-><init>(II)V

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 487
    :cond_131
    :goto_131
    if-eqz v1, :cond_13f

    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v14

    if-nez v14, :cond_13f

    .line 488
    const v14, 0x106000d

    invoke-virtual {v6, v14}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setIcon(I)Landroid/view/MenuItem;

    .line 490
    :cond_13f
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    new-instance v15, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;

    const/16 v16, 0x0

    move-object/from16 v0, v16

    invoke-direct {v15, v6, v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;-><init>(Landroid/support/v7/internal/view/menu/MenuItemImpl;Landroid/support/design/internal/NavigationMenuPresenter$1;)V

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 491
    move v2, v4

    goto :goto_f4

    .line 477
    :cond_151
    const/4 v1, 0x0

    goto :goto_10d

    .line 483
    :cond_153
    if-nez v1, :cond_131

    invoke-virtual {v6}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v14

    if-eqz v14, :cond_131

    .line 484
    const/4 v1, 0x1

    .line 485
    move-object/from16 v0, p0

    iget-object v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v14}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->appendTransparentIconIfMissing(II)V

    goto :goto_131

    .line 494
    .end local v4    # "groupId":I
    .end local v6    # "item":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    :cond_16a
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mUpdateSuspended:Z

    goto/16 :goto_6
.end method


# virtual methods
.method public createInstanceState()Landroid/os/Bundle;
    .registers 10

    .prologue
    .line 522
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 523
    .local v6, "state":Landroid/os/Bundle;
    iget-object v7, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mCheckedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    if-eqz v7, :cond_14

    .line 524
    const-string v7, "android:menu:checked"

    iget-object v8, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mCheckedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    invoke-virtual {v8}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getItemId()I

    move-result v8

    invoke-virtual {v6, v7, v8}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 527
    :cond_14
    new-instance v1, Landroid/util/SparseArray;

    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 528
    .local v1, "actionViewStates":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/design/internal/ParcelableSparseArray;>;"
    iget-object v7, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_1f
    :goto_1f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    .line 529
    .local v5, "navigationMenuItem":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;
    instance-of v7, v5, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;

    if-eqz v7, :cond_1f

    .line 530
    check-cast v5, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;

    .end local v5    # "navigationMenuItem":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;
    invoke-virtual {v5}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;->getMenuItem()Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v4

    .line 531
    .local v4, "item":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    if-eqz v4, :cond_4d

    invoke-virtual {v4}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getActionView()Landroid/view/View;

    move-result-object v0

    .line 532
    .local v0, "actionView":Landroid/view/View;
    :goto_3b
    if-eqz v0, :cond_1f

    .line 533
    new-instance v2, Landroid/support/design/internal/ParcelableSparseArray;

    invoke-direct {v2}, Landroid/support/design/internal/ParcelableSparseArray;-><init>()V

    .line 534
    .local v2, "container":Landroid/support/design/internal/ParcelableSparseArray;
    invoke-virtual {v0, v2}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    .line 535
    invoke-virtual {v4}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getItemId()I

    move-result v7

    invoke-virtual {v1, v7, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_1f

    .line 531
    .end local v0    # "actionView":Landroid/view/View;
    .end local v2    # "container":Landroid/support/design/internal/ParcelableSparseArray;
    :cond_4d
    const/4 v0, 0x0

    goto :goto_3b

    .line 539
    .end local v4    # "item":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    :cond_4f
    const-string v7, "android:menu:action_views"

    invoke-virtual {v6, v7, v1}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    .line 540
    return-object v6
.end method

.method public getItemCount()I
    .registers 2

    .prologue
    .line 336
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 331
    int-to-long v0, p1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .registers 6
    .param p1, "position"    # I

    .prologue
    .line 341
    iget-object v2, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    .line 342
    .local v0, "item":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;
    instance-of v2, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuSeparatorItem;

    if-eqz v2, :cond_e

    .line 343
    const/4 v2, 0x2

    .line 351
    :goto_d
    return v2

    .line 344
    :cond_e
    instance-of v2, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuHeaderItem;

    if-eqz v2, :cond_14

    .line 345
    const/4 v2, 0x3

    goto :goto_d

    .line 346
    :cond_14
    instance-of v2, v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;

    if-eqz v2, :cond_29

    move-object v1, v0

    .line 347
    check-cast v1, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;

    .line 348
    .local v1, "textItem":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;
    invoke-virtual {v1}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;->getMenuItem()Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->hasSubMenu()Z

    move-result v2

    if-eqz v2, :cond_27

    .line 349
    const/4 v2, 0x1

    goto :goto_d

    .line 351
    :cond_27
    const/4 v2, 0x0

    goto :goto_d

    .line 354
    .end local v1    # "textItem":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;
    :cond_29
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Unknown item type."

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public onBindViewHolder(Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;I)V
    .registers 10
    .param p1, "holder"    # Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;
    .param p2, "position"    # I

    .prologue
    const/4 v6, 0x0

    .line 374
    invoke-virtual {p0, p2}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->getItemViewType(I)I

    move-result v3

    packed-switch v3, :pswitch_data_96

    .line 408
    :goto_8
    return-void

    .line 376
    :pswitch_9
    iget-object v1, p1, Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;->itemView:Landroid/view/View;

    check-cast v1, Landroid/support/design/internal/NavigationMenuItemView;

    .line 377
    .local v1, "itemView":Landroid/support/design/internal/NavigationMenuItemView;
    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mIconTintList:Landroid/content/res/ColorStateList;
    invoke-static {v3}, Landroid/support/design/internal/NavigationMenuPresenter;->access$500(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/support/design/internal/NavigationMenuItemView;->setIconTintList(Landroid/content/res/ColorStateList;)V

    .line 378
    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mTextAppearanceSet:Z
    invoke-static {v3}, Landroid/support/design/internal/NavigationMenuPresenter;->access$600(Landroid/support/design/internal/NavigationMenuPresenter;)Z

    move-result v3

    if-eqz v3, :cond_2b

    .line 379
    invoke-virtual {v1}, Landroid/support/design/internal/NavigationMenuItemView;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mTextAppearance:I
    invoke-static {v4}, Landroid/support/design/internal/NavigationMenuPresenter;->access$700(Landroid/support/design/internal/NavigationMenuPresenter;)I

    move-result v4

    invoke-virtual {v1, v3, v4}, Landroid/support/design/internal/NavigationMenuItemView;->setTextAppearance(Landroid/content/Context;I)V

    .line 381
    :cond_2b
    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mTextColor:Landroid/content/res/ColorStateList;
    invoke-static {v3}, Landroid/support/design/internal/NavigationMenuPresenter;->access$800(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/content/res/ColorStateList;

    move-result-object v3

    if-eqz v3, :cond_3c

    .line 382
    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mTextColor:Landroid/content/res/ColorStateList;
    invoke-static {v3}, Landroid/support/design/internal/NavigationMenuPresenter;->access$800(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/content/res/ColorStateList;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/support/design/internal/NavigationMenuItemView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 384
    :cond_3c
    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mItemBackground:Landroid/graphics/drawable/Drawable;
    invoke-static {v3}, Landroid/support/design/internal/NavigationMenuPresenter;->access$900(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    if-eqz v3, :cond_65

    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mItemBackground:Landroid/graphics/drawable/Drawable;
    invoke-static {v3}, Landroid/support/design/internal/NavigationMenuPresenter;->access$900(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    :goto_52
    invoke-virtual {v1, v3}, Landroid/support/design/internal/NavigationMenuItemView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 386
    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;

    .line 387
    .local v0, "item":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;
    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;->getMenuItem()Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v3

    invoke-virtual {v1, v3, v6}, Landroid/support/design/internal/NavigationMenuItemView;->initialize(Landroid/support/v7/internal/view/menu/MenuItemImpl;I)V

    goto :goto_8

    .line 384
    .end local v0    # "item":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;
    :cond_65
    const/4 v3, 0x0

    goto :goto_52

    .line 391
    .end local v1    # "itemView":Landroid/support/design/internal/NavigationMenuItemView;
    :pswitch_67
    iget-object v2, p1, Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;->itemView:Landroid/view/View;

    check-cast v2, Landroid/widget/TextView;

    .line 392
    .local v2, "subHeader":Landroid/widget/TextView;
    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;

    .line 393
    .restart local v0    # "item":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;
    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;->getMenuItem()Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_8

    .line 397
    .end local v0    # "item":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;
    .end local v2    # "subHeader":Landroid/widget/TextView;
    :pswitch_7f
    iget-object v3, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuSeparatorItem;

    .line 399
    .local v0, "item":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuSeparatorItem;
    iget-object v3, p1, Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuSeparatorItem;->getPaddingTop()I

    move-result v4

    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuSeparatorItem;->getPaddingBottom()I

    move-result v5

    invoke-virtual {v3, v6, v4, v6, v5}, Landroid/view/View;->setPadding(IIII)V

    goto/16 :goto_8

    .line 374
    :pswitch_data_96
    .packed-switch 0x0
        :pswitch_9
        :pswitch_67
        :pswitch_7f
    .end packed-switch
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "x1"    # I

    .prologue
    .line 310
    check-cast p1, Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;

    .end local p1    # "x0":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p0, p1, p2}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->onBindViewHolder(Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;I)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;
    .registers 6
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 359
    packed-switch p2, :pswitch_data_3c

    .line 369
    const/4 v0, 0x0

    :goto_4
    return-object v0

    .line 361
    :pswitch_5
    new-instance v0, Landroid/support/design/internal/NavigationMenuPresenter$NormalViewHolder;

    iget-object v1, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mLayoutInflater:Landroid/view/LayoutInflater;
    invoke-static {v1}, Landroid/support/design/internal/NavigationMenuPresenter;->access$200(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/view/LayoutInflater;

    move-result-object v1

    iget-object v2, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mOnClickListener:Landroid/view/View$OnClickListener;
    invoke-static {v2}, Landroid/support/design/internal/NavigationMenuPresenter;->access$300(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-direct {v0, v1, p1, v2}, Landroid/support/design/internal/NavigationMenuPresenter$NormalViewHolder;-><init>(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/view/View$OnClickListener;)V

    goto :goto_4

    .line 363
    :pswitch_17
    new-instance v0, Landroid/support/design/internal/NavigationMenuPresenter$SubheaderViewHolder;

    iget-object v1, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mLayoutInflater:Landroid/view/LayoutInflater;
    invoke-static {v1}, Landroid/support/design/internal/NavigationMenuPresenter;->access$200(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/design/internal/NavigationMenuPresenter$SubheaderViewHolder;-><init>(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    goto :goto_4

    .line 365
    :pswitch_23
    new-instance v0, Landroid/support/design/internal/NavigationMenuPresenter$SeparatorViewHolder;

    iget-object v1, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mLayoutInflater:Landroid/view/LayoutInflater;
    invoke-static {v1}, Landroid/support/design/internal/NavigationMenuPresenter;->access$200(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/view/LayoutInflater;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/design/internal/NavigationMenuPresenter$SeparatorViewHolder;-><init>(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    goto :goto_4

    .line 367
    :pswitch_2f
    new-instance v0, Landroid/support/design/internal/NavigationMenuPresenter$HeaderViewHolder;

    iget-object v1, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->this$0:Landroid/support/design/internal/NavigationMenuPresenter;

    # getter for: Landroid/support/design/internal/NavigationMenuPresenter;->mHeaderLayout:Landroid/widget/LinearLayout;
    invoke-static {v1}, Landroid/support/design/internal/NavigationMenuPresenter;->access$400(Landroid/support/design/internal/NavigationMenuPresenter;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/design/internal/NavigationMenuPresenter$HeaderViewHolder;-><init>(Landroid/view/View;)V

    goto :goto_4

    .line 359
    nop

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_5
        :pswitch_17
        :pswitch_23
        :pswitch_2f
    .end packed-switch
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 4
    .param p1, "x0"    # Landroid/view/ViewGroup;
    .param p2, "x1"    # I

    .prologue
    .line 310
    invoke-virtual {p0, p1, p2}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onViewRecycled(Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;)V
    .registers 3
    .param p1, "holder"    # Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;

    .prologue
    .line 412
    instance-of v0, p1, Landroid/support/design/internal/NavigationMenuPresenter$NormalViewHolder;

    if-eqz v0, :cond_b

    .line 413
    iget-object v0, p1, Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Landroid/support/design/internal/NavigationMenuItemView;

    invoke-virtual {v0}, Landroid/support/design/internal/NavigationMenuItemView;->recycle()V

    .line 415
    :cond_b
    return-void
.end method

.method public bridge synthetic onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2
    .param p1, "x0"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;

    .prologue
    .line 310
    check-cast p1, Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;

    .end local p1    # "x0":Landroid/support/v7/widget/RecyclerView$ViewHolder;
    invoke-virtual {p0, p1}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->onViewRecycled(Landroid/support/design/internal/NavigationMenuPresenter$ViewHolder;)V

    return-void
.end method

.method public restoreInstanceState(Landroid/os/Bundle;)V
    .registers 11
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x0

    .line 544
    const-string v7, "android:menu:checked"

    invoke-virtual {p1, v7, v8}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 545
    .local v2, "checkedItem":I
    if-eqz v2, :cond_38

    .line 546
    const/4 v7, 0x1

    iput-boolean v7, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mUpdateSuspended:Z

    .line 547
    iget-object v7, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_12
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_33

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    .line 548
    .local v4, "item":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;
    instance-of v7, v4, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;

    if-eqz v7, :cond_12

    .line 549
    check-cast v4, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;

    .end local v4    # "item":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;
    invoke-virtual {v4}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;->getMenuItem()Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v5

    .line 550
    .local v5, "menuItem":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    if-eqz v5, :cond_12

    invoke-virtual {v5}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getItemId()I

    move-result v7

    if-ne v7, v2, :cond_12

    .line 551
    invoke-virtual {p0, v5}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->setCheckedItem(Landroid/support/v7/internal/view/menu/MenuItemImpl;)V

    .line 556
    .end local v5    # "menuItem":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    :cond_33
    iput-boolean v8, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mUpdateSuspended:Z

    .line 557
    invoke-direct {p0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->prepareMenuItems()V

    .line 560
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_38
    const-string v7, "android:menu:action_views"

    invoke-virtual {p1, v7}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object v1

    .line 562
    .local v1, "actionViewStates":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Landroid/support/design/internal/ParcelableSparseArray;>;"
    iget-object v7, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_44
    :goto_44
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_72

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;

    .line 563
    .local v6, "navigationMenuItem":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;
    instance-of v7, v6, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;

    if-eqz v7, :cond_44

    .line 564
    check-cast v6, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;

    .end local v6    # "navigationMenuItem":Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuItem;
    invoke-virtual {v6}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuTextItem;->getMenuItem()Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v4

    .line 565
    .local v4, "item":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    if-eqz v4, :cond_70

    invoke-virtual {v4}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getActionView()Landroid/view/View;

    move-result-object v0

    .line 566
    .local v0, "actionView":Landroid/view/View;
    :goto_60
    if-eqz v0, :cond_44

    .line 567
    invoke-virtual {v4}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getItemId()I

    move-result v7

    invoke-virtual {v1, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/util/SparseArray;

    invoke-virtual {v0, v7}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    goto :goto_44

    .line 565
    .end local v0    # "actionView":Landroid/view/View;
    :cond_70
    const/4 v0, 0x0

    goto :goto_60

    .line 571
    .end local v4    # "item":Landroid/support/v7/internal/view/menu/MenuItemImpl;
    :cond_72
    return-void
.end method

.method public setCheckedItem(Landroid/support/v7/internal/view/menu/MenuItemImpl;)V
    .registers 4
    .param p1, "checkedItem"    # Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .prologue
    .line 511
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mCheckedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    if-eq v0, p1, :cond_a

    invoke-virtual {p1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->isCheckable()Z

    move-result v0

    if-nez v0, :cond_b

    .line 519
    :cond_a
    :goto_a
    return-void

    .line 514
    :cond_b
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mCheckedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    if-eqz v0, :cond_15

    .line 515
    iget-object v0, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mCheckedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setChecked(Z)Landroid/view/MenuItem;

    .line 517
    :cond_15
    iput-object p1, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mCheckedItem:Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .line 518
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setChecked(Z)Landroid/view/MenuItem;

    goto :goto_a
.end method

.method public setUpdateSuspended(Z)V
    .registers 2
    .param p1, "updateSuspended"    # Z

    .prologue
    .line 574
    iput-boolean p1, p0, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->mUpdateSuspended:Z

    .line 575
    return-void
.end method

.method public update()V
    .registers 1

    .prologue
    .line 418
    invoke-direct {p0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->prepareMenuItems()V

    .line 419
    invoke-virtual {p0}, Landroid/support/design/internal/NavigationMenuPresenter$NavigationMenuAdapter;->notifyDataSetChanged()V

    .line 420
    return-void
.end method
