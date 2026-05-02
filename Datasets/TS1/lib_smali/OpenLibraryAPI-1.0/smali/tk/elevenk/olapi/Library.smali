.class public interface abstract Ltk/elevenk/olapi/Library;
.super Ljava/lang/Object;
.source "Library.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltk/elevenk/olapi/Library$LibraryCallbacks;
    }
.end annotation


# virtual methods
.method public abstract cancelRequest()V
.end method

.method public abstract findRandomBook(Ltk/elevenk/olapi/Library$LibraryCallbacks;)Ljava/lang/Object;
.end method

.method public abstract getBaseUrl()Ljava/lang/String;
.end method

.method public abstract getBookDetails(Ltk/elevenk/olapi/books/BookQuery;)Ltk/elevenk/olapi/data/BookData;
.end method

.method public abstract getCoverUrls(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;
.end method

.method public abstract getEbook(Ltk/elevenk/olapi/data/BookData;)Ljava/lang/Object;
.end method

.method public abstract getReadingDetails(Ltk/elevenk/olapi/read/ReadQuery;)Ltk/elevenk/olapi/data/BookData;
.end method

.method public abstract login(Ltk/elevenk/olapi/data/Credential;)Z
.end method

.method public abstract search(Ltk/elevenk/olapi/search/SearchQuery;)Ltk/elevenk/olapi/search/SearchResults;
.end method
