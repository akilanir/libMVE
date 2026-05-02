.class public final Landroid/support/v7/internal/view/menu/MenuItemImpl;
.super Ljava/lang/Object;
.source "MenuItemImpl.java"

# interfaces
.implements Landroid/support/v4/internal/view/SupportMenuItem;


# static fields
.field private static final CHECKABLE:I = 0x1

.field private static final CHECKED:I = 0x2

.field private static final ENABLED:I = 0x10

.field private static final EXCLUSIVE:I = 0x4

.field private static final HIDDEN:I = 0x8

.field private static final IS_ACTION:I = 0x20

.field static final NO_ICON:I = 0x0

.field private static final SHOW_AS_ACTION_MASK:I = 0x3

.field private static final TAG:Ljava/lang/String; = "MenuItemImpl"

.field private static sDeleteShortcutLabel:Ljava/lang/String;

.field private static sEnterShortcutLabel:Ljava/lang/String;

.field private static sPrependShortcutLabel:Ljava/lang/String;

.field private static sSpaceShortcutLabel:Ljava/lang/String;


# instance fields
.field private mActionProvider:Landroid/support/v4/view/ActionProvider;

.field private mActionView:Landroid/view/View;

.field private final mCategoryOrder:I

.field private mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

.field private mFlags:I

.field private final mGroup:I

.field private mIconDrawable:Landroid/graphics/drawable/Drawable;

.field private mIconResId:I

.field private final mId:I

.field private mIntent:Landroid/content/Intent;

.field private mIsActionViewExpanded:Z

.field private mItemCallback:Ljava/lang/Runnable;

.field private mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

.field private mMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

.field private mOnActionExpandListener:Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

.field private final mOrdering:I

.field private mShortcutAlphabeticChar:C

.field private mShortcutNumericChar:C

.field private mShowAsAction:I

.field private mSubMenu:Landroid/support/v7/internal/view/menu/SubMenuBuilder;

.field private mTitle:Ljava/lang/CharSequence;

.field private mTitleCondensed:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>(Landroid/support/v7/internal/view/menu/MenuBuilder;IIIILjava/lang/CharSequence;I)V
    .registers 10
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "group"    # I
    .param p3, "id"    # I
    .param p4, "categoryOrder"    # I
    .param p5, "ordering"    # I
    .param p6, "title"    # Ljava/lang/CharSequence;
    .param p7, "showAsAction"    # I

    .prologue
    const/4 v1, 0x0

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconResId:I

    .line 76
    const/16 v0, 0x10

    iput v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 84
    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    .line 89
    iput-boolean v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIsActionViewExpanded:Z

    .line 133
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    .line 134
    iput p3, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mId:I

    .line 135
    iput p2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mGroup:I

    .line 136
    iput p4, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mCategoryOrder:I

    .line 137
    iput p5, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mOrdering:I

    .line 138
    iput-object p6, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    .line 139
    iput p7, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    .line 140
    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/internal/view/menu/MenuItemImpl;)Landroid/support/v7/internal/view/menu/MenuBuilder;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .prologue
    .line 40
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    return-object v0
.end method


# virtual methods
.method public actionFormatChanged()V
    .registers 2

    .prologue
    .line 543
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemActionRequestChanged(Landroid/support/v7/internal/view/menu/MenuItemImpl;)V

    .line 544
    return-void
.end method

