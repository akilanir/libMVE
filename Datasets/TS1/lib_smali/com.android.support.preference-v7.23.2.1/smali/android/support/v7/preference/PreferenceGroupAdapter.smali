.class public Landroid/support/v7/preference/PreferenceGroupAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "PreferenceGroupAdapter.java"

# interfaces
.implements Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter",
        "<",
        "Landroid/support/v7/preference/PreferenceViewHolder;",
        ">;",
        "Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "PreferenceGroupAdapter"


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private volatile mIsSyncing:Z

.field private mPreferenceGroup:Landroid/support/v7/preference/PreferenceGroup;

.field private mPreferenceLayouts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;",
            ">;"
        }
    .end annotation
.end field

.field private mPreferenceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/preference/Preference;",
            ">;"
        }
    .end annotation
.end field

.field private mPreferenceListInternal:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/preference/Preference;",
            ">;"
        }
    .end annotation
.end field

.field private mSyncRunnable:Ljava/lang/Runnable;

.field private mTempPreferenceLayout:Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;


# direct methods
.method public constructor <init>(Landroid/support/v7/preference/PreferenceGroup;)V
    .registers 3
    .param p1, "preferenceGroup"    # Landroid/support/v7/preference/PreferenceGroup;

    .prologue
    .line 110
    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    .line 64
    new-instance v0, Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;

    invoke-direct {v0}, Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;-><init>()V

    iput-object v0, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mTempPreferenceLayout:Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;

    .line 66
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mIsSyncing:Z

    .line 68
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mHandler:Landroid/os/Handler;

    .line 70
    new-instance v0, Landroid/support/v7/preference/PreferenceGroupAdapter$1;

    invoke-direct {v0, p0}, Landroid/support/v7/preference/PreferenceGroupAdapter$1;-><init>(Landroid/support/v7/preference/PreferenceGroupAdapter;)V

    iput-object v0, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mSyncRunnable:Ljava/lang/Runnable;

    .line 111
    iput-object p1, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceGroup:Landroid/support/v7/preference/PreferenceGroup;

    .line 113
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceGroup:Landroid/support/v7/preference/PreferenceGroup;

    invoke-virtual {v0, p0}, Landroid/support/v7/preference/PreferenceGroup;->setOnPreferenceChangeInternalListener(Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;)V

    .line 115
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceList:Ljava/util/List;

    .line 116
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceListInternal:Ljava/util/List;

    .line 117
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceLayouts:Ljava/util/List;

    .line 119
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceGroup:Landroid/support/v7/preference/PreferenceGroup;

    instance-of v0, v0, Landroid/support/v7/preference/PreferenceScreen;

    if-eqz v0, :cond_4c

    .line 120
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceGroup:Landroid/support/v7/preference/PreferenceGroup;

    check-cast v0, Landroid/support/v7/preference/PreferenceScreen;

    invoke-virtual {v0}, Landroid/support/v7/preference/PreferenceScreen;->shouldUseGeneratedIds()Z

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/PreferenceGroupAdapter;->setHasStableIds(Z)V

    .line 125
    :goto_48
    invoke-direct {p0}, Landroid/support/v7/preference/PreferenceGroupAdapter;->syncMyPreferences()V

    .line 126
    return-void

    .line 122
    :cond_4c
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v7/preference/PreferenceGroupAdapter;->setHasStableIds(Z)V

    goto :goto_48
.end method

.method static synthetic access$000(Landroid/support/v7/preference/PreferenceGroupAdapter;)V
    .registers 1
    .param p0, "x0"    # Landroid/support/v7/preference/PreferenceGroupAdapter;

    .prologue
    .line 35
    invoke-direct {p0}, Landroid/support/v7/preference/PreferenceGroupAdapter;->syncMyPreferences()V

    return-void
.end method

.method private addPreferenceClassName(Landroid/support/v7/preference/Preference;)V
    .registers 4
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 193
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Landroid/support/v7/preference/PreferenceGroupAdapter;->createPreferenceLayout(Landroid/support/v7/preference/Preference;Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;)Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;

    move-result-object v0

    .line 194
    .local v0, "pl":Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;
    iget-object v1, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceLayouts:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 195
    iget-object v1, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceLayouts:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 197
    :cond_12
    return-void
.end method

