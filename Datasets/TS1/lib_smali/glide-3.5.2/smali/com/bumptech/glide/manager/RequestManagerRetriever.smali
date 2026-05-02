.class public Lcom/bumptech/glide/manager/RequestManagerRetriever;
.super Ljava/lang/Object;
.source "RequestManagerRetriever.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# static fields
.field private static final ID_REMOVE_FRAGMENT_MANAGER:I = 0x1

.field private static final ID_REMOVE_SUPPORT_FRAGMENT_MANAGER:I = 0x2

.field private static final INSTANCE:Lcom/bumptech/glide/manager/RequestManagerRetriever;

.field static final TAG:Ljava/lang/String; = "com.bumptech.glide.manager"


# instance fields
.field private volatile applicationManager:Lcom/bumptech/glide/RequestManager;

.field private final handler:Landroid/os/Handler;

.field final pendingRequestManagerFragments:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/app/FragmentManager;",
            "Lcom/bumptech/glide/manager/RequestManagerFragment;",
            ">;"
        }
    .end annotation
.end field

.field final pendingSupportRequestManagerFragments:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Landroid/support/v4/app/FragmentManager;",
            "Lcom/bumptech/glide/manager/SupportRequestManagerFragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 31
    new-instance v0, Lcom/bumptech/glide/manager/RequestManagerRetriever;

    invoke-direct {v0}, Lcom/bumptech/glide/manager/RequestManagerRetriever;-><init>()V

    sput-object v0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->INSTANCE:Lcom/bumptech/glide/manager/RequestManagerRetriever;

    return-void
.end method

.method constructor <init>()V
    .registers 3

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->pendingRequestManagerFragments:Ljava/util/Map;

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->pendingSupportRequestManagerFragments:Ljava/util/Map;

    .line 61
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->handler:Landroid/os/Handler;

    .line 62
    return-void
.end method

.method private static assertNotDestroyed(Landroid/app/Activity;)V
    .registers 3
    .param p0, "activity"    # Landroid/app/Activity;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 132
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_14

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 133
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You cannot start a load for a destroyed activity"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 135
    :cond_14
    return-void
.end method

.method public static get()Lcom/bumptech/glide/manager/RequestManagerRetriever;
    .registers 1

    .prologue
    .line 56
    sget-object v0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->INSTANCE:Lcom/bumptech/glide/manager/RequestManagerRetriever;

    return-object v0
.end method

