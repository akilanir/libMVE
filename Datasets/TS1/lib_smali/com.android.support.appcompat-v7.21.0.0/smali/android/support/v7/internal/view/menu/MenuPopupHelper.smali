.class public Landroid/support/v7/internal/view/menu/MenuPopupHelper;
.super Ljava/lang/Object;
.source "MenuPopupHelper.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Landroid/widget/PopupWindow$OnDismissListener;
.implements Landroid/support/v7/internal/view/menu/MenuPresenter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;
    }
.end annotation


# static fields
.field static final ITEM_LAYOUT:I

.field private static final TAG:Ljava/lang/String; = "MenuPopupHelper"


# instance fields
.field private final mAdapter:Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;

.field private mAnchorView:Landroid/view/View;

.field private mContentWidth:I

.field private final mContext:Landroid/content/Context;

.field private mDropDownGravity:I

.field mForceShowIcon:Z

.field private mHasContentWidth:Z

.field private final mInflater:Landroid/view/LayoutInflater;

.field private mMeasureParent:Landroid/view/ViewGroup;

.field private final mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

.field private final mOverflowOnly:Z

.field private mPopup:Landroid/support/v7/widget/ListPopupWindow;

.field private final mPopupMaxWidth:I

.field private final mPopupStyleAttr:I

.field private mPresenterCallback:Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

.field private mTreeObserver:Landroid/view/ViewTreeObserver;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 51
    sget v0, Landroid/support/v7/appcompat/R$layout;->abc_popup_menu_item_layout:I

    sput v0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->ITEM_LAYOUT:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;

    .prologue
    .line 79
    const/4 v3, 0x0

    const/4 v4, 0x0

    sget v5, Landroid/support/v7/appcompat/R$attr;->popupMenuStyle:I

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;-><init>(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/View;ZI)V

    .line 80
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/View;)V
    .registers 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p3, "anchorView"    # Landroid/view/View;

    .prologue
    .line 83
    const/4 v4, 0x0

    sget v5, Landroid/support/v7/appcompat/R$attr;->popupMenuStyle:I

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;-><init>(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/View;ZI)V

    .line 84
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/View;ZI)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p3, "anchorView"    # Landroid/view/View;
    .param p4, "overflowOnly"    # Z
    .param p5, "popupStyleAttr"    # I

    .prologue
    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    const/4 v1, 0x0

    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mDropDownGravity:I

    .line 88
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mContext:Landroid/content/Context;

    .line 89
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    iput-object v1, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mInflater:Landroid/view/LayoutInflater;

    .line 90
    iput-object p2, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    .line 91
    new-instance v1, Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;

    iget-object v2, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-direct {v1, p0, v2}, Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;-><init>(Landroid/support/v7/internal/view/menu/MenuPopupHelper;Landroid/support/v7/internal/view/menu/MenuBuilder;)V

    iput-object v1, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mAdapter:Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;

    .line 92
    iput-boolean p4, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mOverflowOnly:Z

    .line 93
    iput p5, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopupStyleAttr:I

    .line 95
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 96
    .local v0, "res":Landroid/content/res/Resources;
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit8 v1, v1, 0x2

    sget v2, Landroid/support/v7/appcompat/R$dimen;->abc_config_prefDialogWidth:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopupMaxWidth:I

    .line 99
    iput-object p3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mAnchorView:Landroid/view/View;

    .line 102
    invoke-virtual {p2, p0, p1}, Landroid/support/v7/internal/view/menu/MenuBuilder;->addMenuPresenter(Landroid/support/v7/internal/view/menu/MenuPresenter;Landroid/content/Context;)V

    .line 103
    return-void
.end method

.method static synthetic access$100(Landroid/support/v7/internal/view/menu/MenuPopupHelper;)Z
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/view/menu/MenuPopupHelper;

    .prologue
    .line 45
    iget-boolean v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mOverflowOnly:Z

    return v0
.end method

