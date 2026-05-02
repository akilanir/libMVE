.class public Lorg/ini4j/spi/OptionsFormatter;
.super Lorg/ini4j/spi/AbstractFormatter;
.source "OptionsFormatter.java"

# interfaces
.implements Lorg/ini4j/spi/OptionsHandler;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 23
    invoke-direct {p0}, Lorg/ini4j/spi/AbstractFormatter;-><init>()V

    return-void
.end method

.method private static newInstance()Lorg/ini4j/spi/OptionsFormatter;
    .registers 1

    .prologue
    .line 47
    const-class v0, Lorg/ini4j/spi/OptionsFormatter;

    invoke-static {v0}, Lorg/ini4j/spi/ServiceFinder;->findService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/ini4j/spi/OptionsFormatter;

    return-object v0
.end method

.method public static newInstance(Ljava/io/Writer;Lorg/ini4j/Config;)Lorg/ini4j/spi/OptionsFormatter;
    .registers 4
    .param p0, "out"    # Ljava/io/Writer;
    .param p1, "config"    # Lorg/ini4j/Config;

    .prologue
    .line 27
    invoke-static {}, Lorg/ini4j/spi/OptionsFormatter;->newInstance()Lorg/ini4j/spi/OptionsFormatter;

    move-result-object v0

    .line 29
    .local v0, "instance":Lorg/ini4j/spi/OptionsFormatter;
    instance-of v1, p0, Ljava/io/PrintWriter;

    if-eqz v1, :cond_11

    check-cast p0, Ljava/io/PrintWriter;

    .end local p0    # "out":Ljava/io/Writer;
    :goto_a
    invoke-virtual {v0, p0}, Lorg/ini4j/spi/OptionsFormatter;->setOutput(Ljava/io/PrintWriter;)V

    .line 30
    invoke-virtual {v0, p1}, Lorg/ini4j/spi/OptionsFormatter;->setConfig(Lorg/ini4j/Config;)V

    .line 32
    return-object v0

    .line 29
    .restart local p0    # "out":Ljava/io/Writer;
    :cond_11
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, p0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    move-object p0, v1

    goto :goto_a
.end method


# virtual methods
.method public endOptions()V
    .registers 2

    .prologue
    .line 37
    invoke-virtual {p0}, Lorg/ini4j/spi/OptionsFormatter;->getOutput()Ljava/io/PrintWriter;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/PrintWriter;->flush()V

    .line 38
    return-void
.end method

.method public bridge synthetic handleComment(Ljava/lang/String;)V
    .registers 2
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-super {p0, p1}, Lorg/ini4j/spi/AbstractFormatter;->handleComment(Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic handleOption(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-super {p0, p1, p2}, Lorg/ini4j/spi/AbstractFormatter;->handleOption(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public startOptions()V
    .registers 1

    .prologue
    .line 43
    return-void
.end method