.method private getApplicationManager(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;
    .registers 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 66
    iget-object v0, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->applicationManager:Lcom/bumptech/glide/RequestManager;

    if-nez v0, :cond_1a

    .line 67
    monitor-enter p0

    .line 68
    :try_start_5
    iget-object v0, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->applicationManager:Lcom/bumptech/glide/RequestManager;

    if-nez v0, :cond_19

    .line 72
    new-instance v0, Lcom/bumptech/glide/RequestManager;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/bumptech/glide/manager/ApplicationLifecycle;

    invoke-direct {v2}, Lcom/bumptech/glide/manager/ApplicationLifecycle;-><init>()V

    invoke-direct {v0, v1, v2}, Lcom/bumptech/glide/RequestManager;-><init>(Landroid/content/Context;Lcom/bumptech/glide/manager/Lifecycle;)V

    iput-object v0, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->applicationManager:Lcom/bumptech/glide/RequestManager;

    .line 75
    :cond_19
    monitor-exit p0
    :try_end_1a
    .catchall {:try_start_5 .. :try_end_1a} :catchall_1d

    .line 78
    :cond_1a
    iget-object v0, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->applicationManager:Lcom/bumptech/glide/RequestManager;

    return-object v0

    .line 75
    :catchall_1d
    move-exception v0

    :try_start_1e
    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_1d

    throw v0
.end method


# virtual methods
.method fragmentGet(Landroid/content/Context;Landroid/app/FragmentManager;)Lcom/bumptech/glide/RequestManager;
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fm"    # Landroid/app/FragmentManager;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 152
    const-string v2, "com.bumptech.glide.manager"

    invoke-virtual {p2, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/manager/RequestManagerFragment;

    .line 153
    .local v0, "current":Lcom/bumptech/glide/manager/RequestManagerFragment;
    if-nez v0, :cond_35

    .line 154
    iget-object v2, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->pendingRequestManagerFragments:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "current":Lcom/bumptech/glide/manager/RequestManagerFragment;
    check-cast v0, Lcom/bumptech/glide/manager/RequestManagerFragment;

    .line 155
    .restart local v0    # "current":Lcom/bumptech/glide/manager/RequestManagerFragment;
    if-nez v0, :cond_35

    .line 156
    new-instance v0, Lcom/bumptech/glide/manager/RequestManagerFragment;

    .end local v0    # "current":Lcom/bumptech/glide/manager/RequestManagerFragment;
    invoke-direct {v0}, Lcom/bumptech/glide/manager/RequestManagerFragment;-><init>()V

    .line 157
    .restart local v0    # "current":Lcom/bumptech/glide/manager/RequestManagerFragment;
    iget-object v2, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->pendingRequestManagerFragments:Ljava/util/Map;

    invoke-interface {v2, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    invoke-virtual {p2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    const-string v3, "com.bumptech.glide.manager"

    invoke-virtual {v2, v0, v3}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 159
    iget-object v2, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->handler:Landroid/os/Handler;

    const/4 v3, 0x1

    invoke-virtual {v2, v3, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    .line 162
    :cond_35
    invoke-virtual {v0}, Lcom/bumptech/glide/manager/RequestManagerFragment;->getRequestManager()Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    .line 163
    .local v1, "requestManager":Lcom/bumptech/glide/RequestManager;
    if-nez v1, :cond_47

    .line 164
    new-instance v1, Lcom/bumptech/glide/RequestManager;

    .end local v1    # "requestManager":Lcom/bumptech/glide/RequestManager;
    invoke-virtual {v0}, Lcom/bumptech/glide/manager/RequestManagerFragment;->getLifecycle()Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Lcom/bumptech/glide/RequestManager;-><init>(Landroid/content/Context;Lcom/bumptech/glide/manager/Lifecycle;)V

    .line 165
    .restart local v1    # "requestManager":Lcom/bumptech/glide/RequestManager;
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/manager/RequestManagerFragment;->setRequestManager(Lcom/bumptech/glide/RequestManager;)V

    .line 167
    :cond_47
    return-object v1
.end method

.method public get(Landroid/app/Activity;)Lcom/bumptech/glide/RequestManager;
    .registers 5
    .param p1, "activity"    # Landroid/app/Activity;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    .prologue
    .line 121
    invoke-static {}, Lcom/bumptech/glide/util/Util;->isOnBackgroundThread()Z

    move-result v1

    if-nez v1, :cond_c

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-ge v1, v2, :cond_15

    .line 122
    :cond_c
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    .line 126
    :goto_14
    return-object v1

    .line 124
    :cond_15
    invoke-static {p1}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->assertNotDestroyed(Landroid/app/Activity;)V

    .line 125
    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    .line 126
    .local v0, "fm":Landroid/app/FragmentManager;
    invoke-virtual {p0, p1, v0}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->fragmentGet(Landroid/content/Context;Landroid/app/FragmentManager;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    goto :goto_14
.end method

.method public get(Landroid/app/Fragment;)Lcom/bumptech/glide/RequestManager;
    .registers 5
    .param p1, "fragment"    # Landroid/app/Fragment;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x11
    .end annotation

    .prologue
    .line 139
    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-nez v1, :cond_e

    .line 140
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "You cannot start a load on a fragment before it is attached"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 142
    :cond_e
    invoke-static {}, Lcom/bumptech/glide/util/Util;->isOnBackgroundThread()Z

    move-result v1

    if-nez v1, :cond_1a

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-ge v1, v2, :cond_27

    .line 143
    :cond_1a
    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    .line 146
    :goto_26
    return-object v1

    .line 145
    :cond_27
    invoke-virtual {p1}, Landroid/app/Fragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    .line 146
    .local v0, "fm":Landroid/app/FragmentManager;
    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->fragmentGet(Landroid/content/Context;Landroid/app/FragmentManager;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    goto :goto_26
.end method

.method public get(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;
    .registers 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 82
    if-nez p1, :cond_a

    .line 83
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "You cannot start a load on a null Context"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 84
    :cond_a
    invoke-static {}, Lcom/bumptech/glide/util/Util;->isOnMainThread()Z

    move-result v0

    if-eqz v0, :cond_39

    instance-of v0, p1, Landroid/app/Application;

    if-nez v0, :cond_39

    .line 85
    instance-of v0, p1, Landroid/support/v4/app/FragmentActivity;

    if-eqz v0, :cond_1f

    .line 86
    check-cast p1, Landroid/support/v4/app/FragmentActivity;

    .end local p1    # "context":Landroid/content/Context;
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroid/support/v4/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;

    move-result-object v0

    .line 94
    :goto_1e
    return-object v0

    .line 87
    .restart local p1    # "context":Landroid/content/Context;
    :cond_1f
    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_2a

    .line 88
    check-cast p1, Landroid/app/Activity;

    .end local p1    # "context":Landroid/content/Context;
    invoke-virtual {p0, p1}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroid/app/Activity;)Lcom/bumptech/glide/RequestManager;

    move-result-object v0

    goto :goto_1e

    .line 89
    .restart local p1    # "context":Landroid/content/Context;
    :cond_2a
    instance-of v0, p1, Landroid/content/ContextWrapper;

    if-eqz v0, :cond_39

    .line 90
    check-cast p1, Landroid/content/ContextWrapper;

    .end local p1    # "context":Landroid/content/Context;
    invoke-virtual {p1}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object v0

    goto :goto_1e

    .line 94
    .restart local p1    # "context":Landroid/content/Context;
    :cond_39
    invoke-direct {p0, p1}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->getApplicationManager(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object v0

    goto :goto_1e
.end method

.method public get(Landroid/support/v4/app/Fragment;)Lcom/bumptech/glide/RequestManager;
    .registers 5
    .param p1, "fragment"    # Landroid/support/v4/app/Fragment;

    .prologue
    .line 108
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    if-nez v1, :cond_e

    .line 109
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "You cannot start a load on a fragment before it is attached"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 111
    :cond_e
    invoke-static {}, Lcom/bumptech/glide/util/Util;->isOnBackgroundThread()Z

    move-result v1

    if-eqz v1, :cond_21

    .line 112
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    .line 115
    :goto_20
    return-object v1

    .line 114
    :cond_21
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getChildFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 115
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->supportFragmentGet(Landroid/content/Context;Landroid/support/v4/app/FragmentManager;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    goto :goto_20
.end method

.method public get(Landroid/support/v4/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;
    .registers 4
    .param p1, "activity"    # Landroid/support/v4/app/FragmentActivity;

    .prologue
    .line 98
    invoke-static {}, Lcom/bumptech/glide/util/Util;->isOnBackgroundThread()Z

    move-result v1

    if-eqz v1, :cond_f

    .line 99
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->get(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    .line 103
    :goto_e
    return-object v1

    .line 101
    :cond_f
    invoke-static {p1}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->assertNotDestroyed(Landroid/app/Activity;)V

    .line 102
    invoke-virtual {p1}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    .line 103
    .local v0, "fm":Landroid/support/v4/app/FragmentManager;
    invoke-virtual {p0, p1, v0}, Lcom/bumptech/glide/manager/RequestManagerRetriever;->supportFragmentGet(Landroid/content/Context;Landroid/support/v4/app/FragmentManager;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    goto :goto_e
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .registers 10
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    .line 192
    const/4 v1, 0x1

    .line 193
    .local v1, "handled":Z
    const/4 v3, 0x0

    .line 194
    .local v3, "removed":Ljava/lang/Object;
    const/4 v2, 0x0

    .line 195
    .local v2, "key":Ljava/lang/Object;
    iget v5, p1, Landroid/os/Message;->what:I

    packed-switch v5, :pswitch_data_48

    .line 207
    const/4 v1, 0x0

    .line 209
    .end local v2    # "key":Ljava/lang/Object;
    .end local v3    # "removed":Ljava/lang/Object;
    :goto_9
    if-eqz v1, :cond_2e

    if-nez v3, :cond_2e

    const-string v5, "com.bumptech.glide.manager"

    const/4 v6, 0x5

    invoke-static {v5, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_2e

    .line 210
    const-string v5, "com.bumptech.glide.manager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to remove expected request manager fragment, manager: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    :cond_2e
    return v1

    .line 197
    .restart local v2    # "key":Ljava/lang/Object;
    .restart local v3    # "removed":Ljava/lang/Object;
    :pswitch_2f
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/app/FragmentManager;

    .line 198
    .local v0, "fm":Landroid/app/FragmentManager;
    move-object v2, v0

    .line 199
    .local v2, "key":Landroid/app/FragmentManager;
    iget-object v5, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->pendingRequestManagerFragments:Ljava/util/Map;

    invoke-interface {v5, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 200
    goto :goto_9

    .line 202
    .end local v0    # "fm":Landroid/app/FragmentManager;
    .local v2, "key":Ljava/lang/Object;
    :pswitch_3b
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/support/v4/app/FragmentManager;

    .line 203
    .local v4, "supportFm":Landroid/support/v4/app/FragmentManager;
    move-object v2, v4

    .line 204
    .local v2, "key":Landroid/support/v4/app/FragmentManager;
    iget-object v5, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->pendingSupportRequestManagerFragments:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 205
    goto :goto_9

    .line 195
    nop

    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_2f
        :pswitch_3b
    .end packed-switch
.end method

.method supportFragmentGet(Landroid/content/Context;Landroid/support/v4/app/FragmentManager;)Lcom/bumptech/glide/RequestManager;
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "fm"    # Landroid/support/v4/app/FragmentManager;

    .prologue
    .line 172
    const-string v2, "com.bumptech.glide.manager"

    invoke-virtual {p2, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;

    .line 173
    .local v0, "current":Lcom/bumptech/glide/manager/SupportRequestManagerFragment;
    if-nez v0, :cond_35

    .line 174
    iget-object v2, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->pendingSupportRequestManagerFragments:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "current":Lcom/bumptech/glide/manager/SupportRequestManagerFragment;
    check-cast v0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;

    .line 175
    .restart local v0    # "current":Lcom/bumptech/glide/manager/SupportRequestManagerFragment;
    if-nez v0, :cond_35

    .line 176
    new-instance v0, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;

    .end local v0    # "current":Lcom/bumptech/glide/manager/SupportRequestManagerFragment;
    invoke-direct {v0}, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;-><init>()V

    .line 177
    .restart local v0    # "current":Lcom/bumptech/glide/manager/SupportRequestManagerFragment;
    iget-object v2, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->pendingSupportRequestManagerFragments:Ljava/util/Map;

    invoke-interface {v2, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    invoke-virtual {p2}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    const-string v3, "com.bumptech.glide.manager"

    invoke-virtual {v2, v0, v3}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    .line 179
    iget-object v2, p0, Lcom/bumptech/glide/manager/RequestManagerRetriever;->handler:Landroid/os/Handler;

    const/4 v3, 0x2

    invoke-virtual {v2, v3, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/Message;->sendToTarget()V

    .line 182
    :cond_35
    invoke-virtual {v0}, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->getRequestManager()Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    .line 183
    .local v1, "requestManager":Lcom/bumptech/glide/RequestManager;
    if-nez v1, :cond_47

    .line 184
    new-instance v1, Lcom/bumptech/glide/RequestManager;

    .end local v1    # "requestManager":Lcom/bumptech/glide/RequestManager;
    invoke-virtual {v0}, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->getLifecycle()Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Lcom/bumptech/glide/RequestManager;-><init>(Landroid/content/Context;Lcom/bumptech/glide/manager/Lifecycle;)V

    .line 185
    .restart local v1    # "requestManager":Lcom/bumptech/glide/RequestManager;
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/manager/SupportRequestManagerFragment;->setRequestManager(Lcom/bumptech/glide/RequestManager;)V

    .line 187
    :cond_47
    return-object v1
.end method
