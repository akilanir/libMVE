.class public final enum Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LeapYearPattern"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

.field public static final enum I:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

.field public static final enum II:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

.field public static final enum III:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

.field public static final enum IV:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    const-string v1, "I"

    invoke-direct {v0, v1, v2}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;->I:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    new-instance v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    const-string v1, "II"

    invoke-direct {v0, v1, v3}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;->II:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    new-instance v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    const-string v1, "III"

    invoke-direct {v0, v1, v4}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;->III:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    new-instance v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    const-string v1, "IV"

    invoke-direct {v0, v1, v5}, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;->IV:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    const/4 v0, 0x4

    new-array v0, v0, [Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    sget-object v1, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;->I:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    aput-object v1, v0, v2

    sget-object v1, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;->II:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    aput-object v1, v0, v3

    sget-object v1, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;->III:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    aput-object v1, v0, v4

    sget-object v1, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;->IV:Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    aput-object v1, v0, v5

    sput-object v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;->$VALUES:[Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

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

.method public static valueOf(Ljava/lang/String;)Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;
    .registers 2

    const-class v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    return-object v0
.end method

.method public static values()[Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;
    .registers 1

    sget-object v0, Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;->$VALUES:[Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    invoke-virtual {v0}, [Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/dmfs/rfc5545/calendarmetrics/IslamicCalendarMetrics$LeapYearPattern;

    return-object v0
.end method
