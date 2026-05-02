.class Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RemoteBinding"
.end annotation


# instance fields
.field descriptor:Lorg/dmfs/xmlobjects/ElementDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/dmfs/xmlobjects/ElementDescriptor",
            "<*>;"
        }
    .end annotation
.end field

.field methodName:Ljava/lang/String;

.field value:Ljava/lang/Object;

.field viewId:I


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$1;)V
    .registers 2

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/RemoteViewsObjectBuilder$RemoteBinding;-><init>()V

    return-void
.end method
