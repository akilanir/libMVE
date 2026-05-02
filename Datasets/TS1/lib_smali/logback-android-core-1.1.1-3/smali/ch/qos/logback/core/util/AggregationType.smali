.class public final enum Lch/qos/logback/core/util/AggregationType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lch/qos/logback/core/util/AggregationType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lch/qos/logback/core/util/AggregationType;

.field public static final enum AS_BASIC_PROPERTY:Lch/qos/logback/core/util/AggregationType;

.field public static final enum AS_BASIC_PROPERTY_COLLECTION:Lch/qos/logback/core/util/AggregationType;

.field public static final enum AS_COMPLEX_PROPERTY:Lch/qos/logback/core/util/AggregationType;

.field public static final enum AS_COMPLEX_PROPERTY_COLLECTION:Lch/qos/logback/core/util/AggregationType;

.field public static final enum NOT_FOUND:Lch/qos/logback/core/util/AggregationType;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lch/qos/logback/core/util/AggregationType;

    const-string v1, "NOT_FOUND"

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/util/AggregationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/util/AggregationType;->NOT_FOUND:Lch/qos/logback/core/util/AggregationType;

    new-instance v0, Lch/qos/logback/core/util/AggregationType;

    const-string v1, "AS_BASIC_PROPERTY"

    invoke-direct {v0, v1, v3}, Lch/qos/logback/core/util/AggregationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/util/AggregationType;->AS_BASIC_PROPERTY:Lch/qos/logback/core/util/AggregationType;

    new-instance v0, Lch/qos/logback/core/util/AggregationType;

    const-string v1, "AS_COMPLEX_PROPERTY"

    invoke-direct {v0, v1, v4}, Lch/qos/logback/core/util/AggregationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/util/AggregationType;->AS_COMPLEX_PROPERTY:Lch/qos/logback/core/util/AggregationType;

    new-instance v0, Lch/qos/logback/core/util/AggregationType;

    const-string v1, "AS_BASIC_PROPERTY_COLLECTION"

    invoke-direct {v0, v1, v5}, Lch/qos/logback/core/util/AggregationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/util/AggregationType;->AS_BASIC_PROPERTY_COLLECTION:Lch/qos/logback/core/util/AggregationType;

    new-instance v0, Lch/qos/logback/core/util/AggregationType;

    const-string v1, "AS_COMPLEX_PROPERTY_COLLECTION"

    invoke-direct {v0, v1, v6}, Lch/qos/logback/core/util/AggregationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/core/util/AggregationType;->AS_COMPLEX_PROPERTY_COLLECTION:Lch/qos/logback/core/util/AggregationType;

    const/4 v0, 0x5

    new-array v0, v0, [Lch/qos/logback/core/util/AggregationType;

    sget-object v1, Lch/qos/logback/core/util/AggregationType;->NOT_FOUND:Lch/qos/logback/core/util/AggregationType;

    aput-object v1, v0, v2

    sget-object v1, Lch/qos/logback/core/util/AggregationType;->AS_BASIC_PROPERTY:Lch/qos/logback/core/util/AggregationType;

    aput-object v1, v0, v3

    sget-object v1, Lch/qos/logback/core/util/AggregationType;->AS_COMPLEX_PROPERTY:Lch/qos/logback/core/util/AggregationType;

    aput-object v1, v0, v4

    sget-object v1, Lch/qos/logback/core/util/AggregationType;->AS_BASIC_PROPERTY_COLLECTION:Lch/qos/logback/core/util/AggregationType;

    aput-object v1, v0, v5

    sget-object v1, Lch/qos/logback/core/util/AggregationType;->AS_COMPLEX_PROPERTY_COLLECTION:Lch/qos/logback/core/util/AggregationType;

    aput-object v1, v0, v6

    sput-object v0, Lch/qos/logback/core/util/AggregationType;->$VALUES:[Lch/qos/logback/core/util/AggregationType;

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

.method public static valueOf(Ljava/lang/String;)Lch/qos/logback/core/util/AggregationType;
    .registers 2

    const-class v0, Lch/qos/logback/core/util/AggregationType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/util/AggregationType;

    return-object v0
.end method

.method public static values()[Lch/qos/logback/core/util/AggregationType;
    .registers 1

    sget-object v0, Lch/qos/logback/core/util/AggregationType;->$VALUES:[Lch/qos/logback/core/util/AggregationType;

    invoke-virtual {v0}, [Lch/qos/logback/core/util/AggregationType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lch/qos/logback/core/util/AggregationType;

    return-object v0
.end method
