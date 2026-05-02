.class public final Lorg/apache/james/mime4j/stream/Event;
.super Ljava/lang/Object;
.source "Event.java"


# static fields
.field public static final HEADERS_PREMATURE_END:Lorg/apache/james/mime4j/stream/Event;

.field public static final INVALID_HEADER:Lorg/apache/james/mime4j/stream/Event;

.field public static final MIME_BODY_PREMATURE_END:Lorg/apache/james/mime4j/stream/Event;

.field public static final OBSOLETE_HEADER:Lorg/apache/james/mime4j/stream/Event;


# instance fields
.field private final code:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 28
    new-instance v0, Lorg/apache/james/mime4j/stream/Event;

    const-string v1, "Body part ended prematurely. Boundary detected in header or EOF reached."

    invoke-direct {v0, v1}, Lorg/apache/james/mime4j/stream/Event;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/james/mime4j/stream/Event;->MIME_BODY_PREMATURE_END:Lorg/apache/james/mime4j/stream/Event;

    .line 32
    new-instance v0, Lorg/apache/james/mime4j/stream/Event;

    const-string v1, "Unexpected end of headers detected. Higher level boundary detected or EOF reached."

    invoke-direct {v0, v1}, Lorg/apache/james/mime4j/stream/Event;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/james/mime4j/stream/Event;->HEADERS_PREMATURE_END:Lorg/apache/james/mime4j/stream/Event;

    .line 36
    new-instance v0, Lorg/apache/james/mime4j/stream/Event;

    const-string v1, "Invalid header encountered"

    invoke-direct {v0, v1}, Lorg/apache/james/mime4j/stream/Event;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/james/mime4j/stream/Event;->INVALID_HEADER:Lorg/apache/james/mime4j/stream/Event;

    .line 39
    new-instance v0, Lorg/apache/james/mime4j/stream/Event;

    const-string v1, "Obsolete header encountered"

    invoke-direct {v0, v1}, Lorg/apache/james/mime4j/stream/Event;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/james/mime4j/stream/Event;->OBSOLETE_HEADER:Lorg/apache/james/mime4j/stream/Event;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    if-nez p1, :cond_d

    .line 47
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Code may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_d
    iput-object p1, p0, Lorg/apache/james/mime4j/stream/Event;->code:Ljava/lang/String;

    .line 50
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 59
    if-nez p1, :cond_4

    .line 65
    :cond_3
    :goto_3
    return v1

    .line 60
    :cond_4
    if-ne p0, p1, :cond_8

    const/4 v1, 0x1

    goto :goto_3

    .line 61
    :cond_8
    instance-of v2, p1, Lorg/apache/james/mime4j/stream/Event;

    if-eqz v2, :cond_3

    move-object v0, p1

    .line 62
    check-cast v0, Lorg/apache/james/mime4j/stream/Event;

    .line 63
    .local v0, "that":Lorg/apache/james/mime4j/stream/Event;
    iget-object v1, p0, Lorg/apache/james/mime4j/stream/Event;->code:Ljava/lang/String;

    iget-object v2, v0, Lorg/apache/james/mime4j/stream/Event;->code:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_3
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 54
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/Event;->code:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/james/mime4j/stream/Event;->code:Ljava/lang/String;

    return-object v0
.end method