.method static synthetic access$200(Landroid/support/v7/internal/view/menu/MenuPopupHelper;)Landroid/view/LayoutInflater;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/view/menu/MenuPopupHelper;

    .prologue
    .line 45
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mInflater:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/v7/internal/view/menu/MenuPopupHelper;)Landroid/support/v7/internal/view/menu/MenuBuilder;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/view/menu/MenuPopupHelper;

    .prologue
    .line 45
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    return-object v0
.end method

.method private measureContentWidth()I
    .registers 13

    .prologue
    const/4 v10, 0x0

    .line 193
    const/4 v7, 0x0

    .line 194
    .local v7, "maxWidth":I
    const/4 v5, 0x0

    .line 195
    .local v5, "itemView":Landroid/view/View;
    const/4 v4, 0x0

    .line 197
    .local v4, "itemType":I
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mAdapter:Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;

    .line 198
    .local v0, "adapter":Landroid/widget/ListAdapter;
    invoke-static {v10, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v9

    .line 199
    .local v9, "widthMeasureSpec":I
    invoke-static {v10, v10}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 200
    .local v2, "heightMeasureSpec":I
    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    .line 201
    .local v1, "count":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_13
    if-ge v3, v1, :cond_3d

    .line 202
    invoke-interface {v0, v3}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v8

    .line 203
    .local v8, "positionType":I
    if-eq v8, v4, :cond_1d

    .line 204
    move v4, v8

    .line 205
    const/4 v5, 0x0

    .line 208
    :cond_1d
    iget-object v10, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mMeasureParent:Landroid/view/ViewGroup;

    if-nez v10, :cond_2a

    .line 209
    new-instance v10, Landroid/widget/FrameLayout;

    iget-object v11, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mContext:Landroid/content/Context;

    invoke-direct {v10, v11}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v10, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mMeasureParent:Landroid/view/ViewGroup;

    .line 212
    :cond_2a
    iget-object v10, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mMeasureParent:Landroid/view/ViewGroup;

    invoke-interface {v0, v3, v5, v10}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    .line 213
    invoke-virtual {v5, v9, v2}, Landroid/view/View;->measure(II)V

    .line 215
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    .line 216
    .local v6, "itemWidth":I
    iget v10, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopupMaxWidth:I

    if-lt v6, v10, :cond_3e

    .line 217
    iget v7, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopupMaxWidth:I

    .line 223
    .end local v6    # "itemWidth":I
    .end local v7    # "maxWidth":I
    .end local v8    # "positionType":I
    :cond_3d
    return v7

    .line 218
    .restart local v6    # "itemWidth":I
    .restart local v7    # "maxWidth":I
    .restart local v8    # "positionType":I
    :cond_3e
    if-le v6, v7, :cond_41

    .line 219
    move v7, v6

    .line 201
    :cond_41
    add-int/lit8 v3, v3, 0x1

    goto :goto_13
.end method


# virtual methods
.method public collapseItemActionView(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/support/v7/internal/view/menu/MenuItemImpl;)Z
    .registers 4
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "item"    # Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .prologue
    .line 311
    const/4 v0, 0x0

    return v0
.end method

.method public dismiss()V
    .registers 2

    .prologue
    .line 158
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 159
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    invoke-virtual {v0}, Landroid/support/v7/widget/ListPopupWindow;->dismiss()V

    .line 161
    :cond_b
    return-void
.end method

.method public expandItemActionView(Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/support/v7/internal/view/menu/MenuItemImpl;)Z
    .registers 4
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "item"    # Landroid/support/v7/internal/view/menu/MenuItemImpl;

    .prologue
    .line 307
    const/4 v0, 0x0

    return v0
.end method

.method public flagActionItems()Z
    .registers 2

    .prologue
    .line 303
    const/4 v0, 0x0

    return v0
.end method

.method public getId()I
    .registers 2

    .prologue
    .line 316
    const/4 v0, 0x0

    return v0
.end method

.method public getMenuView(Landroid/view/ViewGroup;)Landroid/support/v7/internal/view/menu/MenuView;
    .registers 4
    .param p1, "root"    # Landroid/view/ViewGroup;

    .prologue
    .line 246
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "MenuPopupHelpers manage their own views"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPopup()Landroid/support/v7/widget/ListPopupWindow;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    return-object v0
.end method

.method public initForMenu(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;

    .prologue
    .line 242
    return-void
.end method

.method public isShowing()Z
    .registers 2

    .prologue
    .line 174
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    if-eqz v0, :cond_e

    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    invoke-virtual {v0}, Landroid/support/v7/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public onCloseMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;Z)V
    .registers 4
    .param p1, "menu"    # Landroid/support/v7/internal/view/menu/MenuBuilder;
    .param p2, "allMenusAreClosing"    # Z

    .prologue
    .line 293
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    if-eq p1, v0, :cond_5

    .line 299
    :cond_4
    :goto_4
    return-void

    .line 295
    :cond_5
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->dismiss()V

    .line 296
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPresenterCallback:Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

    if-eqz v0, :cond_4

    .line 297
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPresenterCallback:Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

    invoke-interface {v0, p1, p2}, Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;->onCloseMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;Z)V

    goto :goto_4
