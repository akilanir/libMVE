.class public abstract Landroid/support/v7/preference/PreferenceGroup;
.super Landroid/support/v7/preference/Preference;
.source "PreferenceGroup.java"


# instance fields
.field private mAttachedToHierarchy:Z

.field private final mClearRecycleCacheRunnable:Ljava/lang/Runnable;

.field private mCurrentPreferenceOrder:I

.field private final mHandler:Landroid/os/Handler;

.field private final mIdRecycleCache:Landroid/support/v4/util/SimpleArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/SimpleArrayMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mOrderingAsAdded:Z

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


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 91
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/preference/PreferenceGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 92
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 87
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v7/preference/PreferenceGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 88
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    const/4 v3, 0x1

    const/4 v1, 0x0

    .line 72
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v7/preference/Preference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 54
    iput-boolean v3, p0, Landroid/support/v7/preference/PreferenceGroup;->mOrderingAsAdded:Z

    .line 56
    iput v1, p0, Landroid/support/v7/preference/PreferenceGroup;->mCurrentPreferenceOrder:I

    .line 58
    iput-boolean v1, p0, Landroid/support/v7/preference/PreferenceGroup;->mAttachedToHierarchy:Z

    .line 60
    new-instance v1, Landroid/support/v4/util/SimpleArrayMap;

    invoke-direct {v1}, Landroid/support/v4/util/SimpleArrayMap;-><init>()V

    iput-object v1, p0, Landroid/support/v7/preference/PreferenceGroup;->mIdRecycleCache:Landroid/support/v4/util/SimpleArrayMap;

    .line 61
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Landroid/support/v7/preference/PreferenceGroup;->mHandler:Landroid/os/Handler;

    .line 62
    new-instance v1, Landroid/support/v7/preference/PreferenceGroup$1;

    invoke-direct {v1, p0}, Landroid/support/v7/preference/PreferenceGroup$1;-><init>(Landroid/support/v7/preference/PreferenceGroup;)V

    iput-object v1, p0, Landroid/support/v7/preference/PreferenceGroup;->mClearRecycleCacheRunnable:Ljava/lang/Runnable;

    .line 74
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroid/support/v7/preference/PreferenceGroup;->mPreferenceList:Ljava/util/List;

    .line 76
    sget-object v1, Landroid/support/v7/preference/R$styleable;->PreferenceGroup:[I

    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 79
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Landroid/support/v7/preference/R$styleable;->PreferenceGroup_orderingFromXml:I

    sget v2, Landroid/support/v7/preference/R$styleable;->PreferenceGroup_orderingFromXml:I

    invoke-static {v0, v1, v2, v3}, Landroid/support/v4/content/res/TypedArrayUtils;->getBoolean(Landroid/content/res/TypedArray;IIZ)Z

    move-result v1

    iput-boolean v1, p0, Landroid/support/v7/preference/PreferenceGroup;->mOrderingAsAdded:Z

    .line 83
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 84
    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/preference/PreferenceGroup;)Landroid/support/v4/util/SimpleArrayMap;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/preference/PreferenceGroup;

    .prologue
    .line 46
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceGroup;->mIdRecycleCache:Landroid/support/v4/util/SimpleArrayMap;

    return-object v0
.end method

.method private removePreferenceInt(Landroid/support/v7/preference/Preference;)Z
    .registers 7
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 215
    monitor-enter p0

    .line 216
    :try_start_1
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->onPrepareForRemoval()V

    .line 217
    iget-object v2, p0, Landroid/support/v7/preference/PreferenceGroup;->mPreferenceList:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v1

    .line 218
    .local v1, "success":Z
    if-eqz v1, :cond_2d

    .line 230
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 231
    .local v0, "key":Ljava/lang/String;
    if-eqz v0, :cond_2d

    .line 232
    iget-object v2, p0, Landroid/support/v7/preference/PreferenceGroup;->mIdRecycleCache:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getId()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    iget-object v2, p0, Landroid/support/v7/preference/PreferenceGroup;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Landroid/support/v7/preference/PreferenceGroup;->mClearRecycleCacheRunnable:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 234
    iget-object v2, p0, Landroid/support/v7/preference/PreferenceGroup;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Landroid/support/v7/preference/PreferenceGroup;->mClearRecycleCacheRunnable:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 238
    .end local v0    # "key":Ljava/lang/String;
    :cond_2d
    monitor-exit p0

    return v1

    .line 239
    .end local v1    # "success":Z
    :catchall_2f
    move-exception v2

    monitor-exit p0
    :try_end_31
    .catchall {:try_start_1 .. :try_end_31} :catchall_2f

    throw v2
.end method


