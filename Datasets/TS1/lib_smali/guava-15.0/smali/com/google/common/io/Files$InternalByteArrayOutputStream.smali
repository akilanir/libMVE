.class final Lcom/google/common/io/Files$InternalByteArrayOutputStream;
.super Ljava/io/ByteArrayOutputStream;
.source "Files.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/Files;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "InternalByteArrayOutputStream"
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 209
    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/io/Files$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/google/common/io/Files$1;

    .prologue
    .line 209
    invoke-direct {p0}, Lcom/google/common/io/Files$InternalByteArrayOutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method writeTo([BI)V
    .registers 6
    .param p1, "b"    # [B
    .param p2, "off"    # I

    .prologue
    .line 216
    iget-object v0, p0, Lcom/google/common/io/Files$InternalByteArrayOutputStream;->buf:[B

    const/4 v1, 0x0

    iget v2, p0, Lcom/google/common/io/Files$InternalByteArrayOutputStream;->count:I

    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 217
    return-void
.end method
