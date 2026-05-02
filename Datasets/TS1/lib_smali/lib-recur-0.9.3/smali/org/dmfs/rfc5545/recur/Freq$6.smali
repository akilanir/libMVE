.class final enum Lorg/dmfs/rfc5545/recur/Freq$6;
.super Lorg/dmfs/rfc5545/recur/Freq;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/recur/Freq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/dmfs/rfc5545/recur/Freq;-><init>(Ljava/lang/String;ILorg/dmfs/rfc5545/recur/Freq$1;)V

    return-void
.end method


# virtual methods
.method next(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JI)J
    .registers 8

    invoke-static {p2, p3}, Lorg/dmfs/rfc5545/Instance;->minute(J)I

    move-result v0

    add-int/2addr v0, p4

    const/16 v1, 0x3b

    if-le v0, v1, :cond_13

    sget-object v1, Lorg/dmfs/rfc5545/recur/Freq$6;->HOURLY:Lorg/dmfs/rfc5545/recur/Freq;

    div-int/lit8 v2, v0, 0x3c

    invoke-virtual {v1, p1, p2, p3, v2}, Lorg/dmfs/rfc5545/recur/Freq;->next(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JI)J

    move-result-wide p2

    rem-int/lit8 v0, v0, 0x3c

    :cond_13
    invoke-static {p2, p3, v0}, Lorg/dmfs/rfc5545/Instance;->setMinute(JI)J

    move-result-wide v0

    return-wide v0
.end method