# virtual methods
.method public addItemFromInflater(Landroid/support/v7/preference/Preference;)V
    .registers 2
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 123
    invoke-virtual {p0, p1}, Landroid/support/v7/preference/PreferenceGroup;->addPreference(Landroid/support/v7/preference/Preference;)Z

    .line 124
    return-void
.end method

.method public addPreference(Landroid/support/v7/preference/Preference;)Z
    .registers 10
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    const/4 v6, 0x1

    .line 152
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceGroup;->mPreferenceList:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    move v5, v6

    .line 199
    :goto_a
    return v5

    .line 157
    :cond_b
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getOrder()I

    move-result v5

    const v7, 0x7fffffff

    if-ne v5, v7, :cond_2d

    .line 158
    iget-boolean v5, p0, Landroid/support/v7/preference/PreferenceGroup;->mOrderingAsAdded:Z

    if-eqz v5, :cond_21

    .line 159
    iget v5, p0, Landroid/support/v7/preference/PreferenceGroup;->mCurrentPreferenceOrder:I

    add-int/lit8 v7, v5, 0x1

    iput v7, p0, Landroid/support/v7/preference/PreferenceGroup;->mCurrentPreferenceOrder:I

    invoke-virtual {p1, v5}, Landroid/support/v7/preference/Preference;->setOrder(I)V

    .line 162
    :cond_21
    instance-of v5, p1, Landroid/support/v7/preference/PreferenceGroup;

    if-eqz v5, :cond_2d

    move-object v5, p1

    .line 165
    check-cast v5, Landroid/support/v7/preference/PreferenceGroup;

    iget-boolean v7, p0, Landroid/support/v7/preference/PreferenceGroup;->mOrderingAsAdded:Z

    invoke-virtual {v5, v7}, Landroid/support/v7/preference/PreferenceGroup;->setOrderingAsAdded(Z)V

    .line 169
    :cond_2d
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceGroup;->mPreferenceList:Ljava/util/List;

    invoke-static {v5, p1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v2

    .line 170
    .local v2, "insertionIndex":I
    if-gez v2, :cond_39

    .line 171
    mul-int/lit8 v5, v2, -0x1

    add-int/lit8 v2, v5, -0x1

    .line 174
    :cond_39
    invoke-virtual {p0, p1}, Landroid/support/v7/preference/PreferenceGroup;->onPrepareAddPreference(Landroid/support/v7/preference/Preference;)Z

    move-result v5

    if-nez v5, :cond_41

    .line 175
    const/4 v5, 0x0

    goto :goto_a

    .line 178
    :cond_41
    monitor-enter p0

    .line 179
    :try_start_42
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceGroup;->mPreferenceList:Ljava/util/List;

    invoke-interface {v5, v2, p1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 180
    monitor-exit p0
    :try_end_48
    .catchall {:try_start_42 .. :try_end_48} :catchall_7a

    .line 182
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroup;->getPreferenceManager()Landroid/support/v7/preference/PreferenceManager;

    move-result-object v4

    .line 183
    .local v4, "preferenceManager":Landroid/support/v7/preference/PreferenceManager;
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v3

    .line 185
    .local v3, "key":Ljava/lang/String;
    if-eqz v3, :cond_7d

    iget-object v5, p0, Landroid/support/v7/preference/PreferenceGroup;->mIdRecycleCache:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v5, v3}, Landroid/support/v4/util/SimpleArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7d

    .line 186
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceGroup;->mIdRecycleCache:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v5, v3}, Landroid/support/v4/util/SimpleArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 187
    .local v0, "id":J
    iget-object v5, p0, Landroid/support/v7/preference/PreferenceGroup;->mIdRecycleCache:Landroid/support/v4/util/SimpleArrayMap;

    invoke-virtual {v5, v3}, Landroid/support/v4/util/SimpleArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    :goto_6b
    invoke-virtual {p1, v4, v0, v1}, Landroid/support/v7/preference/Preference;->onAttachedToHierarchy(Landroid/support/v7/preference/PreferenceManager;J)V

    .line 193
    iget-boolean v5, p0, Landroid/support/v7/preference/PreferenceGroup;->mAttachedToHierarchy:Z

    if-eqz v5, :cond_75

    .line 194
    invoke-virtual {p1}, Landroid/support/v7/preference/Preference;->onAttached()V

    .line 197
    :cond_75
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroup;->notifyHierarchyChanged()V

    move v5, v6

    .line 199
    goto :goto_a

    .line 180
    .end local v0    # "id":J
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "preferenceManager":Landroid/support/v7/preference/PreferenceManager;
    :catchall_7a
    move-exception v5

    :try_start_7b
    monitor-exit p0
    :try_end_7c
    .catchall {:try_start_7b .. :try_end_7c} :catchall_7a

    throw v5

    .line 189
    .restart local v3    # "key":Ljava/lang/String;
    .restart local v4    # "preferenceManager":Landroid/support/v7/preference/PreferenceManager;
    :cond_7d
    invoke-virtual {v4}, Landroid/support/v7/preference/PreferenceManager;->getNextId()J

    move-result-wide v0

    .restart local v0    # "id":J
    goto :goto_6b
