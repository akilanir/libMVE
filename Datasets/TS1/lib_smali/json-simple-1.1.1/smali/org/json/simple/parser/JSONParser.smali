.class public Lorg/json/simple/parser/JSONParser;
.super Ljava/lang/Object;
.source "JSONParser.java"


# static fields
.field public static final S_END:I = 0x6

.field public static final S_INIT:I = 0x0

.field public static final S_IN_ARRAY:I = 0x3

.field public static final S_IN_ERROR:I = -0x1

.field public static final S_IN_FINISHED_VALUE:I = 0x1

.field public static final S_IN_OBJECT:I = 0x2

.field public static final S_IN_PAIR_VALUE:I = 0x5

.field public static final S_PASSED_PAIR_KEY:I = 0x4


# instance fields
.field private handlerStatusStack:Ljava/util/LinkedList;

.field private lexer:Lorg/json/simple/parser/Yylex;

.field private status:I

.field private token:Lorg/json/simple/parser/Yytoken;


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v2, Lorg/json/simple/parser/Yylex;

    move-object v0, v1

    check-cast v0, Ljava/io/Reader;

    invoke-direct {v2, v0}, Lorg/json/simple/parser/Yylex;-><init>(Ljava/io/Reader;)V

    iput-object v2, p0, Lorg/json/simple/parser/JSONParser;->lexer:Lorg/json/simple/parser/Yylex;

    .line 35
    iput-object v1, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    .line 36
    const/4 v0, 0x0

    iput v0, p0, Lorg/json/simple/parser/JSONParser;->status:I

    return-void
.end method

.method private createArrayContainer(Lorg/json/simple/parser/ContainerFactory;)Ljava/util/List;
    .registers 3
    .param p1, "containerFactory"    # Lorg/json/simple/parser/ContainerFactory;

    .prologue
    .line 285
    if-nez p1, :cond_8

    .line 286
    new-instance v0, Lorg/json/simple/JSONArray;

    invoke-direct {v0}, Lorg/json/simple/JSONArray;-><init>()V

    .line 291
    :cond_7
    :goto_7
    return-object v0

    .line 287
    :cond_8
    invoke-interface {p1}, Lorg/json/simple/parser/ContainerFactory;->creatArrayContainer()Ljava/util/List;

    move-result-object v0

    .line 289
    .local v0, "l":Ljava/util/List;
    if-nez v0, :cond_7

    .line 290
    new-instance v0, Lorg/json/simple/JSONArray;

    .end local v0    # "l":Ljava/util/List;
    invoke-direct {v0}, Lorg/json/simple/JSONArray;-><init>()V

    goto :goto_7
.end method

.method private createObjectContainer(Lorg/json/simple/parser/ContainerFactory;)Ljava/util/Map;
    .registers 3
    .param p1, "containerFactory"    # Lorg/json/simple/parser/ContainerFactory;

    .prologue
    .line 275
    if-nez p1, :cond_8

    .line 276
    new-instance v0, Lorg/json/simple/JSONObject;

    invoke-direct {v0}, Lorg/json/simple/JSONObject;-><init>()V

    .line 281
    :cond_7
    :goto_7
    return-object v0

    .line 277
    :cond_8
    invoke-interface {p1}, Lorg/json/simple/parser/ContainerFactory;->createObjectContainer()Ljava/util/Map;

    move-result-object v0

    .line 279
    .local v0, "m":Ljava/util/Map;
    if-nez v0, :cond_7

    .line 280
    new-instance v0, Lorg/json/simple/JSONObject;

    .end local v0    # "m":Ljava/util/Map;
    invoke-direct {v0}, Lorg/json/simple/JSONObject;-><init>()V

    goto :goto_7
.end method

.method private nextToken()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/simple/parser/ParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 269
    iget-object v0, p0, Lorg/json/simple/parser/JSONParser;->lexer:Lorg/json/simple/parser/Yylex;

    invoke-virtual {v0}, Lorg/json/simple/parser/Yylex;->yylex()Lorg/json/simple/parser/Yytoken;

    move-result-object v0

    iput-object v0, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    .line 270
    iget-object v0, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    if-nez v0, :cond_15

    .line 271
    new-instance v0, Lorg/json/simple/parser/Yytoken;

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/json/simple/parser/Yytoken;-><init>(ILjava/lang/Object;)V

    iput-object v0, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    .line 272
    :cond_15
    return-void
.end method