.end method

.method public onDismiss()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 164
    iput-object v1, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    .line 165
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuBuilder;->close()V

    .line 166
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mTreeObserver:Landroid/view/ViewTreeObserver;

    if-eqz v0, :cond_23

    .line 167
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mTreeObserver:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-nez v0, :cond_1c

    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mAnchorView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mTreeObserver:Landroid/view/ViewTreeObserver;

    .line 168
    :cond_1c
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mTreeObserver:Landroid/view/ViewTreeObserver;

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 169
    iput-object v1, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mTreeObserver:Landroid/view/ViewTreeObserver;

    .line 171
    :cond_23
    return-void
.end method

.method public onGlobalLayout()V
    .registers 3

    .prologue
    .line 228
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_13

    .line 229
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mAnchorView:Landroid/view/View;

    .line 230
    .local v0, "anchor":Landroid/view/View;
    if-eqz v0, :cond_10

    invoke-virtual {v0}, Landroid/view/View;->isShown()Z

    move-result v1

    if-nez v1, :cond_14

    .line 231
    :cond_10
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->dismiss()V

    .line 237
    .end local v0    # "anchor":Landroid/view/View;
    :cond_13
    :goto_13
    return-void

    .line 232
    .restart local v0    # "anchor":Landroid/view/View;
    :cond_14
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_13

    .line 234
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    invoke-virtual {v1}, Landroid/support/v7/widget/ListPopupWindow;->show()V

    goto :goto_13
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 10
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 179
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mAdapter:Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;

    .line 180
    .local v0, "adapter":Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;
    # getter for: Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;->mAdapterMenu:Landroid/support/v7/internal/view/menu/MenuBuilder;
    invoke-static {v0}, Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;->access$000(Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;)Landroid/support/v7/internal/view/menu/MenuBuilder;

    move-result-object v1

    invoke-virtual {v0, p3}, Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;->getItem(I)Landroid/support/v7/internal/view/menu/MenuItemImpl;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/internal/view/menu/MenuBuilder;->performItemAction(Landroid/view/MenuItem;I)Z

    .line 181
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .registers 6
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x1

    .line 184
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-ne v1, v0, :cond_f

    const/16 v1, 0x52

    if-ne p2, v1, :cond_f

    .line 185
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->dismiss()V

    .line 188
    :goto_e
    return v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 326
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 2

    .prologue
    .line 321
    const/4 v0, 0x0

    return-object v0
.end method

