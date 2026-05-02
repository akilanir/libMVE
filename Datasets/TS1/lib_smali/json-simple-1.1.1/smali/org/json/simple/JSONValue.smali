.class public Lorg/json/simple/JSONValue;
.super Ljava/lang/Object;
.source "JSONValue.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static escape(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 216
    if-nez p0, :cond_4

    .line 217
    const/4 v1, 0x0

    .line 220
    :goto_3
    return-object v1

    .line 218
    :cond_4
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 219
    .local v0, "sb":Ljava/lang/StringBuffer;
    invoke-static {p0, v0}, Lorg/json/simple/JSONValue;->escape(Ljava/lang/String;Ljava/lang/StringBuffer;)V

    .line 220
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_3
.end method

.method static escape(Ljava/lang/String;Ljava/lang/StringBuffer;)V
    .registers 7
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "sb"    # Ljava/lang/StringBuffer;

    .prologue
    .line 228
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_7c

    .line 229
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 230
    .local v0, "ch":C
    sparse-switch v0, :sswitch_data_7e

    .line 257
    if-ltz v0, :cond_14

    const/16 v4, 0x1f

    if-le v0, v4, :cond_24

    :cond_14
    const/16 v4, 0x7f

    if-lt v0, v4, :cond_1c

    const/16 v4, 0x9f

    if-le v0, v4, :cond_24

    :cond_1c
    const/16 v4, 0x2000

    if-lt v0, v4, :cond_78

    const/16 v4, 0x20ff

    if-gt v0, v4, :cond_78

    .line 258
    :cond_24
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    .line 259
    .local v3, "ss":Ljava/lang/String;
    const-string v4, "\\u"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 260
    const/4 v2, 0x0

    .local v2, "k":I
    :goto_2e
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    rsub-int/lit8 v4, v4, 0x4

    if-ge v2, v4, :cond_70

    .line 261
    const/16 v4, 0x30

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 260
    add-int/lit8 v2, v2, 0x1

    goto :goto_2e

    .line 232
    .end local v2    # "k":I
    .end local v3    # "ss":Ljava/lang/String;
    :sswitch_3e
    const-string v4, "\\\""

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 228
    :goto_43
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 235
    :sswitch_46
    const-string v4, "\\\\"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_43

    .line 238
    :sswitch_4c
    const-string v4, "\\b"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_43

    .line 241
    :sswitch_52
    const-string v4, "\\f"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_43

    .line 244
    :sswitch_58
    const-string v4, "\\n"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_43

    .line 247
    :sswitch_5e
    const-string v4, "\\r"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_43

    .line 250
    :sswitch_64
    const-string v4, "\\t"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_43

    .line 253
    :sswitch_6a
    const-string v4, "\\/"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_43

    .line 263
    .restart local v2    # "k":I
    .restart local v3    # "ss":Ljava/lang/String;
    :cond_70
    invoke-virtual {v3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_43

    .line 266
    .end local v2    # "k":I
    .end local v3    # "ss":Ljava/lang/String;
    :cond_78
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_43

    .line 270
    .end local v0    # "ch":C
    :cond_7c
    return-void

    .line 230
    nop

    :sswitch_data_7e
    .sparse-switch
        0x8 -> :sswitch_4c
        0x9 -> :sswitch_64
        0xa -> :sswitch_58
        0xc -> :sswitch_52
        0xd -> :sswitch_5e
        0x22 -> :sswitch_3e
        0x2f -> :sswitch_6a
        0x5c -> :sswitch_46
    .end sparse-switch
.end method

.method public static parse(Ljava/io/Reader;)Ljava/lang/Object;
    .registers 4
    .param p0, "in"    # Ljava/io/Reader;

    .prologue
    .line 41
    :try_start_0
    new-instance v1, Lorg/json/simple/parser/JSONParser;

    invoke-direct {v1}, Lorg/json/simple/parser/JSONParser;-><init>()V

    .line 42
    .local v1, "parser":Lorg/json/simple/parser/JSONParser;
    invoke-virtual {v1, p0}, Lorg/json/simple/parser/JSONParser;->parse(Ljava/io/Reader;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_8} :catch_a

    move-result-object v2

    .line 45
    .end local v1    # "parser":Lorg/json/simple/parser/JSONParser;
    :goto_9
    return-object v2

    .line 44
    :catch_a
    move-exception v0

    .line 45
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_9
.end method

.method public static parse(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 50
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 51
    .local v0, "in":Ljava/io/StringReader;
    invoke-static {v0}, Lorg/json/simple/JSONValue;->parse(Ljava/io/Reader;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static parseWithException(Ljava/io/Reader;)Ljava/lang/Object;
    .registers 3
    .param p0, "in"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/simple/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 72
    new-instance v0, Lorg/json/simple/parser/JSONParser;

    invoke-direct {v0}, Lorg/json/simple/parser/JSONParser;-><init>()V

    .line 73
    .local v0, "parser":Lorg/json/simple/parser/JSONParser;
    invoke-virtual {v0, p0}, Lorg/json/simple/parser/JSONParser;->parse(Ljava/io/Reader;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static parseWithException(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p0, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/simple/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 77
    new-instance v0, Lorg/json/simple/parser/JSONParser;

    invoke-direct {v0}, Lorg/json/simple/parser/JSONParser;-><init>()V

    .line 78
    .local v0, "parser":Lorg/json/simple/parser/JSONParser;
    invoke-virtual {v0, p0}, Lorg/json/simple/parser/JSONParser;->parse(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static toJSONString(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p0, "value"    # Ljava/lang/Object;

    .prologue
    .line 172
    if-nez p0, :cond_5

    .line 173
    const-string v0, "null"

    .line 207
    :goto_4
    return-object v0

    .line 175
    :cond_5
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_29

    .line 176
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    check-cast p0, Ljava/lang/String;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-static {p0}, Lorg/json/simple/JSONValue;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 178
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_29
    instance-of v0, p0, Ljava/lang/Double;

    if-eqz v0, :cond_47

    move-object v0, p0

    .line 179
    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->isInfinite()Z

    move-result v0

    if-nez v0, :cond_3f

    move-object v0, p0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->isNaN()Z

    move-result v0

    if-eqz v0, :cond_42

    .line 180
    :cond_3f
    const-string v0, "null"

    goto :goto_4

    .line 182
    :cond_42
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 185
    :cond_47
    instance-of v0, p0, Ljava/lang/Float;

    if-eqz v0, :cond_65

    move-object v0, p0

    .line 186
    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->isInfinite()Z

    move-result v0

    if-nez v0, :cond_5d

    move-object v0, p0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->isNaN()Z

    move-result v0

    if-eqz v0, :cond_60

    .line 187
    :cond_5d
    const-string v0, "null"

    goto :goto_4

    .line 189
    :cond_60
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 192
    :cond_65
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_6e

    .line 193
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 195
    :cond_6e
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_77

    .line 196
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 198
    :cond_77
    instance-of v0, p0, Lorg/json/simple/JSONAware;

    if-eqz v0, :cond_82

    .line 199
    check-cast p0, Lorg/json/simple/JSONAware;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/json/simple/JSONAware;->toJSONString()Ljava/lang/String;

    move-result-object v0

    goto :goto_4

    .line 201
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_82
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_8e

    .line 202
    check-cast p0, Ljava/util/Map;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-static {p0}, Lorg/json/simple/JSONObject;->toJSONString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_4

    .line 204
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_8e
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_9a

    .line 205
    check-cast p0, Ljava/util/List;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-static {p0}, Lorg/json/simple/JSONArray;->toJSONString(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_4

    .line 207
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_9a
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_4
.end method

.method public static writeJSONString(Ljava/lang/Object;Ljava/io/Writer;)V
    .registers 4
    .param p0, "value"    # Ljava/lang/Object;
    .param p1, "out"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v1, 0x22

    .line 96
    if-nez p0, :cond_a

    .line 97
    const-string v0, "null"

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 155
    .end local p0    # "value":Ljava/lang/Object;
    :goto_9
    return-void

    .line 101
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_a
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_1e

    .line 102
    invoke-virtual {p1, v1}, Ljava/io/Writer;->write(I)V

    .line 103
    check-cast p0, Ljava/lang/String;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-static {p0}, Lorg/json/simple/JSONValue;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 104
    invoke-virtual {p1, v1}, Ljava/io/Writer;->write(I)V

    goto :goto_9

    .line 108
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_1e
    instance-of v0, p0, Ljava/lang/Double;

    if-eqz v0, :cond_42

    move-object v0, p0

    .line 109
    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->isInfinite()Z

    move-result v0

    if-nez v0, :cond_34

    move-object v0, p0

    check-cast v0, Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->isNaN()Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 110
    :cond_34
    const-string v0, "null"

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_9

    .line 112
    :cond_3a
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_9

    .line 116
    :cond_42
    instance-of v0, p0, Ljava/lang/Float;

    if-eqz v0, :cond_66

    move-object v0, p0

    .line 117
    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->isInfinite()Z

    move-result v0

    if-nez v0, :cond_58

    move-object v0, p0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->isNaN()Z

    move-result v0

    if-eqz v0, :cond_5e

    .line 118
    :cond_58
    const-string v0, "null"

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_9

    .line 120
    :cond_5e
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_9

    .line 124
    :cond_66
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_72

    .line 125
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_9

    .line 129
    :cond_72
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_7e

    .line 130
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_9

    .line 134
    :cond_7e
    instance-of v0, p0, Lorg/json/simple/JSONStreamAware;

    if-eqz v0, :cond_88

    .line 135
    check-cast p0, Lorg/json/simple/JSONStreamAware;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-interface {p0, p1}, Lorg/json/simple/JSONStreamAware;->writeJSONString(Ljava/io/Writer;)V

    goto :goto_9

    .line 139
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_88
    instance-of v0, p0, Lorg/json/simple/JSONAware;

    if-eqz v0, :cond_97

    .line 140
    check-cast p0, Lorg/json/simple/JSONAware;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-interface {p0}, Lorg/json/simple/JSONAware;->toJSONString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto/16 :goto_9

    .line 144
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_97
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_a2

    .line 145
    check-cast p0, Ljava/util/Map;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-static {p0, p1}, Lorg/json/simple/JSONObject;->writeJSONString(Ljava/util/Map;Ljava/io/Writer;)V

    goto/16 :goto_9

    .line 149
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_a2
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_ad

    .line 150
    check-cast p0, Ljava/util/List;

    .end local p0    # "value":Ljava/lang/Object;
    invoke-static {p0, p1}, Lorg/json/simple/JSONArray;->writeJSONString(Ljava/util/List;Ljava/io/Writer;)V

    goto/16 :goto_9

    .line 154
    .restart local p0    # "value":Ljava/lang/Object;
    :cond_ad
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto/16 :goto_9
.end method
