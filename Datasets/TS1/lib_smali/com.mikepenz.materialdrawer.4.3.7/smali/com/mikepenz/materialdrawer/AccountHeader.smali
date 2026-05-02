.class public Lcom/mikepenz/materialdrawer/AccountHeader;
.super Ljava/lang/Object;
.source "AccountHeader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderSelectionViewClickListener;,
        Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderListener;
    }
.end annotation


# static fields
.field protected static final BUNDLE_SELECTION_HEADER:Ljava/lang/String; = "bundle_selection_header"

.field protected static final NAVIGATION_DRAWER_ACCOUNT_ASPECT_RATIO:D = 0.5625


# instance fields
.field protected final mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;


# direct methods
.method protected constructor <init>(Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;)V
    .registers 2
    .param p1, "accountHeaderBuilder"    # Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    .line 32
    return-void
.end method


# virtual methods
.method public addProfile(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;I)V
    .registers 5
    .param p1, "profile"    # Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 239
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-nez v0, :cond_f

    .line 240
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    .line 242
    :cond_f
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkId(Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 244
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->updateHeaderAndList()V

    .line 245
    return-void
.end method

.method public varargs addProfiles([Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)V
    .registers 4
    .param p1, "profiles"    # [Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 223
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-nez v0, :cond_f

    .line 224
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    .line 227
    :cond_f
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkIds([Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;)[Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 229
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->updateHeaderAndList()V

    .line 230
    return-void
.end method

.method public clear()V
    .registers 3

    .prologue
    .line 277
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    .line 280
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->calculateProfiles()V

    .line 283
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->buildProfiles()V

    .line 284
    return-void
.end method

.method public getActiveProfile()Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .registers 2

    .prologue
    .line 179
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mCurrentProfile:Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    return-object v0
.end method

.method public getHeaderBackgroundView()Landroid/widget/ImageView;
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderBackground:Landroid/widget/ImageView;

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
    .line 112
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getView()Landroid/view/View;
    .registers 2

    .prologue
    .line 40
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderContainer:Landroid/view/View;

    return-object v0
.end method

.method public isSelectionListShown()Z
    .registers 2

    .prologue
    .line 103
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-boolean v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mSelectionListShown:Z

    return v0
.end method

.method public removeProfile(I)V
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 253
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v0, :cond_17

    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, p1, :cond_17

    .line 254
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 257
    :cond_17
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->updateHeaderAndList()V

    .line 258
    return-void
.end method

.method public removeProfile(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)V
    .registers 3
    .param p1, "profile"    # Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 266
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v0, :cond_d

    .line 267
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 270
    :cond_d
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->updateHeaderAndList()V

    .line 271
    return-void
.end method

.method public saveInstanceState(Landroid/os/Bundle;)Landroid/os/Bundle;
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 293
    if-eqz p1, :cond_d

    .line 294
    const-string v0, "bundle_selection_header"

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-virtual {v1}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->getCurrentSelection()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 296
    :cond_d
    return-object p1
.end method

.method public setActiveProfile(I)V
    .registers 3
    .param p1, "identifier"    # I

    .prologue
    .line 152
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/AccountHeader;->setActiveProfile(IZ)V

    .line 153
    return-void
.end method

.method public setActiveProfile(IZ)V
    .registers 6
    .param p1, "identifier"    # I
    .param p2, "fireOnProfileChanged"    # Z

    .prologue
    .line 161
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v1, :cond_27

    .line 162
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .line 163
    .local v0, "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    instance-of v2, v0, Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    if-eqz v2, :cond_e

    .line 164
    invoke-interface {v0}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIdentifier()I

    move-result v2

    if-ne v2, p1, :cond_e

    .line 165
    invoke-virtual {p0, v0, p2}, Lcom/mikepenz/materialdrawer/AccountHeader;->setActiveProfile(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 171
    .end local v0    # "profile":Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    :cond_27
    return-void
.end method

.method public setActiveProfile(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)V
    .registers 3
    .param p1, "profile"    # Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    .prologue
    .line 131
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mikepenz/materialdrawer/AccountHeader;->setActiveProfile(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V

    .line 132
    return-void
.end method

.method public setActiveProfile(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)V
    .registers 6
    .param p1, "profile"    # Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
    .param p2, "fireOnProfileChanged"    # Z

    .prologue
    .line 140
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-virtual {v1, p1}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->switchProfiles(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)Z

    move-result v0

    .line 141
    .local v0, "isCurrentSelectedProfile":Z
    if-eqz p2, :cond_16

    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderListener;

    if-eqz v1, :cond_16

    .line 142
    iget-object v1, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v1, v1, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mOnAccountHeaderListener:Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderListener;

    const/4 v2, 0x0

    invoke-interface {v1, v2, p1, v0}, Lcom/mikepenz/materialdrawer/AccountHeader$OnAccountHeaderListener;->onProfileChanged(Landroid/view/View;Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;Z)Z

    .line 144
    :cond_16
    return-void
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1, "headerBackground"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderBackground:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 77
    return-void
.end method

.method public setBackgroundRes(I)V
    .registers 3
    .param p1, "headerBackgroundRes"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 85
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderBackground:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 86
    return-void
.end method

.method public setDrawer(Lcom/mikepenz/materialdrawer/Drawer;)V
    .registers 3
    .param p1, "drawer"    # Lcom/mikepenz/materialdrawer/Drawer;

    .prologue
    .line 49
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iput-object p1, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mDrawer:Lcom/mikepenz/materialdrawer/Drawer;

    .line 50
    return-void
.end method

.method public setHeaderBackground(Lcom/mikepenz/materialdrawer/holder/ImageHolder;)V
    .registers 3
    .param p1, "imageHolder"    # Lcom/mikepenz/materialdrawer/holder/ImageHolder;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v0, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mAccountHeaderBackground:Landroid/widget/ImageView;

    invoke-static {p1, v0}, Lcom/mikepenz/materialdrawer/holder/ImageHolder;->applyTo(Lcom/mikepenz/materialdrawer/holder/ImageHolder;Landroid/widget/ImageView;)Z

    .line 68
    return-void
.end method

.method public setProfiles(Ljava/util/ArrayList;)V
    .registers 4
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
    .line 121
    .local p1, "profiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;>;"
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-static {p1}, Lcom/mikepenz/materialdrawer/util/IdDistributor;->checkIds(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, v0, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    .line 122
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-virtual {v0}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->updateHeaderAndList()V

    .line 123
    return-void
.end method

.method public toggleSelectionList(Landroid/content/Context;)V
    .registers 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-virtual {v0, p1}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->toggleSelectionList(Landroid/content/Context;)V

    .line 95
    return-void
.end method

.method public updateProfile(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)V
    .registers 2
    .param p1, "newProfile"    # Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 189
    invoke-virtual {p0, p1}, Lcom/mikepenz/materialdrawer/AccountHeader;->updateProfileByIdentifier(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)V

    .line 190
    return-void
.end method

.method public updateProfileByIdentifier(Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;)V
    .registers 6
    .param p1, "newProfile"    # Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 199
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    if-eqz v2, :cond_48

    invoke-interface {p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIdentifier()I

    move-result v2

    if-ltz v2, :cond_48

    .line 200
    const/4 v0, -0x1

    .line 201
    .local v0, "found":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_e
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_39

    .line 202
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/mikepenz/materialdrawer/model/interfaces/Identifyable;

    if-eqz v2, :cond_49

    .line 203
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;

    invoke-interface {v2}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIdentifier()I

    move-result v2

    invoke-interface {p1}, Lcom/mikepenz/materialdrawer/model/interfaces/IProfile;->getIdentifier()I

    move-result v3

    if-ne v2, v3, :cond_49

    .line 204
    move v0, v1

    .line 210
    :cond_39
    const/4 v2, -0x1

    if-le v0, v2, :cond_48

    .line 211
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    iget-object v2, v2, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->mProfiles:Ljava/util/ArrayList;

    invoke-virtual {v2, v0, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 212
    iget-object v2, p0, Lcom/mikepenz/materialdrawer/AccountHeader;->mAccountHeaderBuilder:Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;

    invoke-virtual {v2}, Lcom/mikepenz/materialdrawer/AccountHeaderBuilder;->updateHeaderAndList()V

    .line 215
    .end local v0    # "found":I
    .end local v1    # "i":I
    :cond_48
    return-void

    .line 201
    .restart local v0    # "found":I
    .restart local v1    # "i":I
    :cond_49
    add-int/lit8 v1, v1, 0x1

    goto :goto_e
.end method
