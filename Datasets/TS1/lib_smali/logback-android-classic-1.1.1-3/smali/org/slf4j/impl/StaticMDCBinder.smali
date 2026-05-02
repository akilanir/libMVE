.class public Lorg/slf4j/impl/StaticMDCBinder;
.super Ljava/lang/Object;


# static fields
.field public static final SINGLETON:Lorg/slf4j/impl/StaticMDCBinder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lorg/slf4j/impl/StaticMDCBinder;

    invoke-direct {v0}, Lorg/slf4j/impl/StaticMDCBinder;-><init>()V

    sput-object v0, Lorg/slf4j/impl/StaticMDCBinder;->SINGLETON:Lorg/slf4j/impl/StaticMDCBinder;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getMDCA()Lorg/slf4j/spi/MDCAdapter;
    .registers 2

    new-instance v0, Lch/qos/logback/classic/util/LogbackMDCAdapter;

    invoke-direct {v0}, Lch/qos/logback/classic/util/LogbackMDCAdapter;-><init>()V

    return-object v0
.end method

.method public getMDCAdapterClassStr()Ljava/lang/String;
    .registers 2

    const-class v0, Lch/qos/logback/classic/util/LogbackMDCAdapter;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
