.class public Lorg/apache/james/mime4j/stream/RawEntity;
.super Ljava/lang/Object;
.source "RawEntity.java"

# interfaces
.implements Lorg/apache/james/mime4j/stream/EntityStateMachine;


# instance fields
.field private state:Lorg/apache/james/mime4j/stream/EntityState;

.field private final stream:Ljava/io/InputStream;


# direct methods
.method constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lorg/apache/james/mime4j/stream/RawEntity;->stream:Ljava/io/InputStream;

    .line 38
    sget-object v0, Lorg/apache/james/mime4j/stream/EntityState;->T_RAW_ENTITY:Lorg/apache/james/mime4j/stream/EntityState;

    iput-object v0, p0, Lorg/apache/james/mime4j/stream/RawEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    .line 39
    return-void
.end method


# virtual methods
.method public advance()Lorg/apache/james/mime4j/stream/EntityStateMachine;
    .registers 2

    .prologue
    .line 52
    sget-object v0, Lorg/apache/james/mime4j/stream/EntityState;->T_END_OF_STREAM:Lorg/apache/james/mime4j/stream/EntityState;

    iput-object v0, p0, Lorg/apache/james/mime4j/stream/RawEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    .line 53
    const/4 v0, 0x0

    return-object v0
.end method

.method public getBodyDescriptor()Lorg/apache/james/mime4j/stream/BodyDescriptor;
    .registers 2

    .prologue
    .line 67
    const/4 v0, 0x0

    return-object v0
.end method

.method public getContentStream()Ljava/io/InputStream;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/RawEntity;->stream:Ljava/io/InputStream;

    return-object v0
.end method

.method public getDecodedContentStream()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 95
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Raw entity does not support stream decoding"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic getField()Lorg/apache/james/mime4j/stream/Field;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 30
    invoke-virtual {p0}, Lorg/apache/james/mime4j/stream/RawEntity;->getField()Lorg/apache/james/mime4j/stream/RawField;

    move-result-object v0

    return-object v0
.end method

.method public getField()Lorg/apache/james/mime4j/stream/RawField;
    .registers 2

    .prologue
    .line 74
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFieldName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 81
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFieldValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 88
    const/4 v0, 0x0

    return-object v0
.end method

.method public getState()Lorg/apache/james/mime4j/stream/EntityState;
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/RawEntity;->state:Lorg/apache/james/mime4j/stream/EntityState;

    return-object v0
.end method

.method public setRecursionMode(Lorg/apache/james/mime4j/stream/RecursionMode;)V
    .registers 2
    .param p1, "recursionMode"    # Lorg/apache/james/mime4j/stream/RecursionMode;

    .prologue
    .line 49
    return-void
.end method
