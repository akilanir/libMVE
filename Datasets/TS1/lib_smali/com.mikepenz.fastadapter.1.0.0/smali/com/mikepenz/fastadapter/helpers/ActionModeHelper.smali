.class public Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;
.super Ljava/lang/Object;
.source "ActionModeHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;
    }
.end annotation


# instance fields
.field private mActionMode:Landroid/support/v7/view/ActionMode;

.field private mCabMenu:I
    .annotation build Landroid/support/annotation/MenuRes;
    .end annotation
.end field

.field private mCallback:Landroid/support/v7/view/ActionMode$Callback;

.field private mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

.field private mInternalCallback:Landroid/support/v7/view/ActionMode$Callback;


# direct methods
.method public constructor <init>(Lcom/mikepenz/fastadapter/FastAdapter;I)V
    .registers 5
    .param p1, "fastAdapter"    # Lcom/mikepenz/fastadapter/FastAdapter;
    .param p2, "cabMenu"    # I

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    .line 29
    iput p2, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mCabMenu:I

    .line 30
    new-instance v0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;-><init>(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$1;)V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mInternalCallback:Landroid/support/v7/view/ActionMode$Callback;

    .line 31
    return-void
.end method

.method public constructor <init>(Lcom/mikepenz/fastadapter/FastAdapter;ILandroid/support/v7/view/ActionMode$Callback;)V
    .registers 6
    .param p1, "fastAdapter"    # Lcom/mikepenz/fastadapter/FastAdapter;
    .param p2, "cabMenu"    # I
    .param p3, "callback"    # Landroid/support/v7/view/ActionMode$Callback;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    .line 35
    iput p2, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mCabMenu:I

    .line 36
    iput-object p3, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    .line 37
    new-instance v0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$ActionBarCallBack;-><init>(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;Lcom/mikepenz/fastadapter/helpers/ActionModeHelper$1;)V

    iput-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mInternalCallback:Landroid/support/v7/view/ActionMode$Callback;

    .line 38
    return-void
.end method

.method static synthetic access$100(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)Landroid/support/v7/view/ActionMode$Callback;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mCallback:Landroid/support/v7/view/ActionMode$Callback;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)Lcom/mikepenz/fastadapter/FastAdapter;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    .prologue
    .line 17
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    return-object v0
.end method

.method static synthetic access$300(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;)I
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;

    .prologue
    .line 17
    iget v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mCabMenu:I

    return v0
.end method

.method static synthetic access$402(Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;Landroid/support/v7/view/ActionMode;)Landroid/support/v7/view/ActionMode;
    .registers 2
    .param p0, "x0"    # Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;
    .param p1, "x1"    # Landroid/support/v7/view/ActionMode;

    .prologue
    .line 17
    iput-object p1, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mActionMode:Landroid/support/v7/view/ActionMode;

    return-object p1
.end method


# virtual methods
.method public getActionMode()Landroid/support/v7/view/ActionMode;
    .registers 2

    .prologue
    .line 41
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mActionMode:Landroid/support/v7/view/ActionMode;

    return-object v0
.end method

.method public onClick(Lcom/mikepenz/fastadapter/IItem;I)Ljava/lang/Boolean;
    .registers 5
    .param p1, "item"    # Lcom/mikepenz/fastadapter/IItem;
    .param p2, "position"    # I

    .prologue
    const/4 v1, 0x1

    .line 53
    instance-of v0, p1, Lcom/mikepenz/fastadapter/IExpandable;

    if-eqz v0, :cond_2d

    move-object v0, p1

    .line 54
    check-cast v0, Lcom/mikepenz/fastadapter/IExpandable;

    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IExpandable;->getSubItems()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2d

    .line 55
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->toggleExpandable(I)V

    .line 58
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mActionMode:Landroid/support/v7/view/ActionMode;

    if-eqz v0, :cond_28

    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/FastAdapter;->getSelections()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-nez v0, :cond_28

    .line 59
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mActionMode:Landroid/support/v7/view/ActionMode;

    invoke-virtual {v0}, Landroid/support/v7/view/ActionMode;->finish()V

    .line 62
    :cond_28
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 71
    :goto_2c
    return-object v0

    .line 66
    :cond_2d
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mActionMode:Landroid/support/v7/view/ActionMode;

    if-eqz v0, :cond_4e

    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0}, Lcom/mikepenz/fastadapter/FastAdapter;->getSelections()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-ne v0, v1, :cond_4e

    invoke-interface {p1}, Lcom/mikepenz/fastadapter/IItem;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 67
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mActionMode:Landroid/support/v7/view/ActionMode;

    invoke-virtual {v0}, Landroid/support/v7/view/ActionMode;->finish()V

    .line 68
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_2c

    .line 71
    :cond_4e
    const/4 v0, 0x0

    goto :goto_2c
.end method

.method public onLongClick(Landroid/support/v7/app/AppCompatActivity;I)Landroid/support/v7/view/ActionMode;
    .registers 4
    .param p1, "act"    # Landroid/support/v7/app/AppCompatActivity;
    .param p2, "position"    # I

    .prologue
    .line 82
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mActionMode:Landroid/support/v7/view/ActionMode;

    if-nez v0, :cond_20

    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->getItem(I)Lcom/mikepenz/fastadapter/IItem;

    move-result-object v0

    invoke-interface {v0}, Lcom/mikepenz/fastadapter/IItem;->isSelectable()Z

    move-result v0

    if-eqz v0, :cond_20

    .line 84
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mInternalCallback:Landroid/support/v7/view/ActionMode$Callback;

    invoke-virtual {p1, v0}, Landroid/support/v7/app/AppCompatActivity;->startSupportActionMode(Landroid/support/v7/view/ActionMode$Callback;)Landroid/support/v7/view/ActionMode;

    move-result-object v0

    iput-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mActionMode:Landroid/support/v7/view/ActionMode;

    .line 86
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mFastAdapter:Lcom/mikepenz/fastadapter/FastAdapter;

    invoke-virtual {v0, p2}, Lcom/mikepenz/fastadapter/FastAdapter;->select(I)V

    .line 88
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mActionMode:Landroid/support/v7/view/ActionMode;

    .line 90
    :goto_1f
    return-object v0

    :cond_20
    iget-object v0, p0, Lcom/mikepenz/fastadapter/helpers/ActionModeHelper;->mActionMode:Landroid/support/v7/view/ActionMode;

    goto :goto_1f
.end method
