.class public Lorg/acra/util/JSONReportBuilder;
.super Ljava/lang/Object;
.source "JSONReportBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/acra/util/JSONReportBuilder$JSONReportException;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addJSONFromProperty(Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 11
    .param p0, "destination"    # Lorg/json/JSONObject;
    .param p1, "propertyString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 135
    const/16 v6, 0x3d

    invoke-virtual {p1, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 136
    .local v2, "equalsIndex":I
    if-lez v2, :cond_40

    .line 137
    move-object v3, p0

    .line 138
    .local v3, "finalObject":Lorg/json/JSONObject;
    const/4 v6, 0x0

    invoke-virtual {p1, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 139
    .local v0, "currentKey":Ljava/lang/String;
    add-int/lit8 v6, v2, 0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 140
    .local v1, "currentValue":Ljava/lang/String;
    invoke-static {v1}, Lorg/acra/util/JSONReportBuilder;->guessType(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 141
    .local v5, "value":Ljava/lang/Object;
    instance-of v6, v5, Ljava/lang/String;

    if-eqz v6, :cond_2f

    .line 142
    check-cast v5, Ljava/lang/String;

    .end local v5    # "value":Ljava/lang/Object;
    const-string v6, "\\\\n"

    const-string v7, "\n"

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 144
    :cond_2f
    const-string v6, "\\."

    invoke-virtual {v0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 145
    .local v4, "splitKey":[Ljava/lang/String;
    array-length v6, v4

    if-le v6, v8, :cond_3c

    .line 146
    invoke-static {v3, v4, v5}, Lorg/acra/util/JSONReportBuilder;->addJSONSubTree(Lorg/json/JSONObject;[Ljava/lang/String;Ljava/lang/Object;)V

    .line 153
    .end local v0    # "currentKey":Ljava/lang/String;
    .end local v1    # "currentValue":Ljava/lang/String;
    .end local v3    # "finalObject":Lorg/json/JSONObject;
    .end local v4    # "splitKey":[Ljava/lang/String;
    :goto_3b
    return-void

    .line 148
    .restart local v0    # "currentKey":Ljava/lang/String;
    .restart local v1    # "currentValue":Ljava/lang/String;
    .restart local v3    # "finalObject":Lorg/json/JSONObject;
    .restart local v4    # "splitKey":[Ljava/lang/String;
    :cond_3c
    invoke-virtual {v3, v0, v5}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3b

    .line 151
    .end local v0    # "currentKey":Ljava/lang/String;
    .end local v1    # "currentValue":Ljava/lang/String;
    .end local v3    # "finalObject":Lorg/json/JSONObject;
    .end local v4    # "splitKey":[Ljava/lang/String;
    :cond_40
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    goto :goto_3b
.end method

.method private static addJSONSubTree(Lorg/json/JSONObject;[Ljava/lang/String;Ljava/lang/Object;)V
    .registers 7
    .param p0, "destination"    # Lorg/json/JSONObject;
    .param p1, "keys"    # [Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 187
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, p1

    if-ge v0, v3, :cond_27

    .line 188
    aget-object v2, p1, v0

    .line 189
    .local v2, "subKey":Ljava/lang/String;
    array-length v3, p1

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_23

    .line 190
    const/4 v1, 0x0

    .line 191
    .local v1, "intermediate":Lorg/json/JSONObject;
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 192
    new-instance v1, Lorg/json/JSONObject;

    .end local v1    # "intermediate":Lorg/json/JSONObject;
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 193
    .restart local v1    # "intermediate":Lorg/json/JSONObject;
    invoke-virtual {p0, v2, v1}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 197
    :goto_1a
    move-object p0, v1

    .line 187
    .end local v1    # "intermediate":Lorg/json/JSONObject;
    :goto_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 195
    .restart local v1    # "intermediate":Lorg/json/JSONObject;
    :cond_1e
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    goto :goto_1a

    .line 199
    .end local v1    # "intermediate":Lorg/json/JSONObject;
    :cond_23
    invoke-virtual {p0, v2, p2}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1b

    .line 202
    .end local v2    # "subKey":Ljava/lang/String;
    :cond_27
    return-void
.end method

.method public static buildJSONReport(Lorg/acra/collector/CrashReportData;)Lorg/json/JSONObject;
    .registers 13
    .param p0, "errorContent"    # Lorg/acra/collector/CrashReportData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/acra/util/JSONReportBuilder$JSONReportException;
        }
    .end annotation

    .prologue
    .line 67
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 68
    .local v2, "jsonReport":Lorg/json/JSONObject;
    invoke-virtual {p0}, Lorg/acra/collector/CrashReportData;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_97

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/acra/ReportField;

    .line 72
    .local v3, "key":Lorg/acra/ReportField;
    :try_start_19
    invoke-virtual {v3}, Lorg/acra/ReportField;->containsKeyValuePairs()Z

    move-result v8

    if-eqz v8, :cond_86

    .line 73
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 74
    .local v7, "subObject":Lorg/json/JSONObject;
    invoke-virtual {p0, v3}, Lorg/acra/collector/CrashReportData;->getProperty(Lorg/acra/ReportField;)Ljava/lang/String;

    move-result-object v6

    .line 75
    .local v6, "strContent":Ljava/lang/String;
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/StringReader;

    invoke-direct {v8, v6}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    const/16 v9, 0x400

    invoke-direct {v5, v8, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_34
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_34} :catch_6c

    .line 76
    .local v5, "reader":Ljava/io/BufferedReader;
    const/4 v4, 0x0

    .line 78
    .local v4, "line":Ljava/lang/String;
    :goto_35
    :try_start_35
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_64

    .line 79
    invoke-static {v7, v4}, Lorg/acra/util/JSONReportBuilder;->addJSONFromProperty(Lorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_3e
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_3e} :catch_3f
    .catch Lorg/json/JSONException; {:try_start_35 .. :try_end_3e} :catch_6c

    goto :goto_35

    .line 81
    :catch_3f
    move-exception v0

    .line 82
    .local v0, "e":Ljava/io/IOException;
    :try_start_40
    sget-object v8, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v9, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Error while converting "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v3}, Lorg/acra/ReportField;->name()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " to JSON."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v9, v10, v0}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 84
    .end local v0    # "e":Ljava/io/IOException;
    :cond_64
    invoke-virtual {v3}, Lorg/acra/ReportField;->name()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8, v7}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6b
    .catch Lorg/json/JSONException; {:try_start_40 .. :try_end_6b} :catch_6c

    goto :goto_d

    .line 89
    .end local v4    # "line":Ljava/lang/String;
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .end local v6    # "strContent":Ljava/lang/String;
    .end local v7    # "subObject":Lorg/json/JSONObject;
    :catch_6c
    move-exception v0

    .line 90
    .local v0, "e":Lorg/json/JSONException;
    new-instance v8, Lorg/acra/util/JSONReportBuilder$JSONReportException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Could not create JSON object for key "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v0}, Lorg/acra/util/JSONReportBuilder$JSONReportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8

    .line 87
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_86
    :try_start_86
    invoke-virtual {v3}, Lorg/acra/ReportField;->name()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v3}, Lorg/acra/collector/CrashReportData;->getProperty(Lorg/acra/ReportField;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lorg/acra/util/JSONReportBuilder;->guessType(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v2, v8, v9}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_95
    .catch Lorg/json/JSONException; {:try_start_86 .. :try_end_95} :catch_6c

    goto/16 :goto_d

    .line 93
    .end local v3    # "key":Lorg/acra/ReportField;
    :cond_97
    return-object v2
.end method

.method private static guessType(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 156
    const-string v2, "true"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 157
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 170
    :goto_d
    return-object v1

    .line 158
    :cond_e
    const-string v2, "false"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 159
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_d

    .line 161
    :cond_1c
    const-string v2, "(?:^|\\s)([1-9](?:\\d*|(?:\\d{0,2})(?:,\\d{3})*)(?:\\.\\d*[1-9])?|0?\\.\\d*[1-9]|0)(?:\\s|$)"

    invoke-virtual {p0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_30

    .line 162
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v2}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    .line 164
    .local v0, "format":Ljava/text/NumberFormat;
    :try_start_2a
    invoke-virtual {v0, p0}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;)Ljava/lang/Number;
    :try_end_2d
    .catch Ljava/text/ParseException; {:try_start_2a .. :try_end_2d} :catch_2f

    move-result-object v1

    .line 165
    .local v1, "number":Ljava/lang/Number;
    goto :goto_d

    .line 166
    .end local v1    # "number":Ljava/lang/Number;
    :catch_2f
    move-exception v2

    .end local v0    # "format":Ljava/text/NumberFormat;
    :cond_30
    move-object v1, p0

    .line 170
    goto :goto_d
.end method
