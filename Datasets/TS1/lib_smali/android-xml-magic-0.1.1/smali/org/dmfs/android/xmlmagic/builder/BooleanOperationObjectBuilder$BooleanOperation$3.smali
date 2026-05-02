.class final enum Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation$3;
.super Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation;-><init>(Ljava/lang/String;ILorg/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$1;)V

    return-void
.end method


# virtual methods
.method public calculate(ZZ)Z
    .registers 4

    if-eq p1, p2, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method