.method private peekStatus(Ljava/util/LinkedList;)I
    .registers 4
    .param p1, "statusStack"    # Ljava/util/LinkedList;

    .prologue
    .line 39
    invoke-virtual {p1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-nez v1, :cond_8

    .line 40
    const/4 v1, -0x1

    .line 42
    :goto_7
    return v1

    .line 41
    :cond_8
    invoke-virtual {p1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 42
    .local v0, "status":Ljava/lang/Integer;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    goto :goto_7
.end method


# virtual methods
.method public getPosition()I
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lorg/json/simple/parser/JSONParser;->lexer:Lorg/json/simple/parser/Yylex;

    invoke-virtual {v0}, Lorg/json/simple/parser/Yylex;->getPosition()I

    move-result v0

    return v0
.end method

.method public parse(Ljava/io/Reader;)Ljava/lang/Object;
    .registers 3
    .param p1, "in"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/simple/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 92
    const/4 v0, 0x0

    check-cast v0, Lorg/json/simple/parser/ContainerFactory;

    invoke-virtual {p0, p1, v0}, Lorg/json/simple/parser/JSONParser;->parse(Ljava/io/Reader;Lorg/json/simple/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/io/Reader;Lorg/json/simple/parser/ContainerFactory;)Ljava/lang/Object;
    .registers 15
    .param p1, "in"    # Ljava/io/Reader;
    .param p2, "containerFactory"    # Lorg/json/simple/parser/ContainerFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/simple/parser/ParseException;
        }
    .end annotation

    .prologue
    const/4 v10, -0x1

    const/4 v11, 0x1

    .line 112
    invoke-virtual {p0, p1}, Lorg/json/simple/parser/JSONParser;->reset(Ljava/io/Reader;)V

    .line 113
    new-instance v5, Ljava/util/LinkedList;

    invoke-direct {v5}, Ljava/util/LinkedList;-><init>()V

    .line 114
    .local v5, "statusStack":Ljava/util/LinkedList;
    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    .line 118
    .local v7, "valueStack":Ljava/util/LinkedList;
    :cond_f
    :try_start_f
    invoke-direct {p0}, Lorg/json/simple/parser/JSONParser;->nextToken()V

    .line 119
    iget v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    packed-switch v8, :pswitch_data_1e0

    .line 256
    :goto_17
    :pswitch_17
    iget v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    if-ne v8, v10, :cond_1ce

    .line 257
    new-instance v8, Lorg/json/simple/parser/ParseException;

    invoke-virtual {p0}, Lorg/json/simple/parser/JSONParser;->getPosition()I

    move-result v9

    const/4 v10, 0x1

    iget-object v11, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    invoke-direct {v8, v9, v10, v11}, Lorg/json/simple/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v8
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_28} :catch_28

    .line 261
    :catch_28
    move-exception v0

    .line 262
    .local v0, "ie":Ljava/io/IOException;
    throw v0

    .line 121
    .end local v0    # "ie":Ljava/io/IOException;
    :pswitch_2a
    :try_start_2a
    iget-object v8, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget v8, v8, Lorg/json/simple/parser/Yytoken;->type:I

    packed-switch v8, :pswitch_data_1f0

    .line 138
    :pswitch_31
    const/4 v8, -0x1

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto :goto_17

    .line 123
    :pswitch_35
    const/4 v8, 0x1

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 124
    new-instance v8, Ljava/lang/Integer;

    iget v9, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v8, v9}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v8}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 125
    iget-object v8, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget-object v8, v8, Lorg/json/simple/parser/Yytoken;->value:Ljava/lang/Object;

    invoke-virtual {v7, v8}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto :goto_17

    .line 128
    :pswitch_4a
    const/4 v8, 0x2

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 129
    new-instance v8, Ljava/lang/Integer;

    iget v9, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v8, v9}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v8}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 130
    invoke-direct {p0, p2}, Lorg/json/simple/parser/JSONParser;->createObjectContainer(Lorg/json/simple/parser/ContainerFactory;)Ljava/util/Map;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto :goto_17

    .line 133
    :pswitch_5f
    const/4 v8, 0x3

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 134
    new-instance v8, Ljava/lang/Integer;

    iget v9, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v8, v9}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v8}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 135
    invoke-direct {p0, p2}, Lorg/json/simple/parser/JSONParser;->createArrayContainer(Lorg/json/simple/parser/ContainerFactory;)Ljava/util/List;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto :goto_17

    .line 143
    :pswitch_74
    iget-object v8, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget v8, v8, Lorg/json/simple/parser/Yytoken;->type:I

    if-ne v8, v10, :cond_7f

    .line 144
    invoke-virtual {v7}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v8

    return-object v8

    .line 146
    :cond_7f
    new-instance v8, Lorg/json/simple/parser/ParseException;

    invoke-virtual {p0}, Lorg/json/simple/parser/JSONParser;->getPosition()I

    move-result v9

    const/4 v10, 0x1

    iget-object v11, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    invoke-direct {v8, v9, v10, v11}, Lorg/json/simple/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v8

    .line 149
    :pswitch_8c
    iget-object v8, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget v8, v8, Lorg/json/simple/parser/Yytoken;->type:I

    packed-switch v8, :pswitch_data_1fc

    .line 174
    :pswitch_93
    const/4 v8, -0x1

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto :goto_17

    .line 153
    :pswitch_97
    iget-object v8, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget-object v8, v8, Lorg/json/simple/parser/Yytoken;->value:Ljava/lang/Object;

    instance-of v8, v8, Ljava/lang/String;

    if-eqz v8, :cond_b7

    .line 154
    iget-object v8, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget-object v1, v8, Lorg/json/simple/parser/Yytoken;->value:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    .line 155
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {v7, v1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 156
    const/4 v8, 0x4

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 157
    new-instance v8, Ljava/lang/Integer;

    iget v9, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v8, v9}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v8}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto/16 :goto_17

    .line 160
    .end local v1    # "key":Ljava/lang/String;
    :cond_b7
    const/4 v8, -0x1

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto/16 :goto_17

    .line 164
    :pswitch_bc
    invoke-virtual {v7}, Ljava/util/LinkedList;->size()I

    move-result v8

    if-le v8, v11, :cond_d0

    .line 165
    invoke-virtual {v5}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 166
    invoke-virtual {v7}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 167
    invoke-direct {p0, v5}, Lorg/json/simple/parser/JSONParser;->peekStatus(Ljava/util/LinkedList;)I

    move-result v8

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto/16 :goto_17

    .line 170
    :cond_d0
    const/4 v8, 0x1

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto/16 :goto_17

    .line 180
    :pswitch_d5
    iget-object v8, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget v8, v8, Lorg/json/simple/parser/Yytoken;->type:I

    packed-switch v8, :pswitch_data_20c

    .line 211
    :pswitch_dc
    const/4 v8, -0x1

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto/16 :goto_17

    .line 184
    :pswitch_e1
    invoke-virtual {v5}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 185
    invoke-virtual {v7}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 186
    .restart local v1    # "key":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    .line 187
    .local v4, "parent":Ljava/util/Map;
    iget-object v8, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget-object v8, v8, Lorg/json/simple/parser/Yytoken;->value:Ljava/lang/Object;

    invoke-interface {v4, v1, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    invoke-direct {p0, v5}, Lorg/json/simple/parser/JSONParser;->peekStatus(Ljava/util/LinkedList;)I

    move-result v8

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto/16 :goto_17

    .line 191
    .end local v1    # "key":Ljava/lang/String;
    .end local v4    # "parent":Ljava/util/Map;
    :pswitch_ff
    invoke-virtual {v5}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 192
    invoke-virtual {v7}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 193
    .restart local v1    # "key":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    .line 194
    .restart local v4    # "parent":Ljava/util/Map;
    invoke-direct {p0, p2}, Lorg/json/simple/parser/JSONParser;->createArrayContainer(Lorg/json/simple/parser/ContainerFactory;)Ljava/util/List;

    move-result-object v2

    .line 195
    .local v2, "newArray":Ljava/util/List;
    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    const/4 v8, 0x3

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 197
    new-instance v8, Ljava/lang/Integer;

    iget v9, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v8, v9}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v8}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 198
    invoke-virtual {v7, v2}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto/16 :goto_17

    .line 201
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "newArray":Ljava/util/List;
    .end local v4    # "parent":Ljava/util/Map;
    :pswitch_127
    invoke-virtual {v5}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 202
    invoke-virtual {v7}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 203
    .restart local v1    # "key":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    .line 204
    .restart local v4    # "parent":Ljava/util/Map;
    invoke-direct {p0, p2}, Lorg/json/simple/parser/JSONParser;->createObjectContainer(Lorg/json/simple/parser/ContainerFactory;)Ljava/util/Map;

    move-result-object v3

    .line 205
    .local v3, "newObject":Ljava/util/Map;
    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    const/4 v8, 0x2

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 207
    new-instance v8, Ljava/lang/Integer;

    iget v9, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v8, v9}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v8}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 208
    invoke-virtual {v7, v3}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto/16 :goto_17

    .line 216
    .end local v1    # "key":Ljava/lang/String;
    .end local v3    # "newObject":Ljava/util/Map;
    .end local v4    # "parent":Ljava/util/Map;
    :pswitch_14f
    iget-object v8, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget v8, v8, Lorg/json/simple/parser/Yytoken;->type:I

    packed-switch v8, :pswitch_data_21e

    .line 250
    :pswitch_156
    const/4 v8, -0x1

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto/16 :goto_17

    .line 220
    :pswitch_15b
    invoke-virtual {v7}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 221
    .local v6, "val":Ljava/util/List;
    iget-object v8, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget-object v8, v8, Lorg/json/simple/parser/Yytoken;->value:Ljava/lang/Object;

    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_17

    .line 224
    .end local v6    # "val":Ljava/util/List;
    :pswitch_16a
    invoke-virtual {v7}, Ljava/util/LinkedList;->size()I

    move-result v8

    if-le v8, v11, :cond_17e

    .line 225
    invoke-virtual {v5}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 226
    invoke-virtual {v7}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 227
    invoke-direct {p0, v5}, Lorg/json/simple/parser/JSONParser;->peekStatus(Ljava/util/LinkedList;)I

    move-result v8

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto/16 :goto_17

    .line 230
    :cond_17e
    const/4 v8, 0x1

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto/16 :goto_17

    .line 234
    :pswitch_183
    invoke-virtual {v7}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 235
    .restart local v6    # "val":Ljava/util/List;
    invoke-direct {p0, p2}, Lorg/json/simple/parser/JSONParser;->createObjectContainer(Lorg/json/simple/parser/ContainerFactory;)Ljava/util/Map;

    move-result-object v3

    .line 236
    .restart local v3    # "newObject":Ljava/util/Map;
    invoke-interface {v6, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 237
    const/4 v8, 0x2

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 238
    new-instance v8, Ljava/lang/Integer;

    iget v9, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v8, v9}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v8}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 239
    invoke-virtual {v7, v3}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto/16 :goto_17

    .line 242
    .end local v3    # "newObject":Ljava/util/Map;
    .end local v6    # "val":Ljava/util/List;
    :pswitch_1a2
    invoke-virtual {v7}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 243
    .restart local v6    # "val":Ljava/util/List;
    invoke-direct {p0, p2}, Lorg/json/simple/parser/JSONParser;->createArrayContainer(Lorg/json/simple/parser/ContainerFactory;)Ljava/util/List;

    move-result-object v2

    .line 244
    .restart local v2    # "newArray":Ljava/util/List;
    invoke-interface {v6, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    const/4 v8, 0x3

    iput v8, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 246
    new-instance v8, Ljava/lang/Integer;

    iget v9, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v8, v9}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v8}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 247
    invoke-virtual {v7, v2}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    goto/16 :goto_17

    .line 254
    .end local v2    # "newArray":Ljava/util/List;
    .end local v6    # "val":Ljava/util/List;
    :pswitch_1c1
    new-instance v8, Lorg/json/simple/parser/ParseException;

    invoke-virtual {p0}, Lorg/json/simple/parser/JSONParser;->getPosition()I

    move-result v9

    const/4 v10, 0x1

    iget-object v11, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    invoke-direct {v8, v9, v10, v11}, Lorg/json/simple/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v8

    .line 259
    :cond_1ce
    iget-object v8, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget v8, v8, Lorg/json/simple/parser/Yytoken;->type:I
    :try_end_1d2
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_1d2} :catch_28

    if-ne v8, v10, :cond_f

    .line 265
    new-instance v8, Lorg/json/simple/parser/ParseException;

    invoke-virtual {p0}, Lorg/json/simple/parser/JSONParser;->getPosition()I

    move-result v9

    iget-object v10, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    invoke-direct {v8, v9, v11, v10}, Lorg/json/simple/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v8

    .line 119
    :pswitch_data_1e0
    .packed-switch -0x1
        :pswitch_1c1
        :pswitch_2a
        :pswitch_74
        :pswitch_8c
        :pswitch_14f
        :pswitch_d5
    .end packed-switch

    .line 121
    :pswitch_data_1f0
    .packed-switch 0x0
        :pswitch_35
        :pswitch_4a
        :pswitch_31
        :pswitch_5f
    .end packed-switch

    .line 149
    :pswitch_data_1fc
    .packed-switch 0x0
        :pswitch_97
        :pswitch_93
        :pswitch_bc
        :pswitch_93
        :pswitch_93
        :pswitch_17
    .end packed-switch

    .line 180
    :pswitch_data_20c
    .packed-switch 0x0
        :pswitch_e1
        :pswitch_127
        :pswitch_dc
        :pswitch_ff
        :pswitch_dc
        :pswitch_dc
        :pswitch_17
    .end packed-switch

    .line 216
    :pswitch_data_21e
    .packed-switch 0x0
        :pswitch_15b
        :pswitch_183
        :pswitch_156
        :pswitch_1a2
        :pswitch_16a
        :pswitch_17
    .end packed-switch
