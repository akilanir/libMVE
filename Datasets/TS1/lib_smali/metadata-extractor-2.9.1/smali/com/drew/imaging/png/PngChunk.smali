.class public Lcom/drew/imaging/png/PngChunk;
.super Ljava/lang/Object;
.source "PngChunk.java"


# instance fields
.field private final _bytes:[B
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field

.field private final _chunkType:Lcom/drew/imaging/png/PngChunkType;
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/drew/imaging/png/PngChunkType;[B)V
    .registers 3
    .param p1, "chunkType"    # Lcom/drew/imaging/png/PngChunkType;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p2, "bytes"    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/drew/imaging/png/PngChunk;->_chunkType:Lcom/drew/imaging/png/PngChunkType;

    .line 38
    iput-object p2, p0, Lcom/drew/imaging/png/PngChunk;->_bytes:[B

    .line 39
    return-void
.end method


# virtual methods
.method public getBytes()[B
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 50
    iget-object v0, p0, Lcom/drew/imaging/png/PngChunk;->_bytes:[B

    return-object v0
.end method

.method public getType()Lcom/drew/imaging/png/PngChunkType;
    .registers 2
    .annotation build Lcom/drew/lang/annotations/NotNull;
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lcom/drew/imaging/png/PngChunk;->_chunkType:Lcom/drew/imaging/png/PngChunkType;

    return-object v0
.end method
