.class final Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;
.super Lorg/joda/time/DateTimeZone;
.source "DateTimeZoneBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/joda/time/tz/DateTimeZoneBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DSTZone"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x605522c6413e57d1L


# instance fields
.field final iEndRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

.field final iStandardOffset:I

.field final iStartRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;


# direct methods
.method constructor <init>(Ljava/lang/String;ILorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;)V
    .registers 5

    .prologue
    .line 1179
    invoke-direct {p0, p1}, Lorg/joda/time/DateTimeZone;-><init>(Ljava/lang/String;)V

    .line 1180
    iput p2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStandardOffset:I

    .line 1181
    iput-object p3, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStartRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    .line 1182
    iput-object p4, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iEndRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    .line 1183
    return-void
.end method

.method private findMatchingRecurrence(J)Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;
    .registers 9

    .prologue
    .line 1307
    iget v4, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStandardOffset:I

    .line 1308
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStartRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    .line 1309
    iget-object v1, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iEndRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    .line 1314
    :try_start_6
    invoke-virtual {v1}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->getSaveMillis()I

    move-result v2

    invoke-virtual {v0, p1, p2, v4, v2}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->next(JII)J
    :try_end_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_d} :catch_1b
    .catch Ljava/lang/ArithmeticException; {:try_start_6 .. :try_end_d} :catch_1e

    move-result-wide v2

    .line 1325
    :goto_e
    :try_start_e
    invoke-virtual {v0}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->getSaveMillis()I

    move-result v5

    invoke-virtual {v1, p1, p2, v4, v5}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->next(JII)J
    :try_end_15
    .catch Ljava/lang/IllegalArgumentException; {:try_start_e .. :try_end_15} :catch_25
    .catch Ljava/lang/ArithmeticException; {:try_start_e .. :try_end_15} :catch_23

    move-result-wide p1

    .line 1335
    :goto_16
    cmp-long v2, v2, p1

    if-lez v2, :cond_21

    :goto_1a
    return-object v0

    .line 1316
    :catch_1b
    move-exception v2

    move-wide v2, p1

    .line 1322
    goto :goto_e

    .line 1319
    :catch_1e
    move-exception v2

    move-wide v2, p1

    .line 1321
    goto :goto_e

    :cond_21
    move-object v0, v1

    .line 1335
    goto :goto_1a

    .line 1330
    :catch_23
    move-exception v4

    goto :goto_16

    .line 1327
    :catch_25
    move-exception v4

    goto :goto_16
.end method

.method static readFrom(Ljava/io/DataInput;Ljava/lang/String;)Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1169
    new-instance v0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    invoke-static {p0}, Lorg/joda/time/tz/DateTimeZoneBuilder;->readMillis(Ljava/io/DataInput;)J

    move-result-wide v1

    long-to-int v1, v1

    invoke-static {p0}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->readFrom(Ljava/io/DataInput;)Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    move-result-object v2

    invoke-static {p0}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->readFrom(Ljava/io/DataInput;)Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    move-result-object v3

    invoke-direct {v0, p1, v1, v2, v3}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;-><init>(Ljava/lang/String;ILorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1286
    if-ne p0, p1, :cond_5

    .line 1297
    :cond_4
    :goto_4
    return v0

    .line 1289
    :cond_5
    instance-of v2, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    if-eqz v2, :cond_35

    .line 1290
    check-cast p1, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;

    .line 1291
    invoke-virtual {p0}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->getID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->getID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_33

    iget v2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStandardOffset:I

    iget v3, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStandardOffset:I

    if-ne v2, v3, :cond_33

    iget-object v2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStartRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    iget-object v3, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStartRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    invoke-virtual {v2, v3}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_33

    iget-object v2, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iEndRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    iget-object v3, p1, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iEndRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    invoke-virtual {v2, v3}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    :cond_33
    move v0, v1

    goto :goto_4

    :cond_35
    move v0, v1

    .line 1297
    goto :goto_4
.end method

.method public getNameKey(J)Ljava/lang/String;
    .registers 4

    .prologue
    .line 1186
    invoke-direct {p0, p1, p2}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->findMatchingRecurrence(J)Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    move-result-object v0

    invoke-virtual {v0}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->getNameKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOffset(J)I
    .registers 5

    .prologue
    .line 1190
    iget v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStandardOffset:I

    invoke-direct {p0, p1, p2}, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->findMatchingRecurrence(J)Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    move-result-object v1

    invoke-virtual {v1}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->getSaveMillis()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getStandardOffset(J)I
    .registers 4

    .prologue
    .line 1194
    iget v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStandardOffset:I

    return v0
.end method

.method public isFixed()Z
    .registers 2

    .prologue
    .line 1198
    const/4 v0, 0x0

    return v0
.end method

.method public nextTransition(J)J
    .registers 12

    .prologue
    const-wide/16 v7, 0x0

    .line 1202
    iget v4, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStandardOffset:I

    .line 1203
    iget-object v5, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStartRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    .line 1204
    iget-object v6, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iEndRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    .line 1209
    :try_start_8
    invoke-virtual {v6}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->getSaveMillis()I

    move-result v0

    invoke-virtual {v5, p1, p2, v4, v0}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->next(JII)J
    :try_end_f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8 .. :try_end_f} :catch_30
    .catch Ljava/lang/ArithmeticException; {:try_start_8 .. :try_end_f} :catch_33

    move-result-wide v0

    .line 1211
    cmp-long v2, p1, v7

    if-lez v2, :cond_19

    cmp-long v2, v0, v7

    if-gez v2, :cond_19

    move-wide v0, p1

    :cond_19
    move-wide v2, v0

    .line 1224
    :goto_1a
    :try_start_1a
    invoke-virtual {v5}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->getSaveMillis()I

    move-result v0

    invoke-virtual {v6, p1, p2, v4, v0}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->next(JII)J
    :try_end_21
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1a .. :try_end_21} :catch_36
    .catch Ljava/lang/ArithmeticException; {:try_start_1a .. :try_end_21} :catch_39

    move-result-wide v0

    .line 1226
    cmp-long v4, p1, v7

    if-lez v4, :cond_3e

    cmp-long v4, v0, v7

    if-gez v4, :cond_3e

    :goto_2a
    move-wide v0, p1

    .line 1238
    :goto_2b
    cmp-long v4, v2, v0

    if-lez v4, :cond_3c

    :goto_2f
    return-wide v0

    .line 1215
    :catch_30
    move-exception v0

    move-wide v2, p1

    .line 1221
    goto :goto_1a

    .line 1218
    :catch_33
    move-exception v0

    move-wide v2, p1

    .line 1220
    goto :goto_1a

    .line 1230
    :catch_36
    move-exception v0

    move-wide v0, p1

    .line 1236
    goto :goto_2b

    .line 1233
    :catch_39
    move-exception v0

    move-wide v0, p1

    .line 1235
    goto :goto_2b

    :cond_3c
    move-wide v0, v2

    .line 1238
    goto :goto_2f

    :cond_3e
    move-wide p1, v0

    goto :goto_2a
