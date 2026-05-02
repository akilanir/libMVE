.class public Lorg/slf4j/impl/StaticMDCBinder;
.super Ljava/lang/Object;
.source "StaticMDCBinder.java"


# static fields
.field public static final SINGLETON:Lorg/slf4j/impl/StaticMDCBinder;

.field static class$org$slf4j$helpers$NOPMDCAdapter:Ljava/lang/Class;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    new-instance v0, Lorg/slf4j/impl/StaticMDCBinder;

    invoke-direct {v0}, Lorg/slf4j/impl/StaticMDCBinder;-><init>()V

    sput-object v0, Lorg/slf4j/impl/StaticMDCBinder;->SINGLETON:Lorg/slf4j/impl/StaticMDCBinder;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 56
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public getMDCA()Lorg/slf4j/spi/MDCAdapter;
    .registers 2

    .prologue
    .line 52
    new-instance v0, Lorg/slf4j/helpers/NOPMDCAdapter;

    invoke-direct {v0}, Lorg/slf4j/helpers/NOPMDCAdapter;-><init>()V

    return-object v0
.end method

.method public getMDCAdapterClassStr()Ljava/lang/String;
    .registers 2

    .prologue
    .line 56
    sget-object v0, Lorg/slf4j/impl/StaticMDCBinder;->class$org$slf4j$helpers$NOPMDCAdapter:Ljava/lang/Class;

    if-nez v0, :cond_11

    const-string v0, "org.slf4j.helpers.NOPMDCAdapter"

    invoke-static {v0}, Lorg/slf4j/impl/StaticMDCBinder;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/slf4j/impl/StaticMDCBinder;->class$org$slf4j$helpers$NOPMDCAdapter:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_11
    sget-object v0, Lorg/slf4j/impl/StaticMDCBinder;->class$org$slf4j$helpers$NOPMDCAdapter:Ljava/lang/Class;

    goto :goto_c
.end method
