.class public abstract Lorg/joda/time/DateTimeZone;
.super Ljava/lang/Object;
.source "DateTimeZone.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/joda/time/DateTimeZone$LazyInit;,
        Lorg/joda/time/DateTimeZone$Stub;
    }
.end annotation


# static fields
.field private static final MAX_MILLIS:I = 0x5265bff

.field public static final UTC:Lorg/joda/time/DateTimeZone;

.field private static final cDefault:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/joda/time/DateTimeZone;",
            ">;"
        }
    .end annotation
.end field

.field private static final cNameProvider:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/joda/time/tz/NameProvider;",
            ">;"
        }
    .end annotation
.end field

.field private static final cProvider:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/joda/time/tz/Provider;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0x4cf893d49479892aL


# instance fields
.field private final iID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 108
    sget-object v0, Lorg/joda/time/UTCDateTimeZone;->INSTANCE:Lorg/joda/time/DateTimeZone;

    sput-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    .line 116
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v0, Lorg/joda/time/DateTimeZone;->cProvider:Ljava/util/concurrent/atomic/AtomicReference;

    .line 122
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v0, Lorg/joda/time/DateTimeZone;->cNameProvider:Ljava/util/concurrent/atomic/AtomicReference;

    .line 128
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v0, Lorg/joda/time/DateTimeZone;->cDefault:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .registers 4

    .prologue
    .line 669
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 670
    if-nez p1, :cond_d

    .line 671
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Id must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 673
    :cond_d
    iput-object p1, p0, Lorg/joda/time/DateTimeZone;->iID:Ljava/lang/String;

    .line 674
    return-void
.end method

.method private static fixedOffsetZone(Ljava/lang/String;I)Lorg/joda/time/DateTimeZone;
    .registers 4

    .prologue
    .line 386
    if-nez p1, :cond_5

    .line 387
    sget-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    .line 389
    :goto_4
    return-object v0

    :cond_5
    new-instance v0, Lorg/joda/time/tz/FixedDateTimeZone;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1, p1, p1}, Lorg/joda/time/tz/FixedDateTimeZone;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    goto :goto_4
.end method

.method public static forID(Ljava/lang/String;)Lorg/joda/time/DateTimeZone;
    .registers 6
    .annotation runtime Lorg/joda/convert/FromString;
    .end annotation

    .prologue
    .line 210
    if-nez p0, :cond_7

    .line 211
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getDefault()Lorg/joda/time/DateTimeZone;

    move-result-object v0

    .line 226
    :cond_6
    :goto_6
    return-object v0

    .line 213
    :cond_7
    const-string v0, "UTC"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 214
    sget-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    goto :goto_6

    .line 216
    :cond_12
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getProvider()Lorg/joda/time/tz/Provider;

    move-result-object v0

    invoke-interface {v0, p0}, Lorg/joda/time/tz/Provider;->getZone(Ljava/lang/String;)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    .line 217
    if-nez v0, :cond_6

    .line 220
    const-string v0, "+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2c

    const-string v0, "-"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_43

    .line 221
    :cond_2c
    invoke-static {p0}, Lorg/joda/time/DateTimeZone;->parseOffset(Ljava/lang/String;)I

    move-result v0

    .line 222
    int-to-long v1, v0

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_3a

    .line 223
    sget-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    goto :goto_6

    .line 225
    :cond_3a
    invoke-static {v0}, Lorg/joda/time/DateTimeZone;->printOffset(I)Ljava/lang/String;

    move-result-object v1

    .line 226
    invoke-static {v1, v0}, Lorg/joda/time/DateTimeZone;->fixedOffsetZone(Ljava/lang/String;I)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    goto :goto_6

    .line 229
    :cond_43
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "The datetime zone id \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' is not recognised"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static forOffsetHours(I)Lorg/joda/time/DateTimeZone;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 243
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/joda/time/DateTimeZone;->forOffsetHoursMinutes(II)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    return-object v0
.end method

