.class public Lcom/fasterxml/jackson/databind/MappingIterator;
.super Ljava/lang/Object;
.source "MappingIterator.java"

# interfaces
.implements Ljava/util/Iterator;
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TT;>;",
        "Ljava/io/Closeable;"
    }
.end annotation


# static fields
.field protected static final EMPTY_ITERATOR:Lcom/fasterxml/jackson/databind/MappingIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/fasterxml/jackson/databind/MappingIterator",
            "<*>;"
        }
    .end annotation
.end field


# instance fields
.field protected final _closeParser:Z

.field protected final _context:Lcom/fasterxml/jackson/databind/DeserializationContext;

.field protected final _deserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected _hasNextChecked:Z

.field protected _parser:Lcom/fasterxml/jackson/core/JsonParser;

.field protected final _type:Lcom/fasterxml/jackson/databind/JavaType;

.field protected final _updatedValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v1, 0x0

    .line 16
    new-instance v0, Lcom/fasterxml/jackson/databind/MappingIterator;

    const/4 v5, 0x0

    move-object v2, v1

    move-object v3, v1

    move-object v4, v1

    move-object v6, v1

    invoke-direct/range {v0 .. v6}, Lcom/fasterxml/jackson/databind/MappingIterator;-><init>(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/JsonDeserializer;ZLjava/lang/Object;)V

    sput-object v0, Lcom/fasterxml/jackson/databind/MappingIterator;->EMPTY_ITERATOR:Lcom/fasterxml/jackson/databind/MappingIterator;

    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/JsonDeserializer;)V
    .registers 12
    .param p1, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p3, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Lcom/fasterxml/jackson/databind/DeserializationContext;",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<*>;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 52
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    .local p4, "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<*>;"
    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v6}, Lcom/fasterxml/jackson/databind/MappingIterator;-><init>(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/JsonDeserializer;ZLjava/lang/Object;)V

    .line 53
    return-void
.end method

.method protected constructor <init>(Lcom/fasterxml/jackson/databind/JavaType;Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Lcom/fasterxml/jackson/databind/JsonDeserializer;ZLjava/lang/Object;)V
    .registers 9
    .param p1, "type"    # Lcom/fasterxml/jackson/databind/JavaType;
    .param p2, "jp"    # Lcom/fasterxml/jackson/core/JsonParser;
    .param p3, "ctxt"    # Lcom/fasterxml/jackson/databind/DeserializationContext;
    .param p5, "managedParser"    # Z
    .param p6, "valueToUpdate"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/databind/JavaType;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Lcom/fasterxml/jackson/databind/DeserializationContext;",
            "Lcom/fasterxml/jackson/databind/JsonDeserializer",
            "<*>;Z",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    .local p4, "deser":Lcom/fasterxml/jackson/databind/JsonDeserializer;, "Lcom/fasterxml/jackson/databind/JsonDeserializer<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_type:Lcom/fasterxml/jackson/databind/JavaType;

    .line 67
    iput-object p2, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    .line 68
    iput-object p3, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_context:Lcom/fasterxml/jackson/databind/DeserializationContext;

    .line 69
    iput-object p4, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_deserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    .line 70
    iput-boolean p5, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_closeParser:Z

    .line 71
    if-nez p6, :cond_22

    .line 72
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_updatedValue:Ljava/lang/Object;

    .line 87
    :goto_12
    if-eqz p5, :cond_21

    if-eqz p2, :cond_21

    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_21

    .line 88
    invoke-virtual {p2}, Lcom/fasterxml/jackson/core/JsonParser;->clearCurrentToken()V

    .line 90
    :cond_21
    return-void

    .line 74
    :cond_22
    iput-object p6, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_updatedValue:Ljava/lang/Object;

    goto :goto_12
.end method

.method protected static emptyIterator()Lcom/fasterxml/jackson/databind/MappingIterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/fasterxml/jackson/databind/MappingIterator",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 94
    sget-object v0, Lcom/fasterxml/jackson/databind/MappingIterator;->EMPTY_ITERATOR:Lcom/fasterxml/jackson/databind/MappingIterator;

    return-object v0
.end method


