.class public final Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;
.super Ljava/lang/Object;
.source "MenuItemImpl.java"

# interfaces
.implements Lcom/actionbarsherlock/view/MenuItem;


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
.field private mActionProvider:Lcom/actionbarsherlock/view/ActionProvider;

.field private mActionView:Landroid/view/View;

.field private final mCategoryOrder:I

.field private mClickListener:Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;

.field private mFlags:I

.field private final mGroup:I

.field private mIconDrawable:Landroid/graphics/drawable/Drawable;

.field private mIconResId:I

.field private final mId:I

.field private mIntent:Landroid/content/Intent;

.field private mIsActionViewExpanded:Z

.field private mItemCallback:Ljava/lang/Runnable;

.field private mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

.field private mMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

.field private mOnActionExpandListener:Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;

.field private final mOrdering:I

.field private mShortcutAlphabeticChar:C

.field private mShortcutNumericChar:C

.field private mShowAsAction:I

.field private mSubMenu:Lcom/actionbarsherlock/internal/view/menu/SubMenuBuilder;

.field private mTitle:Ljava/lang/CharSequence;

.field private mTitleCondensed:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>(Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;IIIILjava/lang/CharSequence;I)V
    .registers 10
    .param p1, "menu"    # Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;
    .param p2, "group"    # I
    .param p3, "id"    # I
    .param p4, "categoryOrder"    # I
    .param p5, "ordering"    # I
    .param p6, "title"    # Ljava/lang/CharSequence;
    .param p7, "showAsAction"    # I

    .prologue
    const/4 v1, 0x0

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIconResId:I

    .line 71
    const/16 v0, 0x10

    iput v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 79
    iput v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    .line 84
    iput-boolean v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIsActionViewExpanded:Z

    .line 128
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    .line 129
    iput p3, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mId:I

    .line 130
    iput p2, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mGroup:I

    .line 131
    iput p4, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mCategoryOrder:I

    .line 132
    iput p5, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mOrdering:I

    .line 133
    iput-object p6, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    .line 134
    iput p7, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    .line 135
    return-void
.end method


# virtual methods
.method public actionFormatChanged()V
    .registers 2

    .prologue
    .line 501
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemActionRequestChanged(Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;)V

    .line 502
    return-void
.end method

