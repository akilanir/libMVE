.class public Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;
.super Ljava/lang/Object;
.source "MenuItemWrapper.java"

# interfaces
.implements Lcom/actionbarsherlock/view/MenuItem;
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field private mActionExpandListener:Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;

.field private mMenuItemClickListener:Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;

.field private mNativeActionExpandListener:Landroid/view/MenuItem$OnActionExpandListener;

.field private final mNativeItem:Landroid/view/MenuItem;

.field private mSubMenu:Lcom/actionbarsherlock/view/SubMenu;


# direct methods
.method public constructor <init>(Landroid/view/MenuItem;)V
    .registers 4
    .param p1, "nativeItem"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mSubMenu:Lcom/actionbarsherlock/view/SubMenu;

    .line 17
    iput-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mMenuItemClickListener:Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;

    .line 18
    iput-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mActionExpandListener:Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;

    .line 19
    iput-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeActionExpandListener:Landroid/view/MenuItem$OnActionExpandListener;

    .line 23
    if-nez p1, :cond_16

    .line 24
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Wrapped menu item cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 26
    :cond_16
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    .line 27
    return-void
.end method

.method static synthetic access$000(Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;)Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;
    .registers 2
    .param p0, "x0"    # Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mActionExpandListener:Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;

    return-object v0
.end method


# virtual methods
.method public collapseActionView()Z
    .registers 2

    .prologue
    .line 273
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->collapseActionView()Z

    move-result v0

    return v0
.end method

.method public expandActionView()Z
    .registers 2

    .prologue
    .line 268
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->expandActionView()Z

    move-result v0

    return v0
.end method

.method public getActionProvider()Lcom/actionbarsherlock/view/ActionProvider;
    .registers 3

    .prologue
    .line 259
    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v1}, Landroid/view/MenuItem;->getActionProvider()Landroid/view/ActionProvider;

    move-result-object v0

    .line 260
    .local v0, "nativeProvider":Landroid/view/ActionProvider;
    if-eqz v0, :cond_13

    instance-of v1, v0, Lcom/actionbarsherlock/internal/view/ActionProviderWrapper;

    if-eqz v1, :cond_13

    .line 261
    check-cast v0, Lcom/actionbarsherlock/internal/view/ActionProviderWrapper;

    .end local v0    # "nativeProvider":Landroid/view/ActionProvider;
    invoke-virtual {v0}, Lcom/actionbarsherlock/internal/view/ActionProviderWrapper;->unwrap()Lcom/actionbarsherlock/view/ActionProvider;

    move-result-object v1

    .line 263
    :goto_12
    return-object v1

    .restart local v0    # "nativeProvider":Landroid/view/ActionProvider;
    :cond_13
    const/4 v1, 0x0

    goto :goto_12
.end method

.method public getActionView()Landroid/view/View;
    .registers 3

    .prologue
    .line 244
    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v0

    .line 245
    .local v0, "actionView":Landroid/view/View;
    instance-of v1, v0, Lcom/actionbarsherlock/internal/widget/CollapsibleActionViewWrapper;

    if-eqz v1, :cond_10

    .line 246
    check-cast v0, Lcom/actionbarsherlock/internal/widget/CollapsibleActionViewWrapper;

    .end local v0    # "actionView":Landroid/view/View;
    invoke-virtual {v0}, Lcom/actionbarsherlock/internal/widget/CollapsibleActionViewWrapper;->unwrap()Landroid/view/View;

    move-result-object v0

    .line 248
    :cond_10
    return-object v0
.end method

.method public getAlphabeticShortcut()C
    .registers 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getAlphabeticShortcut()C

    move-result v0

    return v0
.end method

.method public getGroupId()I
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getGroupId()I

    move-result v0

    return v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .registers 2

    .prologue
    .line 87
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getIntent()Landroid/content/Intent;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getIntent()Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public getItemId()I
    .registers 2

    .prologue
    .line 32
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    return v0
.end method

.method public getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
    .registers 2

    .prologue
    .line 204
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;

    move-result-object v0

    return-object v0
.end method

.method public getNumericShortcut()C
    .registers 2

    .prologue
    .line 115
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getNumericShortcut()C

    move-result v0

    return v0
.end method