.method private createPreferenceLayout(Landroid/support/v7/preference/Preference;Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;)Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;
    .registers 5
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;
    .param p2, "in"    # Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;

    .prologue
    .line 185
    if-eqz p2, :cond_1d

    move-object v0, p2

    .line 186
    .local v0, "pl":Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;
    :goto_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    # setter for: Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;->name:Ljava/lang/String;
    invoke-static {v0, v1}, Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;->access$102(Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;Ljava/lang/String;)Ljava/lang/String;

    .line 187
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getLayoutResource()I

    move-result v1

    # setter for: Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;->resId:I
    invoke-static {v0, v1}, Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;->access$202(Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;I)I

    .line 188
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getWidgetLayoutResource()I

    move-result v1

    # setter for: Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;->widgetResId:I
    invoke-static {v0, v1}, Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;->access$302(Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;I)I

    .line 189
    return-object v0

    .line 185
    .end local v0    # "pl":Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;
    :cond_1d
    new-instance v0, Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;

    invoke-direct {v0}, Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;-><init>()V

    goto :goto_3
.end method

.method private flattenPreferenceGroup(Ljava/util/List;Landroid/support/v7/preference/PreferenceGroup;)V
    .registers 8
    .param p2, "group"    # Landroid/support/v7/preference/PreferenceGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/support/v7/preference/Preference;",
            ">;",
            "Landroid/support/v7/preference/PreferenceGroup;",
            ")V"
        }
    .end annotation

    .prologue
    .line 158
    .local p1, "preferences":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/preference/Preference;>;"
    invoke-virtual {p2}, Landroid/support/v7/preference/PreferenceGroup;->sortPreferences()V

    .line 160
    invoke-virtual {p2}, Landroid/support/v7/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v0

    .line 161
    .local v0, "groupSize":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_8
    if-ge v1, v0, :cond_2a

    .line 162
    invoke-virtual {p2, v1}, Landroid/support/v7/preference/PreferenceGroup;->getPreference(I)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 164
    .local v2, "preference":Landroid/support/v7/preference/Preference;
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    invoke-direct {p0, v2}, Landroid/support/v7/preference/PreferenceGroupAdapter;->addPreferenceClassName(Landroid/support/v7/preference/Preference;)V

    .line 168
    instance-of v4, v2, Landroid/support/v7/preference/PreferenceGroup;

    if-eqz v4, :cond_24

    move-object v3, v2

    .line 169
    check-cast v3, Landroid/support/v7/preference/PreferenceGroup;

    .line 170
    .local v3, "preferenceAsGroup":Landroid/support/v7/preference/PreferenceGroup;
    invoke-virtual {v3}, Landroid/support/v7/preference/PreferenceGroup;->isOnSameScreenAsChildren()Z

    move-result v4

    if-eqz v4, :cond_24

    .line 171
    invoke-direct {p0, p1, v3}, Landroid/support/v7/preference/PreferenceGroupAdapter;->flattenPreferenceGroup(Ljava/util/List;Landroid/support/v7/preference/PreferenceGroup;)V

    .line 175
    .end local v3    # "preferenceAsGroup":Landroid/support/v7/preference/PreferenceGroup;
    :cond_24
    invoke-virtual {v2, p0}, Landroid/support/v7/preference/Preference;->setOnPreferenceChangeInternalListener(Landroid/support/v7/preference/Preference$OnPreferenceChangeInternalListener;)V

    .line 161
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 177
    .end local v2    # "preference":Landroid/support/v7/preference/Preference;
    :cond_2a
    return-void
.end method

.method private syncMyPreferences()V
    .registers 6

    .prologue
    .line 129
    monitor-enter p0

    .line 130
    :try_start_1
    iget-boolean v3, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mIsSyncing:Z

    if-eqz v3, :cond_7

    .line 131
    monitor-exit p0

    .line 155
    :goto_6
    return-void

    .line 134
    :cond_7
    const/4 v3, 0x1

    iput-boolean v3, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mIsSyncing:Z

    .line 135
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_48

    .line 137
    new-instance v1, Ljava/util/ArrayList;

    iget-object v3, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceListInternal:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 138
    .local v1, "newPreferenceList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/preference/Preference;>;"
    iget-object v3, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceGroup:Landroid/support/v7/preference/PreferenceGroup;

    invoke-direct {p0, v1, v3}, Landroid/support/v7/preference/PreferenceGroupAdapter;->flattenPreferenceGroup(Ljava/util/List;Landroid/support/v7/preference/PreferenceGroup;)V

    .line 139
    iput-object v1, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceListInternal:Ljava/util/List;

    .line 141
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceListInternal:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v3, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceList:Ljava/util/List;

    .line 143
    iget-object v3, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceListInternal:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_30
    :goto_30
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/preference/Preference;

    .line 144
    .local v2, "preference":Landroid/support/v7/preference/Preference;
    invoke-virtual {v2}, Landroid/support/v7/preference/Preference;->isVisible()Z

    move-result v3

    if-eqz v3, :cond_30

    .line 145
    iget-object v3, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_30

    .line 135
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "newPreferenceList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/preference/Preference;>;"
    .end local v2    # "preference":Landroid/support/v7/preference/Preference;
    :catchall_48
    move-exception v3

    :try_start_49
    monitor-exit p0
    :try_end_4a
    .catchall {:try_start_49 .. :try_end_4a} :catchall_48

    throw v3

    .line 149
    .restart local v0    # "i$":Ljava/util/Iterator;
    .restart local v1    # "newPreferenceList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/preference/Preference;>;"
    :cond_4b
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroupAdapter;->notifyDataSetChanged()V

    .line 151
    monitor-enter p0

    .line 152
    const/4 v3, 0x0

    :try_start_50
    iput-boolean v3, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mIsSyncing:Z

    .line 153
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 154
    monitor-exit p0

    goto :goto_6

    :catchall_57
    move-exception v3

    monitor-exit p0
    :try_end_59
    .catchall {:try_start_50 .. :try_end_59} :catchall_57

    throw v3
