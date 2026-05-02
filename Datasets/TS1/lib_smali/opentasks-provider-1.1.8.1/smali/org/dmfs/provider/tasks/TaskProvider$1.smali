.class Lorg/dmfs/provider/tasks/TaskProvider$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/dmfs/provider/tasks/TaskProvider;->updateNotifications()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/dmfs/provider/tasks/TaskProvider;


# direct methods
.method constructor <init>(Lorg/dmfs/provider/tasks/TaskProvider;)V
    .registers 2

    iput-object p1, p0, Lorg/dmfs/provider/tasks/TaskProvider$1;->this$0:Lorg/dmfs/provider/tasks/TaskProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    sget-object v0, Lorg/dmfs/provider/tasks/ContentOperation;->UPDATE_NOTIFICATION_ALARM:Lorg/dmfs/provider/tasks/ContentOperation;

    iget-object v1, p0, Lorg/dmfs/provider/tasks/TaskProvider$1;->this$0:Lorg/dmfs/provider/tasks/TaskProvider;

    invoke-virtual {v1}, Lorg/dmfs/provider/tasks/TaskProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/dmfs/provider/tasks/ContentOperation;->fire(Landroid/content/Context;Landroid/content/ContentValues;)V

    return-void
.end method
