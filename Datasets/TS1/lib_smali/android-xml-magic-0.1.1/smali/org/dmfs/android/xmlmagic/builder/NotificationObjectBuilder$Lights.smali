.class Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Lights"
.end annotation


# instance fields
.field color:I

.field off:I

.field on:I


# direct methods
.method private constructor <init>()V
    .registers 3

    const/16 v1, 0x1f4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, -0xff0100

    iput v0, p0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;->color:I

    iput v1, p0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;->on:I

    iput v1, p0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;->off:I

    return-void
.end method

.method synthetic constructor <init>(Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;)V
    .registers 2

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Lights;-><init>()V

    return-void
.end method