.end method

.method public parse(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/simple/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 75
    const/4 v0, 0x0

    check-cast v0, Lorg/json/simple/parser/ContainerFactory;

    invoke-virtual {p0, p1, v0}, Lorg/json/simple/parser/JSONParser;->parse(Ljava/lang/String;Lorg/json/simple/parser/ContainerFactory;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public parse(Ljava/lang/String;Lorg/json/simple/parser/ContainerFactory;)Ljava/lang/Object;
    .registers 8
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "containerFactory"    # Lorg/json/simple/parser/ContainerFactory;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/simple/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 79
    new-instance v1, Ljava/io/StringReader;

    invoke-direct {v1, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 81
    .local v1, "in":Ljava/io/StringReader;
    :try_start_5
    invoke-virtual {p0, v1, p2}, Lorg/json/simple/parser/JSONParser;->parse(Ljava/io/Reader;Lorg/json/simple/parser/ContainerFactory;)Ljava/lang/Object;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_8} :catch_a

    move-result-object v2

    return-object v2

    .line 83
    :catch_a
    move-exception v0

    .line 87
    .local v0, "ie":Ljava/io/IOException;
    new-instance v2, Lorg/json/simple/parser/ParseException;

    const/4 v3, -0x1

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v0}, Lorg/json/simple/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v2
.end method

.method public parse(Ljava/io/Reader;Lorg/json/simple/parser/ContentHandler;)V
    .registers 4
    .param p1, "in"    # Ljava/io/Reader;
    .param p2, "contentHandler"    # Lorg/json/simple/parser/ContentHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/simple/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 312
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/json/simple/parser/JSONParser;->parse(Ljava/io/Reader;Lorg/json/simple/parser/ContentHandler;Z)V

    .line 313
    return-void
.end method

.method public parse(Ljava/io/Reader;Lorg/json/simple/parser/ContentHandler;Z)V
    .registers 15
    .param p1, "in"    # Ljava/io/Reader;
    .param p2, "contentHandler"    # Lorg/json/simple/parser/ContentHandler;
    .param p3, "isResume"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/simple/parser/ParseException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v10, -0x1

    .line 330
    if-nez p3, :cond_2a

    .line 331
    invoke-virtual {p0, p1}, Lorg/json/simple/parser/JSONParser;->reset(Ljava/io/Reader;)V

    .line 332
    new-instance v6, Ljava/util/LinkedList;

    invoke-direct {v6}, Ljava/util/LinkedList;-><init>()V

    iput-object v6, p0, Lorg/json/simple/parser/JSONParser;->handlerStatusStack:Ljava/util/LinkedList;

    .line 342
    :cond_e
    :goto_e
    iget-object v5, p0, Lorg/json/simple/parser/JSONParser;->handlerStatusStack:Ljava/util/LinkedList;

    .line 346
    .local v5, "statusStack":Ljava/util/LinkedList;
    :cond_10
    :try_start_10
    iget v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    packed-switch v6, :pswitch_data_208

    .line 508
    :cond_15
    :goto_15
    :pswitch_15
    iget v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    if-ne v6, v10, :cond_1f3

    .line 509
    new-instance v6, Lorg/json/simple/parser/ParseException;

    invoke-virtual {p0}, Lorg/json/simple/parser/JSONParser;->getPosition()I

    move-result v7

    const/4 v8, 0x1

    iget-object v9, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    invoke-direct {v6, v7, v8, v9}, Lorg/json/simple/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v6
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_26} :catch_26
    .catch Lorg/json/simple/parser/ParseException; {:try_start_10 .. :try_end_26} :catch_4b
    .catch Ljava/lang/RuntimeException; {:try_start_10 .. :try_end_26} :catch_9f
    .catch Ljava/lang/Error; {:try_start_10 .. :try_end_26} :catch_b3

    .line 513
    :catch_26
    move-exception v1

    .line 514
    .local v1, "ie":Ljava/io/IOException;
    iput v10, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 515
    throw v1

    .line 335
    .end local v1    # "ie":Ljava/io/IOException;
    .end local v5    # "statusStack":Ljava/util/LinkedList;
    :cond_2a
    iget-object v6, p0, Lorg/json/simple/parser/JSONParser;->handlerStatusStack:Ljava/util/LinkedList;

    if-nez v6, :cond_e

    .line 336
    const/4 p3, 0x0

    .line 337
    invoke-virtual {p0, p1}, Lorg/json/simple/parser/JSONParser;->reset(Ljava/io/Reader;)V

    .line 338
    new-instance v6, Ljava/util/LinkedList;

    invoke-direct {v6}, Ljava/util/LinkedList;-><init>()V

    iput-object v6, p0, Lorg/json/simple/parser/JSONParser;->handlerStatusStack:Ljava/util/LinkedList;

    goto :goto_e

    .line 348
    .restart local v5    # "statusStack":Ljava/util/LinkedList;
    :pswitch_3a
    :try_start_3a
    invoke-interface {p2}, Lorg/json/simple/parser/ContentHandler;->startJSON()V

    .line 349
    invoke-direct {p0}, Lorg/json/simple/parser/JSONParser;->nextToken()V

    .line 350
    iget-object v6, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget v6, v6, Lorg/json/simple/parser/Yytoken;->type:I

    packed-switch v6, :pswitch_data_21c

    .line 370
    :pswitch_47
    const/4 v6, -0x1

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_4a} :catch_26
    .catch Lorg/json/simple/parser/ParseException; {:try_start_3a .. :try_end_4a} :catch_4b
    .catch Ljava/lang/RuntimeException; {:try_start_3a .. :try_end_4a} :catch_9f
    .catch Ljava/lang/Error; {:try_start_3a .. :try_end_4a} :catch_b3

    goto :goto_15

    .line 517
    :catch_4b
    move-exception v3

    .line 518
    .local v3, "pe":Lorg/json/simple/parser/ParseException;
    iput v10, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 519
    throw v3

    .line 352
    .end local v3    # "pe":Lorg/json/simple/parser/ParseException;
    :pswitch_4f
    const/4 v6, 0x1

    :try_start_50
    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 353
    new-instance v6, Ljava/lang/Integer;

    iget v7, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v6}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 354
    iget-object v6, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget-object v6, v6, Lorg/json/simple/parser/Yytoken;->value:Ljava/lang/Object;

    invoke-interface {p2, v6}, Lorg/json/simple/parser/ContentHandler;->primitive(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_15

    .line 503
    :cond_66
    :goto_66
    :pswitch_66
    return-void

    .line 358
    :pswitch_67
    const/4 v6, 0x2

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 359
    new-instance v6, Ljava/lang/Integer;

    iget v7, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v6}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 360
    invoke-interface {p2}, Lorg/json/simple/parser/ContentHandler;->startObject()Z

    move-result v6

    if-nez v6, :cond_15

    goto :goto_66

    .line 364
    :pswitch_7b
    const/4 v6, 0x3

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 365
    new-instance v6, Ljava/lang/Integer;

    iget v7, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v6}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 366
    invoke-interface {p2}, Lorg/json/simple/parser/ContentHandler;->startArray()Z

    move-result v6

    if-nez v6, :cond_15

    goto :goto_66

    .line 375
    :pswitch_8f
    invoke-direct {p0}, Lorg/json/simple/parser/JSONParser;->nextToken()V

    .line 376
    iget-object v6, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget v6, v6, Lorg/json/simple/parser/Yytoken;->type:I

    if-ne v6, v10, :cond_a3

    .line 377
    invoke-interface {p2}, Lorg/json/simple/parser/ContentHandler;->endJSON()V

    .line 378
    const/4 v6, 0x6

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I
    :try_end_9e
    .catch Ljava/io/IOException; {:try_start_50 .. :try_end_9e} :catch_26
    .catch Lorg/json/simple/parser/ParseException; {:try_start_50 .. :try_end_9e} :catch_4b
    .catch Ljava/lang/RuntimeException; {:try_start_50 .. :try_end_9e} :catch_9f
    .catch Ljava/lang/Error; {:try_start_50 .. :try_end_9e} :catch_b3

    goto :goto_66

    .line 521
    :catch_9f
    move-exception v4

    .line 522
    .local v4, "re":Ljava/lang/RuntimeException;
    iput v10, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 523
    throw v4

    .line 382
    .end local v4    # "re":Ljava/lang/RuntimeException;
    :cond_a3
    const/4 v6, -0x1

    :try_start_a4
    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 383
    new-instance v6, Lorg/json/simple/parser/ParseException;

    invoke-virtual {p0}, Lorg/json/simple/parser/JSONParser;->getPosition()I

    move-result v7

    const/4 v8, 0x1

    iget-object v9, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    invoke-direct {v6, v7, v8, v9}, Lorg/json/simple/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v6
    :try_end_b3
    .catch Ljava/io/IOException; {:try_start_a4 .. :try_end_b3} :catch_26
    .catch Lorg/json/simple/parser/ParseException; {:try_start_a4 .. :try_end_b3} :catch_4b
    .catch Ljava/lang/RuntimeException; {:try_start_a4 .. :try_end_b3} :catch_9f
    .catch Ljava/lang/Error; {:try_start_a4 .. :try_end_b3} :catch_b3

    .line 525
    :catch_b3
    move-exception v0

    .line 526
    .local v0, "e":Ljava/lang/Error;
    iput v10, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 527
    throw v0

    .line 387
    .end local v0    # "e":Ljava/lang/Error;
    :pswitch_b7
    :try_start_b7
    invoke-direct {p0}, Lorg/json/simple/parser/JSONParser;->nextToken()V

    .line 388
    iget-object v6, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget v6, v6, Lorg/json/simple/parser/Yytoken;->type:I

    packed-switch v6, :pswitch_data_228

    .line 415
    :pswitch_c1
    const/4 v6, -0x1

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto/16 :goto_15

    .line 392
    :pswitch_c6
    iget-object v6, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget-object v6, v6, Lorg/json/simple/parser/Yytoken;->value:Ljava/lang/Object;

    instance-of v6, v6, Ljava/lang/String;

    if-eqz v6, :cond_e9

    .line 393
    iget-object v6, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget-object v2, v6, Lorg/json/simple/parser/Yytoken;->value:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    .line 394
    .local v2, "key":Ljava/lang/String;
    const/4 v6, 0x4

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 395
    new-instance v6, Ljava/lang/Integer;

    iget v7, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v6}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 396
    invoke-interface {p2, v2}, Lorg/json/simple/parser/ContentHandler;->startObjectEntry(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_15

    goto/16 :goto_66

    .line 400
    .end local v2    # "key":Ljava/lang/String;
    :cond_e9
    const/4 v6, -0x1

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto/16 :goto_15

    .line 404
    :pswitch_ee
    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v6

    if-le v6, v9, :cond_105

    .line 405
    invoke-virtual {v5}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 406
    invoke-direct {p0, v5}, Lorg/json/simple/parser/JSONParser;->peekStatus(Ljava/util/LinkedList;)I

    move-result v6

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 411
    :goto_fd
    invoke-interface {p2}, Lorg/json/simple/parser/ContentHandler;->endObject()Z

    move-result v6

    if-nez v6, :cond_15

    goto/16 :goto_66

    .line 409
    :cond_105
    const/4 v6, 0x1

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto :goto_fd

    .line 421
    :pswitch_109
    invoke-direct {p0}, Lorg/json/simple/parser/JSONParser;->nextToken()V

    .line 422
    iget-object v6, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget v6, v6, Lorg/json/simple/parser/Yytoken;->type:I

    packed-switch v6, :pswitch_data_238

    .line 450
    :pswitch_113
    const/4 v6, -0x1

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto/16 :goto_15

    .line 426
    :pswitch_118
    invoke-virtual {v5}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 427
    invoke-direct {p0, v5}, Lorg/json/simple/parser/JSONParser;->peekStatus(Ljava/util/LinkedList;)I

    move-result v6

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 428
    iget-object v6, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget-object v6, v6, Lorg/json/simple/parser/Yytoken;->value:Ljava/lang/Object;

    invoke-interface {p2, v6}, Lorg/json/simple/parser/ContentHandler;->primitive(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_66

    .line 430
    invoke-interface {p2}, Lorg/json/simple/parser/ContentHandler;->endObjectEntry()Z

    move-result v6

    if-nez v6, :cond_15

    goto/16 :goto_66

    .line 434
    :pswitch_133
    invoke-virtual {v5}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 435
    new-instance v6, Ljava/lang/Integer;

    const/4 v7, 0x5

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v6}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 436
    const/4 v6, 0x3

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 437
    new-instance v6, Ljava/lang/Integer;

    iget v7, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v6}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 438
    invoke-interface {p2}, Lorg/json/simple/parser/ContentHandler;->startArray()Z

    move-result v6

    if-nez v6, :cond_15

    goto/16 :goto_66

    .line 442
    :pswitch_154
    invoke-virtual {v5}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 443
    new-instance v6, Ljava/lang/Integer;

    const/4 v7, 0x5

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v6}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 444
    const/4 v6, 0x2

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 445
    new-instance v6, Ljava/lang/Integer;

    iget v7, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v6}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 446
    invoke-interface {p2}, Lorg/json/simple/parser/ContentHandler;->startObject()Z

    move-result v6

    if-nez v6, :cond_15

    goto/16 :goto_66

    .line 459
    :pswitch_175
    invoke-virtual {v5}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 460
    invoke-direct {p0, v5}, Lorg/json/simple/parser/JSONParser;->peekStatus(Ljava/util/LinkedList;)I

    move-result v6

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 461
    invoke-interface {p2}, Lorg/json/simple/parser/ContentHandler;->endObjectEntry()Z

    move-result v6

    if-nez v6, :cond_15

    goto/16 :goto_66

    .line 466
    :pswitch_186
    invoke-direct {p0}, Lorg/json/simple/parser/JSONParser;->nextToken()V

    .line 467
    iget-object v6, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget v6, v6, Lorg/json/simple/parser/Yytoken;->type:I

    packed-switch v6, :pswitch_data_24a

    .line 498
    :pswitch_190
    const/4 v6, -0x1

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto/16 :goto_15

    .line 471
    :pswitch_195
    iget-object v6, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget-object v6, v6, Lorg/json/simple/parser/Yytoken;->value:Ljava/lang/Object;

    invoke-interface {p2, v6}, Lorg/json/simple/parser/ContentHandler;->primitive(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_15

    goto/16 :goto_66

    .line 475
    :pswitch_1a1
    invoke-virtual {v5}, Ljava/util/LinkedList;->size()I

    move-result v6

    if-le v6, v9, :cond_1b8

    .line 476
    invoke-virtual {v5}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 477
    invoke-direct {p0, v5}, Lorg/json/simple/parser/JSONParser;->peekStatus(Ljava/util/LinkedList;)I

    move-result v6

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 482
    :goto_1b0
    invoke-interface {p2}, Lorg/json/simple/parser/ContentHandler;->endArray()Z

    move-result v6

    if-nez v6, :cond_15

    goto/16 :goto_66

    .line 480
    :cond_1b8
    const/4 v6, 0x1

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    goto :goto_1b0

    .line 486
    :pswitch_1bc
    const/4 v6, 0x2

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 487
    new-instance v6, Ljava/lang/Integer;

    iget v7, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v6}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 488
    invoke-interface {p2}, Lorg/json/simple/parser/ContentHandler;->startObject()Z

    move-result v6

    if-nez v6, :cond_15

    goto/16 :goto_66

    .line 492
    :pswitch_1d1
    const/4 v6, 0x3

    iput v6, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 493
    new-instance v6, Ljava/lang/Integer;

    iget v7, p0, Lorg/json/simple/parser/JSONParser;->status:I

    invoke-direct {v6, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v5, v6}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    .line 494
    invoke-interface {p2}, Lorg/json/simple/parser/ContentHandler;->startArray()Z

    move-result v6

    if-nez v6, :cond_15

    goto/16 :goto_66

    .line 506
    :pswitch_1e6
    new-instance v6, Lorg/json/simple/parser/ParseException;

    invoke-virtual {p0}, Lorg/json/simple/parser/JSONParser;->getPosition()I

    move-result v7

    const/4 v8, 0x1

    iget-object v9, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    invoke-direct {v6, v7, v8, v9}, Lorg/json/simple/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v6

    .line 511
    :cond_1f3
    iget-object v6, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    iget v6, v6, Lorg/json/simple/parser/Yytoken;->type:I
    :try_end_1f7
    .catch Ljava/io/IOException; {:try_start_b7 .. :try_end_1f7} :catch_26
    .catch Lorg/json/simple/parser/ParseException; {:try_start_b7 .. :try_end_1f7} :catch_4b
    .catch Ljava/lang/RuntimeException; {:try_start_b7 .. :try_end_1f7} :catch_9f
    .catch Ljava/lang/Error; {:try_start_b7 .. :try_end_1f7} :catch_b3

    if-ne v6, v10, :cond_10

    .line 530
    iput v10, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 531
    new-instance v6, Lorg/json/simple/parser/ParseException;

    invoke-virtual {p0}, Lorg/json/simple/parser/JSONParser;->getPosition()I

    move-result v7

    iget-object v8, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    invoke-direct {v6, v7, v9, v8}, Lorg/json/simple/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v6

    .line 346
    nop

    :pswitch_data_208
    .packed-switch -0x1
        :pswitch_1e6
        :pswitch_3a
        :pswitch_8f
        :pswitch_b7
        :pswitch_186
        :pswitch_109
        :pswitch_175
        :pswitch_66
    .end packed-switch

    .line 350
    :pswitch_data_21c
    .packed-switch 0x0
        :pswitch_4f
        :pswitch_67
        :pswitch_47
        :pswitch_7b
    .end packed-switch

    .line 388
    :pswitch_data_228
    .packed-switch 0x0
        :pswitch_c6
        :pswitch_c1
        :pswitch_ee
        :pswitch_c1
        :pswitch_c1
        :pswitch_15
    .end packed-switch

    .line 422
    :pswitch_data_238
    .packed-switch 0x0
        :pswitch_118
        :pswitch_154
        :pswitch_113
        :pswitch_133
        :pswitch_113
        :pswitch_113
        :pswitch_15
    .end packed-switch

    .line 467
    :pswitch_data_24a
    .packed-switch 0x0
        :pswitch_195
        :pswitch_1bc
        :pswitch_190
        :pswitch_1d1
        :pswitch_1a1
        :pswitch_15
    .end packed-switch
