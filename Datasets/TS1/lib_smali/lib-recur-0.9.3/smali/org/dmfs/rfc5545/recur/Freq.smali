.class public abstract enum Lorg/dmfs/rfc5545/recur/Freq;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/dmfs/rfc5545/recur/Freq;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/dmfs/rfc5545/recur/Freq;

.field public static final enum DAILY:Lorg/dmfs/rfc5545/recur/Freq;

.field public static final enum HOURLY:Lorg/dmfs/rfc5545/recur/Freq;

.field public static final enum MINUTELY:Lorg/dmfs/rfc5545/recur/Freq;

.field public static final enum MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

.field public static final enum SECONDLY:Lorg/dmfs/rfc5545/recur/Freq;

.field public static final enum WEEKLY:Lorg/dmfs/rfc5545/recur/Freq;

.field public static final enum YEARLY:Lorg/dmfs/rfc5545/recur/Freq;


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lorg/dmfs/rfc5545/recur/Freq$1;

    const-string v1, "YEARLY"

    invoke-direct {v0, v1, v3}, Lorg/dmfs/rfc5545/recur/Freq$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    new-instance v0, Lorg/dmfs/rfc5545/recur/Freq$2;

    const-string v1, "MONTHLY"

    invoke-direct {v0, v1, v4}, Lorg/dmfs/rfc5545/recur/Freq$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    new-instance v0, Lorg/dmfs/rfc5545/recur/Freq$3;

    const-string v1, "WEEKLY"

    invoke-direct {v0, v1, v5}, Lorg/dmfs/rfc5545/recur/Freq$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/Freq;->WEEKLY:Lorg/dmfs/rfc5545/recur/Freq;

    new-instance v0, Lorg/dmfs/rfc5545/recur/Freq$4;

    const-string v1, "DAILY"

    invoke-direct {v0, v1, v6}, Lorg/dmfs/rfc5545/recur/Freq$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/Freq;->DAILY:Lorg/dmfs/rfc5545/recur/Freq;

    new-instance v0, Lorg/dmfs/rfc5545/recur/Freq$5;

    const-string v1, "HOURLY"

    invoke-direct {v0, v1, v7}, Lorg/dmfs/rfc5545/recur/Freq$5;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/Freq;->HOURLY:Lorg/dmfs/rfc5545/recur/Freq;

    new-instance v0, Lorg/dmfs/rfc5545/recur/Freq$6;

    const-string v1, "MINUTELY"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lorg/dmfs/rfc5545/recur/Freq$6;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/Freq;->MINUTELY:Lorg/dmfs/rfc5545/recur/Freq;

    new-instance v0, Lorg/dmfs/rfc5545/recur/Freq$7;

    const-string v1, "SECONDLY"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lorg/dmfs/rfc5545/recur/Freq$7;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/recur/Freq;->SECONDLY:Lorg/dmfs/rfc5545/recur/Freq;

    const/4 v0, 0x7

    new-array v0, v0, [Lorg/dmfs/rfc5545/recur/Freq;

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->YEARLY:Lorg/dmfs/rfc5545/recur/Freq;

    aput-object v1, v0, v3

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->MONTHLY:Lorg/dmfs/rfc5545/recur/Freq;

    aput-object v1, v0, v4

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->WEEKLY:Lorg/dmfs/rfc5545/recur/Freq;

    aput-object v1, v0, v5

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->DAILY:Lorg/dmfs/rfc5545/recur/Freq;

    aput-object v1, v0, v6

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq;->HOURLY:Lorg/dmfs/rfc5545/recur/Freq;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lorg/dmfs/rfc5545/recur/Freq;->MINUTELY:Lorg/dmfs/rfc5545/recur/Freq;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lorg/dmfs/rfc5545/recur/Freq;->SECONDLY:Lorg/dmfs/rfc5545/recur/Freq;

    aput-object v2, v0, v1

    sput-object v0, Lorg/dmfs/rfc5545/recur/Freq;->$VALUES:[Lorg/dmfs/rfc5545/recur/Freq;

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

.method synthetic constructor <init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/Freq$1;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lorg/dmfs/rfc5545/recur/Freq;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/dmfs/rfc5545/recur/Freq;
    .registers 2

    const-class v0, Lorg/dmfs/rfc5545/recur/Freq;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/recur/Freq;

    return-object v0
.end method

.method public static values()[Lorg/dmfs/rfc5545/recur/Freq;
    .registers 1

    sget-object v0, Lorg/dmfs/rfc5545/recur/Freq;->$VALUES:[Lorg/dmfs/rfc5545/recur/Freq;

    invoke-virtual {v0}, [Lorg/dmfs/rfc5545/recur/Freq;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/dmfs/rfc5545/recur/Freq;

    return-object v0
.end method


# virtual methods
.method abstract next(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JI)J
.end method

.method next(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JIJ)J
    .registers 12

    move-wide v0, p2

    :goto_1
    cmp-long v2, p2, p5

    if-gez v2, :cond_d

    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/dmfs/rfc5545/recur/Freq;->next(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JI)J

    move-result-wide v0

    move-wide v3, v0

    move-wide v0, p2

    move-wide p2, v3

    goto :goto_1

    :cond_d
    return-wide v0
.end method
