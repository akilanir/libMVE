.class public final enum Lzmq/Config;
.super Ljava/lang/Enum;
.source "Config.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lzmq/Config;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lzmq/Config;

.field public static final enum CLOCK_PRECISION:Lzmq/Config;

.field public static final enum COMMAND_PIPE_GRANULARITY:Lzmq/Config;

.field public static final enum INBOUND_POLL_RATE:Lzmq/Config;

.field public static final enum IN_BATCH_SIZE:Lzmq/Config;

.field public static final enum MAX_COMMAND_DELAY:Lzmq/Config;

.field public static final enum MAX_IO_EVENTS:Lzmq/Config;

.field public static final enum MAX_WM_DELTA:Lzmq/Config;

.field public static final enum MESSAGE_PIPE_GRANULARITY:Lzmq/Config;

.field public static final enum OUT_BATCH_SIZE:Lzmq/Config;

.field public static final enum PGM_MAX_TPDU:Lzmq/Config;

.field public static final enum SIGNALER_PORT:Lzmq/Config;


# instance fields
.field private final value:I


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 27
    new-instance v0, Lzmq/Config;

    const-string v1, "MESSAGE_PIPE_GRANULARITY"

    const/16 v2, 0x100

    invoke-direct {v0, v1, v4, v2}, Lzmq/Config;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lzmq/Config;->MESSAGE_PIPE_GRANULARITY:Lzmq/Config;

    .line 30
    new-instance v0, Lzmq/Config;

    const-string v1, "COMMAND_PIPE_GRANULARITY"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v5, v2}, Lzmq/Config;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lzmq/Config;->COMMAND_PIPE_GRANULARITY:Lzmq/Config;

    .line 38
    new-instance v0, Lzmq/Config;

    const-string v1, "INBOUND_POLL_RATE"

    const/16 v2, 0x64

    invoke-direct {v0, v1, v6, v2}, Lzmq/Config;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lzmq/Config;->INBOUND_POLL_RATE:Lzmq/Config;

    .line 44
    new-instance v0, Lzmq/Config;

    const-string v1, "IN_BATCH_SIZE"

    const/16 v2, 0x2000

    invoke-direct {v0, v1, v7, v2}, Lzmq/Config;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lzmq/Config;->IN_BATCH_SIZE:Lzmq/Config;

    .line 50
    new-instance v0, Lzmq/Config;

    const-string v1, "OUT_BATCH_SIZE"

    const/16 v2, 0x2000

    invoke-direct {v0, v1, v8, v2}, Lzmq/Config;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lzmq/Config;->OUT_BATCH_SIZE:Lzmq/Config;

    .line 53
    new-instance v0, Lzmq/Config;

    const-string v1, "MAX_WM_DELTA"

    const/4 v2, 0x5

    const/16 v3, 0x400

    invoke-direct {v0, v1, v2, v3}, Lzmq/Config;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lzmq/Config;->MAX_WM_DELTA:Lzmq/Config;

    .line 56
    new-instance v0, Lzmq/Config;

    const-string v1, "MAX_IO_EVENTS"

    const/4 v2, 0x6

    const/16 v3, 0x100

    invoke-direct {v0, v1, v2, v3}, Lzmq/Config;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lzmq/Config;->MAX_IO_EVENTS:Lzmq/Config;

    .line 62
    new-instance v0, Lzmq/Config;

    const-string v1, "MAX_COMMAND_DELAY"

    const/4 v2, 0x7

    const v3, 0x2dc6c0

    invoke-direct {v0, v1, v2, v3}, Lzmq/Config;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lzmq/Config;->MAX_COMMAND_DELAY:Lzmq/Config;

    .line 69
    new-instance v0, Lzmq/Config;

    const-string v1, "CLOCK_PRECISION"

    const/16 v2, 0x8

    const v3, 0xf4240

    invoke-direct {v0, v1, v2, v3}, Lzmq/Config;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lzmq/Config;->CLOCK_PRECISION:Lzmq/Config;

    .line 72
    new-instance v0, Lzmq/Config;

    const-string v1, "PGM_MAX_TPDU"

    const/16 v2, 0x9

    const/16 v3, 0x5dc

    invoke-direct {v0, v1, v2, v3}, Lzmq/Config;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lzmq/Config;->PGM_MAX_TPDU:Lzmq/Config;

    .line 76
    new-instance v0, Lzmq/Config;

    const-string v1, "SIGNALER_PORT"

    const/16 v2, 0xa

    const/16 v3, 0x1711

    invoke-direct {v0, v1, v2, v3}, Lzmq/Config;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lzmq/Config;->SIGNALER_PORT:Lzmq/Config;

    .line 22
    const/16 v0, 0xb

    new-array v0, v0, [Lzmq/Config;

    sget-object v1, Lzmq/Config;->MESSAGE_PIPE_GRANULARITY:Lzmq/Config;

    aput-object v1, v0, v4

    sget-object v1, Lzmq/Config;->COMMAND_PIPE_GRANULARITY:Lzmq/Config;

    aput-object v1, v0, v5

    sget-object v1, Lzmq/Config;->INBOUND_POLL_RATE:Lzmq/Config;

    aput-object v1, v0, v6

    sget-object v1, Lzmq/Config;->IN_BATCH_SIZE:Lzmq/Config;

    aput-object v1, v0, v7

    sget-object v1, Lzmq/Config;->OUT_BATCH_SIZE:Lzmq/Config;

    aput-object v1, v0, v8

    const/4 v1, 0x5

    sget-object v2, Lzmq/Config;->MAX_WM_DELTA:Lzmq/Config;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lzmq/Config;->MAX_IO_EVENTS:Lzmq/Config;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lzmq/Config;->MAX_COMMAND_DELAY:Lzmq/Config;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lzmq/Config;->CLOCK_PRECISION:Lzmq/Config;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lzmq/Config;->PGM_MAX_TPDU:Lzmq/Config;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lzmq/Config;->SIGNALER_PORT:Lzmq/Config;

    aput-object v2, v0, v1

    sput-object v0, Lzmq/Config;->$VALUES:[Lzmq/Config;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .param p3, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 81
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 82
    iput p3, p0, Lzmq/Config;->value:I

    .line 83
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lzmq/Config;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    const-class v0, Lzmq/Config;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lzmq/Config;

    return-object v0
.end method

.method public static values()[Lzmq/Config;
    .registers 1

    .prologue
    .line 22
    sget-object v0, Lzmq/Config;->$VALUES:[Lzmq/Config;

    invoke-virtual {v0}, [Lzmq/Config;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lzmq/Config;

    return-object v0
.end method


# virtual methods
.method public getValue()I
    .registers 2

    .prologue
    .line 87
    iget v0, p0, Lzmq/Config;->value:I

    return v0
.end method
