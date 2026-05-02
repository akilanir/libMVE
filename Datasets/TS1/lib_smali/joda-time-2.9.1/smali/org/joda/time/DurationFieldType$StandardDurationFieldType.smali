.class Lorg/joda/time/DurationFieldType$StandardDurationFieldType;
.super Lorg/joda/time/DurationFieldType;
.source "DurationFieldType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/DurationFieldType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StandardDurationFieldType"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1c563f5ae6d3L


# instance fields
.field private final iOrdinal:B


# direct methods
.method constructor <init>(Ljava/lang/String;B)V
    .registers 3

    .prologue
    .line 259
    invoke-direct {p0, p1}, Lorg/joda/time/DurationFieldType;-><init>(Ljava/lang/String;)V

    .line 260
    iput-byte p2, p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->iOrdinal:B

    .line 261
    return-void
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 321
    iget-byte v0, p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->iOrdinal:B

    packed-switch v0, :pswitch_data_2a

    .line 348
    :goto_5
    return-object p0

    .line 323
    :pswitch_6
    sget-object p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->ERAS_TYPE:Lorg/joda/time/DurationFieldType;

    goto :goto_5

    .line 325
    :pswitch_9
    sget-object p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->CENTURIES_TYPE:Lorg/joda/time/DurationFieldType;

    goto :goto_5

    .line 327
    :pswitch_c
    sget-object p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->WEEKYEARS_TYPE:Lorg/joda/time/DurationFieldType;

    goto :goto_5

    .line 329
    :pswitch_f
    sget-object p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->YEARS_TYPE:Lorg/joda/time/DurationFieldType;

    goto :goto_5

    .line 331
    :pswitch_12
    sget-object p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->MONTHS_TYPE:Lorg/joda/time/DurationFieldType;

    goto :goto_5

    .line 333
    :pswitch_15
    sget-object p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->WEEKS_TYPE:Lorg/joda/time/DurationFieldType;

    goto :goto_5

    .line 335
    :pswitch_18
    sget-object p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->DAYS_TYPE:Lorg/joda/time/DurationFieldType;

    goto :goto_5

    .line 337
    :pswitch_1b
    sget-object p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->HALFDAYS_TYPE:Lorg/joda/time/DurationFieldType;

    goto :goto_5

    .line 339
    :pswitch_1e
    sget-object p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->HOURS_TYPE:Lorg/joda/time/DurationFieldType;

    goto :goto_5

    .line 341
    :pswitch_21
    sget-object p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->MINUTES_TYPE:Lorg/joda/time/DurationFieldType;

    goto :goto_5

    .line 343
    :pswitch_24
    sget-object p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->SECONDS_TYPE:Lorg/joda/time/DurationFieldType;

    goto :goto_5

    .line 345
    :pswitch_27
    sget-object p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->MILLIS_TYPE:Lorg/joda/time/DurationFieldType;

    goto :goto_5

    .line 321
    :pswitch_data_2a
    .packed-switch 0x1
        :pswitch_6
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_12
        :pswitch_15
        :pswitch_18
        :pswitch_1b
        :pswitch_1e
        :pswitch_21
        :pswitch_24
        :pswitch_27
    .end packed-switch
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 266
    if-ne p0, p1, :cond_5

    .line 272
    :cond_4
    :goto_4
    return v0

    .line 269
    :cond_5
    instance-of v2, p1, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;

    if-eqz v2, :cond_13

    .line 270
    iget-byte v2, p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->iOrdinal:B

    check-cast p1, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;

    iget-byte v3, p1, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->iOrdinal:B

    if-eq v2, v3, :cond_4

    move v0, v1

    goto :goto_4

    :cond_13
    move v0, v1

    .line 272
    goto :goto_4
.end method

.method public getField(Lorg/joda/time/Chronology;)Lorg/joda/time/DurationField;
    .registers 4

    .prologue
    .line 282
    invoke-static {p1}, Lorg/joda/time/DateTimeUtils;->getChronology(Lorg/joda/time/Chronology;)Lorg/joda/time/Chronology;

    move-result-object v0

    .line 284
    iget-byte v1, p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->iOrdinal:B

    packed-switch v1, :pswitch_data_4c

    .line 311
    new-instance v0, Ljava/lang/InternalError;

    invoke-direct {v0}, Ljava/lang/InternalError;-><init>()V

    throw v0

    .line 286
    :pswitch_f
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->eras()Lorg/joda/time/DurationField;

    move-result-object v0

    .line 308
    :goto_13
    return-object v0

    .line 288
    :pswitch_14
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->centuries()Lorg/joda/time/DurationField;

    move-result-object v0

    goto :goto_13

    .line 290
    :pswitch_19
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->weekyears()Lorg/joda/time/DurationField;

    move-result-object v0

    goto :goto_13

    .line 292
    :pswitch_1e
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->years()Lorg/joda/time/DurationField;

    move-result-object v0

    goto :goto_13

    .line 294
    :pswitch_23
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->months()Lorg/joda/time/DurationField;

    move-result-object v0

    goto :goto_13

    .line 296
    :pswitch_28
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->weeks()Lorg/joda/time/DurationField;

    move-result-object v0

    goto :goto_13

    .line 298
    :pswitch_2d
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->days()Lorg/joda/time/DurationField;

    move-result-object v0

    goto :goto_13

    .line 300
    :pswitch_32
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->halfdays()Lorg/joda/time/DurationField;

    move-result-object v0

    goto :goto_13

    .line 302
    :pswitch_37
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->hours()Lorg/joda/time/DurationField;

    move-result-object v0

    goto :goto_13

    .line 304
    :pswitch_3c
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->minutes()Lorg/joda/time/DurationField;

    move-result-object v0

    goto :goto_13

    .line 306
    :pswitch_41
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->seconds()Lorg/joda/time/DurationField;

    move-result-object v0

    goto :goto_13

    .line 308
    :pswitch_46
    invoke-virtual {v0}, Lorg/joda/time/Chronology;->millis()Lorg/joda/time/DurationField;

    move-result-object v0

    goto :goto_13

    .line 284
    nop

    :pswitch_data_4c
    .packed-switch 0x1
        :pswitch_f
        :pswitch_14
        :pswitch_19
        :pswitch_1e
        :pswitch_23
        :pswitch_28
        :pswitch_2d
        :pswitch_32
        :pswitch_37
        :pswitch_3c
        :pswitch_41
        :pswitch_46
    .end packed-switch
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 278
    const/4 v0, 0x1

    iget-byte v1, p0, Lorg/joda/time/DurationFieldType$StandardDurationFieldType;->iOrdinal:B

    shl-int/2addr v0, v1

    return v0
.end method
