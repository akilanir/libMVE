.class public abstract Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;
.super Landroid/app/Service;
.source "SpiceServiceListenerNotificationService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;,
        Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    }
.end annotation


# static fields
.field public static final BUNDLE_KEY_FOREGROUND:Ljava/lang/String; = "BUNDLE_KEY_FOREGROUND"

.field public static final BUNDLE_KEY_NOTIFICATION_ID:Ljava/lang/String; = "BUNDLE_KEY_NOTIFICATION_ID"

.field public static final BUNDLE_KEY_REQUEST_CACHE_KEY:Ljava/lang/String; = "BUNDLE_KEY_REQUEST_CACHE_KEY"

.field public static final BUNDLE_KEY_REQUEST_CLASS:Ljava/lang/String; = "BUNDLE_KEY_REQUEST_CLASS"

.field public static final BUNDLE_KEY_SERVICE_CLASS:Ljava/lang/String; = "BUNDLE_KEY_SERVICE_CLASS"

.field public static final DEFAULT_ROBOSPICE_NOTIFICATION_ID:I = 0x2bc


# instance fields
.field private foreground:Z

.field private notificationId:I

.field private notificationManager:Landroid/app/NotificationManager;

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
    .line 24
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 33
    const/16 v0, 0x2bc

    iput v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->notificationId:I

    .line 134
    return-void
.end method

.method static synthetic access$000(Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;)Landroid/app/NotificationManager;
    .registers 2
    .param p0, "x0"    # Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->notificationManager:Landroid/app/NotificationManager;

    return-object v0
.end method

.method public static createIntent(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/Class;IZ)Landroid/content/Intent;
    .registers 7
    .param p0, "context"    # Landroid/content/Context;
    .param p3, "notificationId"    # I
    .param p4, "foreground"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;",
            ">;",
            "Ljava/lang/Class",
            "<+",
            "Lcom/octo/android/robospice/SpiceService;",
            ">;IZ)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .prologue
    .line 42
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;>;"
    .local p2, "spiceServiceClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/octo/android/robospice/SpiceService;>;"
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p0, p1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 43
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "BUNDLE_KEY_NOTIFICATION_ID"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 44
    const-string v1, "BUNDLE_KEY_SERVICE_CLASS"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 45
    const-string v1, "BUNDLE_KEY_FOREGROUND"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 46
    return-object v0
.end method


# virtual methods
.method public getSpiceServiceClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<+",
            "Lcom/octo/android/robospice/SpiceService;",
            ">;"
        }
    .end annotation

    .prologue
    .line 55
    iget-object v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->spiceServiceClass:Ljava/lang/Class;

    return-object v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 51
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

.method public abstract onCreateNotificationForRequestAdded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")",
            "Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;"
        }
    .end annotation
.end method

.method public abstract onCreateNotificationForRequestAggregated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")",
            "Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;"
        }
    .end annotation
.end method

.method public abstract onCreateNotificationForRequestCancelled(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")",
            "Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;"
        }
    .end annotation
.end method

.method public abstract onCreateNotificationForRequestFailed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")",
            "Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;"
        }
    .end annotation
.end method

.method public abstract onCreateNotificationForRequestNotFound(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")",
            "Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;"
        }
    .end annotation
.end method

.method public abstract onCreateNotificationForRequestProcessed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")",
            "Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;"
        }
    .end annotation
.end method

.method public abstract onCreateNotificationForRequestProgressUpdate(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")",
            "Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;"
        }
    .end annotation
.end method

.method public abstract onCreateNotificationForRequestSucceeded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")",
            "Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;"
        }
    .end annotation
.end method

.method public abstract onCreateNotificationForServiceStopped()Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
.end method

.method public final onDestroy()V
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    invoke-virtual {v0}, Lcom/octo/android/robospice/SpiceManager;->shouldStop()V

    .line 87
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 88
    return-void
.end method

.method public final onStart(Landroid/content/Intent;I)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "startId"    # I

    .prologue
    .line 61
    invoke-super {p0, p1, p2}, Landroid/app/Service;->onStart(Landroid/content/Intent;I)V

    .line 62
    if-nez p1, :cond_6

    .line 82
    :goto_5
    return-void

    .line 65
    :cond_6
    const-string v0, "BUNDLE_KEY_NOTIFICATION_ID"

    const/16 v1, 0x2bc

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->notificationId:I

    .line 66
    const-string v0, "BUNDLE_KEY_SERVICE_CLASS"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    iput-object v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->spiceServiceClass:Ljava/lang/Class;

    .line 68
    iget-object v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->spiceServiceClass:Ljava/lang/Class;

    if-nez v0, :cond_26

    .line 69
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Please specify a service class to monitor. Use #createIntent as helper."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_26
    const-string v0, "BUNDLE_KEY_FOREGROUND"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->foreground:Z

    .line 73
    new-instance v0, Lcom/octo/android/robospice/SpiceManager;

    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->spiceServiceClass:Ljava/lang/Class;

    invoke-direct {v0, v1}, Lcom/octo/android/robospice/SpiceManager;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    .line 74
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->notificationManager:Landroid/app/NotificationManager;

    .line 75
    iget-object v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    invoke-virtual {v0, p0}, Lcom/octo/android/robospice/SpiceManager;->start(Landroid/content/Context;)V

    .line 76
    iget-object v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->spiceManager:Lcom/octo/android/robospice/SpiceManager;

    new-instance v1, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;

    invoke-direct {v1, p0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;-><init>(Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;)V

    invoke-virtual {v0, v1}, Lcom/octo/android/robospice/SpiceManager;->addSpiceServiceListener(Lcom/octo/android/robospice/request/listener/SpiceServiceListener;)V

    .line 78
    iget-boolean v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->foreground:Z

    if-eqz v0, :cond_5e

    .line 79
    iget v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->notificationId:I

    invoke-virtual {p0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->onCreateForegroundNotification()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->startForeground(ILandroid/app/Notification;)V

    .line 81
    :cond_5e
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " started."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lroboguice/util/temp/Ln;->d(Ljava/lang/Object;[Ljava/lang/Object;)I

    goto :goto_5
.end method
