.class public Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;
.super Lcom/alibaba/fastjson/parser/deserializer/AbstractDateDeserializer;
.source "SqlDateDeserializer.java"

# interfaces
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static final instance:Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;

.field public static final instance_timestamp:Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;


# instance fields
.field private timestamp:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 15
    new-instance v0, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;

    invoke-direct {v0}, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;->instance:Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;

    .line 16
    new-instance v0, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;-><init>(Z)V

    sput-object v0, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;->instance_timestamp:Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/alibaba/fastjson/parser/deserializer/AbstractDateDeserializer;-><init>()V

    .line 18
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;->timestamp:Z

    .line 22
    return-void
.end method

.method public constructor <init>(Z)V
    .registers 3
    .param p1, "timestmap"    # Z

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/alibaba/fastjson/parser/deserializer/AbstractDateDeserializer;-><init>()V

    .line 18
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;->timestamp:Z

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;->timestamp:Z

    .line 26
    return-void
.end method


# virtual methods
.method protected cast(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 16
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
    const/4 v5, 0x0

    .line 30
    iget-boolean v8, p0, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;->timestamp:Z

    if-eqz v8, :cond_a

    .line 31
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/alibaba/fastjson/parser/deserializer/SqlDateDeserializer;->castTimestamp(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .line 75
    .end local p4    # "val":Ljava/lang/Object;
    :cond_9
    :goto_9
    return-object v5

    .line 34
    .restart local p4    # "val":Ljava/lang/Object;
    :cond_a
    if-eqz p4, :cond_9

    .line 38
    instance-of v8, p4, Ljava/util/Date;

    if-eqz v8, :cond_1e

    .line 39
    new-instance v7, Ljava/sql/Date;

    check-cast p4, Ljava/util/Date;

    .end local p4    # "val":Ljava/lang/Object;
    invoke-virtual {p4}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    invoke-direct {v7, v8, v9}, Ljava/sql/Date;-><init>(J)V

    .local v7, "val":Ljava/sql/Date;
    move-object p4, v7

    .end local v7    # "val":Ljava/sql/Date;
    .local p4, "val":Ljava/sql/Date;
    :goto_1c
    move-object v5, p4

    .line 75
    goto :goto_9

    .line 40
    .local p4, "val":Ljava/lang/Object;
    :cond_1e
    instance-of v8, p4, Ljava/lang/Number;

    if-eqz v8, :cond_2f

    .line 41
    new-instance v7, Ljava/sql/Date;

    check-cast p4, Ljava/lang/Number;

    .end local p4    # "val":Ljava/lang/Object;
    invoke-virtual {p4}, Ljava/lang/Number;->longValue()J

    move-result-wide v8

    invoke-direct {v7, v8, v9}, Ljava/sql/Date;-><init>(J)V

    .restart local v7    # "val":Ljava/sql/Date;
    move-object p4, v7

    .end local v7    # "val":Ljava/sql/Date;
    .local p4, "val":Ljava/sql/Date;
    goto :goto_1c

    .line 42
    .local p4, "val":Ljava/lang/Object;
    :cond_2f
    instance-of v8, p4, Ljava/lang/String;

    if-eqz v8, :cond_78

    move-object v6, p4

    .line 43
    check-cast v6, Ljava/lang/String;

    .line 44
    .local v6, "strVal":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_9

    .line 50
    new-instance v2, Lcom/alibaba/fastjson/parser/JSONScanner;

    invoke-direct {v2, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 52
    .local v2, "dateLexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    :try_start_41
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch()Z

    move-result v8

    if-eqz v8, :cond_58

    .line 53
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->getCalendar()Ljava/util/Calendar;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/Calendar;->getTimeInMillis()J
    :try_end_4e
    .catchall {:try_start_41 .. :try_end_4e} :catchall_73

    move-result-wide v3

    .line 68
    .local v3, "longVal":J
    :goto_4f
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    .line 70
    new-instance v5, Ljava/sql/Date;

    invoke-direct {v5, v3, v4}, Ljava/sql/Date;-><init>(J)V

    goto :goto_9

    .line 56
    .end local v3    # "longVal":J
    :cond_58
    :try_start_58
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getDateFormat()Ljava/text/DateFormat;
    :try_end_5b
    .catchall {:try_start_58 .. :try_end_5b} :catchall_73

    move-result-object v1

    .line 58
    .local v1, "dateFormat":Ljava/text/DateFormat;
    :try_start_5c
    invoke-virtual {v1, v6}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 59
    .local v0, "date":Ljava/util/Date;
    new-instance v5, Ljava/sql/Date;

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    invoke-direct {v5, v8, v9}, Ljava/sql/Date;-><init>(J)V
    :try_end_69
    .catch Ljava/text/ParseException; {:try_start_5c .. :try_end_69} :catch_6d
    .catchall {:try_start_5c .. :try_end_69} :catchall_73

    .line 68
    .local v5, "sqlDate":Ljava/sql/Date;
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    goto :goto_9

    .line 61
    .end local v0    # "date":Ljava/util/Date;
    .end local v5    # "sqlDate":Ljava/sql/Date;
    :catch_6d
    move-exception v8

    .line 65
    :try_start_6e
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_71
    .catchall {:try_start_6e .. :try_end_71} :catchall_73

    move-result-wide v3

    .restart local v3    # "longVal":J
    goto :goto_4f

    .line 68
    .end local v1    # "dateFormat":Ljava/text/DateFormat;
    .end local v3    # "longVal":J
    :catchall_73
    move-exception v8

    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    throw v8

    .line 72
    .end local v2    # "dateLexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    .end local v6    # "strVal":Ljava/lang/String;
    :cond_78
    new-instance v8, Lcom/alibaba/fastjson/JSONException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "parse error : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v8
.end method

.method protected castTimestamp(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
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
    const/4 v5, 0x0

    .line 81
    if-nez p4, :cond_4

    .line 121
    .end local p4    # "val":Ljava/lang/Object;
    :cond_3
    :goto_3
    return-object v5

    .line 85
    .restart local p4    # "val":Ljava/lang/Object;
    :cond_4
    instance-of v7, p4, Ljava/util/Date;

    if-eqz v7, :cond_14

    .line 86
    new-instance v5, Ljava/sql/Timestamp;

    check-cast p4, Ljava/util/Date;

    .end local p4    # "val":Ljava/lang/Object;
    invoke-virtual {p4}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    invoke-direct {v5, v7, v8}, Ljava/sql/Timestamp;-><init>(J)V

    goto :goto_3

    .line 89
    .restart local p4    # "val":Ljava/lang/Object;
    :cond_14
    instance-of v7, p4, Ljava/lang/Number;

    if-eqz v7, :cond_24

    .line 90
    new-instance v5, Ljava/sql/Timestamp;

    check-cast p4, Ljava/lang/Number;

    .end local p4    # "val":Ljava/lang/Object;
    invoke-virtual {p4}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    invoke-direct {v5, v7, v8}, Ljava/sql/Timestamp;-><init>(J)V

    goto :goto_3

    .line 93
    .restart local p4    # "val":Ljava/lang/Object;
    :cond_24
    instance-of v7, p4, Ljava/lang/String;

    if-eqz v7, :cond_6d

    move-object v6, p4

    .line 94
    check-cast v6, Ljava/lang/String;

    .line 95
    .local v6, "strVal":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_3

    .line 100
    new-instance v2, Lcom/alibaba/fastjson/parser/JSONScanner;

    invoke-direct {v2, v6}, Lcom/alibaba/fastjson/parser/JSONScanner;-><init>(Ljava/lang/String;)V

    .line 102
    .local v2, "dateLexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    :try_start_36
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->scanISO8601DateIfMatch()Z

    move-result v7

    if-eqz v7, :cond_4d

    .line 103
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->getCalendar()Ljava/util/Calendar;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/Calendar;->getTimeInMillis()J
    :try_end_43
    .catchall {:try_start_36 .. :try_end_43} :catchall_68

    move-result-wide v3

    .line 118
    .local v3, "longVal":J
    :goto_44
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    .line 121
    new-instance v5, Ljava/sql/Timestamp;

    invoke-direct {v5, v3, v4}, Ljava/sql/Timestamp;-><init>(J)V

    goto :goto_3

    .line 106
    .end local v3    # "longVal":J
    :cond_4d
    :try_start_4d
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->getDateFormat()Ljava/text/DateFormat;
    :try_end_50
    .catchall {:try_start_4d .. :try_end_50} :catchall_68

    move-result-object v1

    .line 108
    .local v1, "dateFormat":Ljava/text/DateFormat;
    :try_start_51
    invoke-virtual {v1, v6}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 109
    .local v0, "date":Ljava/util/Date;
    new-instance v5, Ljava/sql/Timestamp;

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v7

    invoke-direct {v5, v7, v8}, Ljava/sql/Timestamp;-><init>(J)V
    :try_end_5e
    .catch Ljava/text/ParseException; {:try_start_51 .. :try_end_5e} :catch_62
    .catchall {:try_start_51 .. :try_end_5e} :catchall_68

    .line 118
    .local v5, "sqlDate":Ljava/sql/Timestamp;
    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    goto :goto_3

    .line 111
    .end local v0    # "date":Ljava/util/Date;
    .end local v5    # "sqlDate":Ljava/sql/Timestamp;
    :catch_62
    move-exception v7

    .line 115
    :try_start_63
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_66
    .catchall {:try_start_63 .. :try_end_66} :catchall_68

    move-result-wide v3

    .restart local v3    # "longVal":J
    goto :goto_44

    .line 118
    .end local v1    # "dateFormat":Ljava/text/DateFormat;
    .end local v3    # "longVal":J
    :catchall_68
    move-exception v7

    invoke-virtual {v2}, Lcom/alibaba/fastjson/parser/JSONScanner;->close()V

    throw v7

    .line 124
    .end local v2    # "dateLexer":Lcom/alibaba/fastjson/parser/JSONScanner;
    .end local v6    # "strVal":Ljava/lang/String;
    :cond_6d
    new-instance v7, Lcom/alibaba/fastjson/JSONException;

    const-string v8, "parse error"

    invoke-direct {v7, v8}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 128
    const/4 v0, 0x2

    return v0
.end method
