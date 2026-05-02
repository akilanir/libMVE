.class public abstract Lcom/octo/android/robospice/SpiceService;
.super Landroid/app/Service;
.source "SpiceService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/octo/android/robospice/SpiceService$SpiceServiceBinder;,
        Lcom/octo/android/robospice/SpiceService$SelfStopperRequestProcessorListener;
    }
.end annotation


# static fields
.field private static final DEFAULT_FAIL_ON_CACHE_ERROR:Z = false

.field protected static final DEFAULT_NOTIFICATION_ID:I = 0x2a

.field protected static final DEFAULT_THREAD_COUNT:I = 0x1

.field protected static final DEFAULT_THREAD_KEEP_ALIVE_TIME:I = 0x0

.field protected static final DEFAULT_THREAD_PRIORITY:I = 0x1

.field private static isJUnit:Z


# instance fields
.field private cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

.field private currentPendingRequestCount:I

.field private isBound:Z

.field private isCreated:Z

.field private mSpiceServiceBinder:Lcom/octo/android/robospice/SpiceService$SpiceServiceBinder;

.field private notification:Landroid/app/Notification;

.field private requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 59
    const/4 v0, 0x0

    sput-boolean v0, Lcom/octo/android/robospice/SpiceService;->isJUnit:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 99
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 81
    const/4 v0, 0x0

    iput v0, p0, Lcom/octo/android/robospice/SpiceService;->currentPendingRequestCount:I

    .line 100
    new-instance v0, Lcom/octo/android/robospice/SpiceService$SpiceServiceBinder;

    invoke-direct {v0, p0}, Lcom/octo/android/robospice/SpiceService$SpiceServiceBinder;-><init>(Lcom/octo/android/robospice/SpiceService;)V

    iput-object v0, p0, Lcom/octo/android/robospice/SpiceService;->mSpiceServiceBinder:Lcom/octo/android/robospice/SpiceService$SpiceServiceBinder;

    .line 101
    return-void
.end method

.method static synthetic access$002(Lcom/octo/android/robospice/SpiceService;I)I
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceService;
    .param p1, "x1"    # I

    .prologue
    .line 55
    iput p1, p0, Lcom/octo/android/robospice/SpiceService;->currentPendingRequestCount:I

    return p1
.end method

.method static synthetic access$100(Lcom/octo/android/robospice/SpiceService;)V
    .registers 1
    .param p0, "x0"    # Lcom/octo/android/robospice/SpiceService;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceService;->stopIfNotBoundAndHasNoPendingRequests()V

    return-void
.end method

.method private createRequestProgressManager(Lcom/octo/android/robospice/request/RequestProcessorListener;Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;)Lcom/octo/android/robospice/request/RequestProgressManager;
    .registers 5
    .param p1, "requestProcessorListener"    # Lcom/octo/android/robospice/request/RequestProcessorListener;
    .param p2, "progressReporter"    # Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;
    .param p3, "spiceServiceListenerNotifier"    # Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    .prologue
    .line 148
    new-instance v0, Lcom/octo/android/robospice/request/RequestProgressManager;

    invoke-direct {v0, p1, p2, p3}, Lcom/octo/android/robospice/request/RequestProgressManager;-><init>(Lcom/octo/android/robospice/request/RequestProcessorListener;Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;)V

    return-object v0
.end method