.method public getOrder()I
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getOrder()I

    move-result v0

    return v0
.end method

.method public getSubMenu()Lcom/actionbarsherlock/view/SubMenu;
    .registers 3

    .prologue
    .line 180
    invoke-virtual {p0}, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->hasSubMenu()Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mSubMenu:Lcom/actionbarsherlock/view/SubMenu;

    if-nez v0, :cond_17

    .line 181
    new-instance v0, Lcom/actionbarsherlock/internal/view/menu/SubMenuWrapper;

    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v1}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/actionbarsherlock/internal/view/menu/SubMenuWrapper;-><init>(Landroid/view/SubMenu;)V

    iput-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mSubMenu:Lcom/actionbarsherlock/view/SubMenu;

    .line 183
    :cond_17
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mSubMenu:Lcom/actionbarsherlock/view/SubMenu;

    return-object v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getTitleCondensed()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 70
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->getTitleCondensed()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public hasSubMenu()Z
    .registers 2

    .prologue
    .line 175
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->hasSubMenu()Z

    move-result v0

    return v0
.end method

.method public isActionViewExpanded()Z
    .registers 2

    .prologue
    .line 278
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v0

    return v0
.end method

.method public isCheckable()Z
    .registers 2

    .prologue
    .line 137
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->isCheckable()Z

    move-result v0

    return v0
.end method

.method public isChecked()Z
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->isChecked()Z

    move-result v0

    return v0
.end method

.method public isEnabled()Z
    .registers 2

    .prologue
    .line 170
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->isEnabled()Z

    move-result v0

    return v0
.end method

.method public isVisible()Z
    .registers 2

    .prologue
    .line 159
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->isVisible()Z

    move-result v0

    return v0
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 196
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mMenuItemClickListener:Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;

    if-eqz v0, :cond_b

    .line 197
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mMenuItemClickListener:Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;

    invoke-interface {v0, p0}, Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;->onMenuItemClick(Lcom/actionbarsherlock/view/MenuItem;)Z

    move-result v0

    .line 199
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public setActionProvider(Lcom/actionbarsherlock/view/ActionProvider;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 4
    .param p1, "actionProvider"    # Lcom/actionbarsherlock/view/ActionProvider;

    .prologue
    .line 253
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    new-instance v1, Lcom/actionbarsherlock/internal/view/ActionProviderWrapper;

    invoke-direct {v1, p1}, Lcom/actionbarsherlock/internal/view/ActionProviderWrapper;-><init>(Lcom/actionbarsherlock/view/ActionProvider;)V

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setActionProvider(Landroid/view/ActionProvider;)Landroid/view/MenuItem;

    .line 254
    return-object p0
.end method

.method public setActionView(I)Lcom/actionbarsherlock/view/MenuItem;
    .registers 5
    .param p1, "resId"    # I

    .prologue
    .line 230
    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v1, p1}, Landroid/view/MenuItem;->setActionView(I)Landroid/view/MenuItem;

    .line 231
    if-eqz p1, :cond_1b

    .line 233
    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object v0

    .line 234
    .local v0, "view":Landroid/view/View;
    instance-of v1, v0, Lcom/actionbarsherlock/view/CollapsibleActionView;

    if-eqz v1, :cond_1b

    .line 236
    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    new-instance v2, Lcom/actionbarsherlock/internal/widget/CollapsibleActionViewWrapper;

    invoke-direct {v2, v0}, Lcom/actionbarsherlock/internal/widget/CollapsibleActionViewWrapper;-><init>(Landroid/view/View;)V

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setActionView(Landroid/view/View;)Landroid/view/MenuItem;

    .line 239
    .end local v0    # "view":Landroid/view/View;
    :cond_1b
    return-object p0
.end method

