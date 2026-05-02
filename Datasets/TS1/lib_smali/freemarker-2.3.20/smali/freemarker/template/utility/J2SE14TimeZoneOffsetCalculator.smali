.class Lfreemarker/template/utility/J2SE14TimeZoneOffsetCalculator;
.super Ljava/lang/Object;
.source "J2SE14TimeZoneOffsetCalculator.java"

# interfaces
.implements Lfreemarker/template/utility/DateUtil$TimeZoneOffsetCalculator;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getOffset(Ljava/util/TimeZone;Ljava/util/Date;)I
    .registers 5
    .param p1, "tz"    # Ljava/util/TimeZone;
    .param p2, "date"    # Ljava/util/Date;

    .prologue
    .line 64
    invoke-virtual {p2}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v0

    return v0
.end method
