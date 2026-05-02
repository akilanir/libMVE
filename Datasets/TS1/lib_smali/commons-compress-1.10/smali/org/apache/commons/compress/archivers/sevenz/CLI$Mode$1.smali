.class final enum Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode$1;
.super Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;
.source "CLI.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .registers 5
    .param p3, "x0"    # Ljava/lang/String;

    .prologue
    .line 29
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;-><init>(Ljava/lang/String;ILjava/lang/String;Lorg/apache/commons/compress/archivers/sevenz/CLI$1;)V

    return-void
.end method

.method private getContentMethods(Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;)Ljava/lang/String;
    .registers 8
    .param p1, "entry"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .prologue
    .line 52
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .local v3, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x1

    .line 54
    .local v0, "first":Z
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getContentMethods()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_e
    :goto_e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_43

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;

    .line 55
    .local v2, "m":Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;
    if-nez v0, :cond_21

    .line 56
    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    :cond_21
    const/4 v0, 0x0

    .line 59
    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;->getMethod()Lorg/apache/commons/compress/archivers/sevenz/SevenZMethod;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;->getOptions()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_e

    .line 61
    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;->getOptions()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_e

    .line 64
    .end local v2    # "m":Lorg/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration;
    :cond_43
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public takeAction(Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;)V
    .registers 7
    .param p1, "archive"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;
    .param p2, "entry"    # Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    .prologue
    .line 32
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 33
    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_5b

    .line 34
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, " dir"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 39
    :goto_16
    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getHasLastModifiedDate()Z

    move-result v0

    if-eqz v0, :cond_86

    .line 40
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getLastModifiedDate()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 44
    :goto_38
    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_8e

    .line 45
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0, p2}, Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode$1;->getContentMethods(Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 49
    :goto_5a
    return-void

    .line 36
    :cond_5b
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getCompressedSize()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;->getSize()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_16

    .line 42
    :cond_86
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, " no last modified date"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_38

    .line 47
    :cond_8e
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_5a
.end method
