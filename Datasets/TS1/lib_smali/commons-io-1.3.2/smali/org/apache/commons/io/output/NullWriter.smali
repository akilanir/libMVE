.class public Lorg/apache/commons/io/output/NullWriter;
.super Ljava/io/Writer;
.source "NullWriter.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    .line 35
    return-void
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 70
    return-void
.end method

.method public flush()V
    .registers 1

    .prologue
    .line 65
    return-void
.end method

.method public write(I)V
    .registers 2
    .param p1, "idx"    # I

    .prologue
    .line 40
    return-void
.end method

.method public write(Ljava/lang/String;)V
    .registers 2
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 55
    return-void
.end method

.method public write(Ljava/lang/String;II)V
    .registers 4
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "st"    # I
    .param p3, "end"    # I

    .prologue
    .line 60
    return-void
.end method

.method public write([C)V
    .registers 2
    .param p1, "chr"    # [C

    .prologue
    .line 45
    return-void
.end method

.method public write([CII)V
    .registers 4
    .param p1, "chr"    # [C
    .param p2, "st"    # I
    .param p3, "end"    # I

    .prologue
    .line 50
    return-void
.end method