.method public collapseActionView()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 613
    iget v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    and-int/lit8 v1, v1, 0x8

    if-nez v1, :cond_8

    .line 626
    :cond_7
    :goto_7
    return v0

    .line 616
    :cond_8
    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    if-nez v1, :cond_e

    .line 618
    const/4 v0, 0x1

    goto :goto_7

    .line 621
    :cond_e
    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;

    if-eqz v1, :cond_1a

    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;

    .line 622
    invoke-interface {v1, p0}, Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;->onMenuItemActionCollapse(Lcom/actionbarsherlock/view/MenuItem;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 623
    :cond_1a
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->collapseItemActionView(Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;)Z

    move-result v0

    goto :goto_7
.end method

.method public expandActionView()Z
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 599
    iget v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    and-int/lit8 v1, v1, 0x8

    if-eqz v1, :cond_b

    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    if-nez v1, :cond_c

    .line 608
    :cond_b
    :goto_b
    return v0

    .line 603
    :cond_c
    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;

    if-eqz v1, :cond_18

    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;

    .line 604
    invoke-interface {v1, p0}, Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;->onMenuItemActionExpand(Lcom/actionbarsherlock/view/MenuItem;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 605
    :cond_18
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->expandItemActionView(Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;)Z

    move-result v0

    goto :goto_b
.end method

.method public getActionProvider()Lcom/actionbarsherlock/view/ActionProvider;
    .registers 2

    .prologue
    .line 581
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionProvider:Lcom/actionbarsherlock/view/ActionProvider;

    return-object v0
.end method

.method public getActionView()Landroid/view/View;
    .registers 2

    .prologue
    .line 570
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    if-eqz v0, :cond_7

    .line 571
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    .line 576
    :goto_6
    return-object v0

    .line 572
    :cond_7
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionProvider:Lcom/actionbarsherlock/view/ActionProvider;

    if-eqz v0, :cond_16

    .line 573
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionProvider:Lcom/actionbarsherlock/view/ActionProvider;

    invoke-virtual {v0}, Lcom/actionbarsherlock/view/ActionProvider;->onCreateActionView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    .line 574
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    goto :goto_6

    .line 576
    :cond_16
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getAlphabeticShortcut()C
    .registers 2

    .prologue
    .line 225
    iget-char v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    return v0
.end method

.method getCallback()Ljava/lang/Runnable;
    .registers 2

    .prologue
    .line 216
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mItemCallback:Ljava/lang/Runnable;

    return-object v0
.end method

.method public getGroupId()I
    .registers 2

    .prologue
    .line 190
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mGroup:I

    return v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 3

    .prologue
    .line 379
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_7

    .line 380
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 387
    :goto_6
    return-object v0

    .line 383
    :cond_7
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIconResId:I

    if-eqz v0, :cond_18

    .line 384
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIconResId:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_6

    .line 387
    :cond_18
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getIntent()Landroid/content/Intent;
    .registers 2

    .prologue
    .line 207
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public getItemId()I
    .registers 2
    .annotation runtime Landroid/view/ViewDebug$CapturedViewProperty;
    .end annotation

    .prologue
    .line 195
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mId:I

    return v0
.end method

.method public getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
    .registers 2

    .prologue
    .line 497
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    return-object v0
.end method

.method public getNumericShortcut()C
    .registers 2

    .prologue
    .line 239
    iget-char v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    return v0
.end method

.method public getOrder()I
    .registers 2

    .prologue
    .line 199
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mCategoryOrder:I

    return v0
.end method

.method public getOrdering()I
    .registers 2

    .prologue
    .line 203
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mOrdering:I

    return v0
.end method

.method getShortcut()C
    .registers 2

    .prologue
    .line 265
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->isQwertyMode()Z

    move-result v0

    if-eqz v0, :cond_b

    iget-char v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    :goto_a
    return v0

    :cond_b
    iget-char v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    goto :goto_a
.end method

.method getShortcutLabel()Ljava/lang/String;
    .registers 4

    .prologue
    .line 275
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->getShortcut()C

    move-result v1

    .line 276
    .local v1, "shortcut":C
    if-nez v1, :cond_9

    .line 277
    const-string v2, ""

    .line 300
    :goto_8
    return-object v2

    .line 280
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v2, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->sPrependShortcutLabel:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 281
    .local v0, "sb":Ljava/lang/StringBuilder;
    sparse-switch v1, :sswitch_data_2e

    .line 296
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 300
    :goto_16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_8

    .line 284
    :sswitch_1b
    sget-object v2, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->sEnterShortcutLabel:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_16

    .line 288
    :sswitch_21
    sget-object v2, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->sDeleteShortcutLabel:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_16

    .line 292
    :sswitch_27
    sget-object v2, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->sSpaceShortcutLabel:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_16

    .line 281
    nop

    :sswitch_data_2e
    .sparse-switch
        0x8 -> :sswitch_21
        0xa -> :sswitch_1b
        0x20 -> :sswitch_27
    .end sparse-switch
.end method

.method public getSubMenu()Lcom/actionbarsherlock/view/SubMenu;
    .registers 2

    .prologue
    .line 314
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mSubMenu:Lcom/actionbarsherlock/internal/view/menu/SubMenuBuilder;

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2
    .annotation runtime Landroid/view/ViewDebug$CapturedViewProperty;
    .end annotation

    .prologue
    .line 329
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTitleCondensed()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 362
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mTitleCondensed:Ljava/lang/CharSequence;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mTitleCondensed:Ljava/lang/CharSequence;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    goto :goto_6
.end method

.method getTitleForItemView(Lcom/actionbarsherlock/internal/view/menu/MenuView$ItemView;)Ljava/lang/CharSequence;
    .registers 3
    .param p1, "itemView"    # Lcom/actionbarsherlock/internal/view/menu/MenuView$ItemView;

    .prologue
    .line 340
    if-eqz p1, :cond_d

    invoke-interface {p1}, Lcom/actionbarsherlock/internal/view/menu/MenuView$ItemView;->prefersCondensedTitle()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 341
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->getTitleCondensed()Ljava/lang/CharSequence;

    move-result-object v0

    .line 342
    :goto_c
    return-object v0

    :cond_d
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_c
.end method

.method public hasCollapsibleActionView()Z
    .registers 2

    .prologue
    .line 636
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public hasSubMenu()Z
    .registers 2

    .prologue
    .line 318
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mSubMenu:Lcom/actionbarsherlock/internal/view/menu/SubMenuBuilder;

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

    .line 143
    iget-object v2, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mClickListener:Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;

    if-eqz v2, :cond_e

    iget-object v2, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mClickListener:Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;

    .line 144
    invoke-interface {v2, p0}, Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;->onMenuItemClick(Lcom/actionbarsherlock/view/MenuItem;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 170
    :cond_d
    :goto_d
    return v1

    .line 148
    :cond_e
    iget-object v2, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    iget-object v3, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v3}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->getRootMenu()Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    move-result-object v3

    invoke-virtual {v2, v3, p0}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->dispatchMenuItemSelected(Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;Lcom/actionbarsherlock/view/MenuItem;)Z

    move-result v2

    if-nez v2, :cond_d

    .line 152
    iget-object v2, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mItemCallback:Ljava/lang/Runnable;

    if-eqz v2, :cond_26

    .line 153
    iget-object v2, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mItemCallback:Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    goto :goto_d

    .line 157
    :cond_26
    iget-object v2, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIntent:Landroid/content/Intent;

    if-eqz v2, :cond_3e

    .line 159
    :try_start_2a
    iget-object v2, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v2}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIntent:Landroid/content/Intent;

    invoke-virtual {v2, v3}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_35
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2a .. :try_end_35} :catch_36

    goto :goto_d

    .line 161
    :catch_36
    move-exception v0

    .line 162
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    const-string v2, "MenuItemImpl"

    const-string v3, "Can\'t find activity to handle intent; ignoring"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 166
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    :cond_3e
    iget-object v2, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionProvider:Lcom/actionbarsherlock/view/ActionProvider;

    if-eqz v2, :cond_4a

    iget-object v2, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionProvider:Lcom/actionbarsherlock/view/ActionProvider;

    invoke-virtual {v2}, Lcom/actionbarsherlock/view/ActionProvider;->onPerformDefaultAction()Z

    move-result v2

    if-nez v2, :cond_d

    .line 170
    :cond_4a
    const/4 v1, 0x0

    goto :goto_d
