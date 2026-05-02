.class public Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;
.super Ljava/lang/Object;
.source "SpiceServiceListenerNotificationService.java"

# interfaces
.implements Lcom/octo/android/robospice/request/listener/SpiceServiceListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "NotificationSpiceServiceListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;


# direct methods
.method public constructor <init>(Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;)V
    .registers 2

    .prologue
    .line 134
    iput-object p1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequestAdded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 7
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 162
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    invoke-virtual {v1, p1, p2}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->onCreateNotificationForRequestAdded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;

    move-result-object v0

    .line 163
    .local v0, "notification":Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->access$000(Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;)Landroid/app/NotificationManager;

    move-result-object v1

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getId()I

    move-result v2

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getNotification()Landroid/app/Notification;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 164
    return-void
.end method

.method public onRequestAggregated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 7
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 168
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    invoke-virtual {v1, p1, p2}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->onCreateNotificationForRequestAdded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;

    move-result-object v0

    .line 169
    .local v0, "notification":Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->access$000(Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;)Landroid/app/NotificationManager;

    move-result-object v1

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getId()I

    move-result v2

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getNotification()Landroid/app/Notification;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 170
    return-void
.end method

.method public onRequestCancelled(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 7
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 150
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    invoke-virtual {v1, p1, p2}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->onCreateNotificationForRequestCancelled(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;

    move-result-object v0

    .line 151
    .local v0, "notification":Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->access$000(Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;)Landroid/app/NotificationManager;

    move-result-object v1

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getId()I

    move-result v2

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getNotification()Landroid/app/Notification;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 152
    return-void
.end method

.method public onRequestFailed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 7
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 144
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    invoke-virtual {v1, p1, p2}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->onCreateNotificationForRequestFailed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;

    move-result-object v0

    .line 145
    .local v0, "notification":Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->access$000(Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;)Landroid/app/NotificationManager;

    move-result-object v1

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getId()I

    move-result v2

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getNotification()Landroid/app/Notification;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 146
    return-void
.end method

.method public onRequestNotFound(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 7
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 174
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    invoke-virtual {v1, p1, p2}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->onCreateNotificationForRequestNotFound(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;

    move-result-object v0

    .line 175
    .local v0, "notification":Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->access$000(Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;)Landroid/app/NotificationManager;

    move-result-object v1

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getId()I

    move-result v2

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getNotification()Landroid/app/Notification;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 176
    return-void
.end method

.method public onRequestProcessed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 7
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 180
    .local p1, "cachedSpiceRequest":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    invoke-virtual {v1, p1, p2}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->onCreateNotificationForRequestProcessed(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;

    move-result-object v0

    .line 181
    .local v0, "notification":Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->access$000(Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;)Landroid/app/NotificationManager;

    move-result-object v1

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getId()I

    move-result v2

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getNotification()Landroid/app/Notification;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 182
    return-void
.end method

.method public onRequestProgressUpdated(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 7
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 156
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    invoke-virtual {v1, p1, p2}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->onCreateNotificationForRequestProgressUpdate(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;

    move-result-object v0

    .line 157
    .local v0, "notification":Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->access$000(Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;)Landroid/app/NotificationManager;

    move-result-object v1

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getId()I

    move-result v2

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getNotification()Landroid/app/Notification;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 158
    return-void
.end method

.method public onRequestSucceeded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)V
    .registers 7
    .param p2, "requestProcessingContext"    # Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/octo/android/robospice/request/CachedSpiceRequest",
            "<*>;",
            "Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 138
    .local p1, "request":Lcom/octo/android/robospice/request/CachedSpiceRequest;, "Lcom/octo/android/robospice/request/CachedSpiceRequest<*>;"
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    invoke-virtual {v1, p1, p2}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->onCreateNotificationForRequestSucceeded(Lcom/octo/android/robospice/request/CachedSpiceRequest;Lcom/octo/android/robospice/request/listener/SpiceServiceListener$RequestProcessingContext;)Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;

    move-result-object v0

    .line 139
    .local v0, "notification":Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->access$000(Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;)Landroid/app/NotificationManager;

    move-result-object v1

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getId()I

    move-result v2

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getNotification()Landroid/app/Notification;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 140
    return-void
.end method

.method public onServiceStopped()V
    .registers 5

    .prologue
    .line 186
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    invoke-virtual {v1}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->onCreateNotificationForServiceStopped()Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;

    move-result-object v0

    .line 187
    .local v0, "notification":Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    # getter for: Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->notificationManager:Landroid/app/NotificationManager;
    invoke-static {v1}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->access$000(Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;)Landroid/app/NotificationManager;

    move-result-object v1

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getId()I

    move-result v2

    invoke-virtual {v0}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->getNotification()Landroid/app/Notification;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 188
    iget-object v1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$NotificationSpiceServiceListener;->this$0:Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;

    invoke-virtual {v1}, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;->stopSelf()V

    .line 189
    return-void
.end method