.end method

.method public previousTransition(J)J
    .registers 16

    .prologue
    const-wide/16 v11, 0x1

    const-wide/16 v9, 0x0

    .line 1244
    add-long v2, p1, v11

    .line 1246
    iget v6, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStandardOffset:I

    .line 1247
    iget-object v7, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStartRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    .line 1248
    iget-object v8, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iEndRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    .line 1253
    :try_start_c
    invoke-virtual {v8}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->getSaveMillis()I

    move-result v0

    invoke-virtual {v7, v2, v3, v6, v0}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->previous(JII)J
    :try_end_13
    .catch Ljava/lang/IllegalArgumentException; {:try_start_c .. :try_end_13} :catch_36
    .catch Ljava/lang/ArithmeticException; {:try_start_c .. :try_end_13} :catch_39

    move-result-wide v0

    .line 1255
    cmp-long v4, v2, v9

    if-gez v4, :cond_1d

    cmp-long v4, v0, v9

    if-lez v4, :cond_1d

    move-wide v0, v2

    :cond_1d
    move-wide v4, v0

    .line 1268
    :goto_1e
    :try_start_1e
    invoke-virtual {v7}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->getSaveMillis()I

    move-result v0

    invoke-virtual {v8, v2, v3, v6, v0}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->previous(JII)J
    :try_end_25
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1e .. :try_end_25} :catch_3c
    .catch Ljava/lang/ArithmeticException; {:try_start_1e .. :try_end_25} :catch_3f

    move-result-wide v0

    .line 1270
    cmp-long v6, v2, v9

    if-gez v6, :cond_42

    cmp-long v6, v0, v9

    if-lez v6, :cond_42

    :goto_2e
    move-wide v0, v2

    .line 1282
    :goto_2f
    cmp-long v2, v4, v0

    if-lez v2, :cond_34

    move-wide v0, v4

    :cond_34
    sub-long/2addr v0, v11

    return-wide v0

    .line 1259
    :catch_36
    move-exception v0

    move-wide v4, v2

    .line 1265
    goto :goto_1e

    .line 1262
    :catch_39
    move-exception v0

    move-wide v4, v2

    .line 1264
    goto :goto_1e

    .line 1274
    :catch_3c
    move-exception v0

    move-wide v0, v2

    .line 1280
    goto :goto_2f

    .line 1277
    :catch_3f
    move-exception v0

    move-wide v0, v2

    .line 1279
    goto :goto_2f

    :cond_42
    move-wide v2, v0

    goto :goto_2e
.end method

.method public writeTo(Ljava/io/DataOutput;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1301
    iget v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStandardOffset:I

    int-to-long v0, v0

    invoke-static {p1, v0, v1}, Lorg/joda/time/tz/DateTimeZoneBuilder;->writeMillis(Ljava/io/DataOutput;J)V

    .line 1302
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iStartRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    invoke-virtual {v0, p1}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->writeTo(Ljava/io/DataOutput;)V

    .line 1303
    iget-object v0, p0, Lorg/joda/time/tz/DateTimeZoneBuilder$DSTZone;->iEndRecurrence:Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;

    invoke-virtual {v0, p1}, Lorg/joda/time/tz/DateTimeZoneBuilder$Recurrence;->writeTo(Ljava/io/DataOutput;)V

    .line 1304
    return-void
.end method
