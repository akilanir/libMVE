.class final Lretrofit/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 201
    return-void
.end method

.method static checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 38
    .local p0, "object":Ljava/lang/Object;, "TT;"
    if-nez p0, :cond_8

    .line 39
    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_8
    return-object p0
.end method

.method static closeQuietly(Ljava/io/Closeable;)V
    .registers 2
    .param p0, "closeable"    # Ljava/io/Closeable;

    .prologue
    .line 45
    if-nez p0, :cond_3

    .line 50
    :goto_2
    return-void

    .line 47
    :cond_3
    :try_start_3
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_6} :catch_7

    goto :goto_2

    .line 48
    :catch_7
    move-exception v0

    goto :goto_2
.end method

.method static getCallResponseType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;
    .registers 4
    .param p0, "returnType"    # Ljava/lang/reflect/Type;

    .prologue
    .line 184
    instance-of v1, p0, Ljava/lang/reflect/ParameterizedType;

    if-nez v1, :cond_c

    .line 185
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Call return type must be parameterized as Call<Foo> or Call<? extends Foo>"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 188
    :cond_c
    check-cast p0, Ljava/lang/reflect/ParameterizedType;

    .end local p0    # "returnType":Ljava/lang/reflect/Type;
    invoke-static {p0}, Lretrofit/Utils;->getSingleParameterUpperBound(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/reflect/Type;

    move-result-object v0

    .line 191
    .local v0, "responseType":Ljava/lang/reflect/Type;
    invoke-static {v0}, Lretrofit/Utils;->getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v1

    const-class v2, Lretrofit/Response;

    if-ne v1, v2, :cond_22

    .line 192
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Call<T> cannot use Response as its generic parameter. Specify the response body type only (e.g., Call<TweetResponse>)."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 196
    :cond_22
    return-object v0
.end method

.method public static getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;
    .registers 8
    .param p0, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 134
    instance-of v4, p0, Ljava/lang/Class;

    if-eqz v4, :cond_8

    .line 136
    check-cast p0, Ljava/lang/Class;

    .line 157
    .end local p0    # "type":Ljava/lang/reflect/Type;
    :goto_7
    return-object p0

    .line 138
    .restart local p0    # "type":Ljava/lang/reflect/Type;
    :cond_8
    instance-of v4, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v4, :cond_21

    move-object v2, p0

    .line 139
    check-cast v2, Ljava/lang/reflect/ParameterizedType;

    .line 143
    .local v2, "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v2}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v3

    .line 144
    .local v3, "rawType":Ljava/lang/reflect/Type;
    instance-of v4, v3, Ljava/lang/Class;

    if-nez v4, :cond_1d

    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-direct {v4}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v4

    .line 145
    :cond_1d
    check-cast v3, Ljava/lang/Class;

    .end local v3    # "rawType":Ljava/lang/reflect/Type;
    move-object p0, v3

    goto :goto_7

    .line 147
    .end local v2    # "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    :cond_21
    instance-of v4, p0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v4, :cond_38

    .line 148
    check-cast p0, Ljava/lang/reflect/GenericArrayType;

    .end local p0    # "type":Ljava/lang/reflect/Type;
    invoke-interface {p0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 149
    .local v1, "componentType":Ljava/lang/reflect/Type;
    invoke-static {v1}, Lretrofit/Utils;->getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    goto :goto_7

    .line 151
    .end local v1    # "componentType":Ljava/lang/reflect/Type;
    .restart local p0    # "type":Ljava/lang/reflect/Type;
    :cond_38
    instance-of v4, p0, Ljava/lang/reflect/TypeVariable;

    if-eqz v4, :cond_3f

    .line 154
    const-class p0, Ljava/lang/Object;

    goto :goto_7

    .line 156
    :cond_3f
    instance-of v4, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v4, :cond_50

    .line 157
    check-cast p0, Ljava/lang/reflect/WildcardType;

    .end local p0    # "type":Ljava/lang/reflect/Type;
    invoke-interface {p0}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v4

    aget-object v4, v4, v5

    invoke-static {v4}, Lretrofit/Utils;->getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object p0

    goto :goto_7

    .line 160
    .restart local p0    # "type":Ljava/lang/reflect/Type;
    :cond_50
    if-nez p0, :cond_77

    const-string v0, "null"

    .line 161
    .local v0, "className":Ljava/lang/String;
    :goto_54
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Expected a Class, ParameterizedType, or GenericArrayType, but <"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "> is of type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 160
    .end local v0    # "className":Ljava/lang/String;
    :cond_77
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_54
.end method

.method public static getSingleParameterUpperBound(Ljava/lang/reflect/ParameterizedType;)Ljava/lang/reflect/Type;
    .registers 6
    .param p0, "type"    # Ljava/lang/reflect/ParameterizedType;

    .prologue
    const/4 v4, 0x0

    .line 93
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v1

    .line 94
    .local v1, "types":[Ljava/lang/reflect/Type;
    array-length v2, v1

    const/4 v3, 0x1

    if-eq v2, v3, :cond_26

    .line 95
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Expected one type argument but got: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 96
    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 98
    :cond_26
    aget-object v0, v1, v4

    .line 99
    .local v0, "paramType":Ljava/lang/reflect/Type;
    instance-of v2, v0, Ljava/lang/reflect/WildcardType;

    if-eqz v2, :cond_34

    .line 100
    check-cast v0, Ljava/lang/reflect/WildcardType;

    .end local v0    # "paramType":Ljava/lang/reflect/Type;
    invoke-interface {v0}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v2

    aget-object v0, v2, v4

    .line 102
    :cond_34
    return-object v0
.end method

.method public static hasUnresolvableType(Ljava/lang/reflect/Type;)Z
    .registers 10
    .param p0, "type"    # Ljava/lang/reflect/Type;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 106
    instance-of v5, p0, Ljava/lang/Class;

    if-eqz v5, :cond_7

    .line 125
    :cond_6
    :goto_6
    return v3

    .line 109
    :cond_7
    instance-of v5, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v5, :cond_23

    move-object v1, p0

    .line 110
    check-cast v1, Ljava/lang/reflect/ParameterizedType;

    .line 111
    .local v1, "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v6

    array-length v7, v6

    move v5, v3

    :goto_14
    if-ge v5, v7, :cond_6

    aget-object v2, v6, v5

    .line 112
    .local v2, "typeArgument":Ljava/lang/reflect/Type;
    invoke-static {v2}, Lretrofit/Utils;->hasUnresolvableType(Ljava/lang/reflect/Type;)Z

    move-result v8

    if-eqz v8, :cond_20

    move v3, v4

    .line 113
    goto :goto_6

    .line 111
    :cond_20
    add-int/lit8 v5, v5, 0x1

    goto :goto_14

    .line 118
    .end local v1    # "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    .end local v2    # "typeArgument":Ljava/lang/reflect/Type;
    :cond_23
    instance-of v3, p0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v3, :cond_32

    .line 119
    check-cast p0, Ljava/lang/reflect/GenericArrayType;

    .end local p0    # "type":Ljava/lang/reflect/Type;
    invoke-interface {p0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v3

    invoke-static {v3}, Lretrofit/Utils;->hasUnresolvableType(Ljava/lang/reflect/Type;)Z

    move-result v3

    goto :goto_6

    .line 121
    .restart local p0    # "type":Ljava/lang/reflect/Type;
    :cond_32
    instance-of v3, p0, Ljava/lang/reflect/TypeVariable;

    if-eqz v3, :cond_38

    move v3, v4

    .line 122
    goto :goto_6

    .line 124
    :cond_38
    instance-of v3, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v3, :cond_3e

    move v3, v4

    .line 125
    goto :goto_6

    .line 127
    :cond_3e
    if-nez p0, :cond_65

    const-string v0, "null"

    .line 128
    .local v0, "className":Ljava/lang/String;
    :goto_42
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expected a Class, ParameterizedType, or GenericArrayType, but <"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "> is of type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 127
    .end local v0    # "className":Ljava/lang/String;
    :cond_65
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_42
.end method

.method static isAnnotationPresent([Ljava/lang/annotation/Annotation;Ljava/lang/Class;)Z
    .registers 7
    .param p0, "annotations"    # [Ljava/lang/annotation/Annotation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/annotation/Annotation;",
            "Ljava/lang/Class",
            "<+",
            "Ljava/lang/annotation/Annotation;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, "cls":Ljava/lang/Class;, "Ljava/lang/Class<+Ljava/lang/annotation/Annotation;>;"
    const/4 v1, 0x0

    .line 55
    array-length v3, p0

    move v2, v1

    :goto_3
    if-ge v2, v3, :cond_e

    aget-object v0, p0, v2

    .line 56
    .local v0, "annotation":Ljava/lang/annotation/Annotation;
    invoke-virtual {p1, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 57
    const/4 v1, 0x1

    .line 60
    .end local v0    # "annotation":Ljava/lang/annotation/Annotation;
    :cond_e
    return v1

    .line 55
    .restart local v0    # "annotation":Ljava/lang/annotation/Annotation;
    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method

.method static varargs methodError(Ljava/lang/Throwable;Ljava/lang/reflect/Method;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .registers 7
    .param p0, "cause"    # Ljava/lang/Throwable;
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "args"    # [Ljava/lang/Object;

    .prologue
    .line 172
    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 173
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\n    for method "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 175
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 177
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 178
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v0, p0}, Ljava/lang/IllegalArgumentException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 179
    return-object v0
.end method

.method static varargs methodError(Ljava/lang/reflect/Method;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/RuntimeException;
    .registers 4
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 167
    const/4 v0, 0x0

    invoke-static {v0, p0, p1, p2}, Lretrofit/Utils;->methodError(Ljava/lang/Throwable;Ljava/lang/reflect/Method;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/RuntimeException;

    move-result-object v0

    return-object v0
.end method

.method static readBodyToBytesIfNecessary(Lcom/squareup/okhttp/ResponseBody;)Lcom/squareup/okhttp/ResponseBody;
    .registers 6
    .param p0, "body"    # Lcom/squareup/okhttp/ResponseBody;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    if-nez p0, :cond_4

    .line 69
    const/4 v2, 0x0

    .line 77
    :goto_3
    return-object v2

    .line 72
    :cond_4
    invoke-virtual {p0}, Lcom/squareup/okhttp/ResponseBody;->source()Lokio/BufferedSource;

    move-result-object v1

    .line 73
    .local v1, "source":Lokio/BufferedSource;
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 74
    .local v0, "buffer":Lokio/Buffer;
    invoke-virtual {v0, v1}, Lokio/Buffer;->writeAll(Lokio/Source;)J

    .line 75
    invoke-interface {v1}, Lokio/BufferedSource;->close()V

    .line 77
    invoke-virtual {p0}, Lcom/squareup/okhttp/ResponseBody;->contentType()Lcom/squareup/okhttp/MediaType;

    move-result-object v2

    invoke-virtual {p0}, Lcom/squareup/okhttp/ResponseBody;->contentLength()J

    move-result-wide v3

    invoke-static {v2, v3, v4, v0}, Lcom/squareup/okhttp/ResponseBody;->create(Lcom/squareup/okhttp/MediaType;JLokio/BufferedSource;)Lcom/squareup/okhttp/ResponseBody;

    move-result-object v2

    goto :goto_3
.end method

.method static validateServiceInterface(Ljava/lang/Class;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 81
    .local p0, "service":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-virtual {p0}, Ljava/lang/Class;->isInterface()Z

    move-result v0

    if-nez v0, :cond_e

    .line 82
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "API declarations must be interfaces."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_e
    invoke-virtual {p0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v0

    array-length v0, v0

    if-lez v0, :cond_1d

    .line 88
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "API interfaces must not extend other interfaces."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 90
    :cond_1d
    return-void
.end method
