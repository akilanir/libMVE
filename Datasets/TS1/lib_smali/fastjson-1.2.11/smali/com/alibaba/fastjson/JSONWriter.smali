.class public Lcom/alibaba/fastjson/JSONWriter;
.super Ljava/lang/Object;
.source "JSONWriter.java"

# interfaces
.implements Ljava/io/Closeable;
.implements Ljava/io/Flushable;


# instance fields
.field private context:Lcom/alibaba/fastjson/JSONStreamContext;

.field private serializer:Lcom/alibaba/fastjson/serializer/JSONSerializer;

.field private writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;


# direct methods
.method public constructor <init>(Ljava/io/Writer;)V
    .registers 4
    .param p1, "out"    # Ljava/io/Writer;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-direct {v0, p1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;-><init>(Ljava/io/Writer;)V

    iput-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 23
    new-instance v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;

    iget-object v1, p0, Lcom/alibaba/fastjson/JSONWriter;->writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;-><init>(Lcom/alibaba/fastjson/serializer/SerializeWriter;)V

    iput-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->serializer:Lcom/alibaba/fastjson/serializer/JSONSerializer;

    .line 24
    return-void
.end method

.method private afterWriter()V
    .registers 4

    .prologue
    .line 149
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    if-nez v2, :cond_5

    .line 175
    :cond_4
    :goto_4
    return-void

    .line 153
    :cond_5
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    iget v1, v2, Lcom/alibaba/fastjson/JSONStreamContext;->state:I

    .line 154
    .local v1, "state":I
    const/4 v0, -0x1

    .line 155
    .local v0, "newState":I
    packed-switch v1, :pswitch_data_1e

    .line 172
    :goto_d
    :pswitch_d
    const/4 v2, -0x1

    if-eq v0, v2, :cond_4

    .line 173
    iget-object v2, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    iput v0, v2, Lcom/alibaba/fastjson/JSONStreamContext;->state:I

    goto :goto_4

    .line 157
    :pswitch_15
    const/16 v0, 0x3eb

    .line 158
    goto :goto_d

    .line 161
    :pswitch_18
    const/16 v0, 0x3ea

    .line 162
    goto :goto_d

    .line 164
    :pswitch_1b
    const/16 v0, 0x3ed

    .line 165
    goto :goto_d

    .line 155
    :pswitch_data_1e
    .packed-switch 0x3e9
        :pswitch_18
        :pswitch_15
        :pswitch_18
        :pswitch_1b
        :pswitch_d
    .end packed-switch
.end method

.method private beforeWrite()V
    .registers 3

    .prologue
    const/16 v1, 0x2c

    .line 126
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    if-nez v0, :cond_7

    .line 146
    :goto_6
    :pswitch_6
    return-void

    .line 130
    :cond_7
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    iget v0, v0, Lcom/alibaba/fastjson/JSONStreamContext;->state:I

    packed-switch v0, :pswitch_data_24

    goto :goto_6

    .line 135
    :pswitch_f
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_6

    .line 138
    :pswitch_17
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_6

    .line 141
    :pswitch_1d
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_6

    .line 130
    nop

    :pswitch_data_24
    .packed-switch 0x3e9
        :pswitch_6
        :pswitch_f
        :pswitch_17
        :pswitch_6
        :pswitch_1d
    .end packed-switch
.end method