.end method

.method public isActionButton()Z
    .registers 3

    .prologue
    .line 512
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

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
    .line 645
    iget-boolean v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIsActionViewExpanded:Z

    return v0
.end method

.method public isCheckable()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 409
    iget v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

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
    .line 431
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

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
    .line 174
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

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
    .line 427
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

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
    .registers 2

    .prologue
    .line 455
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, 0x8

    if-nez v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public requestsActionButton()Z
    .registers 3

    .prologue
    const/4 v0, 0x1

    .line 516
    iget v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShowAsAction:I

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
    .line 520
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShowAsAction:I

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

.method public setActionProvider(Lcom/actionbarsherlock/view/ActionProvider;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 4
    .param p1, "actionProvider"    # Lcom/actionbarsherlock/view/ActionProvider;

    .prologue
    .line 585
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    .line 586
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionProvider:Lcom/actionbarsherlock/view/ActionProvider;

    .line 587
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 588
    return-object p0
.end method

.method public setActionView(I)Lcom/actionbarsherlock/view/MenuItem;
    .registers 6
    .param p1, "resId"    # I

    .prologue
    .line 563
    iget-object v2, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v2}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 564
    .local v0, "context":Landroid/content/Context;
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 565
    .local v1, "inflater":Landroid/view/LayoutInflater;
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->setActionView(Landroid/view/View;)Lcom/actionbarsherlock/view/MenuItem;

    .line 566
    return-object p0
.end method

