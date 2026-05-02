.class final enum Lorg/dmfs/rfc5545/recur/Freq$1;
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

    invoke-static {p2, p3}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v0

    add-int/2addr v0, p4

    invoke-static {p2, p3, v0}, Lorg/dmfs/rfc5545/Instance;->setYear(JI)J

    move-result-wide v0

    return-wide v0
.end method

.method next(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;JIJ)J
    .registers 9

    invoke-static {p5, p6}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v0

    invoke-static {p2, p3}, Lorg/dmfs/rfc5545/Instance;->year(J)I

    move-result v1

    if-gt v0, v1, :cond_b

    :goto_a
    return-wide p2

    :cond_b
    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    div-int/2addr v0, p4

    add-int/lit8 v0, v0, 0x1

    mul-int/2addr v0, p4

    add-int/2addr v0, v1

    invoke-static {p2, p3, v0}, Lorg/dmfs/rfc5545/Instance;->setYear(JI)J

    move-result-wide p2

    goto :goto_a
.end method
