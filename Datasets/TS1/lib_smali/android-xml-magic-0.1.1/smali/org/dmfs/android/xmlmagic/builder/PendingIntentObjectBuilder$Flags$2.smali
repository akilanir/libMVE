.class final enum Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags$2;
.super Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$Flags;-><init>(Ljava/lang/String;ILorg/dmfs/android/xmlmagic/builder/PendingIntentObjectBuilder$1;)V

    return-void
.end method


# virtual methods
.method public get()I
    .registers 2

    const/high16 v0, 0x40000000    # 2.0f

    return v0
.end method
