.class public final Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;
.super Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<EntityType:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter",
        "<[",
        "Lorg/dmfs/rfc5545/DateTime;",
        "TEntityType;>;"
    }
.end annotation


# static fields
.field private static final SEPARATOR_PATTERN:Ljava/util/regex/Pattern;


# instance fields
.field private final mDateTimeListFieldName:Ljava/lang/String;

.field private final mTimeZoneFieldName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, ","

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;-><init>()V

    if-nez p1, :cond_d

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "datetimeListFieldName must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    iput-object p1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mDateTimeListFieldName:Ljava/lang/String;

    iput-object p2, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mTimeZoneFieldName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method fieldName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mDateTimeListFieldName:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getFrom(Landroid/content/ContentValues;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->getFrom(Landroid/content/ContentValues;)[Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getFrom(Landroid/database/Cursor;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->getFrom(Landroid/database/Cursor;)[Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getFrom(Landroid/database/Cursor;Landroid/content/ContentValues;)Ljava/lang/Object;
    .registers 4

    invoke-virtual {p0, p1, p2}, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->getFrom(Landroid/database/Cursor;Landroid/content/ContentValues;)[Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    return-object v0
.end method

.method public getFrom(Landroid/content/ContentValues;)[Lorg/dmfs/rfc5545/DateTime;
    .registers 10

    const/4 v3, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mDateTimeListFieldName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_b

    :goto_a
    return-object v0

    :cond_b
    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mTimeZoneFieldName:Ljava/lang/String;

    if-nez v1, :cond_39

    move-object v1, v0

    :goto_10
    if-nez v1, :cond_40

    :goto_12
    sget-object v1, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v4

    array-length v1, v4

    new-array v1, v1, [Lorg/dmfs/rfc5545/DateTime;

    array-length v5, v4

    move v2, v3

    :goto_1d
    if-ge v2, v5, :cond_60

    aget-object v6, v4, v2

    invoke-static {v0, v6}, Lorg/dmfs/rfc5545/DateTime;->parse(Ljava/util/TimeZone;Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v6

    invoke-virtual {v6}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v7

    if-nez v7, :cond_45

    invoke-virtual {v6}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v7

    if-eqz v7, :cond_45

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "DateTime values must not be floating, unless they are all-day."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_39
    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mTimeZoneFieldName:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_10

    :cond_40
    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    goto :goto_12

    :cond_45
    aput-object v6, v1, v2

    if-lez v2, :cond_5d

    aget-object v7, v1, v3

    invoke-virtual {v7}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v7

    invoke-virtual {v6}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v6

    if-eq v7, v6, :cond_5d

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "DateTime values must all be of the same type."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5d
    add-int/lit8 v2, v2, 0x1

    goto :goto_1d

    :cond_60
    move-object v0, v1

    goto :goto_a
.end method

.method public getFrom(Landroid/database/Cursor;)[Lorg/dmfs/rfc5545/DateTime;
    .registers 10

    const/4 v3, 0x0

    const/4 v0, 0x0

    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mDateTimeListFieldName:Ljava/lang/String;

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mTimeZoneFieldName:Ljava/lang/String;

    if-nez v1, :cond_1d

    const/4 v1, -0x1

    :goto_d
    if-ltz v2, :cond_15

    iget-object v4, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mTimeZoneFieldName:Ljava/lang/String;

    if-eqz v4, :cond_24

    if-gez v1, :cond_24

    :cond_15
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "At least one column is missing in cursor."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1d
    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mTimeZoneFieldName:Ljava/lang/String;

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    goto :goto_d

    :cond_24
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_2b

    :goto_2a
    return-object v0

    :cond_2b
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v4, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mTimeZoneFieldName:Ljava/lang/String;

    if-nez v4, :cond_5d

    move-object v1, v0

    :goto_34
    if-nez v1, :cond_62

    :goto_36
    sget-object v1, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v4

    array-length v1, v4

    new-array v1, v1, [Lorg/dmfs/rfc5545/DateTime;

    array-length v5, v4

    move v2, v3

    :goto_41
    if-ge v2, v5, :cond_82

    aget-object v6, v4, v2

    invoke-static {v0, v6}, Lorg/dmfs/rfc5545/DateTime;->parse(Ljava/util/TimeZone;Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v6

    invoke-virtual {v6}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v7

    if-nez v7, :cond_67

    invoke-virtual {v6}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v7

    if-eqz v7, :cond_67

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "DateTime values must not be floating, unless they are all-day."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5d
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_34

    :cond_62
    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    goto :goto_36

    :cond_67
    aput-object v6, v1, v2

    if-lez v2, :cond_7f

    aget-object v7, v1, v3

    invoke-virtual {v7}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v7

    invoke-virtual {v6}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v6

    if-eq v7, v6, :cond_7f

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "DateTime values must all be of the same type."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7f
    add-int/lit8 v2, v2, 0x1

    goto :goto_41

    :cond_82
    move-object v0, v1

    goto :goto_2a
.end method

.method public getFrom(Landroid/database/Cursor;Landroid/content/ContentValues;)[Lorg/dmfs/rfc5545/DateTime;
    .registers 11

    const/4 v3, 0x0

    const/4 v1, 0x0

    if-eqz p2, :cond_58

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mDateTimeListFieldName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_58

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mDateTimeListFieldName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    if-nez v0, :cond_15

    :cond_14
    :goto_14
    return-object v1

    :cond_15
    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mDateTimeListFieldName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1b
    iget-object v2, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mTimeZoneFieldName:Ljava/lang/String;

    if-eqz v2, :cond_af

    if-eqz p2, :cond_75

    iget-object v2, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mTimeZoneFieldName:Ljava/lang/String;

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_75

    iget-object v2, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mTimeZoneFieldName:Ljava/lang/String;

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_2f
    if-nez v2, :cond_8c

    :goto_31
    sget-object v2, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->SEPARATOR_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v4

    array-length v0, v4

    new-array v0, v0, [Lorg/dmfs/rfc5545/DateTime;

    array-length v5, v4

    move v2, v3

    :goto_3c
    if-ge v2, v5, :cond_ac

    aget-object v6, v4, v2

    invoke-static {v1, v6}, Lorg/dmfs/rfc5545/DateTime;->parse(Ljava/util/TimeZone;Ljava/lang/String;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v6

    invoke-virtual {v6}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v7

    if-nez v7, :cond_91

    invoke-virtual {v6}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v7

    if-eqz v7, :cond_91

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "DateTime values must not be floating, unless they are all-day."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_58
    if-eqz p1, :cond_6d

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mDateTimeListFieldName:Ljava/lang/String;

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_6d

    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v2

    if-nez v2, :cond_14

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1b

    :cond_6d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Missing date time list column."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_75
    if-eqz p1, :cond_84

    iget-object v2, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mTimeZoneFieldName:Ljava/lang/String;

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_84

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_2f

    :cond_84
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Missing timezone column."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_8c
    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    goto :goto_31

    :cond_91
    aput-object v6, v0, v2

    if-lez v2, :cond_a9

    aget-object v7, v0, v3

    invoke-virtual {v7}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v7

    invoke-virtual {v6}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v6

    if-eq v7, v6, :cond_a9

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "DateTime values must all be of the same type."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a9
    add-int/lit8 v2, v2, 0x1

    goto :goto_3c

    :cond_ac
    move-object v1, v0

    goto/16 :goto_14

    :cond_af
    move-object v2, v1

    goto/16 :goto_2f
.end method

.method public bridge synthetic setIn(Landroid/content/ContentValues;Ljava/lang/Object;)V
    .registers 3

    check-cast p2, [Lorg/dmfs/rfc5545/DateTime;

    invoke-virtual {p0, p1, p2}, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->setIn(Landroid/content/ContentValues;[Lorg/dmfs/rfc5545/DateTime;)V

    return-void
.end method

.method public setIn(Landroid/content/ContentValues;[Lorg/dmfs/rfc5545/DateTime;)V
    .registers 10

    const/4 v2, 0x0

    if-eqz p2, :cond_45

    array-length v0, p2

    if-lez v0, :cond_45

    :try_start_6
    new-instance v4, Ljava/lang/StringBuilder;

    array-length v0, p2

    mul-int/lit8 v0, v0, 0x11

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x1

    array-length v5, p2

    move v3, v2

    :goto_11
    if-ge v3, v5, :cond_3b

    aget-object v0, p2, v3

    if-eqz v1, :cond_25

    move v1, v2

    :goto_18
    invoke-virtual {v0}, Lorg/dmfs/rfc5545/DateTime;->isFloating()Z

    move-result v6

    if-eqz v6, :cond_34

    :goto_1e
    invoke-virtual {v0, v4}, Lorg/dmfs/rfc5545/DateTime;->writeTo(Ljava/lang/StringBuilder;)V

    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_11

    :cond_25
    const/16 v6, 0x2c

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_2a
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_2a} :catch_2b

    goto :goto_18

    :catch_2b
    move-exception v0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Can not serialize datetime list."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_34
    :try_start_34
    sget-object v6, Lorg/dmfs/rfc5545/DateTime;->UTC:Ljava/util/TimeZone;

    invoke-virtual {v0, v6}, Lorg/dmfs/rfc5545/DateTime;->shiftTimeZone(Ljava/util/TimeZone;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    goto :goto_1e

    :cond_3b
    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mDateTimeListFieldName:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_44
    .catch Ljava/io/IOException; {:try_start_34 .. :try_end_44} :catch_2b

    :goto_44
    return-void

    :cond_45
    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter;->mDateTimeListFieldName:Ljava/lang/String;

    const/4 v0, 0x0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {p1, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_44
.end method
