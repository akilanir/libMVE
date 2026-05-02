.class public interface abstract Lcom/drew/imaging/tiff/TiffHandler;
.super Ljava/lang/Object;
.source "TiffHandler.java"


# virtual methods
.method public abstract completed(Lcom/drew/lang/RandomAccessReader;I)V
    .param p1    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract customProcessTag(ILjava/util/Set;ILcom/drew/lang/RandomAccessReader;II)Z
    .param p2    # Ljava/util/Set;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lcom/drew/lang/RandomAccessReader;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;I",
            "Lcom/drew/lang/RandomAccessReader;",
            "II)Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract endingIFD()V
.end method

.method public abstract error(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract hasFollowerIfd()Z
.end method

.method public abstract setByteArray(I[B)V
    .param p2    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract setDouble(ID)V
.end method

.method public abstract setDoubleArray(I[D)V
    .param p2    # [D
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract setFloat(IF)V
.end method

.method public abstract setFloatArray(I[F)V
    .param p2    # [F
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract setInt16s(II)V
.end method

.method public abstract setInt16sArray(I[S)V
    .param p2    # [S
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract setInt16u(II)V
.end method

.method public abstract setInt16uArray(I[I)V
    .param p2    # [I
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract setInt32s(II)V
.end method

.method public abstract setInt32sArray(I[I)V
    .param p2    # [I
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract setInt32u(IJ)V
.end method

.method public abstract setInt32uArray(I[J)V
    .param p2    # [J
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract setInt8s(IB)V
.end method

.method public abstract setInt8sArray(I[B)V
    .param p2    # [B
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract setInt8u(IS)V
.end method

.method public abstract setInt8uArray(I[S)V
    .param p2    # [S
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract setRational(ILcom/drew/lang/Rational;)V
    .param p2    # Lcom/drew/lang/Rational;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract setRationalArray(I[Lcom/drew/lang/Rational;)V
    .param p2    # [Lcom/drew/lang/Rational;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract setString(ILjava/lang/String;)V
    .param p2    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract setTiffMarker(I)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/drew/imaging/tiff/TiffProcessingException;
        }
    .end annotation
.end method

.method public abstract tryCustomProcessFormat(IIJ)Ljava/lang/Long;
    .annotation build Lcom/drew/lang/annotations/Nullable;
    .end annotation
.end method

.method public abstract tryEnterSubIfd(I)Z
.end method

.method public abstract warn(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Lcom/drew/lang/annotations/NotNull;
        .end annotation
    .end param
.end method
