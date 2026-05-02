.class public final enum Lch/qos/logback/core/joran/spi/ConsoleTarget;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lch/qos/logback/core/joran/spi/ConsoleTarget;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lch/qos/logback/core/joran/spi/ConsoleTarget;

.field public static final enum SystemErr:Lch/qos/logback/core/joran/spi/ConsoleTarget;

.field public static final enum SystemOut:Lch/qos/logback/core/joran/spi/ConsoleTarget;


# instance fields
.field private final name:Ljava/lang/String;

.field private final stream:Ljava/io/OutputStream;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v0, Lch/qos/logback/core/joran/spi/ConsoleTarget;

    const-string v1, "SystemOut"

    const-string v2, "System.out"

    new-instance v3, Lch/qos/logback/core/joran/spi/ConsoleTarget$1;

    invoke-direct {v3}, Lch/qos/logback/core/joran/spi/ConsoleTarget$1;-><init>()V

    invoke-direct {v0, v1, v4, v2, v3}, Lch/qos/logback/core/joran/spi/ConsoleTarget;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/io/OutputStream;)V

    sput-object v0, Lch/qos/logback/core/joran/spi/ConsoleTarget;->SystemOut:Lch/qos/logback/core/joran/spi/ConsoleTarget;

    new-instance v0, Lch/qos/logback/core/joran/spi/ConsoleTarget;

    const-string v1, "SystemErr"

    const-string v2, "System.err"

    new-instance v3, Lch/qos/logback/core/joran/spi/ConsoleTarget$2;

    invoke-direct {v3}, Lch/qos/logback/core/joran/spi/ConsoleTarget$2;-><init>()V

    invoke-direct {v0, v1, v5, v2, v3}, Lch/qos/logback/core/joran/spi/ConsoleTarget;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/io/OutputStream;)V

    sput-object v0, Lch/qos/logback/core/joran/spi/ConsoleTarget;->SystemErr:Lch/qos/logback/core/joran/spi/ConsoleTarget;

    const/4 v0, 0x2

    new-array v0, v0, [Lch/qos/logback/core/joran/spi/ConsoleTarget;

    sget-object v1, Lch/qos/logback/core/joran/spi/ConsoleTarget;->SystemOut:Lch/qos/logback/core/joran/spi/ConsoleTarget;

    aput-object v1, v0, v4

    sget-object v1, Lch/qos/logback/core/joran/spi/ConsoleTarget;->SystemErr:Lch/qos/logback/core/joran/spi/ConsoleTarget;

    aput-object v1, v0, v5

    sput-object v0, Lch/qos/logback/core/joran/spi/ConsoleTarget;->$VALUES:[Lch/qos/logback/core/joran/spi/ConsoleTarget;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/io/OutputStream;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/io/OutputStream;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lch/qos/logback/core/joran/spi/ConsoleTarget;->name:Ljava/lang/String;

    iput-object p4, p0, Lch/qos/logback/core/joran/spi/ConsoleTarget;->stream:Ljava/io/OutputStream;

    return-void
.end method

.method public static findByName(Ljava/lang/String;)Lch/qos/logback/core/joran/spi/ConsoleTarget;
    .registers 6

    invoke-static {}, Lch/qos/logback/core/joran/spi/ConsoleTarget;->values()[Lch/qos/logback/core/joran/spi/ConsoleTarget;

    move-result-object v2

    array-length v3, v2

    const/4 v0, 0x0

    move v1, v0

    :goto_7
    if-ge v1, v3, :cond_18

    aget-object v0, v2, v1

    iget-object v4, v0, Lch/qos/logback/core/joran/spi/ConsoleTarget;->name:Ljava/lang/String;

    invoke-virtual {v4, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_14

    :goto_13
    return-object v0

    :cond_14
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_7

    :cond_18
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public static valueOf(Ljava/lang/String;)Lch/qos/logback/core/joran/spi/ConsoleTarget;
    .registers 2

    const-class v0, Lch/qos/logback/core/joran/spi/ConsoleTarget;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lch/qos/logback/core/joran/spi/ConsoleTarget;

    return-object v0
.end method

.method public static values()[Lch/qos/logback/core/joran/spi/ConsoleTarget;
    .registers 1

    sget-object v0, Lch/qos/logback/core/joran/spi/ConsoleTarget;->$VALUES:[Lch/qos/logback/core/joran/spi/ConsoleTarget;

    invoke-virtual {v0}, [Lch/qos/logback/core/joran/spi/ConsoleTarget;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lch/qos/logback/core/joran/spi/ConsoleTarget;

    return-object v0
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ConsoleTarget;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getStream()Ljava/io/OutputStream;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/joran/spi/ConsoleTarget;->stream:Ljava/io/OutputStream;

    return-object v0
.end method
