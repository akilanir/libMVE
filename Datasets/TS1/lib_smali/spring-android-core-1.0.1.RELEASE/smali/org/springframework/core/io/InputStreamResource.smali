.class public Lorg/springframework/core/io/InputStreamResource;
.super Lorg/springframework/core/io/AbstractResource;
.source "InputStreamResource.java"


# instance fields
.field private final description:Ljava/lang/String;

.field private final inputStream:Ljava/io/InputStream;

.field private read:Z


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 54
    const-string v0, "resource loaded through InputStream"

    invoke-direct {p0, p1, v0}, Lorg/springframework/core/io/InputStreamResource;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 5
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "description"    # Ljava/lang/String;

    .prologue
    .line 62
    invoke-direct {p0}, Lorg/springframework/core/io/AbstractResource;-><init>()V

    .line 46
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/springframework/core/io/InputStreamResource;->read:Z

    .line 63
    if-nez p1, :cond_10

    .line 64
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "InputStream must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_10
    iput-object p1, p0, Lorg/springframework/core/io/InputStreamResource;->inputStream:Ljava/io/InputStream;

    .line 67
    if-eqz p2, :cond_17

    .end local p2    # "description":Ljava/lang/String;
    :goto_14
    iput-object p2, p0, Lorg/springframework/core/io/InputStreamResource;->description:Ljava/lang/String;

    .line 68
    return-void

    .line 67
    .restart local p2    # "description":Ljava/lang/String;
    :cond_17
    const-string p2, ""

    goto :goto_14
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 113
    if-eq p1, p0, :cond_12

    instance-of v0, p1, Lorg/springframework/core/io/InputStreamResource;

    if-eqz v0, :cond_14

    check-cast p1, Lorg/springframework/core/io/InputStreamResource;

    .end local p1    # "obj":Ljava/lang/Object;
    iget-object v0, p1, Lorg/springframework/core/io/InputStreamResource;->inputStream:Ljava/io/InputStream;

    iget-object v1, p0, Lorg/springframework/core/io/InputStreamResource;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method

.method public exists()Z
    .registers 2

    .prologue
    .line 76
    const/4 v0, 0x1

    return v0
.end method

.method public getDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lorg/springframework/core/io/InputStreamResource;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    .prologue
    .line 92
    iget-boolean v0, p0, Lorg/springframework/core/io/InputStreamResource;->read:Z

    if-eqz v0, :cond_c

    .line 93
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "InputStream has already been read - do not use InputStreamResource if a stream needs to be read multiple times"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_c
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/springframework/core/io/InputStreamResource;->read:Z

    .line 97
    iget-object v0, p0, Lorg/springframework/core/io/InputStreamResource;->inputStream:Ljava/io/InputStream;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 122
    iget-object v0, p0, Lorg/springframework/core/io/InputStreamResource;->inputStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public isOpen()Z
    .registers 2

    .prologue
    .line 84
    const/4 v0, 0x1

    return v0
.end method