.end method

.method protected dispatchRestoreInstanceState(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "container"    # Landroid/os/Bundle;

    .prologue
    .line 377
    invoke-super {p0, p1}, Landroid/support/v7/preference/Preference;->dispatchRestoreInstanceState(Landroid/os/Bundle;)V

    .line 380
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    .line 381
    .local v1, "preferenceCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    if-ge v0, v1, :cond_14

    .line 382
    invoke-virtual {p0, v0}, Landroid/support/v7/preference/PreferenceGroup;->getPreference(I)Landroid/support/v7/preference/Preference;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/support/v7/preference/Preference;->dispatchRestoreInstanceState(Landroid/os/Bundle;)V

    .line 381
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 384
    :cond_14
    return-void
.end method

.method protected dispatchSaveInstanceState(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "container"    # Landroid/os/Bundle;

    .prologue
    .line 366
    invoke-super {p0, p1}, Landroid/support/v7/preference/Preference;->dispatchSaveInstanceState(Landroid/os/Bundle;)V

    .line 369
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    .line 370
    .local v1, "preferenceCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    if-ge v0, v1, :cond_14

    .line 371
    invoke-virtual {p0, v0}, Landroid/support/v7/preference/PreferenceGroup;->getPreference(I)Landroid/support/v7/preference/Preference;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/support/v7/preference/Preference;->dispatchSaveInstanceState(Landroid/os/Bundle;)V

    .line 370
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 373
    :cond_14
    return-void
.end method

.method public findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;
    .registers 8
    .param p1, "key"    # Ljava/lang/CharSequence;

    .prologue
    .line 280
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroup;->getKey()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_b

    .line 301
    .end local p0    # "this":Landroid/support/v7/preference/PreferenceGroup;
    :goto_a
    return-object p0

    .line 283
    .restart local p0    # "this":Landroid/support/v7/preference/PreferenceGroup;
    :cond_b
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v3

    .line 284
    .local v3, "preferenceCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_10
    if-ge v1, v3, :cond_35

    .line 285
    invoke-virtual {p0, v1}, Landroid/support/v7/preference/PreferenceGroup;->getPreference(I)Landroid/support/v7/preference/Preference;

    move-result-object v2

    .line 286
    .local v2, "preference":Landroid/support/v7/preference/Preference;
    invoke-virtual {v2}, Landroid/support/v7/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 288
    .local v0, "curKey":Ljava/lang/String;
    if-eqz v0, :cond_24

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_24

    move-object p0, v2

    .line 289
    goto :goto_a

    .line 292
    :cond_24
    instance-of v5, v2, Landroid/support/v7/preference/PreferenceGroup;

    if-eqz v5, :cond_32

    .line 293
    check-cast v2, Landroid/support/v7/preference/PreferenceGroup;

    .end local v2    # "preference":Landroid/support/v7/preference/Preference;
    invoke-virtual {v2, p1}, Landroid/support/v7/preference/PreferenceGroup;->findPreference(Ljava/lang/CharSequence;)Landroid/support/v7/preference/Preference;

    move-result-object v4

    .line 295
    .local v4, "returnedPreference":Landroid/support/v7/preference/Preference;
    if-eqz v4, :cond_32

    move-object p0, v4

    .line 296
    goto :goto_a

    .line 284
    .end local v4    # "returnedPreference":Landroid/support/v7/preference/Preference;
    :cond_32
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 301
    .end local v0    # "curKey":Ljava/lang/String;
    :cond_35
    const/4 p0, 0x0

    goto :goto_a
.end method

.method public getPreference(I)Landroid/support/v7/preference/Preference;
    .registers 3
    .param p1, "index"    # I

    .prologue
    .line 141
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceGroup;->mPreferenceList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/preference/Preference;

    return-object v0
.end method

.method public getPreferenceCount()I
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceGroup;->mPreferenceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public isAttached()Z
    .registers 2

    .prologue
    .line 320
    iget-boolean v0, p0, Landroid/support/v7/preference/PreferenceGroup;->mAttachedToHierarchy:Z

    return v0
.end method

.method protected isOnSameScreenAsChildren()Z
    .registers 2

    .prologue
    .line 312
    const/4 v0, 0x1

    return v0
.end method

.method public isOrderingAsAdded()Z
    .registers 2

    .prologue
    .line 116
    iget-boolean v0, p0, Landroid/support/v7/preference/PreferenceGroup;->mOrderingAsAdded:Z

    return v0
.end method

.method public notifyDependencyChange(Z)V
    .registers 5
    .param p1, "disableDependents"    # Z

    .prologue
    .line 348
    invoke-super {p0, p1}, Landroid/support/v7/preference/Preference;->notifyDependencyChange(Z)V

    .line 352
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    .line 353
    .local v1, "preferenceCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    if-ge v0, v1, :cond_14

    .line 354
    invoke-virtual {p0, v0}, Landroid/support/v7/preference/PreferenceGroup;->getPreference(I)Landroid/support/v7/preference/Preference;

    move-result-object v2

    invoke-virtual {v2, p0, p1}, Landroid/support/v7/preference/Preference;->onParentChanged(Landroid/support/v7/preference/Preference;Z)V

    .line 353
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 356
    :cond_14
    return-void
.end method

.method public onAttached()V
    .registers 4

    .prologue
    .line 325
    invoke-super {p0}, Landroid/support/v7/preference/Preference;->onAttached()V

    .line 329
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v7/preference/PreferenceGroup;->mAttachedToHierarchy:Z

    .line 332
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroup;->getPreferenceCount()I

    move-result v1

    .line 333
    .local v1, "preferenceCount":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_b
    if-ge v0, v1, :cond_17

    .line 334
    invoke-virtual {p0, v0}, Landroid/support/v7/preference/PreferenceGroup;->getPreference(I)Landroid/support/v7/preference/Preference;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/preference/Preference;->onAttached()V

    .line 333
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 336
    :cond_17
    return-void
.end method

.method protected onPrepareAddPreference(Landroid/support/v7/preference/Preference;)Z
    .registers 3
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 262
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroup;->shouldDisableDependents()Z

    move-result v0

    invoke-virtual {p1, p0, v0}, Landroid/support/v7/preference/Preference;->onParentChanged(Landroid/support/v7/preference/Preference;Z)V

    .line 263
    const/4 v0, 0x1

    return v0
.end method

.method protected onPrepareForRemoval()V
    .registers 2

    .prologue
    .line 340
    invoke-super {p0}, Landroid/support/v7/preference/Preference;->onPrepareForRemoval()V

    .line 343
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/preference/PreferenceGroup;->mAttachedToHierarchy:Z

    .line 344
    return-void
.end method

.method public removeAll()V
    .registers 4

    .prologue
    .line 246
    monitor-enter p0

    .line 247
    :try_start_1
    iget-object v1, p0, Landroid/support/v7/preference/PreferenceGroup;->mPreferenceList:Ljava/util/List;

    .line 248
    .local v1, "preferenceList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/preference/Preference;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_9
    if-ltz v0, :cond_18

    .line 249
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/preference/Preference;

    invoke-direct {p0, v2}, Landroid/support/v7/preference/PreferenceGroup;->removePreferenceInt(Landroid/support/v7/preference/Preference;)Z

    .line 248
    add-int/lit8 v0, v0, -0x1

    goto :goto_9

    .line 251
    :cond_18
    monitor-exit p0
    :try_end_19
    .catchall {:try_start_1 .. :try_end_19} :catchall_1d

    .line 252
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroup;->notifyHierarchyChanged()V

    .line 253
    return-void

    .line 251
    .end local v0    # "i":I
    .end local v1    # "preferenceList":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/preference/Preference;>;"
    :catchall_1d
    move-exception v2

    :try_start_1e
    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_1d

    throw v2
.end method

.method public removePreference(Landroid/support/v7/preference/Preference;)Z
    .registers 3
    .param p1, "preference"    # Landroid/support/v7/preference/Preference;

    .prologue
    .line 209
    invoke-direct {p0, p1}, Landroid/support/v7/preference/PreferenceGroup;->removePreferenceInt(Landroid/support/v7/preference/Preference;)Z

    move-result v0

    .line 210
    .local v0, "returnValue":Z
    invoke-virtual {p0}, Landroid/support/v7/preference/PreferenceGroup;->notifyHierarchyChanged()V

    .line 211
    return v0
.end method

.method public setOrderingAsAdded(Z)V
    .registers 2
    .param p1, "orderingAsAdded"    # Z

    .prologue
    .line 106
    iput-boolean p1, p0, Landroid/support/v7/preference/PreferenceGroup;->mOrderingAsAdded:Z

    .line 107
    return-void
.end method

.method sortPreferences()V
    .registers 2

    .prologue
    .line 359
    monitor-enter p0

    .line 360
    :try_start_1
    iget-object v0, p0, Landroid/support/v7/preference/PreferenceGroup;->mPreferenceList:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 361
    monitor-exit p0

    .line 362
    return-void

    .line 361
    :catchall_8
    move-exception v0

    monitor-exit p0
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_8

    throw v0
.end method