# virtual methods
.method protected _handleIOException(Ljava/io/IOException;)Ljava/lang/Object;
    .registers 4
    .param p1, "e"    # Ljava/io/IOException;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/IOException;",
            ")TR;"
        }
    .end annotation

    .prologue
    .line 295
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method protected _handleMappingException(Lcom/fasterxml/jackson/databind/JsonMappingException;)Ljava/lang/Object;
    .registers 4
    .param p1, "e"    # Lcom/fasterxml/jackson/databind/JsonMappingException;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/fasterxml/jackson/databind/JsonMappingException;",
            ")TR;"
        }
    .end annotation

    .prologue
    .line 291
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    new-instance v0, Lcom/fasterxml/jackson/databind/RuntimeJsonMappingException;

    invoke-virtual {p1}, Lcom/fasterxml/jackson/databind/JsonMappingException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/fasterxml/jackson/databind/RuntimeJsonMappingException;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/databind/JsonMappingException;)V

    throw v0
.end method

.method protected _throwNoSuchElement()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">()TR;"
        }
    .end annotation

    .prologue
    .line 287
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    if-eqz v0, :cond_9

    .line 135
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->close()V

    .line 137
    :cond_9
    return-void
.end method

.method public getCurrentLocation()Lcom/fasterxml/jackson/core/JsonLocation;
    .registers 2

    .prologue
    .line 277
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentLocation()Lcom/fasterxml/jackson/core/JsonLocation;

    move-result-object v0

    return-object v0
.end method

.method public getParser()Lcom/fasterxml/jackson/core/JsonParser;
    .registers 2

    .prologue
    .line 252
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    return-object v0
.end method

.method public getParserSchema()Lcom/fasterxml/jackson/core/FormatSchema;
    .registers 2

    .prologue
    .line 263
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->getSchema()Lcom/fasterxml/jackson/core/FormatSchema;

    move-result-object v0

    return-object v0
.end method

