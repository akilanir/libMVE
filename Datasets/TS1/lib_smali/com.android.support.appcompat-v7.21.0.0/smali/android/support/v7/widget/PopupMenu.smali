.class public Landroid/support/v7/widget/PopupMenu;
.super Ljava/lang/Object;
.source "PopupMenu.java"

# interfaces
.implements Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;
.implements Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;,
        Landroid/support/v7/widget/PopupMenu$OnDismissListener;
    }
.end annotation


# instance fields
.field private mAnchor:Landroid/view/View;

.field private mContext:Landroid/content/Context;

.field private mDismissListener:Landroid/support/v7/widget/PopupMenu$OnDismissListener;

.field private mDragListener:Landroid/view/View$OnTouchListener;

.field private mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

.field private mMenuItemClickListener:Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;

.field private mPopup:Landroid/support/v7/internal/view/menu/MenuPopupHelper;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/View;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "anchor"    # Landroid/view/View;

    .prologue
    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;I)V

    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "anchor"    # Landroid/view/View;
    .param p3, "gravity"    # I

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object p1, p0, Landroid/support/v7/widget/PopupMenu;->mContext:Landroid/content/Context;

    .line 83
    new-instance v0, Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-direct {v0, p1}, Landroid/support/v7/internal/view/menu/MenuBuilder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    .line 84
    iget-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->setCallback(Landroid/support/v7/internal/view/menu/MenuBuilder$Callback;)V

    .line 85
    iput-object p2, p0, Landroid/support/v7/widget/PopupMenu;->mAnchor:Landroid/view/View;

    .line 86
    new-instance v0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;

    iget-object v1, p0, Landroid/support/v7/widget/PopupMenu;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-direct {v0, p1, v1, p2}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;-><init>(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/View;)V

    iput-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mPopup:Landroid/support/v7/internal/view/menu/MenuPopupHelper;

    .line 87
    iget-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mPopup:Landroid/support/v7/internal/view/menu/MenuPopupHelper;

    invoke-virtual {v0, p3}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->setGravity(I)V

    .line 88
    iget-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mPopup:Landroid/support/v7/internal/view/menu/MenuPopupHelper;

    invoke-virtual {v0, p0}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->setCallback(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;)V

    .line 89
    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/widget/PopupMenu;)Landroid/support/v7/internal/view/menu/MenuPopupHelper;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/widget/PopupMenu;

    .prologue
    .line 40
    iget-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mPopup:Landroid/support/v7/internal/view/menu/MenuPopupHelper;

    return-object v0
.end method


# virtual methods
.method public dismiss()V
    .registers 2

    .prologue
    .line 176
    iget-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mPopup:Landroid/support/v7/internal/view/menu/MenuPopupHelper;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->dismiss()V

    .line 177
    return-void
.end method

.method public getDragToOpenListener()Landroid/view/View$OnTouchListener;
    .registers 3

    .prologue
    .line 108
    iget-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mDragListener:Landroid/view/View$OnTouchListener;

    if-nez v0, :cond_d

    .line 109
    new-instance v0, Landroid/support/v7/widget/PopupMenu$1;

    iget-object v1, p0, Landroid/support/v7/widget/PopupMenu;->mAnchor:Landroid/view/View;

    invoke-direct {v0, p0, v1}, Landroid/support/v7/widget/PopupMenu$1;-><init>(Landroid/support/v7/widget/PopupMenu;Landroid/view/View;)V

    iput-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mDragListener:Landroid/view/View$OnTouchListener;

    .line 130
    :cond_d
    iget-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mDragListener:Landroid/view/View$OnTouchListener;

    return-object v0
.end method

.method public getMenu()Landroid/view/Menu;
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    return-object v0
.end method

.method public getMenuInflater()Landroid/view/MenuInflater;
    .registers 3

    .prologue
    .line 151
    new-instance v0, Landroid/support/v7/internal/view/SupportMenuInflater;

    iget-object v1, p0, Landroid/support/v7/widget/PopupMenu;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/support/v7/internal/view/SupportMenuInflater;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public inflate(I)V
    .registers 4
    .param p1, "menuRes"    # I

    .prologue
    .line 160
    invoke-virtual {p0}, Landroid/support/v7/widget/PopupMenu;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/widget/PopupMenu;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0, p1, v1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 161
    return-void
.end method

.method public onCloseMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;Z)V
    .registers 4
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "allMenusAreClosing"    # Z

    .prologue
    .line 211
    iget-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mDismissListener:Landroid/support/v7/widget/PopupMenu$OnDismissListener;

    if-eqz v0, :cond_9

    .line 212
    iget-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mDismissListener:Landroid/support/v7/widget/PopupMenu$OnDismissListener;

    invoke-interface {v0, p0}, Landroid/support/v7/widget/PopupMenu$OnDismissListener;->onDismiss(Landroid/support/v7/widget/PopupMenu;)V

    .line 214
    :cond_9
    return-void
.end method

.method public onCloseSubMenu(Landroid/support/v7/internal/view/menu/SubMenuBuilder;)V
    .registers 2
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    .prologue
    .line 235
    return-void
.end method

.method public onMenuItemSelected(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z
    .registers 4
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 201
    iget-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mMenuItemClickListener:Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;

    if-eqz v0, :cond_b

    .line 202
    iget-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mMenuItemClickListener:Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;

    invoke-interface {v0, p2}, Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    .line 204
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public onMenuModeChange(Landroid/support/v7/internal/view/menu/MenuBuilder;)V
    .registers 2
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;

    .prologue
    .line 241
    return-void
.end method

.method public onOpenSubMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;)Z
    .registers 6
    .param p1, "subMenu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;

    .prologue
    const/4 v0, 0x1

    .line 220
    if-nez p1, :cond_5

    const/4 v0, 0x0

    .line 228
    :cond_4
    :goto_4
    return v0

    .line 222
    :cond_5
    invoke-virtual {p1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->hasVisibleItems()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 227
    new-instance v1, Landroid/support/v7/internal/view/menu/MenuPopupHelper;

    iget-object v2, p0, Landroid/support/v7/widget/PopupMenu;->mContext:Landroid/content/Context;

    iget-object v3, p0, Landroid/support/v7/widget/PopupMenu;->mAnchor:Landroid/view/View;

    invoke-direct {v1, v2, p1, v3}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;-><init>(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/View;)V

    invoke-virtual {v1}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->show()V

    goto :goto_4
.end method

.method public setOnDismissListener(Landroid/support/v7/widget/PopupMenu$OnDismissListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v7/widget/PopupMenu$OnDismissListener;

    .prologue
    .line 194
    iput-object p1, p0, Landroid/support/v7/widget/PopupMenu;->mDismissListener:Landroid/support/v7/widget/PopupMenu$OnDismissListener;

    .line 195
    return-void
.end method

.method public setOnMenuItemClickListener(Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;)V
    .registers 2
    .param p1, "listener"    # Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;

    .prologue
    .line 185
    iput-object p1, p0, Landroid/support/v7/widget/PopupMenu;->mMenuItemClickListener:Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;

    .line 186
    return-void
.end method

.method public show()V
    .registers 2

    .prologue
    .line 168
    iget-object v0, p0, Landroid/support/v7/widget/PopupMenu;->mPopup:Landroid/support/v7/internal/view/menu/MenuPopupHelper;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->show()V

    .line 169
    return-void
.end method