.method private createRequestRunner(Ljava/util/concurrent/ExecutorService;Lcom/octo/android/robospice/networkstate/NetworkStateChecker;Lcom/octo/android/robospice/request/RequestProgressManager;)Lcom/octo/android/robospice/request/RequestRunner;
    .registers 10
    .param p1, "executorService"    # Ljava/util/concurrent/ExecutorService;
    .param p2, "networkStateChecker"    # Lcom/octo/android/robospice/networkstate/NetworkStateChecker;
    .param p3, "requestProgressManager"    # Lcom/octo/android/robospice/request/RequestProgressManager;

    .prologue
    .line 143
    new-instance v0, Lcom/octo/android/robospice/request/DefaultRequestRunner;

    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/octo/android/robospice/SpiceService;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    move-object v3, p1

    move-object v4, p3

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/octo/android/robospice/request/DefaultRequestRunner;-><init>(Landroid/content/Context;Lcom/octo/android/robospice/persistence/CacheManager;Ljava/util/concurrent/ExecutorService;Lcom/octo/android/robospice/request/RequestProgressManager;Lcom/octo/android/robospice/networkstate/NetworkStateChecker;)V

    return-object v0
.end method

.method public static final setIsJunit(Z)V
    .registers 1
    .param p0, "b"    # Z

    .prologue
    .line 536
    sput-boolean p0, Lcom/octo/android/robospice/SpiceService;->isJUnit:Z

    .line 537
    return-void
.end method

.method private showNotificationIfNotBoundAndHasPendingRequestsOtherwiseHideNotification()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 503
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->notification:Landroid/app/Notification;

    if-eqz v0, :cond_9

    sget-boolean v0, Lcom/octo/android/robospice/SpiceService;->isJUnit:Z

    if-eqz v0, :cond_a

    .line 514
    :cond_9
    :goto_9
    return-void

    .line 506
    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Pending requests : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/octo/android/robospice/SpiceService;->currentPendingRequestCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 507
    iget-boolean v0, p0, Lcom/octo/android/robospice/SpiceService;->isBound:Z

    if-nez v0, :cond_2c

    iget v0, p0, Lcom/octo/android/robospice/SpiceService;->currentPendingRequestCount:I

    if-nez v0, :cond_38

    .line 508
    :cond_2c
    const-string v0, "Stop foreground"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 509
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/SpiceService;->stopForeground(Z)V

    goto :goto_9

    .line 511
    :cond_38
    const-string v0, "Start foreground"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 512
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->notification:Landroid/app/Notification;

    invoke-direct {p0, v0}, Lcom/octo/android/robospice/SpiceService;->startForeground(Landroid/app/Notification;)V

    goto :goto_9
.end method

.method private startForeground(Landroid/app/Notification;)V
    .registers 10
    .param p1, "notification"    # Landroid/app/Notification;

    .prologue
    const/4 v7, 0x0

    .line 518
    :try_start_1
    const-class v2, Landroid/app/Service;

    const-string v3, "startForeground"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Class;

    const/4 v5, 0x0

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const-class v6, Landroid/app/Notification;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 519
    .local v1, "setForegroundMethod":Ljava/lang/reflect/Method;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getNotificationId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2a
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_2a} :catch_2b
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_2a} :catch_34
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_2a} :catch_3d
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_2a} :catch_46
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_2a} :catch_4f

    .line 531
    .end local v1    # "setForegroundMethod":Ljava/lang/reflect/Method;
    :goto_2a
    return-void

    .line 520
    :catch_2b
    move-exception v0

    .line 521
    .local v0, "e":Ljava/lang/SecurityException;
    const-string v2, "Unable to start a service in foreground"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_2a

    .line 522
    .end local v0    # "e":Ljava/lang/SecurityException;
    :catch_34
    move-exception v0

    .line 523
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    const-string v2, "Unable to start a service in foreground"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_2a

    .line 524
    .end local v0    # "e":Ljava/lang/NoSuchMethodException;
    :catch_3d
    move-exception v0

    .line 525
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    const-string v2, "Unable to start a service in foreground"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_2a

    .line 526
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_46
    move-exception v0

    .line 527
    .local v0, "e":Ljava/lang/IllegalAccessException;
    const-string v2, "Unable to start a service in foreground"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_2a

    .line 528
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_4f
    move-exception v0

    .line 529
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    const-string v2, "Unable to start a service in foreground"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {v0, v2, v3}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_2a
.end method