.method public static forOffsetHoursMinutes(II)Lorg/joda/time/DateTimeZone;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .prologue
    .line 278
    if-nez p0, :cond_7

    if-nez p1, :cond_7

    .line 279
    sget-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    .line 302
    :goto_6
    return-object v0

    .line 281
    :cond_7
    const/16 v0, -0x17

    if-lt p0, v0, :cond_f

    const/16 v0, 0x17

    if-le p0, v0, :cond_28

    .line 282
    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Hours out of range: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 284
    :cond_28
    const/16 v0, -0x3b

    if-lt p1, v0, :cond_30

    const/16 v0, 0x3b

    if-le p1, v0, :cond_49

    .line 285
    :cond_30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Minutes out of range: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 287
    :cond_49
    if-lez p0, :cond_66

    if-gez p1, :cond_66

    .line 288
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Positive hours must not have negative minutes: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 292
    :cond_66
    mul-int/lit8 v0, p0, 0x3c

    .line 293
    if-gez v0, :cond_7b

    .line 294
    :try_start_6a
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    sub-int/2addr v0, v1

    .line 298
    :goto_6f
    const v1, 0xea60

    invoke-static {v0, v1}, Lorg/joda/time/field/FieldUtils;->safeMultiply(II)I
    :try_end_75
    .catch Ljava/lang/ArithmeticException; {:try_start_6a .. :try_end_75} :catch_7d

    move-result v0

    .line 302
    invoke-static {v0}, Lorg/joda/time/DateTimeZone;->forOffsetMillis(I)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    goto :goto_6

    .line 296
    :cond_7b
    add-int/2addr v0, p1

    goto :goto_6f

    .line 299
    :catch_7d
    move-exception v0

    .line 300
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Offset is too large"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static forOffsetMillis(I)Lorg/joda/time/DateTimeZone;
    .registers 4

    .prologue
    .line 312
    const v0, -0x5265bff

    if-lt p0, v0, :cond_a

    const v0, 0x5265bff

    if-le p0, v0, :cond_23

    .line 313
    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Millis out of range: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 315
    :cond_23
    invoke-static {p0}, Lorg/joda/time/DateTimeZone;->printOffset(I)Ljava/lang/String;

    move-result-object v0

    .line 316
    invoke-static {v0, p0}, Lorg/joda/time/DateTimeZone;->fixedOffsetZone(Ljava/lang/String;I)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    return-object v0
.end method

.method public static forTimeZone(Ljava/util/TimeZone;)Lorg/joda/time/DateTimeZone;
    .registers 6

    .prologue
    .line 335
    if-nez p0, :cond_7

    .line 336
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getDefault()Lorg/joda/time/DateTimeZone;

    move-result-object v0

    .line 370
    :cond_6
    :goto_6
    return-object v0

    .line 338
    :cond_7
    invoke-virtual {p0}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v1

    .line 339
    if-nez v1, :cond_15

    .line 340
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The TimeZone id must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 342
    :cond_15
    const-string v0, "UTC"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 343
    sget-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    goto :goto_6

    .line 347
    :cond_20
    const/4 v0, 0x0

    .line 348
    invoke-static {v1}, Lorg/joda/time/DateTimeZone;->getConvertedId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 349
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getProvider()Lorg/joda/time/tz/Provider;

    move-result-object v3

    .line 350
    if-eqz v2, :cond_2f

    .line 351
    invoke-interface {v3, v2}, Lorg/joda/time/tz/Provider;->getZone(Ljava/lang/String;)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    .line 353
    :cond_2f
    if-nez v0, :cond_35

    .line 354
    invoke-interface {v3, v1}, Lorg/joda/time/tz/Provider;->getZone(Ljava/lang/String;)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    .line 356
    :cond_35
    if-nez v0, :cond_6

    .line 361
    if-nez v2, :cond_65

    .line 363
    const-string v0, "GMT+"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_49

    const-string v0, "GMT-"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_65

    .line 364
    :cond_49
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 365
    invoke-static {v0}, Lorg/joda/time/DateTimeZone;->parseOffset(Ljava/lang/String;)I

    move-result v0

    .line 366
    int-to-long v1, v0

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_5c

    .line 367
    sget-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    goto :goto_6

    .line 369
    :cond_5c
    invoke-static {v0}, Lorg/joda/time/DateTimeZone;->printOffset(I)Ljava/lang/String;

    move-result-object v1

    .line 370
    invoke-static {v1, v0}, Lorg/joda/time/DateTimeZone;->fixedOffsetZone(Ljava/lang/String;I)Lorg/joda/time/DateTimeZone;

    move-result-object v0

    goto :goto_6

    .line 374
    :cond_65
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The datetime zone id \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\' is not recognised"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getAvailableIDs()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 398
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getProvider()Lorg/joda/time/tz/Provider;

    move-result-object v0

    invoke-interface {v0}, Lorg/joda/time/tz/Provider;->getAvailableIDs()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method private static getConvertedId(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .prologue
    .line 602
    sget-object v0, Lorg/joda/time/DateTimeZone$LazyInit;->CONVERSION_MAP:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public static getDefault()Lorg/joda/time/DateTimeZone;
    .registers 3

    .prologue
    .line 145
    sget-object v0, Lorg/joda/time/DateTimeZone;->cDefault:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/DateTimeZone;

    .line 146
    if-nez v0, :cond_35

    .line 149
    :try_start_a
    const-string v1, "user.timezone"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 150
    if-eqz v1, :cond_16

    .line 151
    invoke-static {v1}, Lorg/joda/time/DateTimeZone;->forID(Ljava/lang/String;)Lorg/joda/time/DateTimeZone;
    :try_end_15
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_15} :catch_38
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a .. :try_end_15} :catch_36

    move-result-object v0

    .line 156
    :cond_16
    :goto_16
    if-nez v0, :cond_20

    .line 157
    :try_start_18
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v1

    invoke-static {v1}, Lorg/joda/time/DateTimeZone;->forTimeZone(Ljava/util/TimeZone;)Lorg/joda/time/DateTimeZone;
    :try_end_1f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_18 .. :try_end_1f} :catch_36

    move-result-object v0

    .line 162
    :cond_20
    :goto_20
    if-nez v0, :cond_24

    .line 163
    sget-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    .line 165
    :cond_24
    sget-object v1, Lorg/joda/time/DateTimeZone;->cDefault:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_35

    .line 166
    sget-object v0, Lorg/joda/time/DateTimeZone;->cDefault:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/DateTimeZone;

    .line 169
    :cond_35
    return-object v0

    .line 159
    :catch_36
    move-exception v1

    goto :goto_20

    .line 153
    :catch_38
    move-exception v1

    goto :goto_16