.method public collapseActionView()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 684
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    and-int/lit8 v1, v1, 0x8

    if-nez v1, :cond_8

    .line 697
    :cond_7
    :goto_7
    return v0

    .line 687
    :cond_8
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    if-nez v1, :cond_e

    .line 689
    const/4 v0, 0x1

    goto :goto_7

    .line 692
    :cond_e
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

    if-eqz v1, :cond_1a

    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

    invoke-interface {v1, p0}, Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;->onMenuItemActionCollapse(Landroid/view/MenuItem;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 694
    :cond_1a
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->collapseItemActionView(Landroid/support/v7/internal/view/menu/MenuItemImpl;)Z

    move-result v0

    goto :goto_7
.end method

.method public expandActionView()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 670
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->hasCollapsibleActionView()Z

    move-result v1

    if-nez v1, :cond_8

    .line 679
    :cond_7
    :goto_7
    return v0

    .line 674
    :cond_8
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

    if-eqz v1, :cond_14

    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

    invoke-interface {v1, p0}, Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;->onMenuItemActionExpand(Landroid/view/MenuItem;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 676
    :cond_14
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->expandItemActionView(Landroid/support/v7/internal/view/menu/MenuItemImpl;)Z

    move-result v0

    goto :goto_7
.end method

.method public getActionProvider()Landroid/view/ActionProvider;
    .registers 3

    .prologue
    .line 634
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This is not supported, use MenuItemCompat.getActionProvider()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getActionView()Landroid/view/View;
    .registers 2

    .prologue
    .line 616
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    if-eqz v0, :cond_7

    .line 617
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    .line 622
    :goto_6
    return-object v0

    .line 618
    :cond_7
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    if-eqz v0, :cond_16

    .line 619
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    invoke-virtual {v0, p0}, Landroid/support/v4/view/ActionProvider;->onCreateActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    .line 620
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    goto :goto_6

    .line 622
    :cond_16
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getAlphabeticShortcut()C
    .registers 2

    .prologue
    .line 237
    iget-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    return v0
.end method

.method getCallback()Ljava/lang/Runnable;
    .registers 2

    .prologue
    .line 227
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mItemCallback:Ljava/lang/Runnable;

    return-object v0
.end method

.method public getGroupId()I
    .registers 2

    .prologue
    .line 197
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mGroup:I

    return v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 4

    .prologue
    .line 406
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_7

    .line 407
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 417
    :goto_6
    return-object v0

    .line 410
    :cond_7
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconResId:I

    if-eqz v1, :cond_1d

    .line 411
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconResId:I

    invoke-static {v1, v2}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 412
    .local v0, "icon":Landroid/graphics/drawable/Drawable;
    const/4 v1, 0x0

    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconResId:I

    .line 413
    iput-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_6

    .line 417
    .end local v0    # "icon":Landroid/graphics/drawable/Drawable;
    :cond_1d
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getIntent()Landroid/content/Intent;
    .registers 2

    .prologue
    .line 217
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public getItemId()I
    .registers 2
    .annotation runtime Landroid/view/ViewDebug$CapturedViewProperty;
    .end annotation

    .prologue
    .line 203
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mId:I

    return v0
.end method

.method public getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
    .registers 2

    .prologue
    .line 539
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    return-object v0
.end method

.method public getNumericShortcut()C
    .registers 2

    .prologue
    .line 255
    iget-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    return v0
.end method

.method public getOrder()I
    .registers 2

    .prologue
    .line 208
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mCategoryOrder:I

    return v0
.end method

.method public getOrdering()I
    .registers 2

    .prologue
    .line 212
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mOrdering:I

    return v0
.end method

.method getShortcut()C
    .registers 2

    .prologue
    .line 285
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->isQwertyMode()Z

    move-result v0

    if-eqz v0, :cond_b

    iget-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    :goto_a
    return v0

    :cond_b
    iget-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    goto :goto_a
.end method

.method getShortcutLabel()Ljava/lang/String;
    .registers 4

    .prologue
    .line 295
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getShortcut()C

    move-result v1

    .line 296
    .local v1, "shortcut":C
    if-nez v1, :cond_9

    .line 297
    const-string v2, ""

    .line 320
    :goto_8
    return-object v2

    .line 300
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v2, Landroid/support/v7/internal/view/menu/MenuItemImpl;->sPrependShortcutLabel:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 301
    .local v0, "sb":Ljava/lang/StringBuilder;
    sparse-switch v1, :sswitch_data_2e

    .line 316
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 320
    :goto_16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_8

    .line 304
    :sswitch_1b
    sget-object v2, Landroid/support/v7/internal/view/menu/MenuItemImpl;->sEnterShortcutLabel:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_16

    .line 308
    :sswitch_21
    sget-object v2, Landroid/support/v7/internal/view/menu/MenuItemImpl;->sDeleteShortcutLabel:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_16

    .line 312
    :sswitch_27
    sget-object v2, Landroid/support/v7/internal/view/menu/MenuItemImpl;->sSpaceShortcutLabel:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_16

    .line 301
    nop

    :sswitch_data_2e
    .sparse-switch
        0x8 -> :sswitch_21
        0xa -> :sswitch_1b
        0x20 -> :sswitch_27
    .end sparse-switch
.end method

.method public getSubMenu()Landroid/view/SubMenu;
    .registers 2

    .prologue
    .line 335
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mSubMenu:Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    return-object v0
.end method

.method public getSupportActionProvider()Landroid/support/v4/view/ActionProvider;
    .registers 2

    .prologue
    .line 640
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2
    .annotation runtime Landroid/view/ViewDebug$CapturedViewProperty;
    .end annotation

    .prologue
    .line 352
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTitleCondensed()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 387
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitleCondensed:Ljava/lang/CharSequence;

    if-eqz v0, :cond_7

    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitleCondensed:Ljava/lang/CharSequence;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    goto :goto_6
.end method

.method getTitleForItemView(Landroid/support/v7/internal/view/menu/MenuView$ItemView;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "itemView"    # Landroid/support/v7/internal/view/menu/MenuView$ItemView;

    .prologue
    .line 362
    if-eqz p1, :cond_d

    invoke-interface {p1}, Landroid/support/v7/internal/view/menu/MenuView$ItemView;->prefersCondensedTitle()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getTitleCondensed()Ljava/lang/CharSequence;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_c
.end method

.method public hasCollapsibleActionView()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 708
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    and-int/lit8 v1, v1, 0x8

    if-eqz v1, :cond_1c

    .line 709
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    if-nez v1, :cond_17

    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    if-eqz v1, :cond_17

    .line 710
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    invoke-virtual {v1, p0}, Landroid/support/v4/view/ActionProvider;->onCreateActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    .line 712
    :cond_17
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    if-eqz v1, :cond_1c

    const/4 v0, 0x1

    .line 714
    :cond_1c
    return v0
.end method

.method public hasSubMenu()Z
    .registers 2

    .prologue
    .line 340
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mSubMenu:Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public invoke()Z
    .registers 5

    .prologue
    const/4 v1, 0x1

    .line 148
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    if-eqz v2, :cond_e

    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    invoke-interface {v2, p0}, Landroid/view/MenuItem$OnMenuItemClickListener;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 174
    :cond_d
    :goto_d
    return v1

    .line 152
    :cond_e
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v3}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getRootMenu()Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-result-object v3

    invoke-virtual {v2, v3, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->dispatchMenuItemSelected(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z

    move-result v2

    if-nez v2, :cond_d

    .line 156
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mItemCallback:Ljava/lang/Runnable;

    if-eqz v2, :cond_26

    .line 157
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mItemCallback:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    goto :goto_d

    .line 161
    :cond_26
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIntent:Landroid/content/Intent;

    if-eqz v2, :cond_3e

    .line 163
    :try_start_2a
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIntent:Landroid/content/Intent;

    invoke-virtual {v2, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_35
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2a .. :try_end_35} :catch_36

    goto :goto_d

    .line 165
    :catch_36
    move-exception v0

    .line 166
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const-string v2, "MenuItemImpl"

    const-string v3, "Can\'t find activity to handle intent; ignoring"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 170
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    :cond_3e
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    if-eqz v2, :cond_4a

    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    invoke-virtual {v2}, Landroid/support/v4/view/ActionProvider;->onPerformDefaultAction()Z

    move-result v2

    if-nez v2, :cond_d

    .line 174
    :cond_4a
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public isActionButton()Z
    .registers 3

    .prologue
    .line 554
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, 0x20

    const/16 v1, 0x20

    if-ne v0, v1, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isActionViewExpanded()Z
    .registers 2

    .prologue
    .line 724
    iget-boolean v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIsActionViewExpanded:Z

    return v0
.end method

.method public isCheckable()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 442
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isChecked()Z
    .registers 3

    .prologue
    .line 466
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 179
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isExclusiveCheckable()Z
    .registers 2

    .prologue
    .line 461
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public isVisible()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 492
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    if-eqz v2, :cond_1f

    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    invoke-virtual {v2}, Landroid/support/v4/view/ActionProvider;->overridesItemVisibility()Z

    move-result v2

    if-eqz v2, :cond_1f

    .line 493
    iget v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v2, v2, 0x8

    if-nez v2, :cond_1d

    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    invoke-virtual {v2}, Landroid/support/v4/view/ActionProvider;->isVisible()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 495
    :cond_1c
    :goto_1c
    return v0

    :cond_1d
    move v0, v1

    .line 493
    goto :goto_1c

    .line 495
    :cond_1f
    iget v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v2, v2, 0x8

    if-eqz v2, :cond_1c

    move v0, v1

    goto :goto_1c
.end method

.method public requestsActionButton()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 558
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    and-int/lit8 v1, v1, 0x1

    if-ne v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public requiresActionButton()Z
    .registers 3

    .prologue
    .line 562
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    and-int/lit8 v0, v0, 0x2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public setActionProvider(Landroid/view/ActionProvider;)Landroid/view/MenuItem;
    .registers 4
    .param p1, "actionProvider"    # Landroid/view/ActionProvider;

    .prologue
    .line 628
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This is not supported, use MenuItemCompat.setActionProvider()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setActionView(I)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 6
    .param p1, "resId"    # I

    .prologue
    .line 608
    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 609
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 610
    .local v1, "inflater":Landroid/view/LayoutInflater;
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setActionView(Landroid/view/View;)Landroid/support/v4/internal/view/SupportMenuItem;

    .line 611
    return-object p0
.end method

.method public setActionView(Landroid/view/View;)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 597
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    .line 598
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    .line 599
    if-eqz p1, :cond_17

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_17

    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mId:I

    if-lez v0, :cond_17

    .line 600
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mId:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setId(I)V

    .line 602
    :cond_17
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemActionRequestChanged(Landroid/support/v7/internal/view/menu/MenuItemImpl;)V

    .line 603
    return-object p0
.end method

.method public bridge synthetic setActionView(I)Landroid/view/MenuItem;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setActionView(I)Landroid/support/v4/internal/view/SupportMenuItem;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic setActionView(Landroid/view/View;)Landroid/view/MenuItem;
    .registers 3
    .param p1, "x0"    # Landroid/view/View;

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setActionView(Landroid/view/View;)Landroid/support/v4/internal/view/SupportMenuItem;

    move-result-object v0

    return-object v0
.end method

.method public setActionViewExpanded(Z)V
    .registers 4
    .param p1, "isExpanded"    # Z

    .prologue
    .line 718
    iput-boolean p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIsActionViewExpanded:Z

    .line 719
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 720
    return-void
.end method

.method public setAlphabeticShortcut(C)Landroid/view/MenuItem;
    .registers 4
    .param p1, "alphaChar"    # C

    .prologue
    .line 242
    iget-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    if-ne v0, p1, :cond_5

    .line 250
    :goto_4
    return-object p0

    .line 246
    :cond_5
    invoke-static {p1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    iput-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    .line 248
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    goto :goto_4
.end method

.method public setCallback(Ljava/lang/Runnable;)Landroid/view/MenuItem;
    .registers 2
    .param p1, "callback"    # Ljava/lang/Runnable;

    .prologue
    .line 231
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mItemCallback:Ljava/lang/Runnable;

    .line 232
    return-object p0
.end method

.method public setCheckable(Z)Landroid/view/MenuItem;
    .registers 6
    .param p1, "checkable"    # Z

    .prologue
    const/4 v2, 0x0

    .line 447
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 448
    .local v0, "oldFlags":I
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v3, v1, -0x2

    if-eqz p1, :cond_17

    const/4 v1, 0x1

    :goto_a
    or-int/2addr v1, v3

    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 449
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    if-eq v0, v1, :cond_16

    .line 450
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v1, v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 453
    :cond_16
    return-object p0

    :cond_17
    move v1, v2

    .line 448
    goto :goto_a
.end method

.method public setChecked(Z)Landroid/view/MenuItem;
    .registers 3
    .param p1, "checked"    # Z

    .prologue
    .line 471
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_c

    .line 474
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->setExclusiveItemChecked(Landroid/view/MenuItem;)V

    .line 479
    :goto_b
    return-object p0

    .line 476
    :cond_c
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setCheckedInt(Z)V

    goto :goto_b
.end method

.method setCheckedInt(Z)V
    .registers 6
    .param p1, "checked"    # Z

    .prologue
    const/4 v2, 0x0

    .line 483
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 484
    .local v0, "oldFlags":I
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v3, v1, -0x3

    if-eqz p1, :cond_17

    const/4 v1, 0x2

    :goto_a
    or-int/2addr v1, v3

    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 485
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    if-eq v0, v1, :cond_16

    .line 486
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v1, v2}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 488
    :cond_16
    return-void

    :cond_17
    move v1, v2

    .line 484
    goto :goto_a
.end method

.method public setEnabled(Z)Landroid/view/MenuItem;
    .registers 4
    .param p1, "enabled"    # Z

    .prologue
    .line 184
    if-eqz p1, :cond_f

    .line 185
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 190
    :goto_8
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 192
    return-object p0

    .line 187
    :cond_f
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    goto :goto_8
.end method

.method public setExclusiveCheckable(Z)V
    .registers 4
    .param p1, "exclusive"    # Z

    .prologue
    .line 457
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v1, v0, -0x5

    if-eqz p1, :cond_b

    const/4 v0, 0x4

    :goto_7
    or-int/2addr v0, v1

    iput v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 458
    return-void

    .line 457
    :cond_b
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setIcon(I)Landroid/view/MenuItem;
    .registers 4
    .param p1, "iconResId"    # I

    .prologue
    .line 431
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 432
    iput p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconResId:I

    .line 435
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 437
    return-object p0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;
    .registers 4
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v1, 0x0

    .line 422
    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconResId:I

    .line 423
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 424
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 426
    return-object p0
.end method

.method public setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;
    .registers 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 222
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mIntent:Landroid/content/Intent;

    .line 223
    return-object p0
.end method

.method public setIsActionButton(Z)V
    .registers 3
    .param p1, "isActionButton"    # Z

    .prologue
    .line 566
    if-eqz p1, :cond_9

    .line 567
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 571
    :goto_8
    return-void

    .line 569
    :cond_9
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    goto :goto_8
.end method

.method setMenuInfo(Landroid/view/ContextMenu$ContextMenuInfo;)V
    .registers 2
    .param p1, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    .line 534
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    .line 535
    return-void
.end method

.method public setNumericShortcut(C)Landroid/view/MenuItem;
    .registers 4
    .param p1, "numericChar"    # C

    .prologue
    .line 260
    iget-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    if-ne v0, p1, :cond_5

    .line 268
    :goto_4
    return-object p0

    .line 264
    :cond_5
    iput-char p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    .line 266
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    goto :goto_4
.end method

.method public setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;
    .registers 4
    .param p1, "listener"    # Landroid/view/MenuItem$OnActionExpandListener;

    .prologue
    .line 729
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This is not supported, use MenuItemCompat.setOnActionExpandListener()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;
    .registers 2
    .param p1, "clickListener"    # Landroid/view/MenuItem$OnMenuItemClickListener;

    .prologue
    .line 524
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mClickListener:Landroid/view/MenuItem$OnMenuItemClickListener;

    .line 525
    return-object p0
.end method

.method public setShortcut(CC)Landroid/view/MenuItem;
    .registers 5
    .param p1, "numericChar"    # C
    .param p2, "alphaChar"    # C

    .prologue
    .line 273
    iput-char p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    .line 274
    invoke-static {p2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    iput-char v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    .line 276
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 278
    return-object p0
.end method

.method public setShowAsAction(I)V
    .registers 4
    .param p1, "actionEnum"    # I

    .prologue
    .line 579
    and-int/lit8 v0, p1, 0x3

    packed-switch v0, :pswitch_data_16

    .line 588
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SHOW_AS_ACTION_ALWAYS, SHOW_AS_ACTION_IF_ROOM, and SHOW_AS_ACTION_NEVER are mutually exclusive."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 591
    :pswitch_d
    iput p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    .line 592
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemActionRequestChanged(Landroid/support/v7/internal/view/menu/MenuItemImpl;)V

    .line 593
    return-void

    .line 579
    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_d
        :pswitch_d
        :pswitch_d
    .end packed-switch
.end method

.method public setShowAsActionFlags(I)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 2
    .param p1, "actionEnum"    # I

    .prologue
    .line 664
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setShowAsAction(I)V

    .line 665
    return-object p0
.end method

.method public bridge synthetic setShowAsActionFlags(I)Landroid/view/MenuItem;
    .registers 3
    .param p1, "x0"    # I

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setShowAsActionFlags(I)Landroid/support/v4/internal/view/SupportMenuItem;

    move-result-object v0

    return-object v0
.end method

.method setSubMenu(Landroid/support/v7/internal/view/menu/SubMenuBuilder;)V
    .registers 3
    .param p1, "subMenu"    # Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    .prologue
    .line 344
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mSubMenu:Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    .line 346
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/support/v7/internal/view/menu/SubMenuBuilder;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/SubMenu;

    .line 347
    return-void
.end method

.method public setSupportActionProvider(Landroid/support/v4/view/ActionProvider;)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 4
    .param p1, "actionProvider"    # Landroid/support/v4/view/ActionProvider;

    .prologue
    const/4 v1, 0x0

    .line 645
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    if-eqz v0, :cond_a

    .line 646
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ActionProvider;->setVisibilityListener(Landroid/support/v4/view/ActionProvider$VisibilityListener;)V

    .line 648
    :cond_a
    iput-object v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    .line 649
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    .line 650
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 651
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    if-eqz v0, :cond_22

    .line 652
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mActionProvider:Landroid/support/v4/view/ActionProvider;

    new-instance v1, Landroid/support/v7/internal/view/menu/MenuItemImpl$1;

    invoke-direct {v1, p0}, Landroid/support/v7/internal/view/menu/MenuItemImpl$1;-><init>(Landroid/support/v7/internal/view/menu/MenuItemImpl;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ActionProvider;->setVisibilityListener(Landroid/support/v4/view/ActionProvider$VisibilityListener;)V

    .line 659
    :cond_22
    return-object p0
.end method

.method public setSupportOnActionExpandListener(Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;)Landroid/support/v4/internal/view/SupportMenuItem;
    .registers 2
    .param p1, "listener"    # Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

    .prologue
    .line 703
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;

    .line 704
    return-object p0
.end method

.method public setTitle(I)Landroid/view/MenuItem;
    .registers 3
    .param p1, "title"    # I

    .prologue
    .line 382
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 4
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 369
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    .line 371
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 373
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mSubMenu:Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    if-eqz v0, :cond_11

    .line 374
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mSubMenu:Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    invoke-virtual {v0, p1}, Landroid/support/v7/internal/view/menu/SubMenuBuilder;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/SubMenu;

    .line 377
    :cond_11
    return-object p0
.end method

.method public setTitleCondensed(Ljava/lang/CharSequence;)Landroid/view/MenuItem;
    .registers 4
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 392
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitleCondensed:Ljava/lang/CharSequence;

    .line 395
    if-nez p1, :cond_6

    .line 396
    iget-object p1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    .line 399
    :cond_6
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 401
    return-object p0
.end method

.method public setVisible(Z)Landroid/view/MenuItem;
    .registers 3
    .param p1, "shown"    # Z

    .prologue
    .line 517
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->setVisibleInt(Z)Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->onItemVisibleChanged(Landroid/support/v7/internal/view/menu/MenuItemImpl;)V

    .line 519
    :cond_b
    return-object p0
.end method

.method setVisibleInt(Z)Z
    .registers 6
    .param p1, "shown"    # Z

    .prologue
    const/4 v2, 0x0

    .line 507
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 508
    .local v0, "oldFlags":I
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v3, v1, -0x9

    if-eqz p1, :cond_13

    move v1, v2

    :goto_a
    or-int/2addr v1, v3

    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 509
    iget v1, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mFlags:I

    if-eq v0, v1, :cond_12

    const/4 v2, 0x1

    :cond_12
    return v2

    .line 508
    :cond_13
    const/16 v1, 0x8

    goto :goto_a
.end method

.method public shouldShowIcon()Z
    .registers 2

    .prologue
    .line 550
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->getOptionalIconsVisible()Z

    move-result v0

    return v0
.end method

.method shouldShowShortcut()Z
    .registers 2

    .prologue
    .line 330
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->isShortcutsVisible()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuItemImpl;->getShortcut()C

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public showsTextAsAction()Z
    .registers 3

    .prologue
    .line 574
    iget v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    and-int/lit8 v0, v0, 0x4

    const/4 v1, 0x4

    if-ne v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 530
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
