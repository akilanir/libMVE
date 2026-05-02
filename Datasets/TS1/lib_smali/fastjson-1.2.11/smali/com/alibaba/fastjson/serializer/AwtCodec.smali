.class public Lcom/alibaba/fastjson/serializer/AwtCodec;
.super Ljava/lang/Object;
.source "AwtCodec.java"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static final instance:Lcom/alibaba/fastjson/serializer/AwtCodec;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 19
    new-instance v0, Lcom/alibaba/fastjson/serializer/AwtCodec;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/AwtCodec;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/serializer/AwtCodec;->instance:Lcom/alibaba/fastjson/serializer/AwtCodec;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static support(Ljava/lang/Class;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 22
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/awt/Point;

    if-eq p0, v0, :cond_10

    const-class v0, Ljava/awt/Rectangle;

    if-eq p0, v0, :cond_10

    const-class v0, Ljava/awt/Font;

    if-eq p0, v0, :cond_10

    const-class v0, Ljava/awt/Color;

    if-ne p0, v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method


# virtual methods
.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p2, "type"    # Ljava/lang/reflect/Type;
    .param p3, "fieldName"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/alibaba/fastjson/parser/DefaultJSONParser;",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    const/16 v3, 0x10

    .line 96
    iget-object v0, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 98
    .local v0, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_11

    .line 99
    invoke-interface {v0, v3}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 100
    const/4 v1, 0x0

    .line 121
    :goto_10
    return-object v1

    .line 103
    :cond_11
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v1

    const/16 v2, 0xc

    if-eq v1, v2, :cond_27

    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v1

    if-eq v1, v3, :cond_27

    .line 104
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    const-string v2, "syntax error"

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 106
    :cond_27
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 108
    const-class v1, Ljava/awt/Point;

    if-ne p2, v1, :cond_33

    .line 109
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/AwtCodec;->parsePoint(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/awt/Point;

    move-result-object v1

    goto :goto_10

    .line 112
    :cond_33
    const-class v1, Ljava/awt/Rectangle;

    if-ne p2, v1, :cond_3c

    .line 113
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/AwtCodec;->parseRectangle(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/awt/Rectangle;

    move-result-object v1

    goto :goto_10

    .line 116
    :cond_3c
    const-class v1, Ljava/awt/Color;

    if-ne p2, v1, :cond_45

    .line 117
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/AwtCodec;->parseColor(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/awt/Color;

    move-result-object v1

    goto :goto_10

    .line 120
    :cond_45
    const-class v1, Ljava/awt/Font;

    if-ne p2, v1, :cond_4e

    .line 121
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/serializer/AwtCodec;->parseFont(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/awt/Font;

    move-result-object v1

    goto :goto_10

    .line 124
    :cond_4e
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "not support awt class : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 321
    const/16 v0, 0xc

    return v0
.end method

.method protected parseColor(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/awt/Color;
    .registers 13
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    .prologue
    const/4 v10, 0x4

    const/4 v9, 0x2

    .line 181
    iget-object v4, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 183
    .local v4, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    const/4 v5, 0x0

    .local v5, "r":I
    const/4 v2, 0x0

    .local v2, "g":I
    const/4 v1, 0x0

    .local v1, "b":I
    const/4 v0, 0x0

    .line 185
    .local v0, "alpha":I
    :cond_8
    :goto_8
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v7

    const/16 v8, 0xd

    if-ne v7, v8, :cond_19

    .line 186
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 223
    new-instance v7, Ljava/awt/Color;

    invoke-direct {v7, v5, v2, v1, v0}, Ljava/awt/Color;-><init>(IIII)V

    return-object v7

    .line 191
    :cond_19
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v7

    if-ne v7, v10, :cond_48

    .line 192
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v3

    .line 193
    .local v3, "key":Ljava/lang/String;
    invoke-interface {v4, v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 199
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v7

    if-ne v7, v9, :cond_50

    .line 200
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    move-result v6

    .line 201
    .local v6, "val":I
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 206
    const-string v7, "r"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_58

    .line 207
    move v5, v6

    .line 218
    :goto_3c
    invoke-interface {v4}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v7

    const/16 v8, 0x10

    if-ne v7, v8, :cond_8

    .line 219
    invoke-interface {v4, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_8

    .line 195
    .end local v3    # "key":Ljava/lang/String;
    .end local v6    # "val":I
    :cond_48
    new-instance v7, Lcom/alibaba/fastjson/JSONException;

    const-string v8, "syntax error"

    invoke-direct {v7, v8}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 203
    .restart local v3    # "key":Ljava/lang/String;
    :cond_50
    new-instance v7, Lcom/alibaba/fastjson/JSONException;

    const-string v8, "syntax error"

    invoke-direct {v7, v8}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 208
    .restart local v6    # "val":I
    :cond_58
    const-string v7, "g"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_62

    .line 209
    move v2, v6

    goto :goto_3c

    .line 210
    :cond_62
    const-string v7, "b"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6c

    .line 211
    move v1, v6

    goto :goto_3c

    .line 212
    :cond_6c
    const-string v7, "alpha"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_76

    .line 213
    move v0, v6

    goto :goto_3c

    .line 215
    :cond_76
    new-instance v7, Lcom/alibaba/fastjson/JSONException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "syntax error, "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method protected parseFont(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/awt/Font;
    .registers 11
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x2

    .line 128
    iget-object v1, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 130
    .local v1, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    const/4 v3, 0x0

    .local v3, "size":I
    const/4 v4, 0x0

    .line 131
    .local v4, "style":I
    const/4 v2, 0x0

    .line 133
    .local v2, "name":Ljava/lang/String;
    :cond_7
    :goto_7
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v5

    const/16 v6, 0xd

    if-ne v5, v6, :cond_18

    .line 134
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 177
    new-instance v5, Ljava/awt/Font;

    invoke-direct {v5, v2, v4, v3}, Ljava/awt/Font;-><init>(Ljava/lang/String;II)V

    return-object v5

    .line 139
    :cond_18
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v5

    if-ne v5, v8, :cond_46

    .line 140
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, "key":Ljava/lang/String;
    invoke-interface {v1, v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 147
    const-string v5, "name"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_56

    .line 148
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v5

    if-ne v5, v8, :cond_4e

    .line 149
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v2

    .line 150
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 172
    :goto_3a
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v5

    const/16 v6, 0x10

    if-ne v5, v6, :cond_7

    .line 173
    invoke-interface {v1, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_7

    .line 143
    .end local v0    # "key":Ljava/lang/String;
    :cond_46
    new-instance v5, Lcom/alibaba/fastjson/JSONException;

    const-string v6, "syntax error"

    invoke-direct {v5, v6}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 152
    .restart local v0    # "key":Ljava/lang/String;
    :cond_4e
    new-instance v5, Lcom/alibaba/fastjson/JSONException;

    const-string v6, "syntax error"

    invoke-direct {v5, v6}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 154
    :cond_56
    const-string v5, "style"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_74

    .line 155
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v5

    if-ne v5, v7, :cond_6c

    .line 156
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    move-result v4

    .line 157
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    goto :goto_3a

    .line 159
    :cond_6c
    new-instance v5, Lcom/alibaba/fastjson/JSONException;

    const-string v6, "syntax error"

    invoke-direct {v5, v6}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 161
    :cond_74
    const-string v5, "size"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_92

    .line 162
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v5

    if-ne v5, v7, :cond_8a

    .line 163
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    move-result v3

    .line 164
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    goto :goto_3a

    .line 166
    :cond_8a
    new-instance v5, Lcom/alibaba/fastjson/JSONException;

    const-string v6, "syntax error"

    invoke-direct {v5, v6}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 169
    :cond_92
    new-instance v5, Lcom/alibaba/fastjson/JSONException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "syntax error, "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method protected parsePoint(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/awt/Point;
    .registers 11
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x2

    .line 273
    iget-object v1, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 275
    .local v1, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    const/4 v3, 0x0

    .local v3, "x":I
    const/4 v4, 0x0

    .line 277
    .local v4, "y":I
    :cond_6
    :goto_6
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v5

    const/16 v6, 0xd

    if-ne v5, v6, :cond_17

    .line 278
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 317
    new-instance v5, Ljava/awt/Point;

    invoke-direct {v5, v3, v4}, Ljava/awt/Point;-><init>(II)V

    return-object v5

    .line 283
    :cond_17
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v5

    if-ne v5, v8, :cond_54

    .line 284
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v0

    .line 286
    .local v0, "key":Ljava/lang/String;
    sget-object v5, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2f

    .line 287
    const-string v5, "java.awt.Point"

    invoke-virtual {p1, v5}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->acceptType(Ljava/lang/String;)V

    goto :goto_6

    .line 291
    :cond_2f
    invoke-interface {v1, v7}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 297
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v5

    if-ne v5, v7, :cond_5c

    .line 298
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    move-result v2

    .line 299
    .local v2, "val":I
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 304
    const-string v5, "x"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_79

    .line 305
    move v3, v2

    .line 312
    :goto_48
    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v5

    const/16 v6, 0x10

    if-ne v5, v6, :cond_6

    .line 313
    invoke-interface {v1, v8}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_6

    .line 293
    .end local v0    # "key":Ljava/lang/String;
    .end local v2    # "val":I
    :cond_54
    new-instance v5, Lcom/alibaba/fastjson/JSONException;

    const-string v6, "syntax error"

    invoke-direct {v5, v6}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 301
    .restart local v0    # "key":Ljava/lang/String;
    :cond_5c
    new-instance v5, Lcom/alibaba/fastjson/JSONException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "syntax error : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v1}, Lcom/alibaba/fastjson/parser/JSONLexer;->tokenName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 306
    .restart local v2    # "val":I
    :cond_79
    const-string v5, "y"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_83

    .line 307
    move v4, v2

    goto :goto_48

    .line 309
    :cond_83
    new-instance v5, Lcom/alibaba/fastjson/JSONException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "syntax error, "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method protected parseRectangle(Lcom/alibaba/fastjson/parser/DefaultJSONParser;)Ljava/awt/Rectangle;
    .registers 13
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;

    .prologue
    const/4 v10, 0x4

    const/4 v9, 0x2

    .line 227
    iget-object v2, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 229
    .local v2, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    const/4 v5, 0x0

    .local v5, "x":I
    const/4 v6, 0x0

    .local v6, "y":I
    const/4 v4, 0x0

    .local v4, "width":I
    const/4 v0, 0x0

    .line 231
    .local v0, "height":I
    :cond_8
    :goto_8
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v7

    const/16 v8, 0xd

    if-ne v7, v8, :cond_19

    .line 232
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 269
    new-instance v7, Ljava/awt/Rectangle;

    invoke-direct {v7, v5, v6, v4, v0}, Ljava/awt/Rectangle;-><init>(IIII)V

    return-object v7

    .line 237
    :cond_19
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v7

    if-ne v7, v10, :cond_48

    .line 238
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->stringVal()Ljava/lang/String;

    move-result-object v1

    .line 239
    .local v1, "key":Ljava/lang/String;
    invoke-interface {v2, v9}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextTokenWithColon(I)V

    .line 245
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v7

    if-ne v7, v9, :cond_50

    .line 246
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->intValue()I

    move-result v3

    .line 247
    .local v3, "val":I
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken()V

    .line 252
    const-string v7, "x"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_58

    .line 253
    move v5, v3

    .line 264
    :goto_3c
    invoke-interface {v2}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v7

    const/16 v8, 0x10

    if-ne v7, v8, :cond_8

    .line 265
    invoke-interface {v2, v10}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    goto :goto_8

    .line 241
    .end local v1    # "key":Ljava/lang/String;
    .end local v3    # "val":I
    :cond_48
    new-instance v7, Lcom/alibaba/fastjson/JSONException;

    const-string v8, "syntax error"

    invoke-direct {v7, v8}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 249
    .restart local v1    # "key":Ljava/lang/String;
    :cond_50
    new-instance v7, Lcom/alibaba/fastjson/JSONException;

    const-string v8, "syntax error"

    invoke-direct {v7, v8}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 254
    .restart local v3    # "val":I
    :cond_58
    const-string v7, "y"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_62

    .line 255
    move v6, v3

    goto :goto_3c

    .line 256
    :cond_62
    const-string v7, "width"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6c

    .line 257
    move v4, v3

    goto :goto_3c

    .line 258
    :cond_6c
    const-string v7, "height"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_76

    .line 259
    move v0, v3

    goto :goto_3c

    .line 261
    :cond_76
    new-instance v7, Lcom/alibaba/fastjson/JSONException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "syntax error, "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 15
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
    const/16 v8, 0x2c

    .line 31
    iget-object v2, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 33
    .local v2, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    if-nez p2, :cond_a

    .line 34
    invoke-virtual {v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull()V

    .line 81
    :goto_9
    return-void

    .line 38
    :cond_a
    const/16 v4, 0x7b

    .line 40
    .local v4, "sep":C
    instance-of v5, p2, Ljava/awt/Point;

    if-eqz v5, :cond_31

    move-object v1, p2

    .line 41
    check-cast v1, Ljava/awt/Point;

    .line 43
    .local v1, "font":Ljava/awt/Point;
    const-class v5, Ljava/awt/Point;

    invoke-virtual {p0, v2, v5, v4}, Lcom/alibaba/fastjson/serializer/AwtCodec;->writeClassName(Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/lang/Class;C)C

    move-result v4

    .line 45
    const-string v5, "x"

    invoke-virtual {v1}, Ljava/awt/Point;->getX()D

    move-result-wide v6

    invoke-virtual {v2, v4, v5, v6, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;D)V

    .line 46
    const-string v5, "y"

    invoke-virtual {v1}, Ljava/awt/Point;->getY()D

    move-result-wide v6

    invoke-virtual {v2, v8, v5, v6, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;D)V

    .line 79
    .end local v1    # "font":Ljava/awt/Point;
    :cond_2b
    :goto_2b
    const/16 v5, 0x7d

    invoke-virtual {v2, v5}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_9

    .line 47
    :cond_31
    instance-of v5, p2, Ljava/awt/Font;

    if-eqz v5, :cond_5a

    move-object v1, p2

    .line 48
    check-cast v1, Ljava/awt/Font;

    .line 50
    .local v1, "font":Ljava/awt/Font;
    const-class v5, Ljava/awt/Font;

    invoke-virtual {p0, v2, v5, v4}, Lcom/alibaba/fastjson/serializer/AwtCodec;->writeClassName(Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/lang/Class;C)C

    move-result v4

    .line 52
    const-string v5, "name"

    invoke-virtual {v1}, Ljava/awt/Font;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v4, v5, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;Ljava/lang/String;)V

    .line 53
    const-string v5, "style"

    invoke-virtual {v1}, Ljava/awt/Font;->getStyle()I

    move-result v6

    invoke-virtual {v2, v8, v5, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 54
    const-string v5, "size"

    invoke-virtual {v1}, Ljava/awt/Font;->getSize()I

    move-result v6

    invoke-virtual {v2, v8, v5, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    goto :goto_2b

    .line 55
    .end local v1    # "font":Ljava/awt/Font;
    :cond_5a
    instance-of v5, p2, Ljava/awt/Rectangle;

    if-eqz v5, :cond_8c

    move-object v3, p2

    .line 56
    check-cast v3, Ljava/awt/Rectangle;

    .line 58
    .local v3, "rectangle":Ljava/awt/Rectangle;
    const-class v5, Ljava/awt/Rectangle;

    invoke-virtual {p0, v2, v5, v4}, Lcom/alibaba/fastjson/serializer/AwtCodec;->writeClassName(Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/lang/Class;C)C

    move-result v4

    .line 60
    const-string v5, "x"

    invoke-virtual {v3}, Ljava/awt/Rectangle;->getX()D

    move-result-wide v6

    invoke-virtual {v2, v4, v5, v6, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;D)V

    .line 61
    const-string v5, "y"

    invoke-virtual {v3}, Ljava/awt/Rectangle;->getY()D

    move-result-wide v6

    invoke-virtual {v2, v8, v5, v6, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;D)V

    .line 62
    const-string v5, "width"

    invoke-virtual {v3}, Ljava/awt/Rectangle;->getWidth()D

    move-result-wide v6

    invoke-virtual {v2, v8, v5, v6, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;D)V

    .line 63
    const-string v5, "height"

    invoke-virtual {v3}, Ljava/awt/Rectangle;->getHeight()D

    move-result-wide v6

    invoke-virtual {v2, v8, v5, v6, v7}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;D)V

    goto :goto_2b

    .line 64
    .end local v3    # "rectangle":Ljava/awt/Rectangle;
    :cond_8c
    instance-of v5, p2, Ljava/awt/Color;

    if-eqz v5, :cond_c5

    move-object v0, p2

    .line 65
    check-cast v0, Ljava/awt/Color;

    .line 67
    .local v0, "color":Ljava/awt/Color;
    const-class v5, Ljava/awt/Color;

    invoke-virtual {p0, v2, v5, v4}, Lcom/alibaba/fastjson/serializer/AwtCodec;->writeClassName(Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/lang/Class;C)C

    move-result v4

    .line 69
    const-string v5, "r"

    invoke-virtual {v0}, Ljava/awt/Color;->getRed()I

    move-result v6

    invoke-virtual {v2, v4, v5, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 70
    const-string v5, "g"

    invoke-virtual {v0}, Ljava/awt/Color;->getGreen()I

    move-result v6

    invoke-virtual {v2, v8, v5, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 71
    const-string v5, "b"

    invoke-virtual {v0}, Ljava/awt/Color;->getBlue()I

    move-result v6

    invoke-virtual {v2, v8, v5, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    .line 72
    invoke-virtual {v0}, Ljava/awt/Color;->getAlpha()I

    move-result v5

    if-lez v5, :cond_2b

    .line 73
    const-string v5, "alpha"

    invoke-virtual {v0}, Ljava/awt/Color;->getAlpha()I

    move-result v6

    invoke-virtual {v2, v8, v5, v6}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldValue(CLjava/lang/String;I)V

    goto/16 :goto_2b

    .line 76
    .end local v0    # "color":Ljava/awt/Color;
    :cond_c5
    new-instance v5, Lcom/alibaba/fastjson/JSONException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "not support awt class : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method protected writeClassName(Lcom/alibaba/fastjson/serializer/SerializeWriter;Ljava/lang/Class;C)C
    .registers 5
    .param p1, "out"    # Lcom/alibaba/fastjson/serializer/SerializeWriter;
    .param p3, "sep"    # C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/serializer/SerializeWriter;",
            "Ljava/lang/Class",
            "<*>;C)C"
        }
    .end annotation

    .prologue
    .line 84
    .local p2, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v0

    if-eqz v0, :cond_1b

    .line 85
    const/16 v0, 0x7b

    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 86
    sget-object v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeFieldName(Ljava/lang/String;)V

    .line 87
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeString(Ljava/lang/String;)V

    .line 88
    const/16 p3, 0x2c

    .line 90
    :cond_1b
    return p3
.end method
