.class public final Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;
.super Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<EntityType:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter",
        "<",
        "Lorg/dmfs/rfc5545/DateTime;",
        "TEntityType;>;"
    }
.end annotation


# instance fields
.field private final mAllDayDefault:Z

.field private final mAllDayField:Ljava/lang/String;

.field private final mTimestampField:Ljava/lang/String;

.field private final mTzField:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Lorg/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter;-><init>()V

    if-nez p1, :cond_d

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "timestampField must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_d
    iput-object p1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTimestampField:Ljava/lang/String;

    iput-object p2, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTzField:Ljava/lang/String;

    iput-object p3, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayField:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayDefault:Z

    return-void
.end method


# virtual methods
.method fieldName()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTimestampField:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getFrom(Landroid/content/ContentValues;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->getFrom(Landroid/content/ContentValues;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getFrom(Landroid/database/Cursor;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1}, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->getFrom(Landroid/database/Cursor;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getFrom(Landroid/database/Cursor;Landroid/content/ContentValues;)Ljava/lang/Object;
    .registers 4

    invoke-virtual {p0, p1, p2}, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->getFrom(Landroid/database/Cursor;Landroid/content/ContentValues;)Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    return-object v0
.end method

.method public getFrom(Landroid/content/ContentValues;)Lorg/dmfs/rfc5545/DateTime;
    .registers 7

    const/4 v1, 0x0

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTimestampField:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    if-nez v3, :cond_a

    :goto_9
    return-object v1

    :cond_a
    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTzField:Ljava/lang/String;

    if-nez v0, :cond_34

    move-object v0, v1

    :goto_f
    new-instance v2, Lorg/dmfs/rfc5545/DateTime;

    if-nez v0, :cond_3b

    sget-object v0, Lorg/dmfs/rfc5545/DateTime;->UTC:Ljava/util/TimeZone;

    :goto_15
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-direct {v2, v0, v3, v4}, Lorg/dmfs/rfc5545/DateTime;-><init>(Ljava/util/TimeZone;J)V

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayField:Ljava/lang/String;

    if-nez v0, :cond_40

    :goto_20
    if-eqz v1, :cond_28

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_2e

    :cond_28
    if-nez v0, :cond_45

    iget-boolean v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayDefault:Z

    if-eqz v0, :cond_45

    :cond_2e
    invoke-virtual {v2}, Lorg/dmfs/rfc5545/DateTime;->toAllDay()Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    :goto_32
    move-object v1, v0

    goto :goto_9

    :cond_34
    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTzField:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_f

    :cond_3b
    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    goto :goto_15

    :cond_40
    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_20

    :cond_45
    move-object v0, v2

    goto :goto_32
.end method

.method public getFrom(Landroid/database/Cursor;)Lorg/dmfs/rfc5545/DateTime;
    .registers 8

    const/4 v1, -0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTimestampField:Ljava/lang/String;

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTzField:Ljava/lang/String;

    if-nez v0, :cond_28

    move v0, v1

    :goto_d
    iget-object v3, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayField:Ljava/lang/String;

    if-nez v3, :cond_2f

    move v3, v1

    :goto_12
    if-ltz v4, :cond_20

    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTzField:Ljava/lang/String;

    if-eqz v1, :cond_1a

    if-ltz v0, :cond_20

    :cond_1a
    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayField:Ljava/lang/String;

    if-eqz v1, :cond_37

    if-gez v3, :cond_37

    :cond_20
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "At least one column is missing in cursor."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_28
    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTzField:Ljava/lang/String;

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    goto :goto_d

    :cond_2f
    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayField:Ljava/lang/String;

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    move v3, v1

    goto :goto_12

    :cond_37
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_3e

    :goto_3d
    return-object v2

    :cond_3e
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTzField:Ljava/lang/String;

    if-nez v1, :cond_70

    move-object v0, v2

    :goto_4b
    new-instance v1, Lorg/dmfs/rfc5545/DateTime;

    if-nez v0, :cond_75

    sget-object v0, Lorg/dmfs/rfc5545/DateTime;->UTC:Ljava/util/TimeZone;

    :goto_51
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-direct {v1, v0, v4, v5}, Lorg/dmfs/rfc5545/DateTime;-><init>(Ljava/util/TimeZone;J)V

    if-gez v3, :cond_7a

    :goto_5a
    if-eqz v2, :cond_62

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_6a

    :cond_62
    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayField:Ljava/lang/String;

    if-nez v0, :cond_83

    iget-boolean v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayDefault:Z

    if-eqz v0, :cond_83

    :cond_6a
    invoke-virtual {v1}, Lorg/dmfs/rfc5545/DateTime;->toAllDay()Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    :goto_6e
    move-object v2, v0

    goto :goto_3d

    :cond_70
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_4b

    :cond_75
    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    goto :goto_51

    :cond_7a
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_5a

    :cond_83
    move-object v0, v1

    goto :goto_6e
.end method

.method public getFrom(Landroid/database/Cursor;Landroid/content/ContentValues;)Lorg/dmfs/rfc5545/DateTime;
    .registers 8

    const/4 v2, 0x0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    if-eqz p2, :cond_60

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTimestampField:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_60

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTimestampField:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    if-nez v0, :cond_19

    :cond_18
    :goto_18
    return-object v2

    :cond_19
    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTimestampField:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    :goto_23
    iget-object v4, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTzField:Ljava/lang/String;

    if-eqz v4, :cond_37

    if-eqz p2, :cond_7d

    iget-object v2, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTzField:Ljava/lang/String;

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7d

    iget-object v2, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTzField:Ljava/lang/String;

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_37
    :goto_37
    iget-object v4, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayField:Ljava/lang/String;

    if-eqz v4, :cond_4b

    if-eqz p2, :cond_94

    iget-object v3, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayField:Ljava/lang/String;

    invoke-virtual {p2, v3}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_94

    iget-object v3, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayField:Ljava/lang/String;

    invoke-virtual {p2, v3}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    :cond_4b
    :goto_4b
    new-instance v4, Lorg/dmfs/rfc5545/DateTime;

    if-nez v2, :cond_af

    sget-object v2, Lorg/dmfs/rfc5545/DateTime;->UTC:Ljava/util/TimeZone;

    :goto_51
    invoke-direct {v4, v2, v0, v1}, Lorg/dmfs/rfc5545/DateTime;-><init>(Ljava/util/TimeZone;J)V

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eqz v0, :cond_b4

    invoke-virtual {v4}, Lorg/dmfs/rfc5545/DateTime;->toAllDay()Lorg/dmfs/rfc5545/DateTime;

    move-result-object v0

    :goto_5e
    move-object v2, v0

    goto :goto_18

    :cond_60
    if-eqz p1, :cond_75

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTimestampField:Ljava/lang/String;

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_75

    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v1

    if-nez v1, :cond_18

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    goto :goto_23

    :cond_75
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Missing timestamp column."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_7d
    if-eqz p1, :cond_8c

    iget-object v2, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTzField:Ljava/lang/String;

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    if-ltz v2, :cond_8c

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_37

    :cond_8c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Missing timezone column."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_94
    if-eqz p1, :cond_a7

    iget-object v3, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayField:Ljava/lang/String;

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    if-ltz v3, :cond_a7

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_4b

    :cond_a7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Missing timezone column."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_af
    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v2

    goto :goto_51

    :cond_b4
    move-object v0, v4

    goto :goto_5e
.end method

.method public bridge synthetic setIn(Landroid/content/ContentValues;Ljava/lang/Object;)V
    .registers 3

    check-cast p2, Lorg/dmfs/rfc5545/DateTime;

    invoke-virtual {p0, p1, p2}, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->setIn(Landroid/content/ContentValues;Lorg/dmfs/rfc5545/DateTime;)V

    return-void
.end method

.method public setIn(Landroid/content/ContentValues;Lorg/dmfs/rfc5545/DateTime;)V
    .registers 7

    const/4 v0, 0x0

    if-eqz p2, :cond_3b

    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTimestampField:Ljava/lang/String;

    invoke-virtual {p2}, Lorg/dmfs/rfc5545/DateTime;->getTimestamp()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTzField:Ljava/lang/String;

    if-eqz v1, :cond_1f

    invoke-virtual {p2}, Lorg/dmfs/rfc5545/DateTime;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v1

    iget-object v2, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTzField:Ljava/lang/String;

    if-nez v1, :cond_34

    :goto_1c
    invoke-virtual {p1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1f
    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayField:Ljava/lang/String;

    if-eqz v0, :cond_33

    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mAllDayField:Ljava/lang/String;

    invoke-virtual {p2}, Lorg/dmfs/rfc5545/DateTime;->isAllDay()Z

    move-result v0

    if-eqz v0, :cond_39

    const/4 v0, 0x1

    :goto_2c
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :cond_33
    :goto_33
    return-void

    :cond_34
    invoke-virtual {v1}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v0

    goto :goto_1c

    :cond_39
    const/4 v0, 0x0

    goto :goto_2c

    :cond_3b
    iget-object v1, p0, Lorg/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter;->mTimestampField:Ljava/lang/String;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {p1, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_33
.end method
