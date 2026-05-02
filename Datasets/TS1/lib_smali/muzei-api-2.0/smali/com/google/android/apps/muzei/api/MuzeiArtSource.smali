.class public abstract Lcom/google/android/apps/muzei/api/MuzeiArtSource;
.super Landroid/app/IntentService;
.source "MuzeiArtSource.java"


# static fields
.field public static final ACTION_MUZEI_ART_SOURCE:Ljava/lang/String; = "com.google.android.apps.muzei.api.MuzeiArtSource"

.field public static final BUILTIN_COMMAND_ID_NEXT_ARTWORK:I = 0x3e9

.field public static final EXTRA_FROM_MUZEI_SETTINGS:Ljava/lang/String; = "com.google.android.apps.muzei.api.extra.FROM_MUZEI_SETTINGS"

.field private static final FIRST_BUILTIN_COMMAND_ID:I = 0x3e8

.field protected static final MAX_CUSTOM_COMMAND_ID:I = 0x3e7

.field private static final MSG_PUBLISH_CURRENT_STATE:I = 0x1

.field private static final PREF_SCHEDULED_UPDATE_TIME_MILLIS:Ljava/lang/String; = "scheduled_update_time_millis"

.field private static final PREF_STATE:Ljava/lang/String; = "state"

.field private static final PREF_SUBSCRIPTIONS:Ljava/lang/String; = "subscriptions"

.field private static final TAG:Ljava/lang/String; = "MuzeiArtSource"

.field public static final UPDATE_REASON_INITIAL:I = 0x1

.field public static final UPDATE_REASON_OTHER:I = 0x0

.field public static final UPDATE_REASON_SCHEDULED:I = 0x3

.field public static final UPDATE_REASON_USER_NEXT:I = 0x2

.field private static final URI_SCHEME_COMMAND:Ljava/lang/String; = "muzeicommand"


# instance fields
.field private mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

.field private mHandler:Landroid/os/Handler;

.field private final mName:Ljava/lang/String;

.field private mSharedPrefs:Landroid/content/SharedPreferences;

