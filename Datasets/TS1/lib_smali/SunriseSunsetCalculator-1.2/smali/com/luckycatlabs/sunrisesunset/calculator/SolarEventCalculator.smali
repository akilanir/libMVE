.class public Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;
.super Ljava/lang/Object;
.source "SolarEventCalculator.java"


# instance fields
.field private final location:Lcom/luckycatlabs/sunrisesunset/dto/Location;

.field private final timeZone:Ljava/util/TimeZone;


# direct methods
.method public constructor <init>(Lcom/luckycatlabs/sunrisesunset/dto/Location;Ljava/lang/String;)V
    .registers 4
    .param p1, "location"    # Lcom/luckycatlabs/sunrisesunset/dto/Location;
    .param p2, "timeZoneIdentifier"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->location:Lcom/luckycatlabs/sunrisesunset/dto/Location;

    .line 46
    invoke-static {p2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    iput-object v0, p0, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->timeZone:Ljava/util/TimeZone;

    .line 47
    return-void
.end method

.method public constructor <init>(Lcom/luckycatlabs/sunrisesunset/dto/Location;Ljava/util/TimeZone;)V
    .registers 3
    .param p1, "location"    # Lcom/luckycatlabs/sunrisesunset/dto/Location;
    .param p2, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->location:Lcom/luckycatlabs/sunrisesunset/dto/Location;

    .line 59
    iput-object p2, p0, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->timeZone:Ljava/util/TimeZone;

    .line 60
    return-void
.end method

.method private adjustForDST(Ljava/math/BigDecimal;Ljava/util/Calendar;)Ljava/math/BigDecimal;
    .registers 8
    .param p1, "localMeanTime"    # Ljava/math/BigDecimal;
    .param p2, "date"    # Ljava/util/Calendar;

    .prologue
    .line 283
    move-object v0, p1

    .line 284
    .local v0, "localTime":Ljava/math/BigDecimal;
    iget-object v1, p0, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {p2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/TimeZone;->inDaylightTime(Ljava/util/Date;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 285
    sget-object v1, Ljava/math/BigDecimal;->ONE:Ljava/math/BigDecimal;

    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 287
    :cond_13
    invoke-virtual {v0}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v1

    const-wide/high16 v3, 0x4038000000000000L    # 24.0

    cmpl-double v1, v1, v3

    if-lez v1, :cond_27

    .line 288
    const-wide/16 v1, 0x18

    invoke-static {v1, v2}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 290
    :cond_27
    return-object v0
.end method

.method private computeSolarEventTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;Z)Ljava/math/BigDecimal;
    .registers 15
    .param p1, "solarZenith"    # Lcom/luckycatlabs/sunrisesunset/Zenith;
    .param p2, "date"    # Ljava/util/Calendar;
    .param p3, "isSunrise"    # Z

    .prologue
    .line 117
    iget-object v7, p0, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {p2, v7}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    .line 118
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-direct {p0, p2, v7}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getLongitudeHour(Ljava/util/Calendar;Ljava/lang/Boolean;)Ljava/math/BigDecimal;

    move-result-object v3

    .line 120
    .local v3, "longitudeHour":Ljava/math/BigDecimal;
    invoke-direct {p0, v3}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getMeanAnomaly(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    .line 121
    .local v4, "meanAnomaly":Ljava/math/BigDecimal;
    invoke-direct {p0, v4}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getSunTrueLongitude(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    .line 122
    .local v6, "sunTrueLong":Ljava/math/BigDecimal;
    invoke-direct {p0, v6, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getCosineSunLocalHour(Ljava/math/BigDecimal;Lcom/luckycatlabs/sunrisesunset/Zenith;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 123
    .local v0, "cosineSunLocalHour":Ljava/math/BigDecimal;
    invoke-virtual {v0}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v7

    const-wide/high16 v9, -0x4010000000000000L    # -1.0

    cmpg-double v7, v7, v9

    if-ltz v7, :cond_2d

    invoke-virtual {v0}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v7

    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    cmpl-double v7, v7, v9

    if-lez v7, :cond_2f

    .line 124
    :cond_2d
    const/4 v2, 0x0

    .line 130
    :goto_2e
    return-object v2

    .line 127
    :cond_2f
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-direct {p0, v0, v7}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getSunLocalHour(Ljava/math/BigDecimal;Ljava/lang/Boolean;)Ljava/math/BigDecimal;

    move-result-object v5

    .line 128
    .local v5, "sunLocalHour":Ljava/math/BigDecimal;
    invoke-direct {p0, v6, v3, v5}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getLocalMeanTime(Ljava/math/BigDecimal;Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 129
    .local v1, "localMeanTime":Ljava/math/BigDecimal;
    invoke-direct {p0, v1, p2}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getLocalTime(Ljava/math/BigDecimal;Ljava/util/Calendar;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 130
    .local v2, "localTime":Ljava/math/BigDecimal;
    goto :goto_2e
.end method

.method private convertDegreesToRadians(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 4
    .param p1, "degrees"    # Ljava/math/BigDecimal;

    .prologue
    .line 392
    const-wide v0, 0x3f91df46a2529d39L    # 0.017453292519943295

    invoke-static {v0, v1}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->multiplyBy(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0
.end method

.method private convertRadiansToDegrees(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 5
    .param p1, "radians"    # Ljava/math/BigDecimal;

    .prologue
    .line 388
    new-instance v0, Ljava/math/BigDecimal;

    const-wide v1, 0x404ca5dc1a63c1f8L    # 57.29577951308232

    invoke-direct {v0, v1, v2}, Ljava/math/BigDecimal;-><init>(D)V

    invoke-direct {p0, p1, v0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->multiplyBy(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0
.end method

.method private divideBy(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 5
    .param p1, "dividend"    # Ljava/math/BigDecimal;
    .param p2, "divisor"    # Ljava/math/BigDecimal;

    .prologue
    .line 400
    const/4 v0, 0x4

    sget-object v1, Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;

    invoke-virtual {p1, p2, v0, v1}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0
.end method

.method private getArcCosineFor(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 5
    .param p1, "radians"    # Ljava/math/BigDecimal;

    .prologue
    .line 383
    invoke-virtual {p1}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Math;->acos(D)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v0

    .line 384
    .local v0, "arcCosine":Ljava/math/BigDecimal;
    invoke-direct {p0, v0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->setScale(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    return-object v1
.end method

.method private getBaseLongitudeHour()Ljava/math/BigDecimal;
    .registers 4

    .prologue
    .line 140
    iget-object v0, p0, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->location:Lcom/luckycatlabs/sunrisesunset/dto/Location;

    invoke-virtual {v0}, Lcom/luckycatlabs/sunrisesunset/dto/Location;->getLongitude()Ljava/math/BigDecimal;

    move-result-object v0

    const-wide/16 v1, 0xf

    invoke-static {v1, v2}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->divideBy(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0
.end method

.method private getCosineOfSunDeclination(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 6
    .param p1, "sinSunDeclination"    # Ljava/math/BigDecimal;

    .prologue
    .line 247
    invoke-virtual {p1}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->asin(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v0

    .line 248
    .local v0, "arcSinOfSinDeclination":Ljava/math/BigDecimal;
    invoke-virtual {v0}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v1

    .line 249
    .local v1, "cosDeclination":Ljava/math/BigDecimal;
    invoke-direct {p0, v1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->setScale(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    return-object v2
.end method

.method private getCosineSunLocalHour(Ljava/math/BigDecimal;Lcom/luckycatlabs/sunrisesunset/Zenith;)Ljava/math/BigDecimal;
    .registers 14
    .param p1, "sunTrueLong"    # Ljava/math/BigDecimal;
    .param p2, "zenith"    # Lcom/luckycatlabs/sunrisesunset/Zenith;

    .prologue
    .line 225
    invoke-direct {p0, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getSinOfSunDeclination(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v7

    .line 226
    .local v7, "sinSunDeclination":Ljava/math/BigDecimal;
    invoke-direct {p0, v7}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getCosineOfSunDeclination(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 228
    .local v1, "cosineSunDeclination":Ljava/math/BigDecimal;
    invoke-virtual {p2}, Lcom/luckycatlabs/sunrisesunset/Zenith;->degrees()Ljava/math/BigDecimal;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->convertDegreesToRadians(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v8

    .line 229
    .local v8, "zenithInRads":Ljava/math/BigDecimal;
    invoke-virtual {v8}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v2

    .line 230
    .local v2, "cosineZenith":Ljava/math/BigDecimal;
    iget-object v9, p0, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->location:Lcom/luckycatlabs/sunrisesunset/dto/Location;

    invoke-virtual {v9}, Lcom/luckycatlabs/sunrisesunset/dto/Location;->getLatitude()Ljava/math/BigDecimal;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->convertDegreesToRadians(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v9

    invoke-virtual {v9}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v6

    .line 231
    .local v6, "sinLatitude":Ljava/math/BigDecimal;
    iget-object v9, p0, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->location:Lcom/luckycatlabs/sunrisesunset/dto/Location;

    invoke-virtual {v9}, Lcom/luckycatlabs/sunrisesunset/dto/Location;->getLatitude()Ljava/math/BigDecimal;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->convertDegreesToRadians(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v9

    invoke-virtual {v9}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v0

    .line 233
    .local v0, "cosLatitude":Ljava/math/BigDecimal;
    invoke-virtual {v7, v6}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    .line 234
    .local v5, "sinDeclinationTimesSinLat":Ljava/math/BigDecimal;
    invoke-virtual {v2, v5}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    .line 235
    .local v3, "dividend":Ljava/math/BigDecimal;
    invoke-virtual {v1, v0}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    .line 237
    .local v4, "divisor":Ljava/math/BigDecimal;
    invoke-direct {p0, v3, v4}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->divideBy(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->setScale(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v9

    return-object v9
.end method

.method private getDayOfYear(Ljava/util/Calendar;)Ljava/math/BigDecimal;
    .registers 4
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 373
    new-instance v0, Ljava/math/BigDecimal;

    const/4 v1, 0x6

    invoke-virtual {p1, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/math/BigDecimal;-><init>(I)V

    return-object v0
.end method

.method private getLocalMeanTime(Ljava/math/BigDecimal;Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 13
    .param p1, "sunTrueLong"    # Ljava/math/BigDecimal;
    .param p2, "longitudeHour"    # Ljava/math/BigDecimal;
    .param p3, "sunLocalHour"    # Ljava/math/BigDecimal;

    .prologue
    const-wide/16 v7, 0x18

    .line 262
    invoke-direct {p0, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getRightAscension(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 263
    .local v2, "rightAscension":Ljava/math/BigDecimal;
    new-instance v3, Ljava/math/BigDecimal;

    const-string v4, "0.06571"

    invoke-direct {v3, v4}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, v3}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 264
    .local v0, "innerParens":Ljava/math/BigDecimal;
    invoke-virtual {p3, v2}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 265
    .local v1, "localMeanTime":Ljava/math/BigDecimal;
    new-instance v3, Ljava/math/BigDecimal;

    const-string v4, "6.622"

    invoke-direct {v3, v4}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 267
    invoke-virtual {v1}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmpg-double v3, v3, v5

    if-gez v3, :cond_3b

    .line 268
    invoke-static {v7, v8}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 272
    :cond_36
    :goto_36
    invoke-direct {p0, v1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->setScale(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    return-object v3

    .line 269
    :cond_3b
    invoke-virtual {v1}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v3

    const-wide/high16 v5, 0x4038000000000000L    # 24.0

    cmpl-double v3, v3, v5

    if-lez v3, :cond_36

    .line 270
    invoke-static {v7, v8}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    goto :goto_36
.end method

.method private getLocalTime(Ljava/math/BigDecimal;Ljava/util/Calendar;)Ljava/math/BigDecimal;
    .registers 7
    .param p1, "localMeanTime"    # Ljava/math/BigDecimal;
    .param p2, "date"    # Ljava/util/Calendar;

    .prologue
    .line 276
    invoke-direct {p0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getBaseLongitudeHour()Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 277
    .local v2, "utcTime":Ljava/math/BigDecimal;
    invoke-direct {p0, p2}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getUTCOffSet(Ljava/util/Calendar;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 278
    .local v0, "utcOffSet":Ljava/math/BigDecimal;
    invoke-virtual {v2, v0}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 279
    .local v1, "utcOffSetTime":Ljava/math/BigDecimal;
    invoke-direct {p0, v1, p2}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->adjustForDST(Ljava/math/BigDecimal;Ljava/util/Calendar;)Ljava/math/BigDecimal;

    move-result-object v3

    return-object v3
.end method

.method private getLocalTimeAsString(Ljava/math/BigDecimal;)Ljava/lang/String;
    .registers 12
    .param p1, "localTimeParam"    # Ljava/math/BigDecimal;

    .prologue
    const/16 v9, 0xa

    const/4 v8, 0x0

    .line 301
    if-nez p1, :cond_8

    .line 302
    const-string v6, "99:99"

    .line 324
    :goto_7
    return-object v6

    .line 305
    :cond_8
    move-object v2, p1

    .line 306
    .local v2, "localTime":Ljava/math/BigDecimal;
    sget-object v6, Ljava/math/BigDecimal;->ZERO:Ljava/math/BigDecimal;

    invoke-virtual {v2, v6}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v6

    const/4 v7, -0x1

    if-ne v6, v7, :cond_1c

    .line 307
    const-wide/high16 v6, 0x4038000000000000L    # 24.0

    invoke-static {v6, v7}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 309
    :cond_1c
    invoke-virtual {v2}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "\\."

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 310
    .local v5, "timeComponents":[Ljava/lang/String;
    aget-object v6, v5, v8

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 312
    .local v0, "hour":I
    new-instance v4, Ljava/math/BigDecimal;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "0."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v7, 0x1

    aget-object v7, v5, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 313
    .local v4, "minutes":Ljava/math/BigDecimal;
    const-wide/16 v6, 0x3c

    invoke-static {v6, v7}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    sget-object v7, Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;

    invoke-virtual {v6, v8, v7}, Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v4

    .line 314
    invoke-virtual {v4}, Ljava/math/BigDecimal;->intValue()I

    move-result v6

    const/16 v7, 0x3c

    if-ne v6, v7, :cond_63

    .line 315
    sget-object v4, Ljava/math/BigDecimal;->ZERO:Ljava/math/BigDecimal;

    .line 316
    add-int/lit8 v0, v0, 0x1

    .line 318
    :cond_63
    const/16 v6, 0x18

    if-ne v0, v6, :cond_68

    .line 319
    const/4 v0, 0x0

    .line 322
    :cond_68
    invoke-virtual {v4}, Ljava/math/BigDecimal;->intValue()I

    move-result v6

    if-ge v6, v9, :cond_b7

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "0"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 323
    .local v3, "minuteString":Ljava/lang/String;
    :goto_85
    if-ge v0, v9, :cond_bc

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "0"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 324
    .local v1, "hourString":Ljava/lang/String;
    :goto_9e
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_7

    .line 322
    .end local v1    # "hourString":Ljava/lang/String;
    .end local v3    # "minuteString":Ljava/lang/String;
    :cond_b7
    invoke-virtual {v4}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v3

    goto :goto_85

    .line 323
    .restart local v3    # "minuteString":Ljava/lang/String;
    :cond_bc
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_9e
.end method

.method private getLongitudeHour(Ljava/util/Calendar;Ljava/lang/Boolean;)Ljava/math/BigDecimal;
    .registers 9
    .param p1, "date"    # Ljava/util/Calendar;
    .param p2, "isSunrise"    # Ljava/lang/Boolean;

    .prologue
    .line 149
    const/16 v3, 0x12

    .line 150
    .local v3, "offset":I
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_9

    .line 151
    const/4 v3, 0x6

    .line 153
    :cond_9
    int-to-long v4, v3

    invoke-static {v4, v5}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-direct {p0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getBaseLongitudeHour()Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 154
    .local v1, "dividend":Ljava/math/BigDecimal;
    const-wide/16 v4, 0x18

    invoke-static {v4, v5}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-direct {p0, v1, v4}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->divideBy(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 155
    .local v0, "addend":Ljava/math/BigDecimal;
    invoke-direct {p0, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getDayOfYear(Ljava/util/Calendar;)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 156
    .local v2, "longHour":Ljava/math/BigDecimal;
    invoke-direct {p0, v2}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->setScale(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    return-object v4
.end method

.method private getMeanAnomaly(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 6
    .param p1, "longitudeHour"    # Ljava/math/BigDecimal;

    .prologue
    .line 165
    new-instance v1, Ljava/math/BigDecimal;

    const-string v2, "0.9856"

    invoke-direct {v1, v2}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v1, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->multiplyBy(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    new-instance v2, Ljava/math/BigDecimal;

    const-string v3, "3.289"

    invoke-direct {v2, v3}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 166
    .local v0, "meanAnomaly":Ljava/math/BigDecimal;
    invoke-direct {p0, v0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->setScale(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    return-object v1
.end method

.method private getRightAscension(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 16
    .param p1, "sunTrueLong"    # Ljava/math/BigDecimal;

    .prologue
    const-wide/16 v12, 0x168

    const/4 v11, 0x0

    .line 201
    new-instance v6, Ljava/math/BigDecimal;

    invoke-direct {p0, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->convertDegreesToRadians(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v7

    invoke-virtual {v7}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Math;->tan(D)D

    move-result-wide v7

    invoke-direct {v6, v7, v8}, Ljava/math/BigDecimal;-><init>(D)V

    .line 203
    .local v6, "tanL":Ljava/math/BigDecimal;
    invoke-direct {p0, v6}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->convertRadiansToDegrees(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v7

    new-instance v8, Ljava/math/BigDecimal;

    const-string v9, "0.91764"

    invoke-direct {v8, v9}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v7, v8}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->multiplyBy(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 204
    .local v1, "innerParens":Ljava/math/BigDecimal;
    new-instance v4, Ljava/math/BigDecimal;

    invoke-direct {p0, v1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->convertDegreesToRadians(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v7

    invoke-virtual {v7}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Math;->atan(D)D

    move-result-wide v7

    invoke-direct {v4, v7, v8}, Ljava/math/BigDecimal;-><init>(D)V

    .line 205
    .local v4, "rightAscension":Ljava/math/BigDecimal;
    invoke-direct {p0, v4}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->convertRadiansToDegrees(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->setScale(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    .line 207
    invoke-virtual {v4}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmpg-double v7, v7, v9

    if-gez v7, :cond_7b

    .line 208
    invoke-static {v12, v13}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    .line 213
    :cond_4e
    :goto_4e
    const-wide/16 v7, 0x5a

    invoke-static {v7, v8}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v3

    .line 214
    .local v3, "ninety":Ljava/math/BigDecimal;
    sget-object v7, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    invoke-virtual {p1, v3, v11, v7}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 215
    .local v2, "longitudeQuadrant":Ljava/math/BigDecimal;
    invoke-virtual {v2, v3}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 217
    sget-object v7, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    invoke-virtual {v4, v3, v11, v7}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v5

    .line 218
    .local v5, "rightAscensionQuadrant":Ljava/math/BigDecimal;
    invoke-virtual {v5, v3}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    .line 220
    invoke-virtual {v2, v5}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 221
    .local v0, "augend":Ljava/math/BigDecimal;
    invoke-virtual {v4, v0}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v7

    const-wide/16 v8, 0xf

    invoke-static {v8, v9}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v8

    invoke-direct {p0, v7, v8}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->divideBy(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v7

    return-object v7

    .line 209
    .end local v0    # "augend":Ljava/math/BigDecimal;
    .end local v2    # "longitudeQuadrant":Ljava/math/BigDecimal;
    .end local v3    # "ninety":Ljava/math/BigDecimal;
    .end local v5    # "rightAscensionQuadrant":Ljava/math/BigDecimal;
    :cond_7b
    invoke-virtual {v4}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v7

    const-wide v9, 0x4076800000000000L    # 360.0

    cmpl-double v7, v7, v9

    if-lez v7, :cond_4e

    .line 210
    invoke-static {v12, v13}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    goto :goto_4e
.end method

.method private getSinOfSunDeclination(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 6
    .param p1, "sunTrueLong"    # Ljava/math/BigDecimal;

    .prologue
    .line 241
    invoke-direct {p0, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->convertDegreesToRadians(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v1

    .line 242
    .local v1, "sinTrueLongitude":Ljava/math/BigDecimal;
    new-instance v2, Ljava/math/BigDecimal;

    const-string v3, "0.39782"

    invoke-direct {v2, v3}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 243
    .local v0, "sinOfDeclination":Ljava/math/BigDecimal;
    invoke-direct {p0, v0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->setScale(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    return-object v2
.end method

.method private getSunLocalHour(Ljava/math/BigDecimal;Ljava/lang/Boolean;)Ljava/math/BigDecimal;
    .registers 7
    .param p1, "cosineSunLocalHour"    # Ljava/math/BigDecimal;
    .param p2, "isSunrise"    # Ljava/lang/Boolean;

    .prologue
    .line 253
    invoke-direct {p0, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getArcCosineFor(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 254
    .local v0, "arcCosineOfCosineHourAngle":Ljava/math/BigDecimal;
    invoke-direct {p0, v0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->convertRadiansToDegrees(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 255
    .local v1, "localHour":Ljava/math/BigDecimal;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_18

    .line 256
    const-wide/16 v2, 0x168

    invoke-static {v2, v3}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 258
    :cond_18
    const-wide/16 v2, 0xf

    invoke-static {v2, v3}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->divideBy(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    return-object v2
.end method

.method private getSunTrueLongitude(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 11
    .param p1, "meanAnomaly"    # Ljava/math/BigDecimal;

    .prologue
    .line 178
    new-instance v3, Ljava/math/BigDecimal;

    invoke-direct {p0, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->convertDegreesToRadians(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v5

    invoke-direct {v3, v5, v6}, Ljava/math/BigDecimal;-><init>(D)V

    .line 179
    .local v3, "sinMeanAnomaly":Ljava/math/BigDecimal;
    new-instance v2, Ljava/math/BigDecimal;

    invoke-direct {p0, p1}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->convertDegreesToRadians(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    const-wide/16 v6, 0x2

    invoke-static {v6, v7}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-direct {p0, v5, v6}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->multiplyBy(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v5

    invoke-direct {v2, v5, v6}, Ljava/math/BigDecimal;-><init>(D)V

    .line 182
    .local v2, "sinDoubleMeanAnomaly":Ljava/math/BigDecimal;
    new-instance v5, Ljava/math/BigDecimal;

    const-string v6, "1.916"

    invoke-direct {v5, v6}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v3, v5}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->multiplyBy(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 183
    .local v0, "firstPart":Ljava/math/BigDecimal;
    new-instance v5, Ljava/math/BigDecimal;

    const-string v6, "0.020"

    invoke-direct {v5, v6}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v2, v5}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->multiplyBy(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    new-instance v6, Ljava/math/BigDecimal;

    const-string v7, "282.634"

    invoke-direct {v6, v7}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v6}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 184
    .local v1, "secondPart":Ljava/math/BigDecimal;
    invoke-virtual {v0, v1}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    .line 186
    .local v4, "trueLongitude":Ljava/math/BigDecimal;
    invoke-virtual {v4}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v5

    const-wide v7, 0x4076800000000000L    # 360.0

    cmpl-double v5, v5, v7

    if-lez v5, :cond_6c

    .line 187
    const-wide/16 v5, 0x168

    invoke-static {v5, v6}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    .line 189
    :cond_6c
    invoke-direct {p0, v4}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->setScale(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    return-object v5
.end method

.method private getUTCOffSet(Ljava/util/Calendar;)Ljava/math/BigDecimal;
    .registers 7
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 377
    new-instance v1, Ljava/math/BigDecimal;

    const/16 v2, 0xf

    invoke-virtual {p1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/math/BigDecimal;-><init>(I)V

    .line 378
    .local v1, "offSetInMillis":Ljava/math/BigDecimal;
    new-instance v2, Ljava/math/BigDecimal;

    const v3, 0x36ee80

    invoke-direct {v2, v3}, Ljava/math/BigDecimal;-><init>(I)V

    new-instance v3, Ljava/math/MathContext;

    const/4 v4, 0x2

    invoke-direct {v3, v4}, Ljava/math/MathContext;-><init>(I)V

    invoke-virtual {v1, v2, v3}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;Ljava/math/MathContext;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 379
    .local v0, "offSet":Ljava/math/BigDecimal;
    return-object v0
.end method

.method private multiplyBy(Ljava/math/BigDecimal;Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 4
    .param p1, "multiplicand"    # Ljava/math/BigDecimal;
    .param p2, "multiplier"    # Ljava/math/BigDecimal;

    .prologue
    .line 396
    invoke-virtual {p1, p2}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->setScale(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0
.end method

.method private setScale(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 4
    .param p1, "number"    # Ljava/math/BigDecimal;

    .prologue
    .line 404
    const/4 v0, 0x4

    sget-object v1, Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;

    invoke-virtual {p1, v0, v1}, Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public computeSunriseCalendar(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/util/Calendar;
    .registers 4
    .param p1, "solarZenith"    # Lcom/luckycatlabs/sunrisesunset/Zenith;
    .param p2, "date"    # Ljava/util/Calendar;

    .prologue
    .line 86
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSolarEventTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;Z)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getLocalTimeAsCalendar(Ljava/math/BigDecimal;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public computeSunriseTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/lang/String;
    .registers 4
    .param p1, "solarZenith"    # Lcom/luckycatlabs/sunrisesunset/Zenith;
    .param p2, "date"    # Ljava/util/Calendar;

    .prologue
    .line 73
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSolarEventTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;Z)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getLocalTimeAsString(Ljava/math/BigDecimal;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public computeSunsetCalendar(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/util/Calendar;
    .registers 4
    .param p1, "solarZenith"    # Lcom/luckycatlabs/sunrisesunset/Zenith;
    .param p2, "date"    # Ljava/util/Calendar;

    .prologue
    .line 113
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSolarEventTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;Z)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getLocalTimeAsCalendar(Ljava/math/BigDecimal;Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public computeSunsetTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;)Ljava/lang/String;
    .registers 4
    .param p1, "solarZenith"    # Lcom/luckycatlabs/sunrisesunset/Zenith;
    .param p2, "date"    # Ljava/util/Calendar;

    .prologue
    .line 100
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->computeSolarEventTime(Lcom/luckycatlabs/sunrisesunset/Zenith;Ljava/util/Calendar;Z)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/luckycatlabs/sunrisesunset/calculator/SolarEventCalculator;->getLocalTimeAsString(Ljava/math/BigDecimal;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getLocalTimeAsCalendar(Ljava/math/BigDecimal;Ljava/util/Calendar;)Ljava/util/Calendar;
    .registers 12
    .param p1, "localTimeParam"    # Ljava/math/BigDecimal;
    .param p2, "date"    # Ljava/util/Calendar;

    .prologue
    const/16 v8, 0xb

    const/4 v7, 0x0

    .line 335
    if-nez p1, :cond_7

    .line 336
    const/4 v3, 0x0

    .line 367
    :goto_6
    return-object v3

    .line 340
    :cond_7
    invoke-virtual {p2}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Calendar;

    .line 342
    .local v3, "resultTime":Ljava/util/Calendar;
    move-object v1, p1

    .line 343
    .local v1, "localTime":Ljava/math/BigDecimal;
    sget-object v5, Ljava/math/BigDecimal;->ZERO:Ljava/math/BigDecimal;

    invoke-virtual {v1, v5}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_26

    .line 344
    const-wide/high16 v5, 0x4038000000000000L    # 24.0

    invoke-static {v5, v6}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 345
    const/16 v5, -0x18

    invoke-virtual {v3, v8, v5}, Ljava/util/Calendar;->add(II)V

    .line 347
    :cond_26
    invoke-virtual {v1}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "\\."

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 348
    .local v4, "timeComponents":[Ljava/lang/String;
    aget-object v5, v4, v7

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 350
    .local v0, "hour":I
    new-instance v2, Ljava/math/BigDecimal;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "0."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x1

    aget-object v6, v4, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 351
    .local v2, "minutes":Ljava/math/BigDecimal;
    const-wide/16 v5, 0x3c

    invoke-static {v5, v6}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    sget-object v6, Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;

    invoke-virtual {v5, v7, v6}, Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 352
    invoke-virtual {v2}, Ljava/math/BigDecimal;->intValue()I

    move-result v5

    const/16 v6, 0x3c

    if-ne v5, v6, :cond_6d

    .line 353
    sget-object v2, Ljava/math/BigDecimal;->ZERO:Ljava/math/BigDecimal;

    .line 354
    add-int/lit8 v0, v0, 0x1

    .line 356
    :cond_6d
    const/16 v5, 0x18

    if-ne v0, v5, :cond_72

    .line 357
    const/4 v0, 0x0

    .line 361
    :cond_72
    invoke-virtual {v3, v8, v0}, Ljava/util/Calendar;->set(II)V

    .line 362
    const/16 v5, 0xc

    invoke-virtual {v2}, Ljava/math/BigDecimal;->intValue()I

    move-result v6

    invoke-virtual {v3, v5, v6}, Ljava/util/Calendar;->set(II)V

    .line 363
    const/16 v5, 0xd

    invoke-virtual {v3, v5, v7}, Ljava/util/Calendar;->set(II)V

    .line 364
    const/16 v5, 0xe

    invoke-virtual {v3, v5, v7}, Ljava/util/Calendar;->set(II)V

    .line 365
    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    goto/16 :goto_6
.end method
