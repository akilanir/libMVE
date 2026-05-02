.class final enum Lorg/dmfs/rfc5545/recur/Freq$3;
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

    mul-int/lit8 v0, p4, 0x7

    invoke-virtual {p1, p2, p3, v0}, Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;->nextDay(JI)J

    move-result-wide v0

    return-wide v0
.end method