.field private mSubscriptions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/content/ComponentName;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 286
    invoke-direct {p0, p1}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 267
    new-instance v0, Lcom/google/android/apps/muzei/api/MuzeiArtSource$1;

    invoke-direct {v0, p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource$1;-><init>(Lcom/google/android/apps/muzei/api/MuzeiArtSource;)V

    iput-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    .line 287
    iput-object p1, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mName:Ljava/lang/String;

    .line 288
    return-void
.end method

.method static synthetic access$000(Lcom/google/android/apps/muzei/api/MuzeiArtSource;)V
    .registers 1
    .param p0, "x0"    # Lcom/google/android/apps/muzei/api/MuzeiArtSource;

    .prologue
    .line 190
    invoke-direct {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->publishCurrentState()V

    return-void
.end method

.method static synthetic access$100(Lcom/google/android/apps/muzei/api/MuzeiArtSource;)V
    .registers 1
    .param p0, "x0"    # Lcom/google/android/apps/muzei/api/MuzeiArtSource;

    .prologue
    .line 190
    invoke-direct {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->saveState()V

    return-void
.end method

.method static synthetic access$200(Lcom/google/android/apps/muzei/api/MuzeiArtSource;Landroid/content/ComponentName;Ljava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Lcom/google/android/apps/muzei/api/MuzeiArtSource;
    .param p1, "x1"    # Landroid/content/ComponentName;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 190
    invoke-direct {p0, p1, p2}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->processSubscribe(Landroid/content/ComponentName;Ljava/lang/String;)V

    return-void
.end method

.method private clearUpdateAlarm()V
    .registers 3

    .prologue
    .line 667
    const-string v1, "alarm"

    invoke-virtual {p0, v1}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 668
    .local v0, "am":Landroid/app/AlarmManager;
    invoke-direct {p0, p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->getHandleNextCommandPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 669
    return-void
.end method

.method private getHandleNextCommandPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;
    .registers 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/16 v5, 0x3e9

    .line 672
    const/4 v0, 0x0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.google.android.apps.muzei.api.action.HANDLE_COMMAND"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v2, Landroid/content/ComponentName;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "muzeicommand"

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.google.android.apps.muzei.api.extra.COMMAND_ID"

    invoke-virtual {v1, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.google.android.apps.muzei.api.extra.SCHEDULED"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v1

    const/high16 v2, 0x8000000

    invoke-static {p1, v0, v1, v2}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method

.method protected static getSharedPreferences(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "sourceName"    # Ljava/lang/String;

    .prologue
    .line 518
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "muzeiartsource_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method private loadState()V
    .registers 6

    .prologue
    .line 741
    iget-object v2, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "state"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 742
    .local v1, "stateString":Ljava/lang/String;
    if-eqz v1, :cond_39

    .line 744
    :try_start_b
    new-instance v2, Lorg/json/JSONTokener;

    invoke-direct {v2, v1}, Lorg/json/JSONTokener;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Lorg/json/JSONTokener;->nextValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;

    invoke-static {v2}, Lcom/google/android/apps/muzei/api/internal/SourceState;->fromJson(Lorg/json/JSONObject;)Lcom/google/android/apps/muzei/api/internal/SourceState;

    move-result-object v2

    iput-object v2, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_1c} :catch_1d

    .line 752
    :goto_1c
    return-void

    .line 746
    :catch_1d
    move-exception v0

    .line 747
    .local v0, "e":Lorg/json/JSONException;
    const-string v2, "MuzeiArtSource"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Couldn\'t deserialize current state, id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1c

    .line 750
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_39
    new-instance v2, Lcom/google/android/apps/muzei/api/internal/SourceState;

    invoke-direct {v2}, Lcom/google/android/apps/muzei/api/internal/SourceState;-><init>()V

    iput-object v2, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

    goto :goto_1c
.end method

.method private declared-synchronized loadSubscriptions()V
    .registers 10

    .prologue
    .line 719
    monitor-enter p0

    :try_start_1
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iput-object v6, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSubscriptions:Ljava/util/Map;

    .line 720
    iget-object v6, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v7, "subscriptions"

    const/4 v8, 0x0

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v3

    .line 721
    .local v3, "serializedSubscriptions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v3, :cond_3d

    .line 722
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_17
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 723
    .local v2, "serializedSubscription":Ljava/lang/String;
    const-string v6, "\\|"

    const/4 v7, 0x2

    invoke-virtual {v2, v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 724
    .local v0, "arr":[Ljava/lang/String;
    const/4 v6, 0x0

    aget-object v6, v0, v6

    invoke-static {v6}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v4

    .line 725
    .local v4, "subscriber":Landroid/content/ComponentName;
    const/4 v6, 0x1

    aget-object v5, v0, v6

    .line 726
    .local v5, "token":Ljava/lang/String;
    iget-object v6, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSubscriptions:Ljava/util/Map;

    invoke-interface {v6, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_39
    .catchall {:try_start_1 .. :try_end_39} :catchall_3a

    goto :goto_17

    .line 719
    .end local v0    # "arr":[Ljava/lang/String;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "serializedSubscription":Ljava/lang/String;
    .end local v3    # "serializedSubscriptions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v4    # "subscriber":Landroid/content/ComponentName;
    .end local v5    # "token":Ljava/lang/String;
    :catchall_3a
    move-exception v6

    monitor-exit p0

    throw v6

    .line 729
    .restart local v3    # "serializedSubscriptions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_3d
    monitor-exit p0

    return-void
.end method

.method private declared-synchronized processAndDispatchSubscriberAdded(Landroid/content/ComponentName;)V
    .registers 12
    .param p1, "subscriber"    # Landroid/content/ComponentName;

    .prologue
    const-wide/16 v8, 0x0

    const/4 v7, 0x1

    .line 589
    monitor-enter p0

    const/4 v0, 0x0

    .line 590
    .local v0, "updateDueToSchedule":Z
    :try_start_5
    iget-object v3, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSubscriptions:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    if-ne v3, v7, :cond_2e

    .line 591
    invoke-virtual {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->onEnabled()V

    .line 594
    iget-object v3, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSharedPrefs:Landroid/content/SharedPreferences;

    const-string v4, "scheduled_update_time_millis"

    const-wide/16 v5, 0x0

    invoke-interface {v3, v4, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    .line 595
    .local v1, "updateTimeMillis":J
    cmp-long v3, v1, v8

    if-lez v3, :cond_2e

    .line 596
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    cmp-long v3, v1, v3

    if-gez v3, :cond_4c

    .line 598
    const/4 v0, 0x1

    .line 599
    invoke-virtual {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->unscheduleUpdate()V

    .line 600
    const/4 v3, 0x3

    invoke-virtual {p0, v3}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->onUpdate(I)V

    .line 608
    .end local v1    # "updateTimeMillis":J
    :cond_2e
    :goto_2e
    invoke-virtual {p0, p1}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->onSubscriberAdded(Landroid/content/ComponentName;)V

    .line 611
    if-nez v0, :cond_47

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSubscriptions:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    if-ne v3, v7, :cond_47

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

    invoke-virtual {v3}, Lcom/google/android/apps/muzei/api/internal/SourceState;->getCurrentArtwork()Lcom/google/android/apps/muzei/api/Artwork;

    move-result-object v3

    if-nez v3, :cond_47

    .line 614
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->onUpdate(I)V

    .line 618
    :cond_47
    invoke-direct {p0, p1}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->publishCurrentState(Landroid/content/ComponentName;)V
    :try_end_4a
    .catchall {:try_start_5 .. :try_end_4a} :catchall_50

    .line 619
    monitor-exit p0

    return-void

    .line 603
    .restart local v1    # "updateTimeMillis":J
    :cond_4c
    :try_start_4c
    invoke-direct {p0, v1, v2}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->setUpdateAlarm(J)V
    :try_end_4f
    .catchall {:try_start_4c .. :try_end_4f} :catchall_50

    goto :goto_2e

    .line 589
    .end local v1    # "updateTimeMillis":J
    :catchall_50
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method private declared-synchronized processAndDispatchSubscriberRemoved(Landroid/content/ComponentName;)V
    .registers 3
    .param p1, "subscriber"    # Landroid/content/ComponentName;

    .prologue
    .line 623
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p1}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->onSubscriberRemoved(Landroid/content/ComponentName;)V

    .line 624
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSubscriptions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-nez v0, :cond_12

    .line 625
    invoke-direct {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->clearUpdateAlarm()V

    .line 626
    invoke-virtual {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->onDisabled()V
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_14

    .line 628
    :cond_12
    monitor-exit p0

    return-void

    .line 623
    :catchall_14
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private processHandleCommand(ILandroid/os/Bundle;)V
    .registers 8
    .param p1, "commandId"    # I
    .param p2, "extras"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, 0x3

    .line 631
    const-string v2, "MuzeiArtSource"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Received handle command intent, command ID: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 632
    const/16 v2, 0x3e9

    if-ne p1, v2, :cond_3e

    .line 633
    const-string v2, "com.google.android.apps.muzei.api.extra.SCHEDULED"

    const/4 v3, 0x0

    invoke-virtual {p2, v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_3c

    move v0, v1

    .line 636
    .local v0, "reason":I
    :goto_33
    if-ne v0, v1, :cond_38

    .line 637
    invoke-virtual {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->unscheduleUpdate()V

    .line 639
    :cond_38
    invoke-virtual {p0, v0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->onUpdate(I)V

    .line 643
    .end local v0    # "reason":I
    :goto_3b
    return-void

    .line 633
    :cond_3c
    const/4 v0, 0x2

    goto :goto_33

    .line 641
    :cond_3e
    invoke-virtual {p0, p1}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->onCustomCommand(I)V

    goto :goto_3b
.end method

.method private processNetworkAvailable()V
    .registers 1

    .prologue
    .line 646
    invoke-virtual {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->onNetworkAvailable()V

    .line 647
    return-void
.end method

.method private declared-synchronized processSubscribe(Landroid/content/ComponentName;Ljava/lang/String;)V
    .registers 6
    .param p1, "subscriber"    # Landroid/content/ComponentName;
    .param p2, "token"    # Ljava/lang/String;

    .prologue
    .line 553
    monitor-enter p0

    if-nez p1, :cond_c

    .line 554
    :try_start_3
    const-string v1, "MuzeiArtSource"

    const-string v2, "No subscriber given."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_28

    .line 585
    :cond_a
    :goto_a
    monitor-exit p0

    return-void

    .line 558
    :cond_c
    :try_start_c
    iget-object v1, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSubscriptions:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 559
    .local v0, "oldToken":Ljava/lang/String;
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 560
    if-eqz v0, :cond_a

    .line 565
    iget-object v1, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSubscriptions:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 566
    invoke-direct {p0, p1}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->processAndDispatchSubscriberRemoved(Landroid/content/ComponentName;)V

    .line 584
    :goto_24
    invoke-direct {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->saveSubscriptions()V
    :try_end_27
    .catchall {:try_start_c .. :try_end_27} :catchall_28

    goto :goto_a

    .line 553
    .end local v0    # "oldToken":Ljava/lang/String;
    :catchall_28
    move-exception v1

    monitor-exit p0

    throw v1

    .line 570
    .restart local v0    # "oldToken":Ljava/lang/String;
    :cond_2b
    :try_start_2b
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_39

    .line 572
    iget-object v1, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSubscriptions:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 573
    invoke-direct {p0, p1}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->processAndDispatchSubscriberRemoved(Landroid/content/ComponentName;)V

    .line 576
    :cond_39
    invoke-virtual {p0, p1}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->onAllowSubscription(Landroid/content/ComponentName;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 580
    iget-object v1, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSubscriptions:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 581
    invoke-direct {p0, p1}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->processAndDispatchSubscriberAdded(Landroid/content/ComponentName;)V
    :try_end_47
    .catchall {:try_start_2b .. :try_end_47} :catchall_28

    goto :goto_24
.end method

.method private declared-synchronized publishCurrentState()V
    .registers 4

    .prologue
    .line 683
    monitor-enter p0

    :try_start_1
    iget-object v2, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSubscriptions:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ComponentName;

    .line 684
    .local v1, "subscription":Landroid/content/ComponentName;
    invoke-direct {p0, v1}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->publishCurrentState(Landroid/content/ComponentName;)V
    :try_end_1a
    .catchall {:try_start_1 .. :try_end_1a} :catchall_1b

    goto :goto_b

    .line 683
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "subscription":Landroid/content/ComponentName;
    :catchall_1b
    move-exception v2

    monitor-exit p0

    throw v2

    .line 686
    .restart local v0    # "i$":Ljava/util/Iterator;
    :cond_1e
    monitor-exit p0

    return-void
.end method

.method private declared-synchronized publishCurrentState(Landroid/content/ComponentName;)V
    .registers 9
    .param p1, "subscriber"    # Landroid/content/ComponentName;

    .prologue
    .line 689
    monitor-enter p0

    :try_start_1
    iget-object v4, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSubscriptions:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 690
    .local v3, "token":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2b

    .line 691
    const-string v4, "MuzeiArtSource"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Not active, canceling update, id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_29
    .catchall {:try_start_1 .. :try_end_29} :catchall_93

    .line 716
    :cond_29
    :goto_29
    monitor-exit p0

    return-void

    .line 696
    :cond_2b
    :try_start_2b
    new-instance v4, Landroid/content/Intent;

    const-string v5, "com.google.android.apps.muzei.api.action.PUBLISH_UPDATE"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v4

    const-string v5, "com.google.android.apps.muzei.api.extra.TOKEN"

    invoke-virtual {v4, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v5

    const-string v6, "com.google.android.apps.muzei.api.extra.STATE"

    iget-object v4, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

    if-eqz v4, :cond_96

    iget-object v4, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

    invoke-virtual {v4}, Lcom/google/android/apps/muzei/api/internal/SourceState;->toBundle()Landroid/os/Bundle;

    move-result-object v4

    :goto_48
    invoke-virtual {v5, v6, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;
    :try_end_4b
    .catchall {:try_start_2b .. :try_end_4b} :catchall_93

    move-result-object v1

    .line 701
    .local v1, "intent":Landroid/content/Intent;
    :try_start_4c
    invoke-virtual {p0, v1}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v2

    .line 702
    .local v2, "returnedSubscriber":Landroid/content/ComponentName;
    if-nez v2, :cond_29

    .line 703
    const-string v4, "MuzeiArtSource"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Update wasn\'t published because subscriber no longer exists, id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    iget-object v4, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    new-instance v5, Lcom/google/android/apps/muzei/api/MuzeiArtSource$2;

    invoke-direct {v5, p0, p1}, Lcom/google/android/apps/muzei/api/MuzeiArtSource$2;-><init>(Lcom/google/android/apps/muzei/api/MuzeiArtSource;Landroid/content/ComponentName;)V

    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_76
    .catch Ljava/lang/SecurityException; {:try_start_4c .. :try_end_76} :catch_77
    .catchall {:try_start_4c .. :try_end_76} :catchall_93

    goto :goto_29

    .line 713
    .end local v2    # "returnedSubscriber":Landroid/content/ComponentName;
    :catch_77
    move-exception v0

    .line 714
    .local v0, "e":Ljava/lang/SecurityException;
    :try_start_78
    const-string v4, "MuzeiArtSource"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Couldn\'t publish update, id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_92
    .catchall {:try_start_78 .. :try_end_92} :catchall_93

    goto :goto_29

    .line 689
    .end local v0    # "e":Ljava/lang/SecurityException;
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v3    # "token":Ljava/lang/String;
    :catchall_93
    move-exception v4

    monitor-exit p0

    throw v4

    .line 696
    .restart local v3    # "token":Ljava/lang/String;
    :cond_96
    const/4 v4, 0x0

    goto :goto_48
.end method

.method private saveState()V
    .registers 5

    .prologue
    .line 756
    :try_start_0
    iget-object v1, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "state"

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

    invoke-virtual {v3}, Lcom/google/android/apps/muzei/api/internal/SourceState;->toJson()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_19
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_19} :catch_1a

    .line 760
    :goto_19
    return-void

    .line 757
    :catch_1a
    move-exception v0

    .line 758
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "MuzeiArtSource"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Couldn\'t serialize current state, id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_19
.end method

.method private declared-synchronized saveSubscriptions()V
    .registers 6

    .prologue
    .line 732
    monitor-enter p0

    :try_start_1
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 733
    .local v1, "serializedSubscriptions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSubscriptions:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_46

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/ComponentName;

    .line 734
    .local v2, "subscriber":Landroid/content/ComponentName;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "|"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSubscriptions:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_42
    .catchall {:try_start_1 .. :try_end_42} :catchall_43

    goto :goto_10

    .line 732
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "serializedSubscriptions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v2    # "subscriber":Landroid/content/ComponentName;
    :catchall_43
    move-exception v3

    monitor-exit p0

    throw v3

    .line 737
    .restart local v0    # "i$":Ljava/util/Iterator;
    .restart local v1    # "serializedSubscriptions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_46
    :try_start_46
    iget-object v3, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "subscriptions"

    invoke-interface {v3, v4, v1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_55
    .catchall {:try_start_46 .. :try_end_55} :catchall_43

    .line 738
    monitor-exit p0

    return-void
.end method

.method private setUpdateAlarm(J)V
    .registers 7
    .param p1, "nextTimeMillis"    # J

    .prologue
    .line 650
    invoke-virtual {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_21

    .line 651
    const-string v1, "MuzeiArtSource"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Source has no subscribers, not actually scheduling next update, id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 664
    :goto_20
    return-void

    .line 656
    :cond_21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    cmp-long v1, p1, v1

    if-gez v1, :cond_44

    .line 657
    const-string v1, "MuzeiArtSource"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Refusing to schedule next artwork in the past, id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_20

    .line 661
    :cond_44
    const-string v1, "alarm"

    invoke-virtual {p0, v1}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 662
    .local v0, "am":Landroid/app/AlarmManager;
    const/4 v1, 0x1

    invoke-direct {p0, p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->getHandleNextCommandPendingIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v1, p1, p2, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 663
    const-string v1, "MuzeiArtSource"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Scheduling next artwork (source "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3, p1, p2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_20
.end method


# virtual methods
.method protected final getCurrentArtwork()Lcom/google/android/apps/muzei/api/Artwork;
    .registers 2

    .prologue
    .line 467
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

    invoke-virtual {v0}, Lcom/google/android/apps/muzei/api/internal/SourceState;->getCurrentArtwork()Lcom/google/android/apps/muzei/api/Artwork;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method protected final getSharedPreferences()Landroid/content/SharedPreferences;
    .registers 2

    .prologue
    .line 527
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mName:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->getSharedPreferences(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method protected final declared-synchronized isEnabled()Z
    .registers 2

    .prologue
    .line 504
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSubscriptions:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_e

    move-result v0

    if-lez v0, :cond_c

    const/4 v0, 0x1

    :goto_a
    monitor-exit p0

    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_a

    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected onAllowSubscription(Landroid/content/ComponentName;)Z
    .registers 3
    .param p1, "subscriber"    # Landroid/content/ComponentName;

    .prologue
    .line 305
    const/4 v0, 0x1

    return v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 764
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .registers 2

    .prologue
    .line 292
    invoke-super {p0}, Landroid/app/IntentService;->onCreate()V

    .line 293
    invoke-virtual {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mSharedPrefs:Landroid/content/SharedPreferences;

    .line 294
    invoke-direct {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->loadSubscriptions()V

    .line 295
    invoke-direct {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->loadState()V

    .line 296
    return-void
.end method

.method protected onCustomCommand(I)V
    .registers 2
    .param p1, "id"    # I

    .prologue
    .line 363
    return-void
.end method

.method protected onDisabled()V
    .registers 1

    .prologue
    .line 340
    return-void
.end method

.method protected onEnabled()V
    .registers 1

    .prologue
    .line 331
    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .registers 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 532
    if-nez p1, :cond_3

    .line 550
    :cond_2
    :goto_2
    return-void

    .line 536
    :cond_3
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 538
    .local v0, "action":Ljava/lang/String;
    const-string v2, "com.google.android.apps.muzei.api.action.SUBSCRIBE"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 539
    const-string v2, "com.google.android.apps.muzei.api.extra.SUBSCRIBER_COMPONENT"

    invoke-virtual {p1, v2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Landroid/content/ComponentName;

    const-string v3, "com.google.android.apps.muzei.api.extra.TOKEN"

    invoke-virtual {p1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->processSubscribe(Landroid/content/ComponentName;Ljava/lang/String;)V

    goto :goto_2

    .line 543
    :cond_21
    const-string v2, "com.google.android.apps.muzei.api.action.HANDLE_COMMAND"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_38

    .line 544
    const-string v2, "com.google.android.apps.muzei.api.extra.COMMAND_ID"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 545
    .local v1, "commandId":I
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->processHandleCommand(ILandroid/os/Bundle;)V

    goto :goto_2

    .line 547
    .end local v1    # "commandId":I
    :cond_38
    const-string v2, "com.google.android.apps.muzei.api.action.NETWORK_AVAILABLE"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 548
    invoke-direct {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->processNetworkAvailable()V

    goto :goto_2
.end method

.method protected onNetworkAvailable()V
    .registers 1

    .prologue
    .line 371
    return-void
.end method

.method protected onSubscriberAdded(Landroid/content/ComponentName;)V
    .registers 2
    .param p1, "subscriber"    # Landroid/content/ComponentName;

    .prologue
    .line 314
    return-void
.end method

.method protected onSubscriberRemoved(Landroid/content/ComponentName;)V
    .registers 2
    .param p1, "subscriber"    # Landroid/content/ComponentName;

    .prologue
    .line 322
    return-void
.end method

.method protected abstract onUpdate(I)V
.end method

.method protected final publishArtwork(Lcom/google/android/apps/muzei/api/Artwork;)V
    .registers 4
    .param p1, "artwork"    # Lcom/google/android/apps/muzei/api/Artwork;

    .prologue
    const/4 v1, 0x1

    .line 378
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

    invoke-virtual {v0, p1}, Lcom/google/android/apps/muzei/api/internal/SourceState;->setCurrentArtwork(Lcom/google/android/apps/muzei/api/Artwork;)V

    .line 379
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 380
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 381
    return-void
.end method

.method protected final removeAllUserCommands()V
    .registers 4

    .prologue
    const/4 v2, 0x1

    .line 444
    iget-object v1, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

    const/4 v0, 0x0

    check-cast v0, [I

    invoke-virtual {v1, v0}, Lcom/google/android/apps/muzei/api/internal/SourceState;->setUserCommands([I)V

    .line 445
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 446
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 447
    return-void
.end method

.method protected final scheduleUpdate(J)V
    .registers 5
    .param p1, "scheduledUpdateTimeMillis"    # J

    .prologue
    .line 484
    invoke-virtual {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "scheduled_update_time_millis"

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 486
    invoke-direct {p0, p1, p2}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->setUpdateAlarm(J)V

    .line 487
    return-void
.end method

.method protected final setDescription(Ljava/lang/String;)V
    .registers 4
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    .line 389
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

    invoke-virtual {v0, p1}, Lcom/google/android/apps/muzei/api/internal/SourceState;->setDescription(Ljava/lang/String;)V

    .line 390
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 391
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 392
    return-void
.end method

.method protected final setUserCommands(Ljava/util/List;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/google/android/apps/muzei/api/UserCommand;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "commands":Ljava/util/List;, "Ljava/util/List<Lcom/google/android/apps/muzei/api/UserCommand;>;"
    const/4 v1, 0x1

    .line 419
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

    invoke-virtual {v0, p1}, Lcom/google/android/apps/muzei/api/internal/SourceState;->setUserCommands(Ljava/util/List;)V

    .line 420
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 421
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 422
    return-void
.end method

.method protected final varargs setUserCommands([I)V
    .registers 4
    .param p1, "commands"    # [I

    .prologue
    const/4 v1, 0x1

    .line 433
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

    invoke-virtual {v0, p1}, Lcom/google/android/apps/muzei/api/internal/SourceState;->setUserCommands([I)V

    .line 434
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 435
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 436
    return-void
.end method

.method protected final varargs setUserCommands([Lcom/google/android/apps/muzei/api/UserCommand;)V
    .registers 5
    .param p1, "commands"    # [Lcom/google/android/apps/muzei/api/UserCommand;

    .prologue
    const/4 v2, 0x1

    .line 405
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/apps/muzei/api/internal/SourceState;->setUserCommands(Ljava/util/List;)V

    .line 406
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 407
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 408
    return-void
.end method

.method protected final setWantsNetworkAvailable(Z)V
    .registers 4
    .param p1, "wantsNetworkAvailable"    # Z

    .prologue
    const/4 v1, 0x1

    .line 457
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mCurrentState:Lcom/google/android/apps/muzei/api/internal/SourceState;

    invoke-virtual {v0, p1}, Lcom/google/android/apps/muzei/api/internal/SourceState;->setWantsNetworkAvailable(Z)V

    .line 458
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 459
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 460
    return-void
.end method

.method protected final unscheduleUpdate()V
    .registers 3

    .prologue
    .line 493
    invoke-virtual {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->getSharedPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "scheduled_update_time_millis"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 494
    invoke-direct {p0}, Lcom/google/android/apps/muzei/api/MuzeiArtSource;->clearUpdateAlarm()V

    .line 495
    return-void
.end method
