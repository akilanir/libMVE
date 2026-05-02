.class Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Action"
.end annotation


# instance fields
.field icon:I

.field intent:Landroid/app/PendingIntent;

.field title:Ljava/lang/CharSequence;


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;)V
    .registers 2

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Action;-><init>()V

    return-void
.end method