.method public setActionView(Landroid/view/View;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 553
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionView:Landroid/view/View;

    .line 554
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mActionProvider:Lcom/actionbarsherlock/view/ActionProvider;

    .line 555
    if-eqz p1, :cond_17

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_17

    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mId:I

    if-lez v0, :cond_17

    .line 556
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mId:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setId(I)V

    .line 558
    :cond_17
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemActionRequestChanged(Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;)V

    .line 559
    return-object p0
.end method

.method public setActionViewExpanded(Z)V
    .registers 4
    .param p1, "isExpanded"    # Z

    .prologue
    .line 640
    iput-boolean p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIsActionViewExpanded:Z

    .line 641
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 642
    return-void
.end method

.method public setAlphabeticShortcut(C)Lcom/actionbarsherlock/view/MenuItem;
    .registers 4
    .param p1, "alphaChar"    # C

    .prologue
    .line 229
    iget-char v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    if-ne v0, p1, :cond_5

    .line 235
    :goto_4
    return-object p0

    .line 231
    :cond_5
    invoke-static {p1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    iput-char v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    .line 233
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    goto :goto_4
.end method

.method public setCallback(Ljava/lang/Runnable;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 2
    .param p1, "callback"    # Ljava/lang/Runnable;

    .prologue
    .line 220
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mItemCallback:Ljava/lang/Runnable;

    .line 221
    return-object p0
.end method

.method public setCheckable(Z)Lcom/actionbarsherlock/view/MenuItem;
    .registers 6
    .param p1, "checkable"    # Z

    .prologue
    const/4 v2, 0x0

    .line 413
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 414
    .local v0, "oldFlags":I
    iget v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v3, v1, -0x2

    if-eqz p1, :cond_17

    const/4 v1, 0x1

    :goto_a
    or-int/2addr v1, v3

    iput v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 415
    iget v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    if-eq v0, v1, :cond_16

    .line 416
    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v1, v2}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 419
    :cond_16
    return-object p0

    :cond_17
    move v1, v2

    .line 414
    goto :goto_a
.end method

.method public setChecked(Z)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "checked"    # Z

    .prologue
    .line 435
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_c

    .line 438
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->setExclusiveItemChecked(Lcom/actionbarsherlock/view/MenuItem;)V

    .line 443
    :goto_b
    return-object p0

    .line 440
    :cond_c
    invoke-virtual {p0, p1}, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->setCheckedInt(Z)V

    goto :goto_b
.end method

.method setCheckedInt(Z)V
    .registers 6
    .param p1, "checked"    # Z

    .prologue
    const/4 v2, 0x0

    .line 447
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 448
    .local v0, "oldFlags":I
    iget v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v3, v1, -0x3

    if-eqz p1, :cond_17

    const/4 v1, 0x2

    :goto_a
    or-int/2addr v1, v3

    iput v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 449
    iget v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    if-eq v0, v1, :cond_16

    .line 450
    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v1, v2}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 452
    :cond_16
    return-void

    :cond_17
    move v1, v2

    .line 448
    goto :goto_a
.end method

.method public setEnabled(Z)Lcom/actionbarsherlock/view/MenuItem;
    .registers 4
    .param p1, "enabled"    # Z

    .prologue
    .line 178
    if-eqz p1, :cond_f

    .line 179
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 184
    :goto_8
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 186
    return-object p0

    .line 181
    :cond_f
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    goto :goto_8
.end method

.method public setExclusiveCheckable(Z)V
    .registers 4
    .param p1, "exclusive"    # Z

    .prologue
    .line 423
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v1, v0, -0x5

    if-eqz p1, :cond_b

    const/4 v0, 0x4

    :goto_7
    or-int/2addr v0, v1

    iput v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 424
    return-void

    .line 423
    :cond_b
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public setIcon(I)Lcom/actionbarsherlock/view/MenuItem;
    .registers 4
    .param p1, "iconResId"    # I

    .prologue
    .line 399
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 400
    iput p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIconResId:I

    .line 403
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 405
    return-object p0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 4
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    const/4 v1, 0x0

    .line 391
    iput v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIconResId:I

    .line 392
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIconDrawable:Landroid/graphics/drawable/Drawable;

    .line 393
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 395
    return-object p0
.end method

.method public setIntent(Landroid/content/Intent;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 211
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mIntent:Landroid/content/Intent;

    .line 212
    return-object p0
.end method

.method public setIsActionButton(Z)V
    .registers 3
    .param p1, "isActionButton"    # Z

    .prologue
    .line 524
    if-eqz p1, :cond_9

    .line 525
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 529
    :goto_8
    return-void

    .line 527
    :cond_9
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v0, v0, -0x21

    iput v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    goto :goto_8
.end method

.method setMenuInfo(Landroid/view/ContextMenu$ContextMenuInfo;)V
    .registers 2
    .param p1, "menuInfo"    # Landroid/view/ContextMenu$ContextMenuInfo;

    .prologue
    .line 493
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    .line 494
    return-void
.end method

.method public setNumericShortcut(C)Lcom/actionbarsherlock/view/MenuItem;
    .registers 4
    .param p1, "numericChar"    # C

    .prologue
    .line 243
    iget-char v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    if-ne v0, p1, :cond_5

    .line 249
    :goto_4
    return-object p0

    .line 245
    :cond_5
    iput-char p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    .line 247
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    goto :goto_4
.end method

.method public setOnActionExpandListener(Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 2
    .param p1, "listener"    # Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;

    .prologue
    .line 631
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mOnActionExpandListener:Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;

    .line 632
    return-object p0
.end method

.method public setOnMenuItemClickListener(Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 2
    .param p1, "clickListener"    # Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;

    .prologue
    .line 483
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mClickListener:Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;

    .line 484
    return-object p0
.end method

.method public setShortcut(CC)Lcom/actionbarsherlock/view/MenuItem;
    .registers 5
    .param p1, "numericChar"    # C
    .param p2, "alphaChar"    # C

    .prologue
    .line 253
    iput-char p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShortcutNumericChar:C

    .line 254
    invoke-static {p2}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    iput-char v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShortcutAlphabeticChar:C

    .line 256
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 258
    return-object p0
.end method

.method public setShowAsAction(I)V
    .registers 4
    .param p1, "actionEnum"    # I

    .prologue
    .line 536
    and-int/lit8 v0, p1, 0x3

    packed-switch v0, :pswitch_data_16

    .line 545
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "SHOW_AS_ACTION_ALWAYS, SHOW_AS_ACTION_IF_ROOM, and SHOW_AS_ACTION_NEVER are mutually exclusive."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 548
    :pswitch_d
    iput p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShowAsAction:I

    .line 549
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemActionRequestChanged(Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;)V

    .line 550
    return-void

    .line 536
    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_d
        :pswitch_d
        :pswitch_d
    .end packed-switch
.end method

.method public setShowAsActionFlags(I)Lcom/actionbarsherlock/view/MenuItem;
    .registers 2
    .param p1, "actionEnum"    # I

    .prologue
    .line 593
    invoke-virtual {p0, p1}, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->setShowAsAction(I)V

    .line 594
    return-object p0
.end method

.method setSubMenu(Lcom/actionbarsherlock/internal/view/menu/SubMenuBuilder;)V
    .registers 3
    .param p1, "subMenu"    # Lcom/actionbarsherlock/internal/view/menu/SubMenuBuilder;

    .prologue
    .line 322
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mSubMenu:Lcom/actionbarsherlock/internal/view/menu/SubMenuBuilder;

    .line 324
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/actionbarsherlock/internal/view/menu/SubMenuBuilder;->setHeaderTitle(Ljava/lang/CharSequence;)Lcom/actionbarsherlock/view/SubMenu;

    .line 325
    return-void
.end method

.method public setTitle(I)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "title"    # I

    .prologue
    .line 358
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->setTitle(Ljava/lang/CharSequence;)Lcom/actionbarsherlock/view/MenuItem;

    move-result-object v0

    return-object v0
.end method

.method public setTitle(Ljava/lang/CharSequence;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 4
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 346
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    .line 348
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 350
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mSubMenu:Lcom/actionbarsherlock/internal/view/menu/SubMenuBuilder;

    if-eqz v0, :cond_11

    .line 351
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mSubMenu:Lcom/actionbarsherlock/internal/view/menu/SubMenuBuilder;

    invoke-virtual {v0, p1}, Lcom/actionbarsherlock/internal/view/menu/SubMenuBuilder;->setHeaderTitle(Ljava/lang/CharSequence;)Lcom/actionbarsherlock/view/SubMenu;

    .line 354
    :cond_11
    return-object p0
.end method

.method public setTitleCondensed(Ljava/lang/CharSequence;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 4
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 366
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mTitleCondensed:Ljava/lang/CharSequence;

    .line 369
    if-nez p1, :cond_6

    .line 370
    iget-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    .line 373
    :cond_6
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemsChanged(Z)V

    .line 375
    return-object p0
.end method

.method public setVisible(Z)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "shown"    # Z

    .prologue
    .line 477
    invoke-virtual {p0, p1}, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->setVisibleInt(Z)Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->onItemVisibleChanged(Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;)V

    .line 479
    :cond_b
    return-object p0
.end method

.method setVisibleInt(Z)Z
    .registers 6
    .param p1, "shown"    # Z

    .prologue
    const/4 v2, 0x0

    .line 468
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 469
    .local v0, "oldFlags":I
    iget v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    and-int/lit8 v3, v1, -0x9

    if-eqz p1, :cond_13

    move v1, v2

    :goto_a
    or-int/2addr v1, v3

    iput v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    .line 470
    iget v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mFlags:I

    if-eq v0, v1, :cond_12

    const/4 v2, 0x1

    :cond_12
    return v2

    .line 469
    :cond_13
    const/16 v1, 0x8

    goto :goto_a
.end method

.method public shouldShowIcon()Z
    .registers 2

    .prologue
    .line 508
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->getOptionalIconsVisible()Z

    move-result v0

    return v0
.end method

.method shouldShowShortcut()Z
    .registers 2

    .prologue
    .line 310
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mMenu:Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/actionbarsherlock/internal/view/menu/MenuBuilder;->isShortcutsVisible()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->getShortcut()C

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
    .line 532
    iget v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mShowAsAction:I

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
    .line 489
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemImpl;->mTitle:Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