.method private beginStructure()V
    .registers 5

    .prologue
    .line 75
    iget-object v1, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    iget v0, v1, Lcom/alibaba/fastjson/JSONStreamContext;->state:I

    .line 76
    .local v0, "state":I
    iget-object v1, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    iget v1, v1, Lcom/alibaba/fastjson/JSONStreamContext;->state:I

    packed-switch v1, :pswitch_data_34

    .line 88
    :pswitch_b
    new-instance v1, Lcom/alibaba/fastjson/JSONException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "illegal state : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 78
    :pswitch_24
    iget-object v1, p0, Lcom/alibaba/fastjson/JSONWriter;->writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 90
    :goto_2b
    :pswitch_2b
    return-void

    .line 81
    :pswitch_2c
    iget-object v1, p0, Lcom/alibaba/fastjson/JSONWriter;->writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const/16 v2, 0x2c

    invoke-virtual {v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_2b

    .line 76
    :pswitch_data_34
    .packed-switch 0x3e9
        :pswitch_2b
        :pswitch_24
        :pswitch_b
        :pswitch_2b
        :pswitch_2c
    .end packed-switch
.end method

.method private endStructure()V
    .registers 3

    .prologue
    .line 98
    iget-object v1, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    iget-object v1, v1, Lcom/alibaba/fastjson/JSONStreamContext;->parent:Lcom/alibaba/fastjson/JSONStreamContext;

    iput-object v1, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    .line 100
    iget-object v1, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    if-nez v1, :cond_b

    .line 123
    :cond_a
    :goto_a
    return-void

    .line 104
    :cond_b
    const/4 v0, -0x1

    .line 105
    .local v0, "newState":I
    iget-object v1, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    iget v1, v1, Lcom/alibaba/fastjson/JSONStreamContext;->state:I

    packed-switch v1, :pswitch_data_24

    .line 120
    :goto_13
    :pswitch_13
    const/4 v1, -0x1

    if-eq v0, v1, :cond_a

    .line 121
    iget-object v1, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    iput v0, v1, Lcom/alibaba/fastjson/JSONStreamContext;->state:I

    goto :goto_a

    .line 107
    :pswitch_1b
    const/16 v0, 0x3eb

    .line 108
    goto :goto_13

    .line 110
    :pswitch_1e
    const/16 v0, 0x3ed

    .line 111
    goto :goto_13

    .line 115
    :pswitch_21
    const/16 v0, 0x3ea

    .line 116
    goto :goto_13

    .line 105
    :pswitch_data_24
    .packed-switch 0x3e9
        :pswitch_21
        :pswitch_1b
        :pswitch_13
        :pswitch_1e
        :pswitch_13
    .end packed-switch
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->close()V

    .line 183
    return-void
.end method

.method public config(Lcom/alibaba/fastjson/serializer/SerializerFeature;Z)V
    .registers 4
    .param p1, "feature"    # Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .param p2, "state"    # Z

    .prologue
    .line 27
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v0, p1, p2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->config(Lcom/alibaba/fastjson/serializer/SerializerFeature;Z)V

    .line 28
    return-void
.end method

.method public endArray()V
    .registers 3

    .prologue
    .line 93
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 94
    invoke-direct {p0}, Lcom/alibaba/fastjson/JSONWriter;->endStructure()V

    .line 95
    return-void
.end method

.method public endObject()V
    .registers 3

    .prologue
    .line 39
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 40
    invoke-direct {p0}, Lcom/alibaba/fastjson/JSONWriter;->endStructure()V

    .line 41
    return-void
.end method

.method public flush()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-virtual {v0}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->flush()V

    .line 179
    return-void
.end method

.method public startArray()V
    .registers 4

    .prologue
    .line 66
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    if-eqz v0, :cond_7

    .line 67
    invoke-direct {p0}, Lcom/alibaba/fastjson/JSONWriter;->beginStructure()V

    .line 70
    :cond_7
    new-instance v0, Lcom/alibaba/fastjson/JSONStreamContext;

    iget-object v1, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    const/16 v2, 0x3ec

    invoke-direct {v0, v1, v2}, Lcom/alibaba/fastjson/JSONStreamContext;-><init>(Lcom/alibaba/fastjson/JSONStreamContext;I)V

    iput-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    .line 71
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 72
    return-void
.end method

.method public startObject()V
    .registers 4

    .prologue
    .line 31
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    if-eqz v0, :cond_7

    .line 32
    invoke-direct {p0}, Lcom/alibaba/fastjson/JSONWriter;->beginStructure()V

    .line 34
    :cond_7
    new-instance v0, Lcom/alibaba/fastjson/JSONStreamContext;

    iget-object v1, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    const/16 v2, 0x3e9

    invoke-direct {v0, v1, v2}, Lcom/alibaba/fastjson/JSONStreamContext;-><init>(Lcom/alibaba/fastjson/JSONStreamContext;I)V

    iput-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->context:Lcom/alibaba/fastjson/JSONStreamContext;

    .line 35
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->writer:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    const/16 v1, 0x7b

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    .line 36
    return-void
.end method

.method public writeEndArray()V
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 202
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONWriter;->endArray()V

    .line 203
    return-void
.end method

.method public writeEndObject()V
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 192
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONWriter;->endObject()V

    .line 193
    return-void
.end method

.method public writeKey(Ljava/lang/String;)V
    .registers 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONWriter;->writeObject(Ljava/lang/String;)V

    .line 45
    return-void
.end method

.method public writeObject(Ljava/lang/Object;)V
    .registers 3
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/alibaba/fastjson/JSONWriter;->beforeWrite()V

    .line 61
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->serializer:Lcom/alibaba/fastjson/serializer/JSONSerializer;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/Object;)V

    .line 62
    invoke-direct {p0}, Lcom/alibaba/fastjson/JSONWriter;->afterWriter()V

    .line 63
    return-void
.end method

.method public writeObject(Ljava/lang/String;)V
    .registers 3
    .param p1, "object"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/alibaba/fastjson/JSONWriter;->beforeWrite()V

    .line 54
    iget-object v0, p0, Lcom/alibaba/fastjson/JSONWriter;->serializer:Lcom/alibaba/fastjson/serializer/JSONSerializer;

    invoke-virtual {v0, p1}, Lcom/alibaba/fastjson/serializer/JSONSerializer;->write(Ljava/lang/String;)V

    .line 56
    invoke-direct {p0}, Lcom/alibaba/fastjson/JSONWriter;->afterWriter()V

    .line 57
    return-void
.end method

.method public writeStartArray()V
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 197
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONWriter;->startArray()V

    .line 198
    return-void
.end method

.method public writeStartObject()V
    .registers 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 187
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONWriter;->startObject()V

    .line 188
    return-void
.end method

.method public writeValue(Ljava/lang/Object;)V
    .registers 2
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 48
    invoke-virtual {p0, p1}, Lcom/alibaba/fastjson/JSONWriter;->writeObject(Ljava/lang/Object;)V

    .line 49
    return-void
.end method