.method public hasNext()Z
    .registers 3

    .prologue
    .line 107
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    :try_start_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/MappingIterator;->hasNextValue()Z
    :try_end_3
    .catch Lcom/fasterxml/jackson/databind/JsonMappingException; {:try_start_0 .. :try_end_3} :catch_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_11

    move-result v1

    .line 111
    :goto_4
    return v1

    .line 108
    :catch_5
    move-exception v0

    .line 109
    .local v0, "e":Lcom/fasterxml/jackson/databind/JsonMappingException;
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/MappingIterator;->_handleMappingException(Lcom/fasterxml/jackson/databind/JsonMappingException;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_4

    .line 110
    .end local v0    # "e":Lcom/fasterxml/jackson/databind/JsonMappingException;
    :catch_11
    move-exception v0

    .line 111
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/MappingIterator;->_handleIOException(Ljava/io/IOException;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_4
.end method

.method public hasNextValue()Z
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 151
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    if-nez v4, :cond_7

    .line 170
    :cond_6
    :goto_6
    return v2

    .line 154
    :cond_7
    iget-boolean v4, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_hasNextChecked:Z

    if-nez v4, :cond_2e

    .line 155
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 156
    .local v1, "t":Lcom/fasterxml/jackson/core/JsonToken;
    iput-boolean v3, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_hasNextChecked:Z

    .line 157
    if-nez v1, :cond_2e

    .line 158
    iget-object v4, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v4}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 160
    if-eqz v1, :cond_21

    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v1, v4, :cond_2e

    .line 161
    :cond_21
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    .line 162
    .local v0, "jp":Lcom/fasterxml/jackson/core/JsonParser;
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    .line 163
    iget-boolean v3, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_closeParser:Z

    if-eqz v3, :cond_6

    .line 164
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->close()V

    goto :goto_6

    .end local v0    # "jp":Lcom/fasterxml/jackson/core/JsonParser;
    .end local v1    # "t":Lcom/fasterxml/jackson/core/JsonToken;
    :cond_2e
    move v2, v3

    .line 170
    goto :goto_6
.end method

.method public next()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 119
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    :try_start_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/MappingIterator;->nextValue()Ljava/lang/Object;
    :try_end_3
    .catch Lcom/fasterxml/jackson/databind/JsonMappingException; {:try_start_0 .. :try_end_3} :catch_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_10

    move-result-object v1

    return-object v1

    .line 120
    :catch_5
    move-exception v0

    .line 121
    .local v0, "e":Lcom/fasterxml/jackson/databind/JsonMappingException;
    new-instance v1, Lcom/fasterxml/jackson/databind/RuntimeJsonMappingException;

    invoke-virtual {v0}, Lcom/fasterxml/jackson/databind/JsonMappingException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/fasterxml/jackson/databind/RuntimeJsonMappingException;-><init>(Ljava/lang/String;Lcom/fasterxml/jackson/databind/JsonMappingException;)V

    throw v1

    .line 122
    .end local v0    # "e":Lcom/fasterxml/jackson/databind/JsonMappingException;
    :catch_10
    move-exception v0

    .line 123
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public nextValue()Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 176
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    iget-boolean v1, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_hasNextChecked:Z

    if-nez v1, :cond_f

    .line 177
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/MappingIterator;->hasNextValue()Z

    move-result v1

    if-nez v1, :cond_f

    .line 178
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/MappingIterator;->_throwNoSuchElement()Ljava/lang/Object;

    move-result-object v0

    .line 195
    :goto_e
    return-object v0

    .line 181
    :cond_f
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    if-nez v1, :cond_18

    .line 182
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/MappingIterator;->_throwNoSuchElement()Ljava/lang/Object;

    move-result-object v0

    goto :goto_e

    .line 184
    :cond_18
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_hasNextChecked:Z

    .line 187
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_updatedValue:Ljava/lang/Object;

    if-nez v1, :cond_2f

    .line 188
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_deserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    iget-object v3, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_context:Lcom/fasterxml/jackson/databind/DeserializationContext;

    invoke-virtual {v1, v2, v3}, Lcom/fasterxml/jackson/databind/JsonDeserializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;)Ljava/lang/Object;

    move-result-object v0

    .line 194
    .local v0, "result":Ljava/lang/Object;, "TT;"
    :goto_29
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonParser;->clearCurrentToken()V

    goto :goto_e

    .line 190
    .end local v0    # "result":Ljava/lang/Object;, "TT;"
    :cond_2f
    iget-object v1, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_deserializer:Lcom/fasterxml/jackson/databind/JsonDeserializer;

    iget-object v2, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_parser:Lcom/fasterxml/jackson/core/JsonParser;

    iget-object v3, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_context:Lcom/fasterxml/jackson/databind/DeserializationContext;

    iget-object v4, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_updatedValue:Ljava/lang/Object;

    invoke-virtual {v1, v2, v3, v4}, Lcom/fasterxml/jackson/databind/JsonDeserializer;->deserialize(Lcom/fasterxml/jackson/core/JsonParser;Lcom/fasterxml/jackson/databind/DeserializationContext;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    iget-object v0, p0, Lcom/fasterxml/jackson/databind/MappingIterator;->_updatedValue:Ljava/lang/Object;

    .restart local v0    # "result":Ljava/lang/Object;, "TT;"
    goto :goto_29
.end method

.method public readAll(Ljava/util/Collection;)Ljava/util/Collection;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<C::",
            "Ljava/util/Collection",
            "<-TT;>;>(TC;)TC;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 234
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    .local p1, "results":Ljava/util/Collection;, "TC;"
    :goto_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/MappingIterator;->hasNextValue()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 235
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/MappingIterator;->nextValue()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 237
    :cond_e
    return-object p1
.end method

.method public readAll()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0, v0}, Lcom/fasterxml/jackson/databind/MappingIterator;->readAll(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public readAll(Ljava/util/List;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "L::Ljava/util/List",
            "<-TT;>;>(T",
            "L;",
            ")T",
            "L;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 220
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    .local p1, "resultList":Ljava/util/List;, "TL;"
    :goto_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/MappingIterator;->hasNextValue()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 221
    invoke-virtual {p0}, Lcom/fasterxml/jackson/databind/MappingIterator;->nextValue()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 223
    :cond_e
    return-object p1
.end method

.method public remove()V
    .registers 2

    .prologue
    .line 129
    .local p0, "this":Lcom/fasterxml/jackson/databind/MappingIterator;, "Lcom/fasterxml/jackson/databind/MappingIterator<TT;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