.method public onSubMenuSelected(Landroid/support/v7/internal/view/menu/SubMenuBuilder;)Z
    .registers 9
    .param p1, "subMenu"    # Landroid/support/v7/internal/view/menu/SubMenuBuilder;

    .prologue
    .line 265
    invoke-virtual {p1}, Landroid/support/v7/internal/view/menu/SubMenuBuilder;->hasVisibleItems()Z

    move-result v5

    if-eqz v5, :cond_44

    .line 266
    new-instance v4, Landroid/support/v7/internal/view/menu/MenuPopupHelper;

    iget-object v5, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mContext:Landroid/content/Context;

    iget-object v6, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mAnchorView:Landroid/view/View;

    invoke-direct {v4, v5, p1, v6}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;-><init>(Landroid/content/Context;Landroid/support/v7/internal/view/menu/MenuBuilder;Landroid/view/View;)V

    .line 267
    .local v4, "subPopup":Landroid/support/v7/internal/view/menu/MenuPopupHelper;
    iget-object v5, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPresenterCallback:Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

    invoke-virtual {v4, v5}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->setCallback(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;)V

    .line 269
    const/4 v3, 0x0

    .line 270
    .local v3, "preserveIconSpacing":Z
    invoke-virtual {p1}, Landroid/support/v7/internal/view/menu/SubMenuBuilder;->size()I

    move-result v1

    .line 271
    .local v1, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1a
    if-ge v2, v1, :cond_2d

    .line 272
    invoke-virtual {p1, v2}, Landroid/support/v7/internal/view/menu/SubMenuBuilder;->getItem(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 273
    .local v0, "childItem":Landroid/view/MenuItem;
    invoke-interface {v0}, Landroid/view/MenuItem;->isVisible()Z

    move-result v5

    if-eqz v5, :cond_41

    invoke-interface {v0}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    if-eqz v5, :cond_41

    .line 274
    const/4 v3, 0x1

    .line 278
    .end local v0    # "childItem":Landroid/view/MenuItem;
    :cond_2d
    invoke-virtual {v4, v3}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->setForceShowIcon(Z)V

    .line 280
    invoke-virtual {v4}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->tryShow()Z

    move-result v5

    if-eqz v5, :cond_44

    .line 281
    iget-object v5, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPresenterCallback:Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

    if-eqz v5, :cond_3f

    .line 282
    iget-object v5, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPresenterCallback:Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

    invoke-interface {v5, p1}, Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;->onOpenSubMenu(Landroid/support/v7/internal/view/menu/MenuBuilder;)Z

    .line 284
    :cond_3f
    const/4 v5, 0x1

    .line 287
    .end local v1    # "count":I
    .end local v2    # "i":I
    .end local v3    # "preserveIconSpacing":Z
    .end local v4    # "subPopup":Landroid/support/v7/internal/view/menu/MenuPopupHelper;
    :goto_40
    return v5

    .line 271
    .restart local v0    # "childItem":Landroid/view/MenuItem;
    .restart local v1    # "count":I
    .restart local v2    # "i":I
    .restart local v3    # "preserveIconSpacing":Z
    .restart local v4    # "subPopup":Landroid/support/v7/internal/view/menu/MenuPopupHelper;
    :cond_41
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a

    .line 287
    .end local v0    # "childItem":Landroid/view/MenuItem;
    .end local v1    # "count":I
    .end local v2    # "i":I
    .end local v3    # "preserveIconSpacing":Z
    .end local v4    # "subPopup":Landroid/support/v7/internal/view/menu/MenuPopupHelper;
    :cond_44
    const/4 v5, 0x0

    goto :goto_40
.end method

.method public setAnchorView(Landroid/view/View;)V
    .registers 2
    .param p1, "anchor"    # Landroid/view/View;

    .prologue
    .line 106
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mAnchorView:Landroid/view/View;

    .line 107
    return-void
.end method

.method public setCallback(Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;)V
    .registers 2
    .param p1, "cb"    # Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

    .prologue
    .line 260
    iput-object p1, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPresenterCallback:Landroid/support/v7/internal/view/menu/MenuPresenter$Callback;

    .line 261
    return-void
.end method

.method public setForceShowIcon(Z)V
    .registers 2
    .param p1, "forceShow"    # Z

    .prologue
    .line 110
    iput-boolean p1, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mForceShowIcon:Z

    .line 111
    return-void
.end method

.method public setGravity(I)V
    .registers 2
    .param p1, "gravity"    # I

    .prologue
    .line 114
    iput p1, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mDropDownGravity:I

    .line 115
    return-void
.end method

.method public show()V
    .registers 3

    .prologue
    .line 118
    invoke-virtual {p0}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->tryShow()Z

    move-result v0

    if-nez v0, :cond_e

    .line 119
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "MenuPopupHelper cannot be used without an anchor"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 121
    :cond_e
    return-void
.end method

.method public tryShow()Z
    .registers 8

    .prologue
    const/4 v0, 0x0

    const/4 v2, 0x1

    .line 128
    new-instance v3, Landroid/support/v7/widget/ListPopupWindow;

    iget-object v4, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mContext:Landroid/content/Context;

    const/4 v5, 0x0

    iget v6, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopupStyleAttr:I

    invoke-direct {v3, v4, v5, v6}, Landroid/support/v7/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    .line 129
    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    invoke-virtual {v3, p0}, Landroid/support/v7/widget/ListPopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 130
    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    invoke-virtual {v3, p0}, Landroid/support/v7/widget/ListPopupWindow;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 131
    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    iget-object v4, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mAdapter:Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/ListPopupWindow;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 132
    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    invoke-virtual {v3, v2}, Landroid/support/v7/widget/ListPopupWindow;->setModal(Z)V

    .line 134
    iget-object v1, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mAnchorView:Landroid/view/View;

    .line 135
    .local v1, "anchor":Landroid/view/View;
    if-eqz v1, :cond_6e

    .line 136
    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mTreeObserver:Landroid/view/ViewTreeObserver;

    if-nez v3, :cond_2d

    move v0, v2

    .line 137
    .local v0, "addGlobalListener":Z
    :cond_2d
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v3

    iput-object v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mTreeObserver:Landroid/view/ViewTreeObserver;

    .line 138
    if-eqz v0, :cond_3a

    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mTreeObserver:Landroid/view/ViewTreeObserver;

    invoke-virtual {v3, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 139
    :cond_3a
    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    invoke-virtual {v3, v1}, Landroid/support/v7/widget/ListPopupWindow;->setAnchorView(Landroid/view/View;)V

    .line 140
    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    iget v4, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mDropDownGravity:I

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/ListPopupWindow;->setDropDownGravity(I)V

    .line 145
    iget-boolean v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mHasContentWidth:Z

    if-nez v3, :cond_52

    .line 146
    invoke-direct {p0}, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->measureContentWidth()I

    move-result v3

    iput v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mContentWidth:I

    .line 147
    iput-boolean v2, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mHasContentWidth:Z

    .line 150
    :cond_52
    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    iget v4, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mContentWidth:I

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/ListPopupWindow;->setContentWidth(I)V

    .line 151
    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    const/4 v4, 0x2

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/ListPopupWindow;->setInputMethodMode(I)V

    .line 152
    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    invoke-virtual {v3}, Landroid/support/v7/widget/ListPopupWindow;->show()V

    .line 153
    iget-object v3, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mPopup:Landroid/support/v7/widget/ListPopupWindow;

    invoke-virtual {v3}, Landroid/support/v7/widget/ListPopupWindow;->getListView()Landroid/widget/ListView;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/widget/ListView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 154
    .end local v0    # "addGlobalListener":Z
    :goto_6d
    return v2

    :cond_6e
    move v2, v0

    .line 142
    goto :goto_6d
.end method

.method public updateMenuView(Z)V
    .registers 3
    .param p1, "cleared"    # Z

    .prologue
    .line 251
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mHasContentWidth:Z

    .line 253
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mAdapter:Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;

    if-eqz v0, :cond_c

    .line 254
    iget-object v0, p0, Landroid/support/v7/internal/view/menu/MenuPopupHelper;->mAdapter:Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;

    invoke-virtual {v0}, Landroid/support/v7/internal/view/menu/MenuPopupHelper$MenuAdapter;->notifyDataSetChanged()V

    .line 256
    :cond_c
    return-void
.end method