.end method

.method public parse(Ljava/lang/String;Lorg/json/simple/parser/ContentHandler;)V
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "contentHandler"    # Lorg/json/simple/parser/ContentHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/simple/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 295
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lorg/json/simple/parser/JSONParser;->parse(Ljava/lang/String;Lorg/json/simple/parser/ContentHandler;Z)V

    .line 296
    return-void
.end method

.method public parse(Ljava/lang/String;Lorg/json/simple/parser/ContentHandler;Z)V
    .registers 9
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "contentHandler"    # Lorg/json/simple/parser/ContentHandler;
    .param p3, "isResume"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/simple/parser/ParseException;
        }
    .end annotation

    .prologue
    .line 299
    new-instance v1, Ljava/io/StringReader;

    invoke-direct {v1, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 301
    .local v1, "in":Ljava/io/StringReader;
    :try_start_5
    invoke-virtual {p0, v1, p2, p3}, Lorg/json/simple/parser/JSONParser;->parse(Ljava/io/Reader;Lorg/json/simple/parser/ContentHandler;Z)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_8} :catch_9

    .line 309
    return-void

    .line 303
    :catch_9
    move-exception v0

    .line 307
    .local v0, "ie":Ljava/io/IOException;
    new-instance v2, Lorg/json/simple/parser/ParseException;

    const/4 v3, -0x1

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4, v0}, Lorg/json/simple/parser/ParseException;-><init>(IILjava/lang/Object;)V

    throw v2
.end method

.method public reset()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 50
    iput-object v1, p0, Lorg/json/simple/parser/JSONParser;->token:Lorg/json/simple/parser/Yytoken;

    .line 51
    const/4 v0, 0x0

    iput v0, p0, Lorg/json/simple/parser/JSONParser;->status:I

    .line 52
    iput-object v1, p0, Lorg/json/simple/parser/JSONParser;->handlerStatusStack:Ljava/util/LinkedList;

    .line 53
    return-void
.end method

.method public reset(Ljava/io/Reader;)V
    .registers 3
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    .line 63
    iget-object v0, p0, Lorg/json/simple/parser/JSONParser;->lexer:Lorg/json/simple/parser/Yylex;

    invoke-virtual {v0, p1}, Lorg/json/simple/parser/Yylex;->yyreset(Ljava/io/Reader;)V

    .line 64
    invoke-virtual {p0}, Lorg/json/simple/parser/JSONParser;->reset()V

    .line 65
    return-void
.end method