.end method

.method private static getDefaultNameProvider()Lorg/joda/time/tz/NameProvider;
    .registers 3

    .prologue
    .line 573
    const/4 v1, 0x0

    .line 575
    :try_start_1
    const-string v0, "org.joda.time.DateTimeZone.NameProvider"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_6
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_6} :catch_22

    move-result-object v0

    .line 576
    if-eqz v0, :cond_25

    .line 578
    :try_start_9
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/tz/NameProvider;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_13} :catch_1b
    .catch Ljava/lang/SecurityException; {:try_start_9 .. :try_end_13} :catch_22

    .line 587
    :goto_13
    if-nez v0, :cond_1a

    .line 588
    new-instance v0, Lorg/joda/time/tz/DefaultNameProvider;

    invoke-direct {v0}, Lorg/joda/time/tz/DefaultNameProvider;-><init>()V

    .line 591
    :cond_1a
    return-object v0

    .line 579
    :catch_1b
    move-exception v0

    .line 580
    :try_start_1c
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
    :try_end_22
    .catch Ljava/lang/SecurityException; {:try_start_1c .. :try_end_22} :catch_22

    .line 583
    :catch_22
    move-exception v0

    move-object v0, v1

    goto :goto_13

    :cond_25
    move-object v0, v1

    goto :goto_13
.end method

.method private static getDefaultProvider()Lorg/joda/time/tz/Provider;
    .registers 3

    .prologue
    .line 486
    :try_start_0
    const-string v0, "org.joda.time.DateTimeZone.Provider"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_5} :catch_1e

    move-result-object v0

    .line 487
    if-eqz v0, :cond_1f

    .line 489
    :try_start_8
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/tz/Provider;

    .line 490
    invoke-static {v0}, Lorg/joda/time/DateTimeZone;->validateProvider(Lorg/joda/time/tz/Provider;)Lorg/joda/time/tz/Provider;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_15} :catch_17
    .catch Ljava/lang/SecurityException; {:try_start_8 .. :try_end_15} :catch_1e

    move-result-object v0

    .line 520
    :goto_16
    return-object v0

    .line 491
    :catch_17
    move-exception v0

    .line 492
    :try_start_18
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_1e
    .catch Ljava/lang/SecurityException; {:try_start_18 .. :try_end_1e} :catch_1e

    .line 495
    :catch_1e
    move-exception v0

    .line 500
    :cond_1f
    :try_start_1f
    const-string v0, "org.joda.time.DateTimeZone.Folder"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
    :try_end_24
    .catch Ljava/lang/SecurityException; {:try_start_1f .. :try_end_24} :catch_3d

    move-result-object v0

    .line 501
    if-eqz v0, :cond_3e

    .line 503
    :try_start_27
    new-instance v1, Lorg/joda/time/tz/ZoneInfoProvider;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Lorg/joda/time/tz/ZoneInfoProvider;-><init>(Ljava/io/File;)V

    .line 504
    invoke-static {v1}, Lorg/joda/time/DateTimeZone;->validateProvider(Lorg/joda/time/tz/Provider;)Lorg/joda/time/tz/Provider;
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_34} :catch_36
    .catch Ljava/lang/SecurityException; {:try_start_27 .. :try_end_34} :catch_3d

    move-result-object v0

    goto :goto_16

    .line 505
    :catch_36
    move-exception v0

    .line 506
    :try_start_37
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_3d
    .catch Ljava/lang/SecurityException; {:try_start_37 .. :try_end_3d} :catch_3d

    .line 509
    :catch_3d
    move-exception v0

    .line 514
    :cond_3e
    :try_start_3e
    new-instance v0, Lorg/joda/time/tz/ZoneInfoProvider;

    const-string v1, "org/joda/time/tz/data"

    invoke-direct {v0, v1}, Lorg/joda/time/tz/ZoneInfoProvider;-><init>(Ljava/lang/String;)V

    .line 515
    invoke-static {v0}, Lorg/joda/time/DateTimeZone;->validateProvider(Lorg/joda/time/tz/Provider;)Lorg/joda/time/tz/Provider;
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_48} :catch_4a

    move-result-object v0

    goto :goto_16

    .line 516
    :catch_4a
    move-exception v0

    .line 517
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 520
    new-instance v0, Lorg/joda/time/tz/UTCProvider;

    invoke-direct {v0}, Lorg/joda/time/tz/UTCProvider;-><init>()V

    goto :goto_16
