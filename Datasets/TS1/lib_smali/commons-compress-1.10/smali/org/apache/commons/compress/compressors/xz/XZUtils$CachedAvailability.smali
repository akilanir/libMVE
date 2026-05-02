.class final enum Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;
.super Ljava/lang/Enum;
.source "XZUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/compressors/xz/XZUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "CachedAvailability"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

.field public static final enum CACHED_AVAILABLE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

.field public static final enum CACHED_UNAVAILABLE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

.field public static final enum DONT_CACHE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 45
    new-instance v0, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    const-string v1, "DONT_CACHE"

    invoke-direct {v0, v1, v2}, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->DONT_CACHE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    new-instance v0, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    const-string v1, "CACHED_AVAILABLE"

    invoke-direct {v0, v1, v3}, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->CACHED_AVAILABLE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    new-instance v0, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    const-string v1, "CACHED_UNAVAILABLE"

    invoke-direct {v0, v1, v4}, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->CACHED_UNAVAILABLE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    .line 44
    const/4 v0, 0x3

    new-array v0, v0, [Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    sget-object v1, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->DONT_CACHE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    aput-object v1, v0, v2

    sget-object v1, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->CACHED_AVAILABLE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    aput-object v1, v0, v3

    sget-object v1, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->CACHED_UNAVAILABLE:Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    aput-object v1, v0, v4

    sput-object v0, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->$VALUES:[Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 44
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 44
    const-class v0, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    return-object v0
.end method

.method public static values()[Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;
    .registers 1

    .prologue
    .line 44
    sget-object v0, Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->$VALUES:[Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    invoke-virtual {v0}, [Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/commons/compress/compressors/xz/XZUtils$CachedAvailability;

    return-object v0
.end method