.method private stopIfNotBoundAndHasNoPendingRequests()V
    .registers 3

    .prologue
    .line 495
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Pending requests : "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/octo/android/robospice/SpiceService;->currentPendingRequestCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 496
    iget v0, p0, Lcom/octo/android/robospice/SpiceService;->currentPendingRequestCount:I

    if-nez v0, :cond_26

    iget-boolean v0, p0, Lcom/octo/android/robospice/SpiceService;->isBound:Z

    if-nez v0, :cond_26

    .line 497
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->stopSelf()V

    .line 499
    :cond_26
    return-void
.end method


# virtual methods
.method public addRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Set",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 379
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "listRequestListener":Ljava/util/Set;, "Ljava/util/Set<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    iget v0, p0, Lcom/octo/android/robospice/SpiceService;->currentPendingRequestCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/octo/android/robospice/SpiceService;->currentPendingRequestCount:I

    .line 380
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;

    invoke-virtual {v0, p1, p2}, Lcom/octo/android/robospice/request/RequestProcessor;->addRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Set;)V

    .line 381
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceService;->showNotificationIfNotBoundAndHasPendingRequestsOtherwiseHideNotification()V

    .line 382
    return-void
.end method

.method public addSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V
    .registers 3
    .param p1, "spiceServiceListener"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener;

    .prologue
    .line 487
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/RequestProcessor;->addSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V

    .line 488
    return-void
.end method

.method public abstract createCacheManager(Landroid/app/Application;)Lcom/octo/android/robospice/persistence/CacheManager;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation
.end method

