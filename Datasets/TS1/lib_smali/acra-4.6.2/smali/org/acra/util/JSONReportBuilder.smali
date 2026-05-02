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
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 230
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

    .line 142
    const/16 v6, 0x3d

    invoke-virtual {p1, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 143
    .local v2, "equalsIndex":I
    if-lez v2, :cond_40

    .line 144
    move-object v3, p0

    .line 145
    .local v3, "finalObject":Lorg/json/JSONObject;
    const/4 v6, 0x0

    invoke-virtual {p1, v6, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 146
    .local v0, "currentKey":Ljava/lang/String;
    add-int/lit8 v6, v2, 0x1

    invoke-virtual {p1, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 147
    .local v1, "currentValue":Ljava/lang/String;
    invoke-static {v1}, Lorg/acra/util/JSONReportBuilder;->guessType(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 148
    .local v5, "value":Ljava/lang/Object;
    instance-of v6, v5, Ljava/lang/String;

    if-eqz v6, :cond_2f

    .line 149
    check-cast v5, Ljava/lang/String;

    .end local v5    # "value":Ljava/lang/Object;
    const-string v6, "\\\\n"

    const-string v7, "\n"

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 151
    :cond_2f
    const-string v6, "\\."

    invoke-virtual {v0, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 152
    .local v4, "splitKey":[Ljava/lang/String;
    array-length v6, v4

    if-le v6, v8, :cond_3c

    .line 153
    invoke-static {v3, v4, v5}, Lorg/acra/util/JSONReportBuilder;->addJSONSubTree(Lorg/json/JSONObject;[Ljava/lang/String;Ljava/lang/Object;)V

    .line 160
    .end local v0    # "currentKey":Ljava/lang/String;
    .end local v1    # "currentValue":Ljava/lang/String;
    .end local v3    # "finalObject":Lorg/json/JSONObject;
    .end local v4    # "splitKey":[Ljava/lang/String;
    :goto_3b
    return-void

    .line 155
    .restart local v0    # "currentKey":Ljava/lang/String;
    .restart local v1    # "currentValue":Ljava/lang/String;
    .restart local v3    # "finalObject":Lorg/json/JSONObject;
    .restart local v4    # "splitKey":[Ljava/lang/String;
    :cond_3c
    invoke-virtual {v3, v0, v5}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3b

    .line 158
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
    .registers 12
    .param p0, "destination"    # Lorg/json/JSONObject;
    .param p1, "keys"    # [Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 194
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v6, p1

    if-ge v0, v6, :cond_35

    .line 195
    aget-object v3, p1, v0

    .line 196
    .local v3, "subKey":Ljava/lang/String;
    array-length v6, p1

    add-int/lit8 v6, v6, -0x1

    if-ge v0, v6, :cond_4e

    .line 197
    const/4 v1, 0x0

    .line 198
    .local v1, "intermediate":Lorg/json/JSONObject;
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1e

    .line 199
    new-instance v1, Lorg/json/JSONObject;

    .end local v1    # "intermediate":Lorg/json/JSONObject;
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 200
    .restart local v1    # "intermediate":Lorg/json/JSONObject;
    invoke-virtual {p0, v3, v1}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 223
    :cond_1a
    move-object p0, v1

    .line 194
    .end local v1    # "intermediate":Lorg/json/JSONObject;
    :goto_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 202
    .restart local v1    # "intermediate":Lorg/json/JSONObject;
    :cond_1e
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 203
    .local v4, "target":Ljava/lang/Object;
    instance-of v6, v4, Lorg/json/JSONObject;

    if-eqz v6, :cond_36

    .line 204
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 217
    :cond_2a
    if-nez v1, :cond_1a

    .line 218
    sget-object v6, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v7, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    const-string v8, "Unknown json subtree type, see issue #186"

    invoke-interface {v6, v7, v8}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    .end local v1    # "intermediate":Lorg/json/JSONObject;
    .end local v3    # "subKey":Ljava/lang/String;
    .end local v4    # "target":Ljava/lang/Object;
    :cond_35
    return-void

    .line 205
    .restart local v1    # "intermediate":Lorg/json/JSONObject;
    .restart local v3    # "subKey":Ljava/lang/String;
    .restart local v4    # "target":Ljava/lang/Object;
    :cond_36
    instance-of v6, v4, Lorg/json/JSONArray;

    if-eqz v6, :cond_2a

    .line 207
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 208
    .local v5, "wildCard":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_3f
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v2, v6, :cond_2a

    .line 209
    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    .line 210
    if-nez v1, :cond_2a

    .line 208
    add-int/lit8 v2, v2, 0x1

    goto :goto_3f

    .line 225
    .end local v1    # "intermediate":Lorg/json/JSONObject;
    .end local v2    # "j":I
    .end local v4    # "target":Ljava/lang/Object;
    .end local v5    # "wildCard":Lorg/json/JSONArray;
    :cond_4e
    invoke-virtual {p0, v3, p2}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1b
.end method

.method public static buildJSONReport(Lorg/acra/collector/CrashReportData;)Lorg/json/JSONObject;
    .registers 14
    .param p0, "errorContent"    # Lorg/acra/collector/CrashReportData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/acra/util/JSONReportBuilder$JSONReportException;
        }
    .end annotation

    .prologue
    .line 71
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 72
    .local v2, "jsonReport":Lorg/json/JSONObject;
    const/4 v5, 0x0

    .line 73
    .local v5, "reader":Ljava/io/BufferedReader;
    invoke-virtual {p0}, Lorg/acra/collector/CrashReportData;->keySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_a0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/acra/ReportField;

    .line 77
    .local v3, "key":Lorg/acra/ReportField;
    :try_start_1a
    invoke-virtual {v3}, Lorg/acra/ReportField;->containsKeyValuePairs()Z

    move-result v9

    if-eqz v9, :cond_71

    .line 78
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 79
    .local v8, "subObject":Lorg/json/JSONObject;
    invoke-virtual {p0, v3}, Lorg/acra/collector/CrashReportData;->getProperty(Lorg/acra/ReportField;)Ljava/lang/String;

    move-result-object v7

    .line 80
    .local v7, "strContent":Ljava/lang/String;
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/StringReader;

    invoke-direct {v9, v7}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    const/16 v10, 0x400

    invoke-direct {v6, v9, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_35
    .catch Lorg/json/JSONException; {:try_start_1a .. :try_end_35} :catch_81
    .catchall {:try_start_1a .. :try_end_35} :catchall_9b

    .line 81
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .local v6, "reader":Ljava/io/BufferedReader;
    const/4 v4, 0x0

    .line 83
    .local v4, "line":Ljava/lang/String;
    :goto_36
    :try_start_36
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_65

    .line 84
    invoke-static {v8, v4}, Lorg/acra/util/JSONReportBuilder;->addJSONFromProperty(Lorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_3f} :catch_40
    .catch Lorg/json/JSONException; {:try_start_36 .. :try_end_3f} :catch_a4
    .catchall {:try_start_36 .. :try_end_3f} :catchall_a1

    goto :goto_36

    .line 86
    :catch_40
    move-exception v0

    .line 87
    .local v0, "e":Ljava/io/IOException;
    :try_start_41
    sget-object v9, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v10, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Error while converting "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v3}, Lorg/acra/ReportField;->name()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " to JSON."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v9, v10, v11, v0}, Lorg/acra/log/ACRALog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 89
    .end local v0    # "e":Ljava/io/IOException;
    :cond_65
    invoke-virtual {v3}, Lorg/acra/ReportField;->name()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9, v8}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6c
    .catch Lorg/json/JSONException; {:try_start_41 .. :try_end_6c} :catch_a4
    .catchall {:try_start_41 .. :try_end_6c} :catchall_a1

    move-object v5, v6

    .line 97
    .end local v4    # "line":Ljava/lang/String;
    .end local v6    # "reader":Ljava/io/BufferedReader;
    .end local v7    # "strContent":Ljava/lang/String;
    .end local v8    # "subObject":Lorg/json/JSONObject;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    :goto_6d
    invoke-static {v5}, Lorg/acra/collector/CollectorUtil;->safeClose(Ljava/io/Reader;)V

    goto :goto_e

    .line 92
    :cond_71
    :try_start_71
    invoke-virtual {v3}, Lorg/acra/ReportField;->name()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v3}, Lorg/acra/collector/CrashReportData;->getProperty(Lorg/acra/ReportField;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lorg/acra/util/JSONReportBuilder;->guessType(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v2, v9, v10}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_80
    .catch Lorg/json/JSONException; {:try_start_71 .. :try_end_80} :catch_81
    .catchall {:try_start_71 .. :try_end_80} :catchall_9b

    goto :goto_6d

    .line 94
    :catch_81
    move-exception v0

    .line 95
    .local v0, "e":Lorg/json/JSONException;
    :goto_82
    :try_start_82
    new-instance v9, Lorg/acra/util/JSONReportBuilder$JSONReportException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Could not create JSON object for key "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v0}, Lorg/acra/util/JSONReportBuilder$JSONReportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9
    :try_end_9b
    .catchall {:try_start_82 .. :try_end_9b} :catchall_9b

    .line 97
    .end local v0    # "e":Lorg/json/JSONException;
    :catchall_9b
    move-exception v9

    :goto_9c
    invoke-static {v5}, Lorg/acra/collector/CollectorUtil;->safeClose(Ljava/io/Reader;)V

    throw v9

    .line 100
    .end local v3    # "key":Lorg/acra/ReportField;
    :cond_a0
    return-object v2

    .line 97
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v3    # "key":Lorg/acra/ReportField;
    .restart local v4    # "line":Ljava/lang/String;
    .restart local v6    # "reader":Ljava/io/BufferedReader;
    .restart local v7    # "strContent":Ljava/lang/String;
    .restart local v8    # "subObject":Lorg/json/JSONObject;
    :catchall_a1
    move-exception v9

    move-object v5, v6

    .end local v6    # "reader":Ljava/io/BufferedReader;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    goto :goto_9c

    .line 94
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v6    # "reader":Ljava/io/BufferedReader;
    :catch_a4
    move-exception v0

    move-object v5, v6

    .end local v6    # "reader":Ljava/io/BufferedReader;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    goto :goto_82
.end method

.method private static guessType(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 163
    const-string v2, "true"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 164
    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    .line 177
    :goto_d
    return-object v1

    .line 165
    :cond_e
    const-string v2, "false"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 166
    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_d

    .line 168
    :cond_1c
    const-string v2, "(?:^|\\s)([1-9](?:\\d*|(?:\\d{0,2})(?:,\\d{3})*)(?:\\.\\d*[1-9])?|0?\\.\\d*[1-9]|0)(?:\\s|$)"

    invoke-virtual {p0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_30

    .line 169
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v2}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    .line 171
    .local v0, "format":Ljava/text/NumberFormat;
    :try_start_2a
    invoke-virtual {v0, p0}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;)Ljava/lang/Number;
    :try_end_2d
    .catch Ljava/text/ParseException; {:try_start_2a .. :try_end_2d} :catch_2f

    move-result-object v1

    .line 172
    .local v1, "number":Ljava/lang/Number;
    goto :goto_d

    .line 173
    .end local v1    # "number":Ljava/lang/Number;
    :catch_2f
    move-exception v2

    .end local v0    # "format":Ljava/text/NumberFormat;
    :cond_30
    move-object v1, p0

    .line 177
    goto :goto_d
.end method
