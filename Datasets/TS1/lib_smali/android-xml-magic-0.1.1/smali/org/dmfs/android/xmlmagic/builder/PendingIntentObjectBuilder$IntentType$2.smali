.class final enum Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType$2;
.super Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$IntentType;-><init>(Ljava/lang/String;ILorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$1;)V

    return-void
.end method


# virtual methods
.method public getPendingIntent(Landroid/content/Context;Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;)Landroid/app/PendingIntent;
    .registers 6

    iget v0, p2, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;->requestCode:I

    iget-object v1, p2, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;->intent:Landroid/content/Intent;

    iget v2, p2, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$PendingIntentDescriptor;->flags:I

    invoke-static {p1, v0, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    return-object v0
.end method