.end method

.method public static getNameProvider()Lorg/joda/time/tz/NameProvider;
    .registers 3

    .prologue
    .line 533
    sget-object v0, Lorg/joda/time/DateTimeZone;->cNameProvider:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/tz/NameProvider;

    .line 534
    if-nez v0, :cond_1f

    .line 535
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getDefaultNameProvider()Lorg/joda/time/tz/NameProvider;

    move-result-object v0

    .line 536
    sget-object v1, Lorg/joda/time/DateTimeZone;->cNameProvider:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1f

    .line 537
    sget-object v0, Lorg/joda/time/DateTimeZone;->cNameProvider:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/tz/NameProvider;

    .line 540
    :cond_1f
    return-object v0
.end method

.method public static getProvider()Lorg/joda/time/tz/Provider;
    .registers 3

    .prologue
    .line 411
    sget-object v0, Lorg/joda/time/DateTimeZone;->cProvider:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/tz/Provider;

    .line 412
    if-nez v0, :cond_1f

    .line 413
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getDefaultProvider()Lorg/joda/time/tz/Provider;

    move-result-object v0

    .line 414
    sget-object v1, Lorg/joda/time/DateTimeZone;->cProvider:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1f

    .line 415
    sget-object v0, Lorg/joda/time/DateTimeZone;->cProvider:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/joda/time/tz/Provider;

    .line 418
    :cond_1f
    return-object v0
.end method

.method private static parseOffset(Ljava/lang/String;)I
    .registers 3

    .prologue
    .line 612
    sget-object v0, Lorg/joda/time/DateTimeZone$LazyInit;->OFFSET_FORMATTER:Lorg/joda/time/format/DateTimeFormatter;

    invoke-virtual {v0, p0}, Lorg/joda/time/format/DateTimeFormatter;->parseMillis(Ljava/lang/String;)J

    move-result-wide v0

    long-to-int v0, v0

    neg-int v0, v0

    return v0
.end method

.method private static printOffset(I)Ljava/lang/String;
    .registers 7

    .prologue
    const v2, 0x36ee80

    const v5, 0xea60

    const/16 v4, 0x3a

    const/4 v3, 0x2

    .line 625
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 626
    if-ltz p0, :cond_2e

    .line 627
    const/16 v1, 0x2b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 633
    :goto_15
    div-int v1, p0, v2

    .line 634
    invoke-static {v0, v1, v3}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/StringBuffer;II)V

    .line 635
    mul-int/2addr v1, v2

    sub-int v1, p0, v1

    .line 637
    div-int v2, v1, v5

    .line 638
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 639
    invoke-static {v0, v2, v3}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/StringBuffer;II)V

    .line 640
    mul-int/2addr v2, v5

    sub-int/2addr v1, v2

    .line 641
    if-nez v1, :cond_35

    .line 642
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 655
    :goto_2d
    return-object v0

    .line 629
    :cond_2e
    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 630
    neg-int p0, p0

    goto :goto_15

    .line 645
    :cond_35
    div-int/lit16 v2, v1, 0x3e8

    .line 646
    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 647
    invoke-static {v0, v2, v3}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/StringBuffer;II)V

    .line 648
    mul-int/lit16 v2, v2, 0x3e8

    sub-int/2addr v1, v2

    .line 649
    if-nez v1, :cond_47

    .line 650
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2d

    .line 653
    :cond_47
    const/16 v2, 0x2e

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 654
    const/4 v2, 0x3

    invoke-static {v0, v1, v2}, Lorg/joda/time/format/FormatUtils;->appendPaddedInteger(Ljava/lang/StringBuffer;II)V

    .line 655
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2d
.end method

