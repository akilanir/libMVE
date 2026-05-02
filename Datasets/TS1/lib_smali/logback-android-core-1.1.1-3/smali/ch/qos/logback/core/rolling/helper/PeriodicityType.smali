.class public final enum Lch/qos/logback/core/rolling/helper/PeriodicityType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lch/qos/logback/core/rolling/helper/PeriodicityType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lch/qos/logback/core/rolling/helper/PeriodicityType;

.field public static final enum ERRONEOUS:Lch/qos/logback/core/rolling/helper/PeriodicityType;

.field public static final enum HALF_DAY:Lch/qos/logback/core/rolling/helper/PeriodicityType;

.field public static final enum TOP_OF_DAY:Lch/qos/logback/core/rolling/helper/PeriodicityType;

.field public static final enum TOP_OF_HOUR:Lch/qos/logback/core/rolling/helper/PeriodicityType;

.field public static final enum TOP_OF_MILLISECOND:Lch/qos/logback/core/rolling/helper/PeriodicityType;

.field public static final enum TOP_OF_MINUTE:Lch/qos/logback/core/rolling/helper/PeriodicityType;

.field public static final enum TOP_OF_MONTH:Lch/qos/logback/core/rolling/helper/PeriodicityType;

.field public static final enum TOP_OF_SECOND:Lch/qos/logback/core/rolling/helper/PeriodicityType;

.field public static final enum TOP_OF_WEEK:Lch/qos/logback/core/rolling/helper/PeriodicityType;

.field static VALID_ORDERED_LIST:[Lch/qos/logback/core/rolling/helper/PeriodicityType;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;

    const-string v1, "ERRONEOUS"

    invoke-direct {v0, v1, v3}, Lch/qos/logback/core/rolling/helper/PeriodicityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->ERRONEOUS:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    new-instance v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;

    const-string v1, "TOP_OF_MILLISECOND"

    invoke-direct {v0, v1, v4}, Lch/qos/logback/core/rolling/helper/PeriodicityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_MILLISECOND:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    new-instance v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;

    const-string v1, "TOP_OF_SECOND"

    invoke-direct {v0, v1, v5}, Lch/qos/logback/core/rolling/helper/PeriodicityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_SECOND:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    new-instance v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;

    const-string v1, "TOP_OF_MINUTE"

    invoke-direct {v0, v1, v6}, Lch/qos/logback/core/rolling/helper/PeriodicityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_MINUTE:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    new-instance v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;

    const-string v1, "TOP_OF_HOUR"

    invoke-direct {v0, v1, v7}, Lch/qos/logback/core/rolling/helper/PeriodicityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_HOUR:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    new-instance v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;

    const-string v1, "HALF_DAY"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/rolling/helper/PeriodicityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->HALF_DAY:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    new-instance v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;

    const-string v1, "TOP_OF_DAY"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/rolling/helper/PeriodicityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_DAY:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    new-instance v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;

    const-string v1, "TOP_OF_WEEK"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/rolling/helper/PeriodicityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_WEEK:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    new-instance v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;

    const-string v1, "TOP_OF_MONTH"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/rolling/helper/PeriodicityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_MONTH:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    const/16 v0, 0x9

    new-array v0, v0, [Lch/qos/logback/core/rolling/helper/PeriodicityType;

    sget-object v1, Lch/qos/logback/core/rolling/helper/PeriodicityType;->ERRONEOUS:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v1, v0, v3

    sget-object v1, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_MILLISECOND:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v1, v0, v4

    sget-object v1, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_SECOND:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v1, v0, v5

    sget-object v1, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_MINUTE:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v1, v0, v6

    sget-object v1, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_HOUR:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lch/qos/logback/core/rolling/helper/PeriodicityType;->HALF_DAY:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_DAY:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_WEEK:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_MONTH:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v2, v0, v1

    sput-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->$VALUES:[Lch/qos/logback/core/rolling/helper/PeriodicityType;

    const/4 v0, 0x7

    new-array v0, v0, [Lch/qos/logback/core/rolling/helper/PeriodicityType;

    sget-object v1, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_MILLISECOND:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v1, v0, v3

    sget-object v1, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_SECOND:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v1, v0, v4

    sget-object v1, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_MINUTE:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v1, v0, v5

    sget-object v1, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_HOUR:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v1, v0, v6

    sget-object v1, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_DAY:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_WEEK:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lch/qos/logback/core/rolling/helper/PeriodicityType;->TOP_OF_MONTH:Lch/qos/logback/core/rolling/helper/PeriodicityType;

    aput-object v2, v0, v1

    sput-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->VALID_ORDERED_LIST:[Lch/qos/logback/core/rolling/helper/PeriodicityType;

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

.method public static valueOf(Ljava/lang/String;)Lch/qos/logback/core/rolling/helper/PeriodicityType;
    .registers 2

    const-class v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;

    return-object v0
.end method

.method public static values()[Lch/qos/logback/core/rolling/helper/PeriodicityType;
    .registers 1

    sget-object v0, Lch/qos/logback/core/rolling/helper/PeriodicityType;->$VALUES:[Lch/qos/logback/core/rolling/helper/PeriodicityType;

    invoke-virtual {v0}, [Lch/qos/logback/core/rolling/helper/PeriodicityType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lch/qos/logback/core/rolling/helper/PeriodicityType;

    return-object v0
.end method
