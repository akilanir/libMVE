.class public Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;
.super Ljava/lang/Object;
.source "AccountHeader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderSelectionViewClickListener;,
        Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener;
    }
.end annotation


# static fields
.field protected static final BUNDLE_SELECTION_HEADER:Ljava/lang/String; = "bundle_selection_header"

.field protected static final NAVIGATION_DRAWER_ACCOUNT_ASPECT_RATIO:D = 0.5625


# instance fields
.field private final mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;


# direct methods
.method protected constructor <init>(Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;)V
    .registers 2
    .param p1, "accountHeaderBuilder"    # Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    .line 29
    return-void
.end method


# virtual methods
.method public addProfile(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;I)V
    .registers 5
    .param p1, "profile"    # Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .param p2, "position"    # I

    .prologue
    .line 208
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-nez v0, :cond_f

    .line 209
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    .line 211
    :cond_f
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 213
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->updateHeaderAndList()V

    .line 214
    return-void
.end method

.method public varargs addProfiles([Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)V
    .registers 4
    .param p1, "profiles"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .prologue
    .line 191
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-nez v0, :cond_f

    .line 192
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    .line 194
    :cond_f
    if-eqz p1, :cond_18

    .line 195
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-static {v0, p1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 198
    :cond_18
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->updateHeaderAndList()V

    .line 199
    return-void
.end method

.method public clear()V
    .registers 3

    .prologue
    .line 246
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    .line 249
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->calculateProfiles()V

    .line 252
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->buildProfiles()V

    .line 253
    return-void
.end method

.method public getHeaderBackgroundView()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 55
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderBackground:Landroid/widget/ImageView;

    return-object v0
.end method

.method public getProfiles()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;",
            ">;"
        }
    .end annotation

    .prologue
    .line 100
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    return-object v0
.end method

.method public isSelectionListShown()Z
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-boolean v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mSelectionListShown:Z

    return v0
.end method

.method public removeProfile(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 222
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, p1, :cond_17

    .line 223
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 226
    :cond_17
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->updateHeaderAndList()V

    .line 227
    return-void
.end method

.method public removeProfile(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)V
    .registers 3
    .param p1, "profile"    # Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .prologue
    .line 235
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v0, :cond_d

    .line 236
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 239
    :cond_d
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->updateHeaderAndList()V

    .line 240
    return-void
.end method

.method public saveInstanceState(Landroid/os/Bundle;)Landroid/os/Bundle;
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 262
    if-eqz p1, :cond_d

    .line 263
    const-string v0, "bundle_selection_header"

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->getCurrentSelection()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 265
    :cond_d
    return-object p1
.end method

.method public setActiveProfile(I)V
    .registers 3
    .param p1, "identifier"    # I

    .prologue
    .line 140
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->setActiveProfile(IZ)V

    .line 141
    return-void
.end method

.method public setActiveProfile(IZ)V
    .registers 6
    .param p1, "identifier"    # I
    .param p2, "fireOnProfileChanged"    # Z

    .prologue
    .line 149
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v1, :cond_27

    .line 150
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 151
    .local v0, "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    instance-of v2, v0, Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    if-eqz v2, :cond_e

    .line 152
    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIdentifier()I

    move-result v2

    if-ne v2, p1, :cond_e

    .line 153
    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->setActiveProfile(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 159
    .end local v0    # "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    :cond_27
    return-void
.end method

.method public setActiveProfile(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)V
    .registers 3
    .param p1, "profile"    # Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .prologue
    .line 119
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->setActiveProfile(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 120
    return-void
.end method

.method public setActiveProfile(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V
    .registers 6
    .param p1, "profile"    # Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .param p2, "fireOnProfileChanged"    # Z

    .prologue
    .line 128
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    invoke-virtual {v1, p1}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->switchProfiles(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)Z

    move-result v0

    .line 129
    .local v0, "isCurrentSelectedProfile":Z
    if-eqz p2, :cond_16

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener;

    if-eqz v1, :cond_16

    .line 130
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener;

    const/4 v2, 0x0

    invoke-interface {v1, v2, p1, v0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader$OnAccountHeaderListener;->onProfileChanged(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)Z

    .line 132
    :cond_16
    return-void
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "headerBackground"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 64
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderBackground:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 65
    return-void
.end method

.method public setBackgroundRes(I)V
    .registers 3
    .param p1, "headerBackgroundRes"    # I

    .prologue
    .line 73
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mAccountHeaderBackground:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 74
    return-void
.end method

.method public setDrawer(Lcom/mikepenz/materialdrawer/Drawer;)V
    .registers 3
    .param p1, "drawer"    # Lcom/mikepenz/materialdrawer/Drawer;

    .prologue
    .line 46
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iput-object p1, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    .line 47
    return-void
.end method

.method public setProfiles(Ljava/util/ArrayList;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 109
    .local p1, "profiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iput-object p1, v0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    .line 110
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->updateHeaderAndList()V

    .line 111
    return-void
.end method

.method public toggleSelectionList(Landroid/content/Context;)V
    .registers 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 82
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    invoke-virtual {v0, p1}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->toggleSelectionList(Landroid/content/Context;)V

    .line 83
    return-void
.end method

.method public updateProfileByIdentifier(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)V
    .registers 6
    .param p1, "newProfile"    # Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .prologue
    .line 167
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v2, :cond_4a

    if-eqz p1, :cond_4a

    invoke-interface {p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIdentifier()I

    move-result v2

    if-ltz v2, :cond_4a

    .line 168
    const/4 v0, -0x1

    .line 169
    .local v0, "found":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_10
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_3b

    .line 170
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    if-eqz v2, :cond_4b

    .line 171
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIdentifier()I

    move-result v2

    invoke-interface {p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIdentifier()I

    move-result v3

    if-ne v2, v3, :cond_4b

    .line 172
    move v0, v1

    .line 178
    :cond_3b
    const/4 v2, -0x1

    if-le v0, v2, :cond_4a

    .line 179
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v2, v0, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 180
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;

    invoke-virtual {v2}, Lcom/mikepenz/materialdrawer/accountswitcher/AccountHeaderBuilder;->updateHeaderAndList()V

    .line 183
    .end local v0    # "found":I
    .end local v1    # "i":I
    :cond_4a
    return-void

    .line 169
    .restart local v0    # "found":I
    .restart local v1    # "i":I
    :cond_4b
    add-int/lit8 v1, v1, 0x1

    goto :goto_10
.end method
