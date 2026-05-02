.class public Lcom/alibaba/fastjson/serializer/DateCodec;
.super Lcom/alibaba/fastjson/parser/deserializer/AbstractDateDeserializer;
.source "DateCodec.java"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static final instance:Lcom/alibaba/fastjson/serializer/DateCodec;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 41
    new-instance v0, Lcom/alibaba/fastjson/serializer/DateCodec;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/DateCodec;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/serializer/DateCodec;->instance:Lcom/alibaba/fastjson/serializer/DateCodec;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/alibaba/fastjson/parser/deserializer/AbstractDateDeserializer;-><init>()V

    return-void
.end method


# virtual methods
.method protected cast(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p2, "clazz"    # Ljava/lang/reflect/Type;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "val"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 153
    if-nez p4, :cond_5

    move-object p4, v0

    .line 203
    .end local p4    # "val":Ljava/lang/Object;
    :cond_4
    :goto_4
    return-object p4

    .line 157
    .restart local p4    # "val":Ljava/lang/Object;
    :cond_5
    instance-of v7, p4, Ljava/util/Date;

    if-nez v7, :cond_4

    .line 159
    instance-of v7, p4, Ljava/lang/Number;

    if-eqz v7, :cond_1a

    .line 160
    new-instance v0, Ljava/util/Date;

    check-cast p4, Ljava/lang/Number;

    .end local p4    # "val":Ljava/lang/Object;
    invoke-virtual {p4}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    invoke-direct {v0, v7, v8}, Ljava/util/Date;-><init>(J)V

    move-object p4, v0

    goto :goto_4

    .line 161
    .restart local p4    # "val":Ljava/lang/Object;
    :cond_1a
    instance-of v7, p4, Ljava/lang/String;

    if-eqz v7, :cond_91

    move-object v6, p4

    .line 162
    check-cast v6, Ljava/lang/String;

    .line 163
    .local v6, "strVal":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_29

    move-object p4, v0

    .line 164
    goto :goto_4

    .line 167
    :cond_29
    new-instance v2, Lcom/alibaba/fastjson/parser/JSONScanner;

    invoke-direct {v2, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 169
    .local v2, "dateLexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    const/4 v7, 0x0

    :try_start_2f
    invoke-virtual {v2, v7}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch(Z)Z

    move-result v7

    if-eqz v7, :cond_4a

    .line 170
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->getCalendar()Ljava/util/Calendar;

    move-result-object v0

    .line 172
    .local v0, "calendar":Ljava/util/Calendar;
    const-class v7, Ljava/util/Calendar;
    :try_end_3b
    .catchall {:try_start_2f .. :try_end_3b} :catchall_64

    if-ne p2, v7, :cond_42

    .line 179
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    move-object p4, v0

    goto :goto_4

    .line 176
    :cond_42
    :try_start_42
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;
    :try_end_45
    .catchall {:try_start_42 .. :try_end_45} :catchall_64

    move-result-object p4

    .line 179
    .end local p4    # "val":Ljava/lang/Object;
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    goto :goto_4

    .end local v0    # "calendar":Ljava/util/Calendar;
    .restart local p4    # "val":Ljava/lang/Object;
    :cond_4a
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    .line 182
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getDateFomartPattern()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-ne v7, v8, :cond_6a

    .line 183
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getDateFormat()Ljava/text/DateFormat;

    move-result-object v1

    .line 185
    .local v1, "dateFormat":Ljava/text/DateFormat;
    :try_start_5f
    invoke-virtual {v1, v6}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;
    :try_end_62
    .catch Ljava/text/ParseException; {:try_start_5f .. :try_end_62} :catch_69

    move-result-object p4

    goto :goto_4

    .line 179
    .end local v1    # "dateFormat":Ljava/text/DateFormat;
    :catchall_64
    move-exception v7

    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    throw v7

    .line 186
    .restart local v1    # "dateFormat":Ljava/text/DateFormat;
    :catch_69
    move-exception v7

    .line 191
    .end local v1    # "dateFormat":Ljava/text/DateFormat;
    :cond_6a
    const-string v7, "/Date("

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_86

    const-string v7, ")/"

    invoke-virtual {v6, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_86

    .line 192
    const/4 v7, 0x6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x2

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 193
    .local v3, "dotnetDateStr":Ljava/lang/String;
    move-object v6, v3

    .line 202
    .end local v3    # "dotnetDateStr":Ljava/lang/String;
    :cond_86
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 203
    .local v4, "longVal":J
    new-instance p4, Ljava/util/Date;

    .end local p4    # "val":Ljava/lang/Object;
    invoke-direct {p4, v4, v5}, Ljava/util/Date;-><init>(J)V

    goto/16 :goto_4

    .line 206
    .end local v2    # "dateLexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    .end local v4    # "longVal":J
    .end local v6    # "strVal":Ljava/lang/String;
    .restart local p4    # "val":Ljava/lang/Object;
    :cond_91
    new-instance v7, Lcom/alibaba/fastjson/JSONException;

    const-string v8, "parse error"

    invoke-direct {v7, v8}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 210
    const/4 v0, 0x2

    return v0
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 32
    .param p1, "serializer"    # Lcom/alibaba/fastjson/serializer/JSONSerializer;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .param p4, "fieldType"    # Ljava/lang/reflect/Type;
    .param p5, "features"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 46
    .local v13, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    if-nez p2, :cond_a

    .line 47
    invoke-virtual {v13}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 148
    .end local p2    # "object":Ljava/lang/Object;
    :goto_9
    return-void

    .line 52
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_a
    move-object/from16 v0, p2

    instance-of v0, v0, Ljava/util/Date;

    move/from16 v21, v0

    if-eqz v21, :cond_4c

    move-object/from16 v6, p2

    .line 53
    check-cast v6, Ljava/util/Date;

    .line 58
    .local v6, "date":Ljava/util/Date;
    :goto_16
    sget-object v21, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteDateUseDateFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v21

    if-eqz v21, :cond_51

    .line 59
    invoke-virtual/range {p1 .. p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->getDateFormat()Ljava/text/DateFormat;

    move-result-object v8

    .line 60
    .local v8, "format":Ljava/text/DateFormat;
    if-nez v8, :cond_42

    .line 61
    new-instance v8, Ljava/text/SimpleDateFormat;

    .end local v8    # "format":Ljava/text/DateFormat;
    sget-object v21, Lcom/alibaba/fastjson/JSON;->DEFFAULT_DATE_FORMAT:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->locale:Ljava/util/Locale;

    move-object/from16 v22, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-direct {v8, v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 62
    .restart local v8    # "format":Ljava/text/DateFormat;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->timeZone:Ljava/util/TimeZone;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v8, v0}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 64
    :cond_42
    invoke-virtual {v8, v6}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v16

    .line 65
    .local v16, "text":Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    goto :goto_9

    .line 55
    .end local v6    # "date":Ljava/util/Date;
    .end local v8    # "format":Ljava/text/DateFormat;
    .end local v16    # "text":Ljava/lang/String;
    :cond_4c
    invoke-static/range {p2 .. p2}, Lcom/alibaba/fastjson/util/TypeUtils;->castToDate(Ljava/lang/Object;)Ljava/util/Date;

    move-result-object v6

    .restart local v6    # "date":Ljava/util/Date;
    goto :goto_16

    .line 69
    :cond_51
    sget-object v21, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v21

    if-eqz v21, :cond_c5

    .line 70
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, p4

    if-eq v0, v1, :cond_c5

    .line 71
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    const-class v22, Ljava/util/Date;

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    if-ne v0, v1, :cond_8c

    .line 72
    const-string v21, "new Date("

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(Ljava/lang/String;)V

    .line 73
    check-cast p2, Ljava/util/Date;

    .end local p2    # "object":Ljava/lang/Object;
    invoke-virtual/range {p2 .. p2}, Ljava/util/Date;->getTime()J

    move-result-wide v21

    move-wide/from16 v0, v21

    invoke-virtual {v13, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 74
    const/16 v21, 0x29

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_9

    .line 76
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_8c
    const/16 v21, 0x7b

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 77
    sget-object v21, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 78
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/String;)V

    .line 79
    const/16 v21, 0x2c

    const-string v22, "val"

    check-cast p2, Ljava/util/Date;

    .end local p2    # "object":Ljava/lang/Object;
    invoke-virtual/range {p2 .. p2}, Ljava/util/Date;->getTime()J

    move-result-wide v23

    move/from16 v0, v21

    move-object/from16 v1, v22

    move-wide/from16 v2, v23

    invoke-virtual {v13, v0, v1, v2, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;J)V

    .line 80
    const/16 v21, 0x7d

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_9

    .line 86
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_c5
    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v17

    .line 87
    .local v17, "time":J
    sget-object v21, Lcom/alibaba/fastjson/serializer/SerializerFeature;->UseISO8601DateFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v21

    if-eqz v21, :cond_238

    .line 88
    sget-object v21, Lcom/alibaba/fastjson/serializer/SerializerFeature;->UseSingleQuotes:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v21

    if-eqz v21, :cond_18a

    const/16 v14, 0x27

    .line 89
    .local v14, "quote":C
    :goto_df
    invoke-virtual {v13, v14}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 91
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->timeZone:Ljava/util/TimeZone;

    move-object/from16 v21, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;->locale:Ljava/util/Locale;

    move-object/from16 v22, v0

    invoke-static/range {v21 .. v22}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;Ljava/util/Locale;)Ljava/util/Calendar;

    move-result-object v5

    .line 92
    .local v5, "calendar":Ljava/util/Calendar;
    move-wide/from16 v0, v17

    invoke-virtual {v5, v0, v1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 94
    const/16 v21, 0x1

    move/from16 v0, v21

    invoke-virtual {v5, v0}, Ljava/util/Calendar;->get(I)I

    move-result v20

    .line 95
    .local v20, "year":I
    const/16 v21, 0x2

    move/from16 v0, v21

    invoke-virtual {v5, v0}, Ljava/util/Calendar;->get(I)I

    move-result v21

    add-int/lit8 v12, v21, 0x1

    .line 96
    .local v12, "month":I
    const/16 v21, 0x5

    move/from16 v0, v21

    invoke-virtual {v5, v0}, Ljava/util/Calendar;->get(I)I

    move-result v7

    .line 97
    .local v7, "day":I
    const/16 v21, 0xb

    move/from16 v0, v21

    invoke-virtual {v5, v0}, Ljava/util/Calendar;->get(I)I

    move-result v9

    .line 98
    .local v9, "hour":I
    const/16 v21, 0xc

    move/from16 v0, v21

    invoke-virtual {v5, v0}, Ljava/util/Calendar;->get(I)I

    move-result v11

    .line 99
    .local v11, "minute":I
    const/16 v21, 0xd

    move/from16 v0, v21

    invoke-virtual {v5, v0}, Ljava/util/Calendar;->get(I)I

    move-result v15

    .line 100
    .local v15, "second":I
    const/16 v21, 0xe

    move/from16 v0, v21

    invoke-virtual {v5, v0}, Ljava/util/Calendar;->get(I)I

    move-result v10

    .line 103
    .local v10, "millis":I
    if-eqz v10, :cond_18e

    .line 104
    const-string v21, "0000-00-00T00:00:00.000"

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    .line 105
    .local v4, "buf":[C
    const/16 v21, 0x17

    move/from16 v0, v21

    invoke-static {v10, v0, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 106
    const/16 v21, 0x13

    move/from16 v0, v21

    invoke-static {v15, v0, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 107
    const/16 v21, 0x10

    move/from16 v0, v21

    invoke-static {v11, v0, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 108
    const/16 v21, 0xd

    move/from16 v0, v21

    invoke-static {v9, v0, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 109
    const/16 v21, 0xa

    move/from16 v0, v21

    invoke-static {v7, v0, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 110
    const/16 v21, 0x7

    move/from16 v0, v21

    invoke-static {v12, v0, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 111
    const/16 v21, 0x4

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-static {v0, v1, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 130
    :goto_16c
    invoke-virtual {v13, v4}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write([C)V

    .line 132
    invoke-virtual {v5}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v21

    const v22, 0x36ee80

    div-int v19, v21, v22

    .line 133
    .local v19, "timeZone":I
    if-nez v19, :cond_1e5

    .line 134
    const/16 v21, 0x5a

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 144
    :goto_185
    invoke-virtual {v13, v14}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto/16 :goto_9

    .line 88
    .end local v4    # "buf":[C
    .end local v5    # "calendar":Ljava/util/Calendar;
    .end local v7    # "day":I
    .end local v9    # "hour":I
    .end local v10    # "millis":I
    .end local v11    # "minute":I
    .end local v12    # "month":I
    .end local v14    # "quote":C
    .end local v15    # "second":I
    .end local v19    # "timeZone":I
    .end local v20    # "year":I
    :cond_18a
    const/16 v14, 0x22

    goto/16 :goto_df

    .line 114
    .restart local v5    # "calendar":Ljava/util/Calendar;
    .restart local v7    # "day":I
    .restart local v9    # "hour":I
    .restart local v10    # "millis":I
    .restart local v11    # "minute":I
    .restart local v12    # "month":I
    .restart local v14    # "quote":C
    .restart local v15    # "second":I
    .restart local v20    # "year":I
    :cond_18e
    if-nez v15, :cond_1b2

    if-nez v11, :cond_1b2

    if-nez v9, :cond_1b2

    .line 115
    const-string v21, "0000-00-00"

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    .line 116
    .restart local v4    # "buf":[C
    const/16 v21, 0xa

    move/from16 v0, v21

    invoke-static {v7, v0, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 117
    const/16 v21, 0x7

    move/from16 v0, v21

    invoke-static {v12, v0, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 118
    const/16 v21, 0x4

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-static {v0, v1, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    goto :goto_16c

    .line 120
    .end local v4    # "buf":[C
    :cond_1b2
    const-string v21, "0000-00-00T00:00:00"

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    .line 121
    .restart local v4    # "buf":[C
    const/16 v21, 0x13

    move/from16 v0, v21

    invoke-static {v15, v0, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 122
    const/16 v21, 0x10

    move/from16 v0, v21

    invoke-static {v11, v0, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 123
    const/16 v21, 0xd

    move/from16 v0, v21

    invoke-static {v9, v0, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 124
    const/16 v21, 0xa

    move/from16 v0, v21

    invoke-static {v7, v0, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 125
    const/16 v21, 0x7

    move/from16 v0, v21

    invoke-static {v12, v0, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    .line 126
    const/16 v21, 0x4

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-static {v0, v1, v4}, Lcom/alibaba/fastjson/util/IOUtils;->getChars(II[C)V

    goto :goto_16c

    .line 136
    .restart local v19    # "timeZone":I
    :cond_1e5
    if-lez v19, :cond_211

    .line 137
    const/16 v21, 0x2b

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-result-object v21

    const-string v22, "%02d"

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 141
    :goto_208
    const-string v21, ":00"

    move-object/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    goto/16 :goto_185

    .line 139
    :cond_211
    const/16 v21, 0x2d

    move/from16 v0, v21

    invoke-virtual {v13, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(C)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    move-result-object v21

    const-string v22, "%02d"

    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    move/from16 v0, v19

    neg-int v0, v0

    move/from16 v25, v0

    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v25

    aput-object v25, v23, v24

    invoke-static/range {v22 .. v23}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->append(Ljava/lang/CharSequence;)Lcom/alibaba/fastjson/serializer/SerializeWriter;

    goto :goto_208

    .line 146
    .end local v4    # "buf":[C
    .end local v5    # "calendar":Ljava/util/Calendar;
    .end local v7    # "day":I
    .end local v9    # "hour":I
    .end local v10    # "millis":I
    .end local v11    # "minute":I
    .end local v12    # "month":I
    .end local v14    # "quote":C
    .end local v15    # "second":I
    .end local v19    # "timeZone":I
    .end local v20    # "year":I
    :cond_238
    move-wide/from16 v0, v17

    invoke-virtual {v13, v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    goto/16 :goto_9
.end method
