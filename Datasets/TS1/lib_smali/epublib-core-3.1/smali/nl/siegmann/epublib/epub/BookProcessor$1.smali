.class final Lnl/siegmann/epublib/epub/BookProcessor$1;
.super Ljava/lang/Object;
.source "BookProcessor.java"

# interfaces
.implements Lnl/siegmann/epublib/epub/BookProcessor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnl/siegmann/epublib/epub/BookProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processBook(Lnl/siegmann/epublib/domain/Book;)Lnl/siegmann/epublib/domain/Book;
    .registers 2
    .param p1, "book"    # Lnl/siegmann/epublib/domain/Book;

    .prologue
    .line 22
    return-object p1
.end method