.method public static setDefault(Lorg/joda/time/DateTimeZone;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 182
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    .line 183
    if-eqz v0, :cond_10

    .line 184
    new-instance v1, Lorg/joda/time/JodaTimePermission;

    const-string v2, "DateTimeZone.setDefault"

    invoke-direct {v1, v2}, Lorg/joda/time/JodaTimePermission;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/SecurityManager;->checkPermission(Ljava/security/Permission;)V

    .line 186
    :cond_10
    if-nez p0, :cond_1a

    .line 187
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The datetime zone must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 189
    :cond_1a
    sget-object v0, Lorg/joda/time/DateTimeZone;->cDefault:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 190
    return-void
.end method

.method public static setNameProvider(Lorg/joda/time/tz/NameProvider;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 554
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    .line 555
    if-eqz v0, :cond_10

    .line 556
    new-instance v1, Lorg/joda/time/JodaTimePermission;

    const-string v2, "DateTimeZone.setNameProvider"

    invoke-direct {v1, v2}, Lorg/joda/time/JodaTimePermission;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/SecurityManager;->checkPermission(Ljava/security/Permission;)V

    .line 558
    :cond_10
    if-nez p0, :cond_16

    .line 559
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getDefaultNameProvider()Lorg/joda/time/tz/NameProvider;

    move-result-object p0

    .line 561
    :cond_16
    sget-object v0, Lorg/joda/time/DateTimeZone;->cNameProvider:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 562
    return-void
.end method

.method public static setProvider(Lorg/joda/time/tz/Provider;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/SecurityException;
        }
    .end annotation

    .prologue
    .line 432
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    .line 433
    if-eqz v0, :cond_10

    .line 434
    new-instance v1, Lorg/joda/time/JodaTimePermission;

    const-string v2, "DateTimeZone.setProvider"

    invoke-direct {v1, v2}, Lorg/joda/time/JodaTimePermission;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/SecurityManager;->checkPermission(Ljava/security/Permission;)V

    .line 436
    :cond_10
    if-nez p0, :cond_1c

    .line 437
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getDefaultProvider()Lorg/joda/time/tz/Provider;

    move-result-object p0

    .line 441
    :goto_16
    sget-object v0, Lorg/joda/time/DateTimeZone;->cProvider:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 442
    return-void

    .line 439
    :cond_1c
    invoke-static {p0}, Lorg/joda/time/DateTimeZone;->validateProvider(Lorg/joda/time/tz/Provider;)Lorg/joda/time/tz/Provider;

    goto :goto_16
.end method

.method private static validateProvider(Lorg/joda/time/tz/Provider;)Lorg/joda/time/tz/Provider;
    .registers 3

    .prologue
    .line 452
    invoke-interface {p0}, Lorg/joda/time/tz/Provider;->getAvailableIDs()Ljava/util/Set;

    move-result-object v0

    .line 453
    if-eqz v0, :cond_c

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    if-nez v1, :cond_14

    .line 454
    :cond_c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The provider doesn\'t have any available ids"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 456
    :cond_14
    const-string v1, "UTC"

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_24

    .line 457
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The provider doesn\'t support UTC"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 459
    :cond_24
    sget-object v0, Lorg/joda/time/DateTimeZone;->UTC:Lorg/joda/time/DateTimeZone;

    const-string v1, "UTC"

    invoke-interface {p0, v1}, Lorg/joda/time/tz/Provider;->getZone(Ljava/lang/String;)Lorg/joda/time/DateTimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/joda/time/DateTimeZone;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3a

    .line 460
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Invalid UTC zone provided"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 462
    :cond_3a
    return-object p0
.end method


# virtual methods
.method public adjustOffset(JZ)J
    .registers 11

    .prologue
    const-wide/32 v2, 0xa4cb80

    .line 1166
    sub-long v0, p1, v2

    .line 1167
    add-long/2addr v2, p1

    .line 1168
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v4

    int-to-long v4, v4

    .line 1169
    invoke-virtual {p0, v2, v3}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v2

    int-to-long v2, v2

    .line 1170
    cmp-long v6, v4, v2

    if-gtz v6, :cond_15

    .line 1190
    :cond_14
    :goto_14
    return-wide p1

    .line 1175
    :cond_15
    sub-long v2, v4, v2

    .line 1176
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/DateTimeZone;->nextTransition(J)J

    move-result-wide v0

    .line 1177
    sub-long v4, v0, v2

    .line 1178
    add-long/2addr v0, v2

    .line 1179
    cmp-long v6, p1, v4

    if-ltz v6, :cond_14

    cmp-long v0, p1, v0

    if-gez v0, :cond_14

    .line 1184
    sub-long v0, p1, v4

    .line 1185
    cmp-long v0, v0, v2

    if-ltz v0, :cond_30

    .line 1187
    if-nez p3, :cond_14

    sub-long/2addr p1, v2

    goto :goto_14

    .line 1190
    :cond_30
    if-eqz p3, :cond_14

    add-long/2addr p1, v2

    goto :goto_14
.end method

.method public convertLocalToUTC(JZ)J
    .registers 16

    .prologue
    const-wide v2, 0x7fffffffffffffffL

    const-wide/16 v10, 0x0

    .line 975
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v5

    .line 977
    int-to-long v0, v5

    sub-long v0, p1, v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v4

    .line 979
    if-eq v5, v4, :cond_5e

    .line 983
    if-nez p3, :cond_18

    if-gez v5, :cond_5e

    .line 985
    :cond_18
    int-to-long v0, v5

    sub-long v0, p1, v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/DateTimeZone;->nextTransition(J)J

    move-result-wide v0

    .line 986
    int-to-long v6, v5

    sub-long v6, p1, v6

    cmp-long v6, v0, v6

    if-nez v6, :cond_27

    move-wide v0, v2

    .line 989
    :cond_27
    int-to-long v6, v4

    sub-long v6, p1, v6

    invoke-virtual {p0, v6, v7}, Lorg/joda/time/DateTimeZone;->nextTransition(J)J

    move-result-wide v6

    .line 990
    int-to-long v8, v4

    sub-long v8, p1, v8

    cmp-long v8, v6, v8

    if-nez v8, :cond_60

    .line 993
    :goto_35
    cmp-long v0, v0, v2

    if-eqz v0, :cond_5e

    .line 995
    if-eqz p3, :cond_45

    .line 997
    new-instance v0, Lorg/joda/time/IllegalInstantException;

    invoke-virtual {p0}, Lorg/joda/time/DateTimeZone;->getID()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p1, p2, v1}, Lorg/joda/time/IllegalInstantException;-><init>(JLjava/lang/String;)V

    throw v0

    :cond_45
    move v0, v5

    .line 1008
    :goto_46
    int-to-long v1, v0

    sub-long v1, p1, v1

    .line 1010
    xor-long v3, p1, v1

    cmp-long v3, v3, v10

    if-gez v3, :cond_5d

    int-to-long v3, v0

    xor-long/2addr v3, p1

    cmp-long v0, v3, v10

    if-gez v0, :cond_5d

    .line 1011
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "Subtracting time zone offset caused overflow"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1013
    :cond_5d
    return-wide v1

    :cond_5e
    move v0, v4

    goto :goto_46

    :cond_60
    move-wide v2, v6

    goto :goto_35
.end method

.method public convertLocalToUTC(JZJ)J
    .registers 10

    .prologue
    .line 952
    invoke-virtual {p0, p4, p5}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v2

    .line 953
    int-to-long v0, v2

    sub-long v0, p1, v0

    .line 954
    invoke-virtual {p0, v0, v1}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v3

    .line 955
    if-ne v3, v2, :cond_e

    .line 958
    :goto_d
    return-wide v0

    :cond_e
    invoke-virtual {p0, p1, p2, p3}, Lorg/joda/time/DateTimeZone;->convertLocalToUTC(JZ)J

    move-result-wide v0

    goto :goto_d
.end method

.method public convertUTCToLocal(J)J
    .registers 10

    .prologue
    const-wide/16 v5, 0x0

    .line 925
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v0

    .line 926
    int-to-long v1, v0

    add-long/2addr v1, p1

    .line 928
    xor-long v3, p1, v1

    cmp-long v3, v3, v5

    if-gez v3, :cond_1c

    int-to-long v3, v0

    xor-long/2addr v3, p1

    cmp-long v0, v3, v5

    if-ltz v0, :cond_1c

    .line 929
    new-instance v0, Ljava/lang/ArithmeticException;

    const-string v1, "Adding time zone offset caused overflow"

    invoke-direct {v0, v1}, Ljava/lang/ArithmeticException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 931
    :cond_1c
    return-wide v1
.end method

.method public abstract equals(Ljava/lang/Object;)Z
.end method

.method public final getID()Ljava/lang/String;
    .registers 2
    .annotation runtime Lorg/joda/convert/ToString;
    .end annotation

    .prologue
    .line 686
    iget-object v0, p0, Lorg/joda/time/DateTimeZone;->iID:Ljava/lang/String;

    return-object v0
.end method

.method public getMillisKeepLocal(Lorg/joda/time/DateTimeZone;J)J
    .registers 10

    .prologue
    .line 1027
    if-nez p1, :cond_14

    .line 1028
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getDefault()Lorg/joda/time/DateTimeZone;

    move-result-object v0

    .line 1030
    :goto_6
    if-ne v0, p0, :cond_9

    .line 1034
    :goto_8
    return-wide p2

    .line 1033
    :cond_9
    invoke-virtual {p0, p2, p3}, Lorg/joda/time/DateTimeZone;->convertUTCToLocal(J)J

    move-result-wide v1

    .line 1034
    const/4 v3, 0x0

    move-wide v4, p2

    invoke-virtual/range {v0 .. v5}, Lorg/joda/time/DateTimeZone;->convertLocalToUTC(JZJ)J

    move-result-wide p2

    goto :goto_8

    :cond_14
    move-object v0, p1

    goto :goto_6
.end method

.method public final getName(J)Ljava/lang/String;
    .registers 4

    .prologue
    .line 755
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/joda/time/DateTimeZone;->getName(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getName(JLjava/util/Locale;)Ljava/lang/String;
    .registers 8

    .prologue
    .line 770
    if-nez p3, :cond_6

    .line 771
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p3

    .line 773
    :cond_6
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/DateTimeZone;->getNameKey(J)Ljava/lang/String;

    move-result-object v1

    .line 774
    if-nez v1, :cond_f

    .line 775
    iget-object v0, p0, Lorg/joda/time/DateTimeZone;->iID:Ljava/lang/String;

    .line 787
    :cond_e
    :goto_e
    return-object v0

    .line 778
    :cond_f
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getNameProvider()Lorg/joda/time/tz/NameProvider;

    move-result-object v0

    .line 779
    instance-of v2, v0, Lorg/joda/time/tz/DefaultNameProvider;

    if-eqz v2, :cond_2e

    .line 780
    check-cast v0, Lorg/joda/time/tz/DefaultNameProvider;

    iget-object v2, p0, Lorg/joda/time/DateTimeZone;->iID:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lorg/joda/time/DateTimeZone;->isStandardOffset(J)Z

    move-result v3

    invoke-virtual {v0, p3, v2, v1, v3}, Lorg/joda/time/tz/DefaultNameProvider;->getName(Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 784
    :goto_23
    if-nez v0, :cond_e

    .line 787
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v0

    invoke-static {v0}, Lorg/joda/time/DateTimeZone;->printOffset(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 782
    :cond_2e
    iget-object v2, p0, Lorg/joda/time/DateTimeZone;->iID:Ljava/lang/String;

    invoke-interface {v0, p3, v2, v1}, Lorg/joda/time/tz/NameProvider;->getName(Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_23
.end method

.method public abstract getNameKey(J)Ljava/lang/String;
.end method

.method public abstract getOffset(J)I
.end method

.method public final getOffset(Lorg/joda/time/ReadableInstant;)I
    .registers 4

    .prologue
    .line 805
    if-nez p1, :cond_b

    .line 806
    invoke-static {}, Lorg/joda/time/DateTimeUtils;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v0

    .line 808
    :goto_a
    return v0

    :cond_b
    invoke-interface {p1}, Lorg/joda/time/ReadableInstant;->getMillis()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v0

    goto :goto_a
.end method

.method public getOffsetFromLocal(J)I
    .registers 13

    .prologue
    const-wide v2, 0x7fffffffffffffffL

    .line 877
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v4

    .line 879
    int-to-long v0, v4

    sub-long v6, p1, v0

    .line 880
    invoke-virtual {p0, v6, v7}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v5

    .line 882
    if-eq v4, v5, :cond_36

    .line 885
    sub-int v0, v4, v5

    if-gez v0, :cond_4d

    .line 889
    invoke-virtual {p0, v6, v7}, Lorg/joda/time/DateTimeZone;->nextTransition(J)J

    move-result-wide v0

    .line 890
    int-to-long v6, v4

    sub-long v6, p1, v6

    cmp-long v6, v0, v6

    if-nez v6, :cond_22

    move-wide v0, v2

    .line 893
    :cond_22
    int-to-long v6, v5

    sub-long v6, p1, v6

    invoke-virtual {p0, v6, v7}, Lorg/joda/time/DateTimeZone;->nextTransition(J)J

    move-result-wide v6

    .line 894
    int-to-long v8, v5

    sub-long v8, p1, v8

    cmp-long v8, v6, v8

    if-nez v8, :cond_4f

    .line 897
    :goto_30
    cmp-long v0, v0, v2

    if-eqz v0, :cond_4d

    move v0, v4

    .line 911
    :cond_35
    :goto_35
    return v0

    .line 901
    :cond_36
    if-ltz v4, :cond_4d

    .line 902
    invoke-virtual {p0, v6, v7}, Lorg/joda/time/DateTimeZone;->previousTransition(J)J

    move-result-wide v1

    .line 903
    cmp-long v0, v1, v6

    if-gez v0, :cond_4d

    .line 904
    invoke-virtual {p0, v1, v2}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v0

    .line 905
    sub-int v3, v0, v4

    .line 906
    sub-long v1, v6, v1

    int-to-long v3, v3

    cmp-long v1, v1, v3

    if-lez v1, :cond_35

    :cond_4d
    move v0, v5

    .line 911
    goto :goto_35

    :cond_4f
    move-wide v2, v6

    goto :goto_30
.end method

.method public final getShortName(J)Ljava/lang/String;
    .registers 4

    .prologue
    .line 709
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/joda/time/DateTimeZone;->getShortName(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getShortName(JLjava/util/Locale;)Ljava/lang/String;
    .registers 8

    .prologue
    .line 724
    if-nez p3, :cond_6

    .line 725
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p3

    .line 727
    :cond_6
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/DateTimeZone;->getNameKey(J)Ljava/lang/String;

    move-result-object v1

    .line 728
    if-nez v1, :cond_f

    .line 729
    iget-object v0, p0, Lorg/joda/time/DateTimeZone;->iID:Ljava/lang/String;

    .line 741
    :cond_e
    :goto_e
    return-object v0

    .line 732
    :cond_f
    invoke-static {}, Lorg/joda/time/DateTimeZone;->getNameProvider()Lorg/joda/time/tz/NameProvider;

    move-result-object v0

    .line 733
    instance-of v2, v0, Lorg/joda/time/tz/DefaultNameProvider;

    if-eqz v2, :cond_2e

    .line 734
    check-cast v0, Lorg/joda/time/tz/DefaultNameProvider;

    iget-object v2, p0, Lorg/joda/time/DateTimeZone;->iID:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lorg/joda/time/DateTimeZone;->isStandardOffset(J)Z

    move-result v3

    invoke-virtual {v0, p3, v2, v1, v3}, Lorg/joda/time/tz/DefaultNameProvider;->getShortName(Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 738
    :goto_23
    if-nez v0, :cond_e

    .line 741
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v0

    invoke-static {v0}, Lorg/joda/time/DateTimeZone;->printOffset(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_e

    .line 736
    :cond_2e
    iget-object v2, p0, Lorg/joda/time/DateTimeZone;->iID:Ljava/lang/String;

    invoke-interface {v0, p3, v2, v1}, Lorg/joda/time/tz/NameProvider;->getShortName(Ljava/util/Locale;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_23
.end method

.method public abstract getStandardOffset(J)I
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 1249
    invoke-virtual {p0}, Lorg/joda/time/DateTimeZone;->getID()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    add-int/lit8 v0, v0, 0x39

    return v0
.end method

.method public abstract isFixed()Z
.end method

.method public isLocalDateTimeGap(Lorg/joda/time/LocalDateTime;)Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 1144
    invoke-virtual {p0}, Lorg/joda/time/DateTimeZone;->isFixed()Z

    move-result v1

    if-eqz v1, :cond_8

    .line 1151
    :goto_7
    return v0

    .line 1148
    :cond_8
    :try_start_8
    invoke-virtual {p1, p0}, Lorg/joda/time/LocalDateTime;->toDateTime(Lorg/joda/time/DateTimeZone;)Lorg/joda/time/DateTime;
    :try_end_b
    .catch Lorg/joda/time/IllegalInstantException; {:try_start_8 .. :try_end_b} :catch_c

    goto :goto_7

    .line 1150
    :catch_c
    move-exception v0

    .line 1151
    const/4 v0, 0x1

    goto :goto_7
.end method

.method public isStandardOffset(J)Z
    .registers 5

    .prologue
    .line 836
    invoke-virtual {p0, p1, p2}, Lorg/joda/time/DateTimeZone;->getOffset(J)I

    move-result v0

    invoke-virtual {p0, p1, p2}, Lorg/joda/time/DateTimeZone;->getStandardOffset(J)I

    move-result v1

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public abstract nextTransition(J)J
.end method

.method public abstract previousTransition(J)J
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1257
    invoke-virtual {p0}, Lorg/joda/time/DateTimeZone;->getID()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toTimeZone()Ljava/util/TimeZone;
    .registers 2

    .prologue
    .line 1232
    iget-object v0, p0, Lorg/joda/time/DateTimeZone;->iID:Ljava/lang/String;

    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    return-object v0
.end method

.method protected writeReplace()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .prologue
    .line 1267
    new-instance v0, Lorg/joda/time/DateTimeZone$Stub;

    iget-object v1, p0, Lorg/joda/time/DateTimeZone;->iID:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/joda/time/DateTimeZone$Stub;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