.method public createDefaultNotification()Landroid/app/Notification;
    .registers 7

    .prologue
    const/16 v5, 0x10

    const/4 v4, 0x0

    .line 274
    const/4 v0, 0x0

    .line 275
    .local v0, "notification":Landroid/app/Notification;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v5, :cond_23

    .line 276
    new-instance v2, Landroid/app/Notification$Builder;

    invoke-direct {v2, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->icon:I

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    .line 289
    :goto_1b
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v5, :cond_22

    .line 290
    const/4 v2, -0x2

    iput v2, v0, Landroid/app/Notification;->priority:I

    .line 293
    :cond_22
    return-object v0

    .line 277
    :cond_23
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_3d

    .line 278
    new-instance v2, Landroid/app/Notification$Builder;

    invoke-direct {v2, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->icon:I

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v0

    goto :goto_1b

    .line 280
    :cond_3d
    new-instance v0, Landroid/app/Notification;

    .end local v0    # "notification":Landroid/app/Notification;
    invoke-direct {v0}, Landroid/app/Notification;-><init>()V

    .line 281
    .restart local v0    # "notification":Landroid/app/Notification;
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget v2, v2, Landroid/content/pm/ApplicationInfo;->icon:I

    iput v2, v0, Landroid/app/Notification;->icon:I

    .line 283
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    invoke-static {v2, v4, v3, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 284
    .local v1, "pendingIntent":Landroid/app/PendingIntent;
    const-string v2, ""

    const-string v3, ""

    invoke-virtual {v0, p0, v2, v3, v1}, Landroid/app/Notification;->setLatestEventInfo(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)V

    .line 285
    const/4 v2, 0x0

    iput-object v2, v0, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 286
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, v0, Landroid/app/Notification;->when:J

    goto :goto_1b
.end method

.method protected createRequestProcessor(Lcom/octo/android/robospice/persistence/CacheManager;Lcom/octo/android/robospice/request/RequestProgressManager;Lcom/octo/android/robospice/request/RequestRunner;)Lcom/octo/android/robospice/request/RequestProcessor;
    .registers 5
    .param p1, "cacheManager"    # Lcom/octo/android/robospice/persistence/CacheManager;
    .param p2, "requestProgressManager"    # Lcom/octo/android/robospice/request/RequestProgressManager;
    .param p3, "requestRunner"    # Lcom/octo/android/robospice/request/RequestRunner;

    .prologue
    .line 172
    new-instance v0, Lcom/octo/android/robospice/request/RequestProcessor;

    invoke-direct {v0, p1, p2, p3}, Lcom/octo/android/robospice/request/RequestProcessor;-><init>(Lcom/octo/android/robospice/persistence/CacheManager;Lcom/octo/android/robospice/request/RequestProgressManager;Lcom/octo/android/robospice/request/RequestRunner;)V

    return-object v0
.end method

.method protected createRequestProcessorListener()Lcom/octo/android/robospice/request/RequestProcessorListener;
    .registers 2

    .prologue
    .line 183
    new-instance v0, Lcom/octo/android/robospice/SpiceService$SelfStopperRequestProcessorListener;

    invoke-direct {v0, p0}, Lcom/octo/android/robospice/SpiceService$SelfStopperRequestProcessorListener;-><init>(Lcom/octo/android/robospice/SpiceService;)V

    return-object v0
.end method

.method protected createRequestRequestListenerNotifier()Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;
    .registers 2

    .prologue
    .line 201
    new-instance v0, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier;

    invoke-direct {v0}, Lcom/octo/android/robospice/request/notifier/DefaultRequestListenerNotifier;-><init>()V

    return-object v0
.end method

.method protected createSpiceServiceListenerNotifier()Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;
    .registers 2

    .prologue
    .line 257
    new-instance v0, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    invoke-direct {v0}, Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;-><init>()V

    return-object v0
.end method

.method public dontNotifyRequestListenersForRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Collection;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Ljava/util/Collection",
            "<",
            "Lcom/octo/android/robospice/request/listener/RequestListener",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 429
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    .local p2, "listRequestListener":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/octo/android/robospice/request/listener/RequestListener<*>;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;

    invoke-virtual {v0, p1, p2}, Lcom/octo/android/robospice/request/RequestProcessor;->dontNotifyRequestListenersForRequest(Lcom/octo/android/robospice/request/CachedSpiceRequest;Ljava/util/Collection;)V

    .line 430
    return-void
.end method

.method public dumpState()V
    .registers 3

    .prologue
    .line 483
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/RequestProcessor;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->v(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 484
    return-void
.end method

.method public getAllCacheKeys(Ljava/lang/Class;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 393
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/persistence/CacheManager;->getAllCacheKeys(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getCoreThreadCount()I
    .registers 2

    .prologue
    .line 333
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getThreadCount()I

    move-result v0

    return v0
.end method

.method public getDataFromCache(Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;,
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 401
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, p1, p2, v1, v2}, Lcom/octo/android/robospice/persistence/CacheManager;->loadDataFromCache(Ljava/lang/Class;Ljava/lang/Object;J)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getDateOfDataInCache(Ljava/lang/Class;Ljava/lang/Object;)Ljava/util/Date;
    .registers 4
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Date;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;,
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 413
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    invoke-virtual {v0, p1, p2}, Lcom/octo/android/robospice/persistence/CacheManager;->getDateOfDataInCache(Ljava/lang/Class;Ljava/lang/Object;)Ljava/util/Date;

    move-result-object v0

    return-object v0
.end method

.method protected getExecutorService()Ljava/util/concurrent/ExecutorService;
    .registers 8

    .prologue
    .line 235
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getCoreThreadCount()I

    move-result v0

    .line 236
    .local v0, "coreThreadCount":I
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getMaximumThreadCount()I

    move-result v2

    .line 237
    .local v2, "maxThreadCount":I
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getThreadPriority()I

    move-result v3

    .line 238
    .local v3, "threadPriority":I
    if-lez v0, :cond_10

    if-gtz v2, :cond_18

    .line 239
    :cond_10
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Thread count must be >= 1"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 241
    :cond_18
    invoke-static {v0, v2, v3}, Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;->getPriorityExecutor(III)Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;

    move-result-object v1

    .line 244
    .local v1, "executor":Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getKeepAliveTime()I

    move-result v4

    int-to-long v4, v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v4, v5, v6}, Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;->setKeepAliveTime(JLjava/util/concurrent/TimeUnit;)V

    .line 245
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x9

    if-lt v4, v5, :cond_3c

    .line 246
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getKeepAliveTime()I

    move-result v4

    if-eqz v4, :cond_3d

    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->isCoreThreadDisposable()Z

    move-result v4

    if-eqz v4, :cond_3d

    const/4 v4, 0x1

    :goto_39
    invoke-virtual {v1, v4}, Lcom/octo/android/robospice/priority/PriorityThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 248
    :cond_3c
    return-object v1

    .line 246
    :cond_3d
    const/4 v4, 0x0

    goto :goto_39
.end method

.method public getKeepAliveTime()I
    .registers 2

    .prologue
    .line 355
    const/4 v0, 0x0

    return v0
.end method

.method public getMaximumThreadCount()I
    .registers 2

    .prologue
    .line 344
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getThreadCount()I

    move-result v0

    return v0
.end method

.method protected getNetworkStateChecker()Lcom/octo/android/robospice/networkstate/NetworkStateChecker;
    .registers 2

    .prologue
    .line 217
    new-instance v0, Lcom/octo/android/robospice/networkstate/DefaultNetworkStateChecker;

    invoke-direct {v0}, Lcom/octo/android/robospice/networkstate/DefaultNetworkStateChecker;-><init>()V

    return-object v0
.end method

.method protected getNotificationId()I
    .registers 2

    .prologue
    .line 297
    const/16 v0, 0x2a

    return v0
.end method

.method protected getRequestProcessor()Lcom/octo/android/robospice/request/RequestProcessor;
    .registers 2

    .prologue
    .line 191
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;

    return-object v0
.end method

.method public getThreadCount()I
    .registers 2

    .prologue
    .line 322
    const/4 v0, 0x1

    return v0
.end method

.method public getThreadPriority()I
    .registers 2

    .prologue
    .line 375
    const/4 v0, 0x1

    return v0
.end method

.method public isCoreThreadDisposable()Z
    .registers 2

    .prologue
    .line 365
    const/4 v0, 0x1

    return v0
.end method

.method public isCreated()Z
    .registers 2

    .prologue
    .line 139
    iget-boolean v0, p0, Lcom/octo/android/robospice/SpiceService;->isCreated:Z

    return v0
.end method

.method public isDataInCache(Ljava/lang/Class;Ljava/lang/Object;J)Z
    .registers 6
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .param p3, "cacheExpiryDuration"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            "J)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 409
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/octo/android/robospice/persistence/CacheManager;->isDataInCache(Ljava/lang/Class;Ljava/lang/Object;J)Z

    move-result v0

    return v0
.end method

.method public isFailOnCacheError()Z
    .registers 2

    .prologue
    .line 421
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/RequestProcessor;->isFailOnCacheError()Z

    move-result v0

    return v0
.end method

.method public loadAllDataFromCache(Ljava/lang/Class;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheLoadingException;,
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 397
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/persistence/CacheManager;->loadAllDataFromCache(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 438
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/octo/android/robospice/SpiceService;->isBound:Z

    .line 439
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceService;->showNotificationIfNotBoundAndHasPendingRequestsOtherwiseHideNotification()V

    .line 440
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->mSpiceServiceBinder:Lcom/octo/android/robospice/SpiceService$SpiceServiceBinder;

    return-object v0
.end method

.method public onCreate()V
    .registers 11

    .prologue
    const/4 v9, 0x0

    .line 105
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 108
    :try_start_4
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getApplication()Landroid/app/Application;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/octo/android/robospice/SpiceService;->createCacheManager(Landroid/app/Application;)Lcom/octo/android/robospice/persistence/CacheManager;

    move-result-object v8

    iput-object v8, p0, Lcom/octo/android/robospice/SpiceService;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;
    :try_end_e
    .catch Lcom/octo/android/robospice/persistence/exception/CacheCreationException; {:try_start_4 .. :try_end_e} :catch_20

    .line 114
    iget-object v8, p0, Lcom/octo/android/robospice/SpiceService;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    if-nez v8, :cond_28

    .line 115
    new-instance v8, Lcom/octo/android/robospice/persistence/exception/CacheCreationException;

    const-string v9, "createCacheManager() can\'t create a null cacheManager"

    invoke-direct {v8, v9}, Lcom/octo/android/robospice/persistence/exception/CacheCreationException;-><init>(Ljava/lang/String;)V

    invoke-static {v8}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;)I

    .line 116
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->stopSelf()V

    .line 135
    :goto_1f
    return-void

    .line 109
    :catch_20
    move-exception v0

    .line 110
    .local v0, "e":Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
    invoke-static {v0}, Lroboguice/util/temp/Ln;->e(Ljava/lang/Throwable;)I

    .line 111
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->stopSelf()V

    goto :goto_1f

    .line 120
    .end local v0    # "e":Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
    :cond_28
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->createRequestRequestListenerNotifier()Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;

    move-result-object v3

    .line 121
    .local v3, "progressReporter":Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->createSpiceServiceListenerNotifier()Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;

    move-result-object v7

    .line 122
    .local v7, "spiceServiceListenerNotifier":Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->createRequestProcessorListener()Lcom/octo/android/robospice/request/RequestProcessorListener;

    move-result-object v4

    .line 123
    .local v4, "requestProcessorListener":Lcom/octo/android/robospice/request/RequestProcessorListener;
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    .line 124
    .local v1, "executorService":Ljava/util/concurrent/ExecutorService;
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->getNetworkStateChecker()Lcom/octo/android/robospice/networkstate/NetworkStateChecker;

    move-result-object v2

    .line 125
    .local v2, "networkStateChecker":Lcom/octo/android/robospice/networkstate/NetworkStateChecker;
    invoke-direct {p0, v4, v3, v7}, Lcom/octo/android/robospice/SpiceService;->createRequestProgressManager(Lcom/octo/android/robospice/request/RequestProcessorListener;Lcom/octo/android/robospice/request/notifier/RequestListenerNotifier;Lcom/octo/android/robospice/request/notifier/SpiceServiceListenerNotifier;)Lcom/octo/android/robospice/request/RequestProgressManager;

    move-result-object v5

    .line 126
    .local v5, "requestProgressManager":Lcom/octo/android/robospice/request/RequestProgressManager;
    invoke-direct {p0, v1, v2, v5}, Lcom/octo/android/robospice/SpiceService;->createRequestRunner(Ljava/util/concurrent/ExecutorService;Lcom/octo/android/robospice/networkstate/NetworkStateChecker;Lcom/octo/android/robospice/request/RequestProgressManager;)Lcom/octo/android/robospice/request/RequestRunner;

    move-result-object v6

    .line 128
    .local v6, "requestRunner":Lcom/octo/android/robospice/request/RequestRunner;
    iget-object v8, p0, Lcom/octo/android/robospice/SpiceService;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    invoke-virtual {p0, v8, v5, v6}, Lcom/octo/android/robospice/SpiceService;->createRequestProcessor(Lcom/octo/android/robospice/persistence/CacheManager;Lcom/octo/android/robospice/request/RequestProgressManager;Lcom/octo/android/robospice/request/RequestRunner;)Lcom/octo/android/robospice/request/RequestProcessor;

    move-result-object v8

    iput-object v8, p0, Lcom/octo/android/robospice/SpiceService;->requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;

    .line 129
    iget-object v8, p0, Lcom/octo/android/robospice/SpiceService;->requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;

    invoke-virtual {v8, v9}, Lcom/octo/android/robospice/request/RequestProcessor;->setFailOnCacheError(Z)V

    .line 131
    invoke-virtual {p0}, Lcom/octo/android/robospice/SpiceService;->createDefaultNotification()Landroid/app/Notification;

    move-result-object v8

    iput-object v8, p0, Lcom/octo/android/robospice/SpiceService;->notification:Landroid/app/Notification;

    .line 133
    const/4 v8, 0x1

    iput-boolean v8, p0, Lcom/octo/android/robospice/SpiceService;->isCreated:Z

    .line 134
    const-string v8, "SpiceService instance created."

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v8, v9}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_1f
.end method

.method public onDestroy()V
    .registers 3

    .prologue
    .line 302
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/RequestProcessor;->shouldStop()V

    .line 303
    const-string v0, "SpiceService instance destroyed."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    .line 304
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 305
    return-void
.end method

.method public onRebind(Landroid/content/Intent;)V
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 445
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/octo/android/robospice/SpiceService;->isBound:Z

    .line 446
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceService;->showNotificationIfNotBoundAndHasPendingRequestsOtherwiseHideNotification()V

    .line 447
    invoke-super {p0, p1}, Landroid/app/Service;->onRebind(Landroid/content/Intent;)V

    .line 448
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 153
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    .line 154
    const/4 v0, 0x2

    return v0
.end method

.method public onUnbind(Landroid/content/Intent;)Z
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 452
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/octo/android/robospice/SpiceService;->isBound:Z

    .line 453
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceService;->showNotificationIfNotBoundAndHasPendingRequestsOtherwiseHideNotification()V

    .line 454
    invoke-direct {p0}, Lcom/octo/android/robospice/SpiceService;->stopIfNotBoundAndHasNoPendingRequests()V

    .line 455
    const/4 v0, 0x1

    return v0
.end method

.method public putDataInCache(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .param p1, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "TT;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/octo/android/robospice/persistence/exception/CacheSavingException;,
            Lcom/octo/android/robospice/persistence/exception/CacheCreationException;
        }
    .end annotation

    .prologue
    .line 405
    .local p2, "data":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->cacheManager:Lcom/octo/android/robospice/persistence/CacheManager;

    invoke-virtual {v0, p2, p1}, Lcom/octo/android/robospice/persistence/CacheManager;->saveDataToCacheAndReturnData(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public removeAllDataFromCache()V
    .registers 2

    .prologue
    .line 417
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;

    invoke-virtual {v0}, Lcom/octo/android/robospice/request/RequestProcessor;->removeAllDataFromCache()V

    .line 418
    return-void
.end method

.method public removeAllDataFromCache(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 389
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/RequestProcessor;->removeAllDataFromCache(Ljava/lang/Class;)V

    .line 390
    return-void
.end method

.method public removeDataFromCache(Ljava/lang/Class;Ljava/lang/Object;)Z
    .registers 4
    .param p2, "cacheKey"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 385
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;

    invoke-virtual {v0, p1, p2}, Lcom/octo/android/robospice/request/RequestProcessor;->removeDataFromCache(Ljava/lang/Class;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V
    .registers 3
    .param p1, "spiceServiceListener"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener;

    .prologue
    .line 491
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/RequestProcessor;->removeSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V

    .line 492
    return-void
.end method

.method public setFailOnCacheError(Z)V
    .registers 3
    .param p1, "failOnCacheError"    # Z

    .prologue
    .line 425
    iget-object v0, p0, Lcom/octo/android/robospice/SpiceService;->requestProcessor:Lcom/octo/android/robospice/request/RequestProcessor;

    invoke-virtual {v0, p1}, Lcom/octo/android/robospice/request/RequestProcessor;->setFailOnCacheError(Z)V

    .line 426
    return-void
.end method
