.class Lorg/apache/commons/compress/archivers/sevenz/Coders$BCJDecoder;
.super Lorg/apache/commons/compress/archivers/sevenz/CoderBase;
.source "Coders.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/sevenz/Coders;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "BCJDecoder"
.end annotation


# instance fields
.field private final opts:Lorg/tukaani/xz/FilterOptions;


# direct methods
.method constructor <init>(Lorg/tukaani/xz/FilterOptions;)V
    .registers 3
    .param p1, "opts"    # Lorg/tukaani/xz/FilterOptions;

    .prologue
    .line 120
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Class;

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/sevenz/CoderBase;-><init>([Ljava/lang/Class;)V

    .line 121
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/sevenz/Coders$BCJDecoder;->opts:Lorg/tukaani/xz/FilterOptions;

    .line 122
    return-void
.end method


# virtual methods
.method decode(Ljava/lang/String;Ljava/io/InputStream;JLorg/apache/commons/compress/archivers/sevenz/Coder;[B)Ljava/io/InputStream;
    .registers 11
    .param p1, "archiveName"    # Ljava/lang/String;
    .param p2, "in"    # Ljava/io/InputStream;
    .param p3, "uncompressedLength"    # J
    .param p5, "coder"    # Lorg/apache/commons/compress/archivers/sevenz/Coder;
    .param p6, "password"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 128
    :try_start_0
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/sevenz/Coders$BCJDecoder;->opts:Lorg/tukaani/xz/FilterOptions;

    invoke-virtual {v2, p2}, Lorg/tukaani/xz/FilterOptions;->getInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;
    :try_end_5
    .catch Ljava/lang/AssertionError; {:try_start_0 .. :try_end_5} :catch_7

    move-result-object v2

    return-object v2

    .line 129
    :catch_7
    move-exception v0

    .line 130
    .local v0, "e":Ljava/lang/AssertionError;
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "BCJ filter used in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " needs XZ for Java > 1.4 - see "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "http://commons.apache.org/proper/commons-compress/limitations.html#7Z"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 133
    .local v1, "ex":Ljava/io/IOException;
    invoke-virtual {v1, v0}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 134
    throw v1
.end method

.method encode(Ljava/io/OutputStream;Ljava/lang/Object;)Ljava/io/OutputStream;
    .registers 6
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "options"    # Ljava/lang/Object;

    .prologue
    .line 139
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/sevenz/Coders$BCJDecoder;->opts:Lorg/tukaani/xz/FilterOptions;

    new-instance v2, Lorg/tukaani/xz/FinishableWrapperOutputStream;

    invoke-direct {v2, p1}, Lorg/tukaani/xz/FinishableWrapperOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-virtual {v1, v2}, Lorg/tukaani/xz/FilterOptions;->getOutputStream(Lorg/tukaani/xz/FinishableOutputStream;)Lorg/tukaani/xz/FinishableOutputStream;

    move-result-object v0

    .line 140
    .local v0, "fo":Lorg/tukaani/xz/FinishableOutputStream;
    new-instance v1, Lorg/apache/commons/compress/archivers/sevenz/Coders$BCJDecoder$1;

    invoke-direct {v1, p0, v0}, Lorg/apache/commons/compress/archivers/sevenz/Coders$BCJDecoder$1;-><init>(Lorg/apache/commons/compress/archivers/sevenz/Coders$BCJDecoder;Ljava/io/OutputStream;)V

    return-object v1
.end method
