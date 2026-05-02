.class public Lcom/alibaba/fastjson/serializer/LongCodec;
.super Ljava/lang/Object;
.source "LongCodec.java"

# interfaces
.implements Lcom/alibaba/fastjson/serializer/ObjectSerializer;
.implements Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;


# static fields
.field public static instance:Lcom/alibaba/fastjson/serializer/LongCodec;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    new-instance v0, Lcom/alibaba/fastjson/serializer/LongCodec;

    invoke-direct {v0}, Lcom/alibaba/fastjson/serializer/LongCodec;-><init>()V

    sput-object v0, Lcom/alibaba/fastjson/serializer/LongCodec;->instance:Lcom/alibaba/fastjson/serializer/LongCodec;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public deserialze(Lcom/alibaba/fastjson/parser/DefaultJSONParser;Ljava/lang/reflect/Type;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12
    .param p1, "parser"    # Lcom/alibaba/fastjson/parser/DefaultJSONParser;
    .param p2, "clazz"    # Ljava/lang/reflect/Type;
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
    .line 54
    iget-object v0, p1, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->lexer:Lcom/alibaba/fastjson/parser/JSONLexer;

    .line 57
    .local v0, "lexer":Lcom/alibaba/fastjson/parser/JSONLexer;
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->token()I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_25

    .line 58
    invoke-interface {v0}, Lcom/alibaba/fastjson/parser/JSONLexer;->longValue()J

    move-result-wide v2

    .line 59
    .local v2, "longValue":J
    const/16 v5, 0x10

    invoke-interface {v0, v5}, Lcom/alibaba/fastjson/parser/JSONLexer;->nextToken(I)V

    .line 60
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 72
    .end local v2    # "longValue":J
    .local v1, "longObject":Ljava/lang/Long;
    :goto_16
    const-class v5, Ljava/util/concurrent/atomic/AtomicLong;

    if-ne p2, v5, :cond_24

    new-instance v5, Ljava/util/concurrent/atomic/AtomicLong;

    .line 73
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-direct {v5, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    move-object v1, v5

    .end local v1    # "longObject":Ljava/lang/Long;
    :cond_24
    :goto_24
    return-object v1

    .line 63
    :cond_25
    invoke-virtual {p1}, Lcom/alibaba/fastjson/parser/DefaultJSONParser;->parse()Ljava/lang/Object;

    move-result-object v4

    .line 65
    .local v4, "value":Ljava/lang/Object;
    if-nez v4, :cond_2d

    .line 66
    const/4 v1, 0x0

    goto :goto_24

    .line 69
    :cond_2d
    invoke-static {v4}, Lcom/alibaba/fastjson/util/TypeUtils;->castToLong(Ljava/lang/Object;)Ljava/lang/Long;

    move-result-object v1

    .restart local v1    # "longObject":Ljava/lang/Long;
    goto :goto_16
.end method

.method public getFastMatchToken()I
    .registers 2

    .prologue
    .line 78
    const/4 v0, 0x2

    return v0
.end method

.method public write(Lcom/alibaba/fastjson/serializer/JSONSerializer;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V
    .registers 11
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
    .line 36
    iget-object v0, p1, Lcom/alibaba/fastjson/serializer/JSONSerializer;->out:Lcom/alibaba/fastjson/serializer/SerializeWriter;

    .line 38
    .local v0, "out":Lcom/alibaba/fastjson/serializer/SerializeWriter;
    if-nez p2, :cond_a

    .line 39
    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullNumberAsZero:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeNull(Lcom/alibaba/fastjson/serializer/SerializerFeature;)V

    .line 50
    .end local p2    # "object":Ljava/lang/Object;
    :cond_9
    :goto_9
    return-void

    .line 41
    .restart local p2    # "object":Ljava/lang/Object;
    :cond_a
    check-cast p2, Ljava/lang/Long;

    .end local p2    # "object":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 42
    .local v1, "value":J
    invoke-virtual {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->writeLong(J)V

    .line 44
    sget-object v3, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteClassName:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->isEnabled(Lcom/alibaba/fastjson/serializer/SerializerFeature;)Z

    move-result v3

    if-eqz v3, :cond_9

    const-wide/32 v3, 0x7fffffff

    cmp-long v3, v1, v3

    if-gtz v3, :cond_9

    const-wide/32 v3, -0x80000000

    cmp-long v3, v1, v3

    if-ltz v3, :cond_9

    const-class v3, Ljava/lang/Long;

    if-eq p4, v3, :cond_9

    .line 47
    const/16 v3, 0x4c

    invoke-virtual {v0, v3}, Lcom/alibaba/fastjson/serializer/SerializeWriter;->write(I)V

    goto :goto_9
.end method
