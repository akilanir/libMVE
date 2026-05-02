.class Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ValueHolder"
.end annotation


# instance fields
.field private key:Ljava/lang/String;

.field private value:Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$1;)V
    .registers 2

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$002(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    iput-object p1, p0, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->key:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;)Ljava/lang/Object;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$102(Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    iput-object p1, p0, Lorg/dmfs/android/xmlmagic/builder/BundleObjectBuilder$ValueHolder;->value:Ljava/lang/Object;

    return-object p1
.end method
