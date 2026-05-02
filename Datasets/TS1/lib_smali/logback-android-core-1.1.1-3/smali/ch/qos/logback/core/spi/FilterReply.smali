.class public final enum Lch/qos/logback/core/spi/FilterReply;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lch/qos/logback/core/spi/FilterReply;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lch/qos/logback/core/spi/FilterReply;

.field public static final enum ACCEPT:Lch/qos/logback/core/spi/FilterReply;

.field public static final enum DENY:Lch/qos/logback/core/spi/FilterReply;

.field public static final enum NEUTRAL:Lch/qos/logback/core/spi/FilterReply;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lch/qos/logback/core/spi/FilterReply;

    const-string v1, "DENY"

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/spi/FilterReply;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/spi/FilterReply;->DENY:Lch/qos/logback/core/spi/FilterReply;

    new-instance v0, Lch/qos/logback/core/spi/FilterReply;

    const-string v1, "NEUTRAL"

    invoke-direct {v0, v1, v3}, Lch/qos/logback/core/spi/FilterReply;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    new-instance v0, Lch/qos/logback/core/spi/FilterReply;

    const-string v1, "ACCEPT"

    invoke-direct {v0, v1, v4}, Lch/qos/logback/core/spi/FilterReply;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/spi/FilterReply;->ACCEPT:Lch/qos/logback/core/spi/FilterReply;

    const/4 v0, 0x3

    new-array v0, v0, [Lch/qos/logback/core/spi/FilterReply;

    sget-object v1, Lch/qos/logback/core/spi/FilterReply;->DENY:Lch/qos/logback/core/spi/FilterReply;

    aput-object v1, v0, v2

    sget-object v1, Lch/qos/logback/core/spi/FilterReply;->NEUTRAL:Lch/qos/logback/core/spi/FilterReply;

    aput-object v1, v0, v3

    sget-object v1, Lch/qos/logback/core/spi/FilterReply;->ACCEPT:Lch/qos/logback/core/spi/FilterReply;

    aput-object v1, v0, v4

    sput-object v0, Lch/qos/logback/core/spi/FilterReply;->$VALUES:[Lch/qos/logback/core/spi/FilterReply;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lch/qos/logback/core/spi/FilterReply;
    .registers 2

    const-class v0, Lch/qos/logback/core/spi/FilterReply;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/spi/FilterReply;

    return-object v0
.end method

.method public static values()[Lch/qos/logback/core/spi/FilterReply;
    .registers 1

    sget-object v0, Lch/qos/logback/core/spi/FilterReply;->$VALUES:[Lch/qos/logback/core/spi/FilterReply;

    invoke-virtual {v0}, [Lch/qos/logback/core/spi/FilterReply;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lch/qos/logback/core/spi/FilterReply;

    return-object v0
.end method
