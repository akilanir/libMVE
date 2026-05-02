.class Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;
.super Ljava/lang/Object;
.source "SpiceNotificationService.java"

# interfaces
.implements Lcom/octo/android/robospice/request/listener/RequestListener;
.implements Lcom/octo/android/robospice/request/listener/RequestProgressListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/octo/android/robospice/notification/SpiceNotificationService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NotificationRequestListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/octo/android/robospice/request/listener/RequestListener",
        "<TT;>;",
        "Lcom/octo/android/robospice/request/listener/RequestProgressListener;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/notification/SpiceNotificationService;


# direct methods
.method private constructor <init>(Lcom/octo/android/robospice/notification/SpiceNotificationService;)V
    .registers 2

    .prologue
    .line 104
    .local p0, "this":Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;, "Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener<TT;>;"
    iput-object p1, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;->this$0:Lcom/octo/android/robospice/notification/SpiceNotificationService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/octo/android/robospice/notification/SpiceNotificationService;Lcom/octo/android/robospice/notification/SpiceNotificationService$1;)V
    .registers 3
    .param p1, "x0"    # Lcom/octo/android/robospice/notification/SpiceNotificationService;
    .param p2, "x1"    # Lcom/octo/android/robospice/notification/SpiceNotificationService$1;

    .prologue
    .line 104
    .local p0, "this":Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;, "Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener<TT;>;"
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;-><init>(Lcom/octo/android/robospice/notification/SpiceNotificationService;)V

    return-void
.end method


# virtual methods
.method public onRequestFailure(Lcom/octo/android/robospice/persistence/exception/SpiceException;)V
    .registers 5
    .param p1, "arg0"    # Lcom/octo/android/robospice/persistence/exception/SpiceException;

    .prologue
    .line 108
    .local p0, "this":Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;, "Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener<TT;>;"
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;->this$0:Lcom/octo/android/robospice/notification/SpiceNotificationService;

    invoke-virtual {v1, p1}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->onCreateNotificationForRequestFailure(Lcom/octo/android/robospice/persistence/exception/SpiceException;)Landroid/app/Notification;

    move-result-object v0

    .line 109
    .local v0, "notification":Landroid/app/Notification;
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;->this$0:Lcom/octo/android/robospice/notification/SpiceNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceNotificationService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->access$200(Lcom/octo/android/robospice/notification/SpiceNotificationService;)Landroid/app/NotificationManager;

    move-result-object v1

    iget-object v2, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;->this$0:Lcom/octo/android/robospice/notification/SpiceNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceNotificationService;->notificationId:I
    invoke-static {v2}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->access$100(Lcom/octo/android/robospice/notification/SpiceNotificationService;)I

    move-result v2

    invoke-virtual {v1, v2, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 110
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;->this$0:Lcom/octo/android/robospice/notification/SpiceNotificationService;

    invoke-virtual {v1}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->stopSelf()V

    .line 111
    return-void
.end method

.method public onRequestProgressUpdate(Lcom/octo/android/robospice/request/listener/RequestProgress;)V
    .registers 5
    .param p1, "progress"    # Lcom/octo/android/robospice/request/listener/RequestProgress;

    .prologue
    .line 122
    .local p0, "this":Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;, "Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener<TT;>;"
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;->this$0:Lcom/octo/android/robospice/notification/SpiceNotificationService;

    invoke-virtual {v1, p1}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->onCreateNotificationForRequestProgress(Lcom/octo/android/robospice/request/listener/RequestProgress;)Landroid/app/Notification;

    move-result-object v0

    .line 123
    .local v0, "notification":Landroid/app/Notification;
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;->this$0:Lcom/octo/android/robospice/notification/SpiceNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceNotificationService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->access$200(Lcom/octo/android/robospice/notification/SpiceNotificationService;)Landroid/app/NotificationManager;

    move-result-object v1

    iget-object v2, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;->this$0:Lcom/octo/android/robospice/notification/SpiceNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceNotificationService;->notificationId:I
    invoke-static {v2}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->access$100(Lcom/octo/android/robospice/notification/SpiceNotificationService;)I

    move-result v2

    invoke-virtual {v1, v2, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 125
    invoke-virtual {p1}, Lcom/octo/android/robospice/request/listener/RequestProgress;->getStatus()Lcom/octo/android/robospice/request/listener/RequestStatus;

    move-result-object v1

    sget-object v2, Lcom/octo/android/robospice/request/listener/RequestStatus;->COMPLETE:Lcom/octo/android/robospice/request/listener/RequestStatus;

    if-ne v1, v2, :cond_22

    .line 126
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;->this$0:Lcom/octo/android/robospice/notification/SpiceNotificationService;

    invoke-virtual {v1}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->stopSelf()V

    .line 128
    :cond_22
    return-void
.end method

.method public onRequestSuccess(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 115
    .local p0, "this":Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;, "Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener<TT;>;"
    .local p1, "result":Ljava/lang/Object;, "TT;"
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;->this$0:Lcom/octo/android/robospice/notification/SpiceNotificationService;

    invoke-virtual {v1}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->onCreateNotificationForRequestSuccess()Landroid/app/Notification;

    move-result-object v0

    .line 116
    .local v0, "notification":Landroid/app/Notification;
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;->this$0:Lcom/octo/android/robospice/notification/SpiceNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceNotificationService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->access$200(Lcom/octo/android/robospice/notification/SpiceNotificationService;)Landroid/app/NotificationManager;

    move-result-object v1

    iget-object v2, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;->this$0:Lcom/octo/android/robospice/notification/SpiceNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceNotificationService;->notificationId:I
    invoke-static {v2}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->access$100(Lcom/octo/android/robospice/notification/SpiceNotificationService;)I

    move-result v2

    invoke-virtual {v1, v2, v0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 117
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceNotificationService$NotificationRequestListener;->this$0:Lcom/octo/android/robospice/notification/SpiceNotificationService;

    invoke-virtual {v1}, Lcom/octo/android/robospice/notification/SpiceNotificationService;->stopSelf()V

    .line 118
    return-void
.end method
