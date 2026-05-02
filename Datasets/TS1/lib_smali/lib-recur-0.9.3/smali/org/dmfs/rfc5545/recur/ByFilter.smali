.class abstract Lorg/dmfs/rfc5545/recur/ByFilter;
.super Ljava/lang/Object;


# instance fields
.field final mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;


# direct methods
.method public constructor <init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/dmfs/rfc5545/recur/ByFilter;->mCalendarMetrics:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    return-void
.end method


# virtual methods
.method abstract filter(J)Z
.end method
