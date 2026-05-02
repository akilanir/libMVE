.class public final enum Lch/qos/logback/classic/db/names/ColumnName;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lch/qos/logback/classic/db/names/ColumnName;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum ARG0:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum ARG1:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum ARG2:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum ARG3:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum CALLER_CLASS:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum CALLER_FILENAME:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum CALLER_LINE:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum CALLER_METHOD:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum EVENT_ID:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum FORMATTED_MESSAGE:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum I:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum LEVEL_STRING:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum LOGGER_NAME:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum MAPPED_KEY:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum MAPPED_VALUE:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum REFERENCE_FLAG:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum THREAD_NAME:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum TIMESTMP:Lch/qos/logback/classic/db/names/ColumnName;

.field public static final enum TRACE_LINE:Lch/qos/logback/classic/db/names/ColumnName;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "EVENT_ID"

    invoke-direct {v0, v1, v3}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->EVENT_ID:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "TIMESTMP"

    invoke-direct {v0, v1, v4}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->TIMESTMP:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "FORMATTED_MESSAGE"

    invoke-direct {v0, v1, v5}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->FORMATTED_MESSAGE:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "LOGGER_NAME"

    invoke-direct {v0, v1, v6}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->LOGGER_NAME:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "LEVEL_STRING"

    invoke-direct {v0, v1, v7}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->LEVEL_STRING:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "THREAD_NAME"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->THREAD_NAME:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "REFERENCE_FLAG"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->REFERENCE_FLAG:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "ARG0"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->ARG0:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "ARG1"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->ARG1:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "ARG2"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->ARG2:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "ARG3"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->ARG3:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "CALLER_FILENAME"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_FILENAME:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "CALLER_CLASS"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_CLASS:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "CALLER_METHOD"

    const/16 v2, 0xd

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_METHOD:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "CALLER_LINE"

    const/16 v2, 0xe

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_LINE:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "MAPPED_KEY"

    const/16 v2, 0xf

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->MAPPED_KEY:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "MAPPED_VALUE"

    const/16 v2, 0x10

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->MAPPED_VALUE:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "I"

    const/16 v2, 0x11

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->I:Lch/qos/logback/classic/db/names/ColumnName;

    new-instance v0, Lch/qos/logback/classic/db/names/ColumnName;

    const-string v1, "TRACE_LINE"

    const/16 v2, 0x12

    invoke-direct {v0, v1, v2}, Lch/qos/logback/classic/db/names/ColumnName;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->TRACE_LINE:Lch/qos/logback/classic/db/names/ColumnName;

    const/16 v0, 0x13

    new-array v0, v0, [Lch/qos/logback/classic/db/names/ColumnName;

    sget-object v1, Lch/qos/logback/classic/db/names/ColumnName;->EVENT_ID:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v1, v0, v3

    sget-object v1, Lch/qos/logback/classic/db/names/ColumnName;->TIMESTMP:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v1, v0, v4

    sget-object v1, Lch/qos/logback/classic/db/names/ColumnName;->FORMATTED_MESSAGE:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v1, v0, v5

    sget-object v1, Lch/qos/logback/classic/db/names/ColumnName;->LOGGER_NAME:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v1, v0, v6

    sget-object v1, Lch/qos/logback/classic/db/names/ColumnName;->LEVEL_STRING:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->THREAD_NAME:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->REFERENCE_FLAG:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->ARG0:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->ARG1:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->ARG2:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->ARG3:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_FILENAME:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_CLASS:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v2, v0, v1

    const/16 v1, 0xd

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_METHOD:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v2, v0, v1

    const/16 v1, 0xe

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->CALLER_LINE:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v2, v0, v1

    const/16 v1, 0xf

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->MAPPED_KEY:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v2, v0, v1

    const/16 v1, 0x10

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->MAPPED_VALUE:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v2, v0, v1

    const/16 v1, 0x11

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->I:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v2, v0, v1

    const/16 v1, 0x12

    sget-object v2, Lch/qos/logback/classic/db/names/ColumnName;->TRACE_LINE:Lch/qos/logback/classic/db/names/ColumnName;

    aput-object v2, v0, v1

    sput-object v0, Lch/qos/logback/classic/db/names/ColumnName;->$VALUES:[Lch/qos/logback/classic/db/names/ColumnName;

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

.method public static valueOf(Ljava/lang/String;)Lch/qos/logback/classic/db/names/ColumnName;
    .registers 2

    const-class v0, Lch/qos/logback/classic/db/names/ColumnName;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lch/qos/logback/classic/db/names/ColumnName;

    return-object v0
.end method

.method public static values()[Lch/qos/logback/classic/db/names/ColumnName;
    .registers 1

    sget-object v0, Lch/qos/logback/classic/db/names/ColumnName;->$VALUES:[Lch/qos/logback/classic/db/names/ColumnName;

    invoke-virtual {v0}, [Lch/qos/logback/classic/db/names/ColumnName;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lch/qos/logback/classic/db/names/ColumnName;

    return-object v0
.end method
