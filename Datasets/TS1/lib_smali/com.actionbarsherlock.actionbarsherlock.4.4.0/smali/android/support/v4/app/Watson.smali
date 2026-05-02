.class public abstract Landroid/support/v4/app/Watson;
.super Landroid/support/v4/app/FragmentActivity;
.source "Watson.java"

# interfaces
.implements Lcom/actionbarsherlock/ActionBarSherlock$OnCreatePanelMenuListener;
.implements Lcom/actionbarsherlock/ActionBarSherlock$OnPreparePanelListener;
.implements Lcom/actionbarsherlock/ActionBarSherlock$OnMenuItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/app/Watson$OnOptionsItemSelectedListener;,
        Landroid/support/v4/app/Watson$OnPrepareOptionsMenuListener;,
        Landroid/support/v4/app/Watson$OnCreateOptionsMenuListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Watson"


# instance fields
.field private mCreatedMenus:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/support/v4/app/FragmentActivity;-><init>()V

    .line 28
    return-void
.end method


# virtual methods
.method public abstract getSupportMenuInflater()Lcom/actionbarsherlock/view/MenuInflater;
.end method

.method public abstract onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;)Z
.end method

.method public onCreatePanelMenu(ILcom/actionbarsherlock/view/Menu;)Z
    .registers 10
    .param p1, "featureId"    # I
    .param p2, "menu"    # Lcom/actionbarsherlock/view/Menu;

    .prologue
    .line 43
    if-nez p1, :cond_74

    .line 44
    invoke-virtual {p0, p2}, Landroid/support/v4/app/Watson;->onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;)Z

    move-result v4

    .line 47
    .local v4, "result":Z
    invoke-virtual {p0}, Landroid/support/v4/app/Watson;->getSupportMenuInflater()Lcom/actionbarsherlock/view/MenuInflater;

    move-result-object v2

    .line 48
    .local v2, "inflater":Lcom/actionbarsherlock/view/MenuInflater;
    const/4 v5, 0x0

    .line 49
    .local v5, "show":Z
    const/4 v3, 0x0

    .line 50
    .local v3, "newMenus":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/support/v4/app/Fragment;>;"
    iget-object v6, p0, Landroid/support/v4/app/Watson;->mFragments:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v6, v6, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    if-eqz v6, :cond_4d

    .line 51
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_13
    iget-object v6, p0, Landroid/support/v4/app/Watson;->mFragments:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v6, v6, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v1, v6, :cond_4d

    .line 52
    iget-object v6, p0, Landroid/support/v4/app/Watson;->mFragments:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v6, v6, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 53
    .local v0, "f":Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_4a

    iget-boolean v6, v0, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-nez v6, :cond_4a

    iget-boolean v6, v0, Landroid/support/v4/app/Fragment;->mHasMenu:Z

    if-eqz v6, :cond_4a

    iget-boolean v6, v0, Landroid/support/v4/app/Fragment;->mMenuVisible:Z

    if-eqz v6, :cond_4a

    instance-of v6, v0, Landroid/support/v4/app/Watson$OnCreateOptionsMenuListener;

    if-eqz v6, :cond_4a

    .line 54
    const/4 v5, 0x1

    move-object v6, v0

    .line 55
    check-cast v6, Landroid/support/v4/app/Watson$OnCreateOptionsMenuListener;

    invoke-interface {v6, p2, v2}, Landroid/support/v4/app/Watson$OnCreateOptionsMenuListener;->onCreateOptionsMenu(Lcom/actionbarsherlock/view/Menu;Lcom/actionbarsherlock/view/MenuInflater;)V

    .line 56
    if-nez v3, :cond_47

    .line 57
    new-instance v3, Ljava/util/ArrayList;

    .end local v3    # "newMenus":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/support/v4/app/Fragment;>;"
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .restart local v3    # "newMenus":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/support/v4/app/Fragment;>;"
    :cond_47
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 51
    :cond_4a
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 64
    .end local v0    # "f":Landroid/support/v4/app/Fragment;
    .end local v1    # "i":I
    :cond_4d
    iget-object v6, p0, Landroid/support/v4/app/Watson;->mCreatedMenus:Ljava/util/ArrayList;

    if-eqz v6, :cond_70

    .line 65
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_52
    iget-object v6, p0, Landroid/support/v4/app/Watson;->mCreatedMenus:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v1, v6, :cond_70

    .line 66
    iget-object v6, p0, Landroid/support/v4/app/Watson;->mCreatedMenus:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 67
    .restart local v0    # "f":Landroid/support/v4/app/Fragment;
    if-eqz v3, :cond_6a

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6d

    .line 68
    :cond_6a
    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->onDestroyOptionsMenu()V

    .line 65
    :cond_6d
    add-int/lit8 v1, v1, 0x1

    goto :goto_52

    .line 73
    .end local v0    # "f":Landroid/support/v4/app/Fragment;
    .end local v1    # "i":I
    :cond_70
    iput-object v3, p0, Landroid/support/v4/app/Watson;->mCreatedMenus:Ljava/util/ArrayList;

    .line 76
    or-int/2addr v4, v5

    .line 81
    .end local v2    # "inflater":Lcom/actionbarsherlock/view/MenuInflater;
    .end local v3    # "newMenus":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/support/v4/app/Fragment;>;"
    .end local v4    # "result":Z
    .end local v5    # "show":Z
    :goto_73
    return v4

    :cond_74
    const/4 v4, 0x0

    goto :goto_73
