.class final Lfreemarker/core/Environment$6;
.super Ljava/io/Writer;
.source "Environment.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 1923
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 1

    .prologue
    .line 1936
    return-void
.end method

.method public flush()V
    .registers 1

    .prologue
    .line 1933
    return-void
.end method

.method public write([CII)V
    .registers 6
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1926
    if-lez p3, :cond_a

    .line 1927
    new-instance v0, Ljava/io/IOException;

    const-string v1, "This transform does not allow nested content."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1930
    :cond_a
    return-void
.end method