.method public setActionView(Landroid/view/View;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 220
    if-eqz p1, :cond_c

    instance-of v1, p1, Lcom/actionbarsherlock/view/CollapsibleActionView;

    if-eqz v1, :cond_c

    .line 221
    new-instance v0, Lcom/actionbarsherlock/internal/widget/CollapsibleActionViewWrapper;

    invoke-direct {v0, p1}, Lcom/actionbarsherlock/internal/widget/CollapsibleActionViewWrapper;-><init>(Landroid/view/View;)V

    .end local p1    # "view":Landroid/view/View;
    .local v0, "view":Landroid/view/View;
    move-object p1, v0

    .line 223
    .end local v0    # "view":Landroid/view/View;
    .restart local p1    # "view":Landroid/view/View;
    :cond_c
    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v1, p1}, Landroid/view/MenuItem;->setActionView(Landroid/view/View;)Landroid/view/MenuItem;

    .line 224
    return-object p0
.end method

.method public setAlphabeticShortcut(C)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "alphaChar"    # C

    .prologue
    .line 120
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setAlphabeticShortcut(C)Landroid/view/MenuItem;

    .line 121
    return-object p0
.end method

.method public setCheckable(Z)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "checkable"    # Z

    .prologue
    .line 131
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setCheckable(Z)Landroid/view/MenuItem;

    .line 132
    return-object p0
.end method

.method public setChecked(Z)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "checked"    # Z

    .prologue
    .line 142
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    .line 143
    return-object p0
.end method

.method public setEnabled(Z)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "enabled"    # Z

    .prologue
    .line 164
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 165
    return-object p0
.end method

.method public setIcon(I)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "iconRes"    # I

    .prologue
    .line 81
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    .line 82
    return-object p0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    .line 76
    return-object p0
.end method

.method public setIntent(Landroid/content/Intent;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setIntent(Landroid/content/Intent;)Landroid/view/MenuItem;

    .line 93
    return-object p0
.end method

.method public setNumericShortcut(C)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "numericChar"    # C

    .prologue
    .line 109
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setNumericShortcut(C)Landroid/view/MenuItem;

    .line 110
    return-object p0
.end method

.method public setOnActionExpandListener(Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 4
    .param p1, "listener"    # Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;

    .prologue
    .line 283
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mActionExpandListener:Lcom/actionbarsherlock/view/MenuItem$OnActionExpandListener;

    .line 285
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeActionExpandListener:Landroid/view/MenuItem$OnActionExpandListener;

    if-nez v0, :cond_14

    .line 286
    new-instance v0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper$1;

    invoke-direct {v0, p0}, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper$1;-><init>(Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;)V

    iput-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeActionExpandListener:Landroid/view/MenuItem$OnActionExpandListener;

    .line 305
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    iget-object v1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeActionExpandListener:Landroid/view/MenuItem$OnActionExpandListener;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;

    .line 308
    :cond_14
    return-object p0
.end method

.method public setOnMenuItemClickListener(Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "menuItemClickListener"    # Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;

    .prologue
    .line 188
    iput-object p1, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mMenuItemClickListener:Lcom/actionbarsherlock/view/MenuItem$OnMenuItemClickListener;

    .line 190
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 191
    return-object p0
.end method

.method public setShortcut(CC)Lcom/actionbarsherlock/view/MenuItem;
    .registers 4
    .param p1, "numericChar"    # C
    .param p2, "alphaChar"    # C

    .prologue
    .line 103
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1, p2}, Landroid/view/MenuItem;->setShortcut(CC)Landroid/view/MenuItem;

    .line 104
    return-object p0
.end method

.method public setShowAsAction(I)V
    .registers 3
    .param p1, "actionEnum"    # I

    .prologue
    .line 209
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 210
    return-void
.end method

.method public setShowAsActionFlags(I)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "actionEnum"    # I

    .prologue
    .line 214
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setShowAsActionFlags(I)Landroid/view/MenuItem;

    .line 215
    return-object p0
.end method

.method public setTitle(I)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "title"    # I

    .prologue
    .line 53
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 54
    return-object p0
.end method

.method public setTitle(Ljava/lang/CharSequence;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 47
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 48
    return-object p0
.end method

.method public setTitleCondensed(Ljava/lang/CharSequence;)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setTitleCondensed(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 65
    return-object p0
.end method

.method public setVisible(Z)Lcom/actionbarsherlock/view/MenuItem;
    .registers 3
    .param p1, "visible"    # Z

    .prologue
    .line 153
    iget-object v0, p0, Lcom/actionbarsherlock/internal/view/menu/MenuItemWrapper;->mNativeItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 154
    return-object p0
.end method