.end method

.method public onMenuItemSelected(ILcom/actionbarsherlock/view/MenuItem;)Z
    .registers 7
    .param p1, "featureId"    # I
    .param p2, "item"    # Lcom/actionbarsherlock/view/MenuItem;

    .prologue
    const/4 v2, 0x1

    .line 117
    if-nez p1, :cond_42

    .line 118
    invoke-virtual {p0, p2}, Landroid/support/v4/app/Watson;->onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 133
    :cond_9
    :goto_9
    return v2

    .line 122
    :cond_a
    iget-object v3, p0, Landroid/support/v4/app/Watson;->mFragments:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v3, v3, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    if-eqz v3, :cond_42

    .line 123
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_11
    iget-object v3, p0, Landroid/support/v4/app/Watson;->mFragments:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v3, v3, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_42

    .line 124
    iget-object v3, p0, Landroid/support/v4/app/Watson;->mFragments:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v3, v3, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 125
    .local v0, "f":Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_3f

    iget-boolean v3, v0, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-nez v3, :cond_3f

    iget-boolean v3, v0, Landroid/support/v4/app/Fragment;->mHasMenu:Z

    if-eqz v3, :cond_3f

    iget-boolean v3, v0, Landroid/support/v4/app/Fragment;->mMenuVisible:Z

    if-eqz v3, :cond_3f

    instance-of v3, v0, Landroid/support/v4/app/Watson$OnOptionsItemSelectedListener;

    if-eqz v3, :cond_3f

    .line 126
    check-cast v0, Landroid/support/v4/app/Watson$OnOptionsItemSelectedListener;

    .end local v0    # "f":Landroid/support/v4/app/Fragment;
    invoke-interface {v0, p2}, Landroid/support/v4/app/Watson$OnOptionsItemSelectedListener;->onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z

    move-result v3

    if-nez v3, :cond_9

    .line 123
    :cond_3f
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 133
    .end local v1    # "i":I
    :cond_42
    const/4 v2, 0x0

    goto :goto_9
.end method

.method public abstract onOptionsItemSelected(Lcom/actionbarsherlock/view/MenuItem;)Z
.end method

.method public abstract onPrepareOptionsMenu(Lcom/actionbarsherlock/view/Menu;)Z
.end method

.method public onPreparePanel(ILandroid/view/View;Lcom/actionbarsherlock/view/Menu;)Z
    .registers 9
    .param p1, "featureId"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "menu"    # Lcom/actionbarsherlock/view/Menu;

    .prologue
    .line 88
    if-nez p1, :cond_44

    .line 89
    invoke-virtual {p0, p3}, Landroid/support/v4/app/Watson;->onPrepareOptionsMenu(Lcom/actionbarsherlock/view/Menu;)Z

    move-result v2

    .line 92
    .local v2, "result":Z
    const/4 v3, 0x0

    .line 93
    .local v3, "show":Z
    iget-object v4, p0, Landroid/support/v4/app/Watson;->mFragments:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v4, v4, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    if-eqz v4, :cond_3d

    .line 94
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    iget-object v4, p0, Landroid/support/v4/app/Watson;->mFragments:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v4, v4, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v1, v4, :cond_3d

    .line 95
    iget-object v4, p0, Landroid/support/v4/app/Watson;->mFragments:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v4, v4, Landroid/support/v4/app/FragmentManagerImpl;->mAdded:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    .line 96
    .local v0, "f":Landroid/support/v4/app/Fragment;
    if-eqz v0, :cond_3a

    iget-boolean v4, v0, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-nez v4, :cond_3a

    iget-boolean v4, v0, Landroid/support/v4/app/Fragment;->mHasMenu:Z

    if-eqz v4, :cond_3a

    iget-boolean v4, v0, Landroid/support/v4/app/Fragment;->mMenuVisible:Z

    if-eqz v4, :cond_3a

    instance-of v4, v0, Landroid/support/v4/app/Watson$OnPrepareOptionsMenuListener;

    if-eqz v4, :cond_3a

    .line 97
    const/4 v3, 0x1

    .line 98
    check-cast v0, Landroid/support/v4/app/Watson$OnPrepareOptionsMenuListener;

    .end local v0    # "f":Landroid/support/v4/app/Fragment;
    invoke-interface {v0, p3}, Landroid/support/v4/app/Watson$OnPrepareOptionsMenuListener;->onPrepareOptionsMenu(Lcom/actionbarsherlock/view/Menu;)V

    .line 94
    :cond_3a
    add-int/lit8 v1, v1, 0x1

    goto :goto_e

    .line 104
    .end local v1    # "i":I
    :cond_3d
    or-int/2addr v2, v3

    .line 106
    invoke-interface {p3}, Lcom/actionbarsherlock/view/Menu;->hasVisibleItems()Z

    move-result v4

    and-int/2addr v2, v4

    .line 110
    .end local v2    # "result":Z
    .end local v3    # "show":Z
    :goto_43
    return v2

    :cond_44
    const/4 v2, 0x0

    goto :goto_43
.end method
