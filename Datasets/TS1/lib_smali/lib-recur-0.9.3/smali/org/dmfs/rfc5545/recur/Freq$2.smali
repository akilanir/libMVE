.class final enum Lorg/dmfs/rfc5545/recur/Freq$2;
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
    .registers 7

    const/4 v0, 0x1

    if-ne p4, v0, :cond_8

    invoke-virtual {p1, p2, p3}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->nextMonth(J)J

    move-result-wide v0

    :goto_7
    return-wide v0

    :cond_8
    invoke-virtual {p1, p2, p3, p4}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->nextMonth(JI)J

    move-result-wide v0

    goto :goto_7
.end method
