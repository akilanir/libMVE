.class public final Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;
.super Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;
    }
.end annotation


# instance fields
.field private final mCount:I

.field private final mInstances:[J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/TimeZone;)V
    .registers 4

    sget-object v0, Lorg/dmfs/rfc5545/DateTime;->GREGORIAN_CALENDAR_SCALE:Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;

    invoke-direct {p0, v0, p1, p2}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;-><init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/lang/String;Ljava/util/TimeZone;)V

    return-void
.end method

.method public constructor <init>(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/lang/String;Ljava/util/TimeZone;)V
    .registers 12

    const/4 v0, 0x0

    invoke-direct {p0}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;-><init>()V

    if-eqz p2, :cond_c

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_12

    :cond_c
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mInstances:[J

    iput v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mCount:I

    :goto_11
    return-void

    :cond_12
    const-string v1, ","

    invoke-virtual {p2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v1, v2

    new-array v1, v1, [J

    iput-object v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mInstances:[J

    array-length v3, v2

    move v1, v0

    :goto_1f
    if-ge v0, v3, :cond_34

    aget-object v4, v2, v0

    invoke-static {p1, p3, v4}, Lorg/dmfs/rfc5545/DateTime;->parse(Lorg/dmfs/rfc5545/calendarmetrics/CalendarMetrics;Ljava/util/TimeZone;Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v4

    iget-object v5, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mInstances:[J

    invoke-virtual {v4}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v6

    aput-wide v6, v5, v1

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    :cond_34
    iput v1, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mCount:I

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mInstances:[J

    invoke-static {v0}, Ljava/util/Arrays;->sort([J)V

    goto :goto_11
.end method

.method public constructor <init>([J)V
    .registers 5

    const/4 v2, 0x0

    invoke-direct {p0}, Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter;-><init>()V

    array-length v0, p1

    new-array v0, v0, [J

    iput-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mInstances:[J

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mInstances:[J

    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v0, p1

    iput v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mCount:I

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mInstances:[J

    invoke-static {v0}, Ljava/util/Arrays;->sort([J)V

    return-void
.end method

.method static synthetic access$000(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;)I
    .registers 2

    iget v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mCount:I

    return v0
.end method

.method static synthetic access$100(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;)[J
    .registers 2

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mInstances:[J

    return-object v0
.end method


# virtual methods
.method bridge synthetic getIterator(Ljava/util/TimeZone;J)Lorg/dmfs/rfc5545/recurrenceset/AbstractRecurrenceAdapter$InstanceIterator;
    .registers 5

    invoke-virtual {p0, p1, p2, p3}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->getIterator(Ljava/util/TimeZone;J)Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;

    move-result-object v0

    return-object v0
.end method

.method getIterator(Ljava/util/TimeZone;J)Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;
    .registers 5

    new-instance v0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;

    invoke-direct {v0, p0, p2, p3}, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList$InstanceIterator;-><init>(Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;J)V

    return-object v0
.end method

.method getLastInstance(Ljava/util/TimeZone;J)J
    .registers 6

    iget-object v0, p0, Lorg/dmfs/rfc5545/recurrenceset/RecurrenceList;->mInstances:[J

    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-wide v0, v0, v1

    return-wide v0
.end method

.method isInfinite()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method