.end method


# virtual methods
.method public getItem(I)Landroid/support/v7/preference/Preference;
    .registers 3
    .param p1, "position"    # I

    .prologue
    .line 205
    if-ltz p1, :cond_8

    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroupAdapter;->getItemCount()I

    move-result v0

    if-lt p1, v0, :cond_a

    :cond_8
    const/4 v0, 0x0

    .line 206
    :goto_9
    return-object v0

    :cond_a
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/preference/Preference;

    goto :goto_9
.end method

.method public getItemCount()I
    .registers 2

    .prologue
    .line 201
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .registers 4
    .param p1, "position"    # I

    .prologue
    .line 210
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroupAdapter;->hasStableIds()Z

    move-result v0

    if-nez v0, :cond_9

    .line 211
    const-wide/16 v0, -0x1

    .line 213
    :goto_8
    return-wide v0

    :cond_9
    invoke-virtual {p0, p1}, Landroid/support/v7/preference/PreferenceGroupAdapter;->getItem(I)Landroid/support/v7/preference/Preference;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/preference/Preference;->getId()J

    move-result-wide v0

    goto :goto_8
.end method

.method public getItemViewType(I)I
    .registers 8
    .param p1, "position"    # I

    .prologue
    .line 261
    invoke-virtual {p0, p1}, Landroid/support/v7/preference/PreferenceGroupAdapter;->getItem(I)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 263
    .local v0, "preference":Landroid/support/v7/preference/Preference;
    iget-object v3, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mTempPreferenceLayout:Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;

    invoke-direct {p0, v0, v3}, Landroid/support/v7/preference/PreferenceGroupAdapter;->createPreferenceLayout(Landroid/support/v7/preference/Preference;Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;)Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;

    move-result-object v3

    iput-object v3, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mTempPreferenceLayout:Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;

    .line 265
    iget-object v3, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceLayouts:Ljava/util/List;

    iget-object v4, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mTempPreferenceLayout:Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;

    invoke-interface {v3, v4}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v1

    .line 266
    .local v1, "viewType":I
    const/4 v3, -0x1

    if-eq v1, v3, :cond_19

    move v2, v1

    .line 271
    .end local v1    # "viewType":I
    .local v2, "viewType":I
    :goto_18
    return v2

    .line 269
    .end local v2    # "viewType":I
    .restart local v1    # "viewType":I
    :cond_19
    iget-object v3, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceLayouts:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v1

    .line 270
    iget-object v3, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceLayouts:Ljava/util/List;

    new-instance v4, Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;

    iget-object v5, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mTempPreferenceLayout:Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;

    invoke-direct {v4, v5}, Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;-><init>(Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v2, v1

    .line 271
    .end local v1    # "viewType":I
    .restart local v2    # "viewType":I
    goto :goto_18
.end method

.method public onBindViewHolder(Landroid/support/v7/preference/PreferenceViewHolder;I)V
    .registers 4
    .param p1, "holder"    # Landroid/support/v7/preference/PreferenceViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 296
    invoke-virtual {p0, p2}, Landroid/support/v7/preference/PreferenceGroupAdapter;->getItem(I)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 297
    .local v0, "preference":Landroid/support/v7/preference/Preference;
    invoke-virtual {v0, p1}, Landroid/support/v7/preference/Preference;->onBindViewHolder(Landroid/support/v7/preference/PreferenceViewHolder;)V

    .line 298
    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 3

    .prologue
    .line 35
    check-cast p1, Landroid/support/v7/preference/PreferenceViewHolder;

    invoke-virtual {p0, p1, p2}, Landroid/support/v7/preference/PreferenceGroupAdapter;->onBindViewHolder(Landroid/support/v7/preference/PreferenceViewHolder;I)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/preference/PreferenceViewHolder;
    .registers 9
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 277
    iget-object v4, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceLayouts:Ljava/util/List;

    invoke-interface {v4, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;

    .line 278
    .local v1, "pl":Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 280
    .local v0, "inflater":Landroid/view/LayoutInflater;
    # getter for: Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;->resId:I
    invoke-static {v1}, Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;->access$200(Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;)I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {v0, v4, p1, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 282
    .local v2, "view":Landroid/view/View;
    const v4, 0x1020018

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 283
    .local v3, "widgetFrame":Landroid/view/ViewGroup;
    if-eqz v3, :cond_31

    .line 284
    # getter for: Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;->widgetResId:I
    invoke-static {v1}, Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;->access$300(Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;)I

    move-result v4

    if-eqz v4, :cond_37

    .line 285
    # getter for: Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;->widgetResId:I
    invoke-static {v1}, Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;->access$300(Landroid/support/v7/preference/PreferenceGroupAdapter$PreferenceLayout;)I

    move-result v4

    invoke-virtual {v0, v4, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 291
    :cond_31
    :goto_31
    new-instance v4, Landroid/support/v7/preference/PreferenceViewHolder;

    invoke-direct {v4, v2}, Landroid/support/v7/preference/PreferenceViewHolder;-><init>(Landroid/view/View;)V

    return-object v4

    .line 287
    :cond_37
    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_31
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 4

    .prologue
    .line 35
    invoke-virtual {p0, p1, p2}, Landroid/support/v7/preference/PreferenceGroupAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/preference/PreferenceViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onPreferenceChange(Landroid/support/v7/preference/Preference;)V
    .registers 2
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 217
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroupAdapter;->notifyDataSetChanged()V

    .line 218
    return-void
.end method

.method public onPreferenceHierarchyChange(Landroid/support/v7/preference/Preference;)V
    .registers 4
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 221
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mSyncRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 222
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mSyncRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 223
    return-void
.end method

.method public onPreferenceVisibilityChange(Landroid/support/v7/preference/Preference;)V
    .registers 9
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 227
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->isVisible()Z

    move-result v5

    if-eqz v5, :cond_35

    .line 231
    const/4 v3, -0x1

    .line 232
    .local v3, "previousVisibleIndex":I
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceListInternal:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_d
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/preference/Preference;

    .line 233
    .local v2, "pref":Landroid/support/v7/preference/Preference;
    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2c

    .line 241
    .end local v2    # "pref":Landroid/support/v7/preference/Preference;
    :cond_1f
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceList:Ljava/util/List;

    add-int/lit8 v6, v3, 0x1

    invoke-interface {v5, v6, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 243
    add-int/lit8 v5, v3, 0x1

    invoke-virtual {p0, v5}, Landroid/support/v7/preference/PreferenceGroupAdapter;->notifyItemInserted(I)V

    .line 257
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v3    # "previousVisibleIndex":I
    :goto_2b
    return-void

    .line 236
    .restart local v0    # "i$":Ljava/util/Iterator;
    .restart local v2    # "pref":Landroid/support/v7/preference/Preference;
    .restart local v3    # "previousVisibleIndex":I
    :cond_2c
    invoke-virtual {v2}, Landroid/support/v7/preference/Preference;->isVisible()Z

    move-result v5

    if-eqz v5, :cond_d

    .line 237
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    .line 248
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "pref":Landroid/support/v7/preference/Preference;
    .end local v3    # "previousVisibleIndex":I
    :cond_35
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceList:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v1

    .line 249
    .local v1, "listSize":I
    const/4 v4, 0x0

    .local v4, "removalIndex":I
    :goto_3c
    if-ge v4, v1, :cond_4a

    .line 250
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceList:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_53

    .line 254
    :cond_4a
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceGroupAdapter;->mPreferenceList:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 255
    invoke-virtual {p0, v4}, Landroid/support/v7/preference/PreferenceGroupAdapter;->notifyItemRemoved(I)V

    goto :goto_2b

    .line 249
    :cond_53
    add-int/lit8 v4, v4, 0x1

    goto :goto_3c
.end method
