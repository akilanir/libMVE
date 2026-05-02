.class public abstract Lcom/octo/android/robospice/notification/SpiceNotificationService;
.super Landroid/app/Service;
.source "SpiceNotificationService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/octo/android/robospice/notification/SpiceNotificationService$1;,
        Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;
    }
.end annotation


# static fields
.field public static final BUNDLE_KEY_FOREGROUND:Ljava/lang/String; = "BUNDLE_KEY_FOREGROUND"

.field public static final BUNDLE_KEY_NOTIFICATION_ID:Ljava/lang/String; = "BUNDLE_KEY_NOTIFICATION_ID"

.field public static final BUNDLE_KEY_REQUEST_CACHE_KEY:Ljava/lang/String; = "BUNDLE_KEY_REQUEST_CACHE_KEY"

.field public static final BUNDLE_KEY_REQUEST_CLASS:Ljava/lang/String; = "BUNDLE_KEY_REQUEST_CLASS"

.field public static final BUNDLE_KEY_SERVICE_CLASS:Ljava/lang/String; = "BUNDLE_KEY_SERVICE_CLASS"

.field private static final DEFAULT_ROBOSPICE_NOTIFICATION_ID:I = 0x46


# instance fields
.field private foreground:Z

.field private notificationId:I

.field private notificationManager:Landroid/app/NotificationManager;

.field private requestCacheKey:Ljava/lang/String;

.field private requestClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation
.end field

.field private spiceManager:Lcom/octo/android/robospice/SpiceManager;

.field private spiceServiceClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Lcom/octo/android/robospice/SpiceService;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 36
    const/16 v0, 0x46

    iput v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->notificationId:I

    .line 104
    return-void
.end method

.method static synthetic access$100(Lcom/octo/android/robospice/notification/SpiceNotificationService;)I
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/notification/SpiceNotificationService;

    .prologue
    .line 27
    iget v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->notificationId:I

    return v0
.end method

.method static synthetic access$200(Lcom/octo/android/robospice/notification/SpiceNotificationService;)Landroid/app/NotificationManager;
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/notification/SpiceNotificationService;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->notificationManager:Landroid/app/NotificationManager;

    return-object v0
.end method

.method public static createIntent(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/Class;ILjava/lang/Class;Ljava/lang/String;Z)Landroid/content/Intent;
    .registers 9
    .param p0, "context"    # Landroid/content/Context;
    .param p3, "notificationId"    # I
    .param p5, "cacheKey"    # Ljava/lang/String;
    .param p6, "foreground"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/octo/android/robospice/notification/SpiceNotificationService;",
            ">;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/octo/android/robospice/SpiceService;",
            ">;I",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            "Z)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .prologue
    .line 47
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/octo/android/robospice/notification/SpiceNotificationService;>;"
    .local p2, "spiceServiceClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/octo/android/robospice/SpiceService;>;"
    .local p4, "requestResultType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 48
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "BUNDLE_KEY_NOTIFICATION_ID"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 49
    const-string v1, "BUNDLE_KEY_SERVICE_CLASS"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 50
    const-string v1, "BUNDLE_KEY_REQUEST_CLASS"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 51
    const-string v1, "BUNDLE_KEY_REQUEST_CACHE_KEY"

    invoke-virtual {v0, v1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 52
    const-string v1, "BUNDLE_KEY_FOREGROUND"

    invoke-virtual {v0, v1, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 53
    return-object v0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 58
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreateForegroundNotification()Landroid/app/Notification;
    .registers 3

    .prologue
    .line 91
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "If you use foreground = true, then you must override onCreateForegroundNotification()."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public abstract onCreateNotificationForRequestFailure(Lcom/octo/android/robospice/persistence/exception/SpiceException;)Landroid/app/Notification;
.end method

.method public abstract onCreateNotificationForRequestProgress(Lcom/octo/android/robospice/request/listener/RequestProgress;)Landroid/app/Notification;
.end method

.method public abstract onCreateNotificationForRequestSuccess()Landroid/app/Notification;
.end method

.method public final onDestroy()V
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    invoke-virtual {v0}, Lcom/octo/android/robospice/SpiceManager;->shouldStop()V

    .line 87
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 88
    return-void
.end method

.method public final onStart(Landroid/content/Intent;I)V
    .registers 8
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "startId"    # I

    .prologue
    .line 64
    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    .line 65
    const-string v0, "BUNDLE_KEY_NOTIFICATION_ID"

    const/16 v1, 0x46

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->notificationId:I

    .line 66
    const-string v0, "BUNDLE_KEY_REQUEST_CLASS"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    iput-object v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->requestClass:Ljava/lang/Class;

    .line 67
    const-string v0, "BUNDLE_KEY_REQUEST_CACHE_KEY"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->requestCacheKey:Ljava/lang/String;

    .line 68
    const-string v0, "BUNDLE_KEY_SERVICE_CLASS"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    iput-object v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->spiceServiceClass:Ljava/lang/Class;

    .line 69
    iget-object v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->spiceServiceClass:Ljava/lang/Class;

    if-nez v0, :cond_35

    .line 70
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Please specify a service class to monitor. Use #createIntent as helper."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_35
    const-string v0, "BUNDLE_KEY_FOREGROUND"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->foreground:Z

    .line 74
    new-instance v0, Lcom/octo/android/robospice/SpiceManager;

    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->spiceServiceClass:Ljava/lang/Class;

    invoke-direct {v0, v1}, Lcom/octo/android/robospice/SpiceManager;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    .line 75
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->notificationManager:Landroid/app/NotificationManager;

    .line 76
    iget-object v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    invoke-virtual {v0, p0}, Lcom/octo/android/robospice/SpiceManager;->start(Landroid/content/Context;)V

    .line 77
    iget-object v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->requestClass:Ljava/lang/Class;

    iget-object v2, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->requestCacheKey:Ljava/lang/String;

    new-instance v3, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;-><init>(Lcom/octo/android/robospice/notification/SpiceNotificationService;Lcom/octo/android/robospice/notification/SpiceNotificationService$1;)V

    invoke-virtual {v0, v1, v2, v3}, Lcom/octo/android/robospice/SpiceManager;->addListenerIfPending(Ljava/lang/Class;Ljava/lang/Object;Lcom/octo/android/robospice/request/listener/RequestListener;)V

    .line 79
    iget-boolean v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->foreground:Z

    if-eqz v0, :cond_72

    .line 80
    iget v0, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService;->notificationId:I

    invoke-virtual {p0}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->onCreateForegroundNotification()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->startForeground(ILandroid/app/Notification;)V

    .line 82
    :cond_72
    return-void
.end method
