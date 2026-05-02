.class public Lnl/siegmann/epublib/epub/BookProcessorPipeline;
.super Ljava/lang/Object;
.source "BookProcessorPipeline.java"

# interfaces
.implements Lnl/siegmann/epublib/epub/BookProcessor;


# instance fields
.field private bookProcessors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/epub/BookProcessor;",
            ">;"
        }
    .end annotation
.end field

.field private log:Lorg/slf4j/Logger;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 27
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lnl/siegmann/epublib/epub/BookProcessorPipeline;-><init>(Ljava/util/List;)V

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/epub/BookProcessor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p1, "bookProcessingPipeline":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/epub/BookProcessor;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const-class v0, Lnl/siegmann/epublib/epub/BookProcessorPipeline;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    iput-object v0, p0, Lnl/siegmann/epublib/epub/BookProcessorPipeline;->log:Lorg/slf4j/Logger;

    .line 31
    iput-object p1, p0, Lnl/siegmann/epublib/epub/BookProcessorPipeline;->bookProcessors:Ljava/util/List;

    .line 32
    return-void
.end method


# virtual methods
.method public addBookProcessor(Lnl/siegmann/epublib/epub/BookProcessor;)V
    .registers 3
    .param p1, "bookProcessor"    # Lnl/siegmann/epublib/epub/BookProcessor;

    .prologue
    .line 51
    iget-object v0, p0, Lnl/siegmann/epublib/epub/BookProcessorPipeline;->bookProcessors:Ljava/util/List;

    if-nez v0, :cond_b

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnl/siegmann/epublib/epub/BookProcessorPipeline;->bookProcessors:Ljava/util/List;

    .line 54
    :cond_b
    iget-object v0, p0, Lnl/siegmann/epublib/epub/BookProcessorPipeline;->bookProcessors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 55
    return-void
.end method

.method public addBookProcessors(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lnl/siegmann/epublib/epub/BookProcessor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 58
    .local p1, "bookProcessors":Ljava/util/Collection;, "Ljava/util/Collection<Lnl/siegmann/epublib/epub/BookProcessor;>;"
    iget-object v0, p0, Lnl/siegmann/epublib/epub/BookProcessorPipeline;->bookProcessors:Ljava/util/List;

    if-nez v0, :cond_b

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnl/siegmann/epublib/epub/BookProcessorPipeline;->bookProcessors:Ljava/util/List;

    .line 61
    :cond_b
    iget-object v0, p0, Lnl/siegmann/epublib/epub/BookProcessorPipeline;->bookProcessors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 62
    return-void
.end method

.method public getBookProcessors()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/epub/BookProcessor;",
            ">;"
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lnl/siegmann/epublib/epub/BookProcessorPipeline;->bookProcessors:Ljava/util/List;

    return-object v0
.end method

.method public processBook(Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Book;
    .registers 8
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;

    .prologue
    .line 37
    iget-object v4, p0, Lnl/siegmann/epublib/epub/BookProcessorPipeline;->bookProcessors:Ljava/util/List;

    if-nez v4, :cond_6

    move-object v0, p1

    .line 47
    .end local p1    # "book":Lnl/siegmann/epublib/domain/Book;
    .local v0, "book":Lnl/siegmann/epublib/domain/Book;
    :goto_5
    return-object v0

    .line 40
    .end local v0    # "book":Lnl/siegmann/epublib/domain/Book;
    .restart local p1    # "book":Lnl/siegmann/epublib/domain/Book;
    :cond_6
    iget-object v4, p0, Lnl/siegmann/epublib/epub/BookProcessorPipeline;->bookProcessors:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_28

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnl/siegmann/epublib/epub/BookProcessor;

    .line 42
    .local v1, "bookProcessor":Lnl/siegmann/epublib/epub/BookProcessor;
    :try_start_18
    invoke-interface {v1, p1}, Lnl/siegmann/epublib/epub/BookProcessor;->processBook(Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Book;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_1b} :catch_1d

    move-result-object p1

    goto :goto_c

    .line 43
    :catch_1d
    move-exception v2

    .line 44
    .local v2, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lnl/siegmann/epublib/epub/BookProcessorPipeline;->log:Lorg/slf4j/Logger;

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_c

    .end local v1    # "bookProcessor":Lnl/siegmann/epublib/epub/BookProcessor;
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_28
    move-object v0, p1

    .line 47
    .end local p1    # "book":Lnl/siegmann/epublib/domain/Book;
    .restart local v0    # "book":Lnl/siegmann/epublib/domain/Book;
    goto :goto_5
.end method

.method public setBookProcessingPipeline(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lnl/siegmann/epublib/epub/BookProcessor;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 71
    .local p1, "bookProcessingPipeline":Ljava/util/List;, "Ljava/util/List<Lnl/siegmann/epublib/epub/BookProcessor;>;"
    iput-object p1, p0, Lnl/siegmann/epublib/epub/BookProcessorPipeline;->bookProcessors:Ljava/util/List;

    .line 72
    return-void
.end method
