.class public Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;
.super Ljava/lang/Object;
.source "SpiceServiceListenerNotificationService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SpiceNotification"
.end annotation


# instance fields
.field private id:I

.field private notification:Landroid/app/Notification;


# direct methods
.method public constructor <init>(ILandroid/app/Notification;)V
    .registers 3
    .param p1, "id"    # I
    .param p2, "notification"    # Landroid/app/Notification;

    .prologue
    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    iput p1, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->id:I

    .line 122
    iput-object p2, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->notification:Landroid/app/Notification;

    .line 123
    return-void
.end method


# virtual methods
.method public getId()I
    .registers 2

    .prologue
    .line 126
    iget v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->id:I

    return v0
.end method

.method public getNotification()Landroid/app/Notification;
    .registers 2

    .prologue
    .line 130
    iget-object v0, p0, Lcom/octo/android/robospice/notification/SpiceServiceListenerNotificationService$SpiceNotification;->notification:Landroid/app/Notification;

    return-object v0
.end method
