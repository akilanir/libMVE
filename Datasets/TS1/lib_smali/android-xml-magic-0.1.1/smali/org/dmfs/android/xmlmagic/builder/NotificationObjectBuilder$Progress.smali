.class Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Progress"
.end annotation


# instance fields
.field indeterminante:Z

.field max:I

.field progress:I

.field visible:Z


# direct methods
.method private constructor <init>()V
    .registers 3

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x64

    iput v0, p0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->max:I

    iput v1, p0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->progress:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->visible:Z

    iput-boolean v1, p0, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;->indeterminante:Z

    return-void
.end method

.method synthetic constructor <init>(Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$1;)V
    .registers 2

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/NotificationObjectBuilder$Progress;-><init>()V

    return-void
.end method
