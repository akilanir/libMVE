.class public Lorg/dmfs/provider/tasks/TaskProviderBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;


# static fields
.field private static final ACTION_NOTIFICATION_ALARM:Ljava/lang/String; = "org.dmfs.tasks.provider.NOTIFICATION_ALARM"

.field private static final REQUEST_CODE_ALARM:I = 0x539


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method static planNotificationUpdate(Landroid/content/Context;Lorg/dmfs/rfc5545/DateTime;)V
    .registers 13
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    const/4 v10, 0x0

    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Landroid/app/AlarmManager;

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lorg/dmfs/provider/tasks/TaskProviderBroadcastReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "org.dmfs.tasks.provider.NOTIFICATION_ALARM"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/16 v1, 0x539

    const/high16 v2, 0x8000000

    invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v0

    if-eqz v0, :cond_5e

    new-instance v0, Lorg/dmfs/rfc5545/DateTime;

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getYear()I

    move-result v2

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getMonth()I

    move-result v3

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getDayOfMonth()I

    move-result v4

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getHours()I

    move-result v5

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getMinutes()I

    move-result v6

    invoke-virtual {p1}, Lorg/dmfs/rfc5545/DateTime;->getSeconds()I

    move-result v7

    invoke-direct/range {v0 .. v7}, Lorg/dmfs/rfc5545/DateTime;-><init>(Ljava/util/TimeZone;IIIIII)V

    :goto_48
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x12

    if-le v1, v2, :cond_56

    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v0

    invoke-virtual {v8, v10, v0, v1, v9}, Landroid/app/AlarmManager;->setExact(IJLandroid/app/PendingIntent;)V

    :goto_55
    return-void

    :cond_56
    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v0

    invoke-virtual {v8, v10, v0, v1, v9}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    goto :goto_55

    :cond_5e
    move-object v0, p1

    goto :goto_48
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7

    const/4 v3, 0x0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    const/4 v0, -0x1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_36

    :cond_d
    :goto_d
    packed-switch v0, :pswitch_data_40

    :goto_10
    sget-object v0, Lorg/dmfs/provider/tasks/ContentOperation;->UPDATE_NOTIFICATION_ALARM:Lorg/dmfs/provider/tasks/ContentOperation;

    invoke-virtual {v0, p1, v3}, Lorg/dmfs/provider/tasks/ContentOperation;->fire(Landroid/content/Context;Landroid/content/ContentValues;)V

    return-void

    :sswitch_16
    const-string v2, "android.intent.action.TIMEZONE_CHANGED"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    const/4 v0, 0x0

    goto :goto_d

    :sswitch_20
    const-string v2, "org.dmfs.tasks.provider.NOTIFICATION_ALARM"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    const/4 v0, 0x1

    goto :goto_d

    :pswitch_2a
    sget-object v0, Lorg/dmfs/provider/tasks/ContentOperation;->UPDATE_TIMEZONE:Lorg/dmfs/provider/tasks/ContentOperation;

    invoke-virtual {v0, p1, v3}, Lorg/dmfs/provider/tasks/ContentOperation;->fire(Landroid/content/Context;Landroid/content/ContentValues;)V

    :pswitch_2f
    sget-object v0, Lorg/dmfs/provider/tasks/ContentOperation;->POST_NOTIFICATIONS:Lorg/dmfs/provider/tasks/ContentOperation;

    invoke-virtual {v0, p1, v3}, Lorg/dmfs/provider/tasks/ContentOperation;->fire(Landroid/content/Context;Landroid/content/ContentValues;)V

    goto :goto_10

    nop

    :sswitch_data_36
    .sparse-switch
        -0x48e463f4 -> :sswitch_20
        0x1df32313 -> :sswitch_16
    .end sparse-switch

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_2a
        :pswitch_2f
    .end packed-switch
.end method
