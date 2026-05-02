.class public final Lorg/acra/util/JSONReportBuilder;
.super Ljava/lang/Object;
.source "JSONReportBuilder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/acra/util/JSONReportBuilder$JSONReportException;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addJSONFromProperty(Lorg/json/JSONObject;Ljava/lang/String;)V
    .registers 10
    .param p0, "destination"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "propertyString"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 143
    const/16 v5, 0x3d

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 144
    .local v2, "equalsIndex":I
    if-lez v2, :cond_3f

    .line 145
    const/4 v5, 0x0

    invoke-virtual {p1, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 146
    .local v0, "currentKey":Ljava/lang/String;
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 147
    .local v1, "currentValue":Ljava/lang/String;
    invoke-static {v1}, Lorg/acra/util/JSONReportBuilder;->guessType(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 148
    .local v4, "value":Ljava/lang/Object;
    instance-of v5, v4, Ljava/lang/String;

    if-eqz v5, :cond_2e

    .line 149
    check-cast v4, Ljava/lang/String;

    .end local v4    # "value":Ljava/lang/Object;
    const-string v5, "\\\\n"

    const-string v6, "\n"

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 151
    :cond_2e
    const-string v5, "\\."

    invoke-virtual {v0, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 152
    .local v3, "splitKey":[Ljava/lang/String;
    array-length v5, v3

    if-le v5, v7, :cond_3b

    .line 153
    invoke-static {p0, v3, v4}, Lorg/acra/util/JSONReportBuilder;->addJSONSubTree(Lorg/json/JSONObject;[Ljava/lang/String;Ljava/lang/Object;)V

    .line 160
    .end local v0    # "currentKey":Ljava/lang/String;
    .end local v1    # "currentValue":Ljava/lang/String;
    .end local v3    # "splitKey":[Ljava/lang/String;
    :goto_3a
    return-void

    .line 155
    .restart local v0    # "currentKey":Ljava/lang/String;
    .restart local v1    # "currentValue":Ljava/lang/String;
    .restart local v3    # "splitKey":[Ljava/lang/String;
    :cond_3b
    invoke-virtual {p0, v0, v4}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3a

    .line 158
    .end local v0    # "currentKey":Ljava/lang/String;
    .end local v1    # "currentValue":Ljava/lang/String;
    .end local v3    # "splitKey":[Ljava/lang/String;
    :cond_3f
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    goto :goto_3a
.end method

.method private static addJSONSubTree(Lorg/json/JSONObject;[Ljava/lang/String;Ljava/lang/Object;)V
    .registers 12
    .param p0, "destination"    # Lorg/json/JSONObject;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "keys"    # [Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
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

    invoke-interface {v6, v7, v8}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;)I

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
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/acra/util/JSONReportBuilder$JSONReportException;
        }
    .end annotation

    .prologue
    .line 72
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 73
    .local v1, "jsonReport":Lorg/json/JSONObject;
    const/4 v4, 0x0

    .line 74
    .local v4, "reader":Ljava/io/BufferedReader;
    invoke-virtual {p0}, Lorg/acra/collector/CrashReportData;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_e
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_9f

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/acra/ReportField;

    .line 78
    .local v2, "key":Lorg/acra/ReportField;
    :try_start_1a
    invoke-virtual {v2}, Lorg/acra/ReportField;->containsKeyValuePairs()Z

    move-result v9

    if-eqz v9, :cond_70

    .line 79
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 80
    .local v7, "subObject":Lorg/json/JSONObject;
    invoke-virtual {p0, v2}, Lorg/acra/collector/CrashReportData;->getProperty(Lorg/acra/ReportField;)Ljava/lang/String;

    move-result-object v6

    .line 81
    .local v6, "strContent":Ljava/lang/String;
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/StringReader;

    invoke-direct {v9, v6}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    const/16 v10, 0x400

    invoke-direct {v5, v9, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_35
    .catch Lorg/json/JSONException; {:try_start_1a .. :try_end_35} :catch_80
    .catchall {:try_start_1a .. :try_end_35} :catchall_9a

    .line 84
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .local v5, "reader":Ljava/io/BufferedReader;
    :goto_35
    :try_start_35
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    .local v3, "line":Ljava/lang/String;
    if-eqz v3, :cond_64

    .line 85
    invoke-static {v7, v3}, Lorg/acra/util/JSONReportBuilder;->addJSONFromProperty(Lorg/json/JSONObject;Ljava/lang/String;)V
    :try_end_3e
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_3e} :catch_3f
    .catch Lorg/json/JSONException; {:try_start_35 .. :try_end_3e} :catch_a3
    .catchall {:try_start_35 .. :try_end_3e} :catchall_a0

    goto :goto_35

    .line 87
    .end local v3    # "line":Ljava/lang/String;
    :catch_3f
    move-exception v0

    .line 88
    .local v0, "e":Ljava/io/IOException;
    :try_start_40
    sget-object v9, Lorg/acra/ACRA;->log:Lorg/acra/log/ACRALog;

    sget-object v10, Lorg/acra/ACRA;->LOG_TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Error while converting "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v2}, Lorg/acra/ReportField;->name()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " to JSON."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v9, v10, v11, v0}, Lorg/acra/log/ACRALog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 90
    .end local v0    # "e":Ljava/io/IOException;
    :cond_64
    invoke-virtual {v2}, Lorg/acra/ReportField;->name()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9, v7}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_6b
    .catch Lorg/json/JSONException; {:try_start_40 .. :try_end_6b} :catch_a3
    .catchall {:try_start_40 .. :try_end_6b} :catchall_a0

    move-object v4, v5

    .line 98
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .end local v6    # "strContent":Ljava/lang/String;
    .end local v7    # "subObject":Lorg/json/JSONObject;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    :goto_6c
    invoke-static {v4}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    goto :goto_e

    .line 93
    :cond_70
    :try_start_70
    invoke-virtual {v2}, Lorg/acra/ReportField;->name()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v2}, Lorg/acra/collector/CrashReportData;->getProperty(Lorg/acra/ReportField;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lorg/acra/util/JSONReportBuilder;->guessType(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v1, v9, v10}, Lorg/json/JSONObject;->accumulate(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7f
    .catch Lorg/json/JSONException; {:try_start_70 .. :try_end_7f} :catch_80
    .catchall {:try_start_70 .. :try_end_7f} :catchall_9a

    goto :goto_6c

    .line 95
    :catch_80
    move-exception v0

    .line 96
    .local v0, "e":Lorg/json/JSONException;
    :goto_81
    :try_start_81
    new-instance v8, Lorg/acra/util/JSONReportBuilder$JSONReportException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Could not create JSON object for key "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v0}, Lorg/acra/util/JSONReportBuilder$JSONReportException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8
    :try_end_9a
    .catchall {:try_start_81 .. :try_end_9a} :catchall_9a

    .line 98
    .end local v0    # "e":Lorg/json/JSONException;
    :catchall_9a
    move-exception v8

    :goto_9b
    invoke-static {v4}, Lorg/acra/util/IOUtils;->safeClose(Ljava/io/Closeable;)V

    throw v8

    .line 101
    .end local v2    # "key":Lorg/acra/ReportField;
    :cond_9f
    return-object v1

    .line 98
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v2    # "key":Lorg/acra/ReportField;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v6    # "strContent":Ljava/lang/String;
    .restart local v7    # "subObject":Lorg/json/JSONObject;
    :catchall_a0
    move-exception v8

    move-object v4, v5

    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    goto :goto_9b

    .line 95
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    :catch_a3
    move-exception v0

    move-object v4, v5

    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    goto :goto_81
.end method

.method private static guessType(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p0, "value"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 164
    const-string v1, "true"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 165
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    .line 177
    .end local p0    # "value":Ljava/lang/String;
    :cond_d
    :goto_d
    return-object p0

    .line 166
    .restart local p0    # "value":Ljava/lang/String;
    :cond_e
    const-string v1, "false"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 167
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    goto :goto_d

    .line 169
    :cond_1c
    const-string v1, "(?:^|\\s)([1-9](?:\\d*|(?:\\d{0,2})(?:,\\d{3})*)(?:\\.\\d*[1-9])?|0?\\.\\d*[1-9]|0)(?:\\s|$)"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 170
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v1}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v0

    .line 172
    .local v0, "format":Ljava/text/NumberFormat;
    :try_start_2a
    invoke-virtual {v0, p0}, Ljava/text/NumberFormat;->parse(Ljava/lang/String;)Ljava/lang/Number;
    :try_end_2d
    .catch Ljava/text/ParseException; {:try_start_2a .. :try_end_2d} :catch_2f

    move-result-object p0

    goto :goto_d

    .line 173
    :catch_2f
    move-exception v1

    goto :goto_d
.end method
