.class Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "QueryParameter"
.end annotation


# instance fields
.field private key:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$1;)V
    .registers 2

    invoke-direct {p0}, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;->key:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    iput-object p1, p0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;->key:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;)Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;->value:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$202(Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    iput-object p1, p0, Lorg/dmfs/android/xmlmagic/builder/AndroidUriObjectBuilder$QueryParameter;->value:Ljava/lang/String;

    return-object p1
.end method
