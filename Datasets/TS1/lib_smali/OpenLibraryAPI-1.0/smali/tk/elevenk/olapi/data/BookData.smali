.class public Ltk/elevenk/olapi/data/BookData;
.super Ljava/lang/Object;
.source "BookData.java"


# static fields
.field private static final AUTHOR:Ljava/lang/String; = "author_name"

.field private static final AUTHORS:Ljava/lang/String; = "authors"

.field private static final AUTHOR_ALTERNATIVE_NAME:Ljava/lang/String; = "author_alternative_name"

.field private static final AUTHOR_KEY:Ljava/lang/String; = "author_key"

.field private static final BOOKS:Ljava/lang/String; = "/books/"

.field private static final BY_STATEMENT:Ljava/lang/String; = "by_statement"

.field private static final CLASSIFICATIONS:Ljava/lang/String; = "classifications"

.field private static final CONTRIBUTOR:Ljava/lang/String; = "contributor"

.field private static final COVERS:Ljava/lang/String; = "cover"

.field private static final COVER_EDITION_KEY:Ljava/lang/String; = "cover_edition_key"

.field private static final COVER_ID:Ljava/lang/String; = "cover_i"

.field private static final DATA:Ljava/lang/String; = "data"

.field private static final DJVU:Ljava/lang/String; = "djvu"

.field private static final EBOOKS:Ljava/lang/String; = "ebooks"

.field private static final EDITION_KEY:Ljava/lang/String; = "edition_key"

.field private static final EPUB:Ljava/lang/String; = "epub"

.field private static final EXCEPTS:Ljava/lang/String; = "excerpts"

.field private static final FIRST_PUBLISHED_YEAR:Ljava/lang/String; = "first_publish_year"

.field private static final FIRST_SENTENCE:Ljava/lang/String; = "first_sentence"

.field private static final FORMATS:Ljava/lang/String; = "formats"

.field private static final FULL_ACCESS:Ljava/lang/String; = "full access"

.field private static final HAS_FULL_TEXT:Ljava/lang/String; = "has_fulltext"

.field private static final IA:Ljava/lang/String; = "ia"

.field private static final IA_BOX_ID:Ljava/lang/String; = "ia_box_id"

.field private static final IA_COLLECTION_S:Ljava/lang/String; = "ia_collection_s"

.field private static final IA_LOADED_ID:Ljava/lang/String; = "ia_loaded_id"

.field private static final IDENTIFIERS:Ljava/lang/String; = "identifiers"

.field private static final ID_DNB:Ljava/lang/String; = "id_dnb"

.field private static final ID_GOODREADS:Ljava/lang/String; = "id_goodreads"

.field private static final ID_LIBRARYTHING:Ljava/lang/String; = "id_librarything"

.field private static final ID_LIBRIS:Ljava/lang/String; = "id_libris"

.field private static final ID_OVERDRIVE:Ljava/lang/String; = "id_overdrive"

.field private static final ISBN:Ljava/lang/String; = "isbn"

.field private static final ITEMS:Ljava/lang/String; = "items"

.field private static final KEY_BOOK:Ljava/lang/String; = "key"

.field private static final KEY_SEARCH:Ljava/lang/String; = "key"

.field private static final LANGUAGE:Ljava/lang/String; = "language"

.field private static final LAST_MODIFIED_I:Ljava/lang/String; = "last_modified_i"

.field private static final LCCN:Ljava/lang/String; = "lccn"

.field private static final LINKS:Ljava/lang/String; = "links"

.field private static final NOTES:Ljava/lang/String; = "notes"

.field private static final NUM_EBOOKS:Ljava/lang/String; = "ebook_count_i"

.field private static final NUM_EDITIONS:Ljava/lang/String; = "edition_count"

.field private static final NUM_PAGES:Ljava/lang/String; = "number_of_pages"

.field private static final OCLC:Ljava/lang/String; = "oclc"

.field private static final OILD_LOWERCASE:Ljava/lang/String; = "olid:"

.field private static final OLID:Ljava/lang/String; = "OLID:"

.field private static final OL_EDITION_ID:Ljava/lang/String; = "ol-edition-id"

.field private static final OVERDIRVE_S:Ljava/lang/String; = "overdrive_s"

.field private static final PAGINATION:Ljava/lang/String; = "pagination"

.field private static final PDF:Ljava/lang/String; = "pdf"

.field private static final PERSON:Ljava/lang/String; = "person"

.field private static final PRINT_DISABLED_S:Ljava/lang/String; = "printdisabled_s"

.field private static final PUBLIC_SCANNED_BOOK:Ljava/lang/String; = "public_scan_b"

.field private static final PUBLISHER:Ljava/lang/String; = "publisher"

.field private static final PUBLISHERS:Ljava/lang/String; = "publishers"

.field private static final PUBLISHERS_NAME:Ljava/lang/String; = "name"

.field private static final PUBLISH_DATE:Ljava/lang/String; = "publish_date"

.field private static final PUBLISH_PLACE:Ljava/lang/String; = "publish_place"

.field private static final PUBLISH_PLACES:Ljava/lang/String; = "publish_places"

.field private static final PUBLISH_YEARS:Ljava/lang/String; = "publish_year"

.field private static final RECORDS:Ljava/lang/String; = "records"

.field private static final SEED:Ljava/lang/String; = "seed"

.field private static final STATUS:Ljava/lang/String; = "status"

.field private static final SUBJECT:Ljava/lang/String; = "subject"

.field private static final SUBJECTS:Ljava/lang/String; = "subjects"

.field private static final TABLE_OF_CONTENTS:Ljava/lang/String; = "table_of_contents"

.field private static final TEXT_BOOK:Ljava/lang/String; = "text"

.field private static final TEXT_SEARCH:Ljava/lang/String; = "text"

.field private static final TITLE_BOOK:Ljava/lang/String; = "title"

.field private static final TITLE_SEARCH:Ljava/lang/String; = "title"

.field private static final TITLE_SUGGEST:Ljava/lang/String; = "title_suggest"

.field private static final TOC_LABEL:Ljava/lang/String; = "label"

.field private static final TOC_LEVEL:Ljava/lang/String; = "level"

.field private static final TOC_PAGENUM:Ljava/lang/String; = "pagenum"

.field private static final TOC_TITLE:Ljava/lang/String; = "title"

.field private static final TYPE:Ljava/lang/String; = "type"

.field private static final URL:Ljava/lang/String; = "url"

.field private static final WEIGHT:Ljava/lang/String; = "weight"


# instance fields
.field private authorAlternativeNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private authorKeys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private authors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private authorsMap:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private bookDataFromApi:Lorg/json/JSONObject;

.field private bookDataFromSearch:Lorg/json/JSONObject;

.field private byStatement:Ljava/lang/String;

.field private classifications:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List;",
            ">;"
        }
    .end annotation
.end field

.field private contributors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private coverEditionKey:Ljava/lang/String;

.field private coverId:Ljava/lang/Integer;

.field private coverImage:Ljava/lang/Object;

.field private covers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private editionKeys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private epubUrl:Ljava/lang/String;

.field private excerpts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private firstPublishedYear:Ljava/lang/String;

.field private firstSentences:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private fullText:Ljava/lang/Boolean;

.field private identifiers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List;",
            ">;"
        }
    .end annotation
.end field

.field private isbns:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private key:Ljava/lang/String;

.field private languages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private links:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private notes:Ljava/lang/String;

.field private numEbooks:Ljava/lang/Integer;

.field private numEditions:Ljava/lang/Integer;

.field private numPages:Ljava/lang/Integer;

.field private oclcs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private olid:Ljava/lang/String;

.field private pagination:Ljava/lang/String;

.field private persons:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private publicScannedBook:Ljava/lang/Boolean;

.field private publishDate:Ljava/lang/String;

.field private publishDates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private publishPlaces:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private publishYears:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private publishers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private readingDataFromApi:Lorg/json/JSONObject;

.field private subjects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private subjectsMap:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private tableOfContents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private title:Ljava/lang/String;

.field private url:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .registers 4
    .param p1, "search"    # Lorg/json/JSONObject;
    .param p2, "api"    # Lorg/json/JSONObject;
    .param p3, "reading"    # Lorg/json/JSONObject;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    iput-object p1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    .line 92
    iput-object p2, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    .line 93
    iput-object p3, p0, Ltk/elevenk/olapi/data/BookData;->readingDataFromApi:Lorg/json/JSONObject;

    .line 94
    return-void
.end method

.method public static bookFromBookApi(Lorg/json/JSONObject;)Ltk/elevenk/olapi/data/BookData;
    .registers 4
    .param p0, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 101
    new-instance v0, Ltk/elevenk/olapi/data/BookData;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-direct {v0, v1, p0, v2}, Ltk/elevenk/olapi/data/BookData;-><init>(Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    return-object v0
.end method

.method public static bookFromReadingApi(Lorg/json/JSONObject;)Ltk/elevenk/olapi/data/BookData;
    .registers 4
    .param p0, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 105
    new-instance v0, Ltk/elevenk/olapi/data/BookData;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-direct {v0, v1, v2, p0}, Ltk/elevenk/olapi/data/BookData;-><init>(Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    return-object v0
.end method

.method public static bookFromSearch(Lorg/json/JSONObject;)Ltk/elevenk/olapi/data/BookData;
    .registers 4
    .param p0, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 97
    new-instance v0, Ltk/elevenk/olapi/data/BookData;

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    invoke-direct {v0, p0, v1, v2}, Ltk/elevenk/olapi/data/BookData;-><init>(Lorg/json/JSONObject;Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    return-object v0
.end method

.method private convertJSONArrayOfJSONObjectsToListOfMaps(Lorg/json/JSONArray;)Ljava/util/List;
    .registers 9
    .param p1, "array"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 852
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 853
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v0, v6, :cond_33

    .line 854
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 855
    .local v4, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 856
    .local v5, "object":Lorg/json/JSONObject;
    invoke-virtual {v5}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 857
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2d

    .line 858
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 859
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {v5, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_19

    .line 861
    .end local v2    # "key":Ljava/lang/String;
    :cond_2d
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 853
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 863
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v4    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "object":Lorg/json/JSONObject;
    :cond_33
    return-object v3
.end method

.method private convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;
    .registers 5
    .param p1, "array"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONArray;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 843
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 845
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_16

    .line 846
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 845
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 848
    :cond_16
    return-object v1
.end method

.method private getEbookUrl(Ljava/lang/String;)Ljava/lang/Object;
    .registers 12
    .param p1, "format"    # Ljava/lang/String;

    .prologue
    .line 797
    const-string v1, ""

    .line 798
    .local v1, "data":Ljava/lang/String;
    move-object v6, v1

    .line 799
    .local v6, "returnedData":Ljava/lang/String;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 800
    .local v0, "alternatives":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    invoke-virtual {v7}, Lorg/json/JSONObject;->length()I

    move-result v7

    if-lez v7, :cond_3d

    .line 802
    :try_start_10
    iget-object v8, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    invoke-virtual {v7}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v8, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "ebooks"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "formats"

    .line 803
    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v7, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "url"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_3c
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_3c} :catch_ec

    move-result-object v1

    .line 808
    :cond_3d
    :goto_3d
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_9f

    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->readingDataFromApi:Lorg/json/JSONObject;

    invoke-virtual {v7}, Lorg/json/JSONObject;->length()I

    move-result v7

    if-lez v7, :cond_9f

    .line 810
    :try_start_4b
    iget-object v8, p0, Ltk/elevenk/olapi/data/BookData;->readingDataFromApi:Lorg/json/JSONObject;

    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->readingDataFromApi:Lorg/json/JSONObject;

    invoke-virtual {v7}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v8, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "records"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "/books/"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 811
    invoke-virtual {p0}, Ltk/elevenk/olapi/data/BookData;->getOlid()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "data"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "ebooks"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "formats"

    .line 812
    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v7, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "url"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_9e
    .catch Lorg/json/JSONException; {:try_start_4b .. :try_end_9e} :catch_f4

    move-result-object v1

    .line 818
    :cond_9f
    :goto_9f
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_10a

    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->readingDataFromApi:Lorg/json/JSONObject;

    invoke-virtual {v7}, Lorg/json/JSONObject;->length()I

    move-result v7

    if-lez v7, :cond_10a

    .line 821
    :try_start_ad
    iget-object v8, p0, Ltk/elevenk/olapi/data/BookData;->readingDataFromApi:Lorg/json/JSONObject;

    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->readingDataFromApi:Lorg/json/JSONObject;

    invoke-virtual {v7}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v8, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "items"

    .line 822
    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    .line 823
    .local v4, "items":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_c6
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v3, v7, :cond_fb

    .line 824
    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/json/JSONObject;

    .line 825
    .local v5, "object":Lorg/json/JSONObject;
    const-string v7, "status"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    const-string v8, "full access"

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_e9

    .line 826
    const-string v7, "ol-edition-id"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_e9
    .catch Lorg/json/JSONException; {:try_start_ad .. :try_end_e9} :catch_103

    .line 823
    :cond_e9
    add-int/lit8 v3, v3, 0x1

    goto :goto_c6

    .line 804
    .end local v3    # "i":I
    .end local v4    # "items":Lorg/json/JSONArray;
    .end local v5    # "object":Lorg/json/JSONObject;
    :catch_ec
    move-exception v2

    .line 805
    .local v2, "e":Lorg/json/JSONException;
    const-string v7, "Unable to get ebook data"

    invoke-static {v7, v2}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3d

    .line 813
    .end local v2    # "e":Lorg/json/JSONException;
    :catch_f4
    move-exception v2

    .line 814
    .restart local v2    # "e":Lorg/json/JSONException;
    const-string v7, "Unable to get ebook data"

    invoke-static {v7, v2}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_9f

    .line 829
    .end local v2    # "e":Lorg/json/JSONException;
    .restart local v3    # "i":I
    .restart local v4    # "items":Lorg/json/JSONArray;
    :cond_fb
    :try_start_fb
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
    :try_end_fe
    .catch Lorg/json/JSONException; {:try_start_fb .. :try_end_fe} :catch_103

    move-result v7

    if-lez v7, :cond_102

    .line 830
    move-object v6, v0

    .line 839
    .end local v3    # "i":I
    .end local v4    # "items":Lorg/json/JSONArray;
    .end local v6    # "returnedData":Ljava/lang/String;
    :cond_102
    :goto_102
    return-object v6

    .line 832
    .restart local v6    # "returnedData":Ljava/lang/String;
    :catch_103
    move-exception v2

    .line 834
    .restart local v2    # "e":Lorg/json/JSONException;
    const-string v7, ""

    invoke-static {v7, v2}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_102

    .line 837
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_10a
    move-object v6, v1

    goto :goto_102
.end method


# virtual methods
.method public addBookDetails(Ltk/elevenk/olapi/Library;)V
    .registers 3
    .param p1, "lib"    # Ltk/elevenk/olapi/Library;

    .prologue
    .line 701
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Ltk/elevenk/olapi/data/BookData;->addBookDetails(Ltk/elevenk/olapi/Library;I)V

    .line 702
    return-void
.end method

.method public addBookDetails(Ltk/elevenk/olapi/Library;I)V
    .registers 10
    .param p1, "lib"    # Ltk/elevenk/olapi/Library;
    .param p2, "edition"    # I

    .prologue
    .line 705
    iget-object v4, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    invoke-virtual {v4}, Lorg/json/JSONObject;->length()I

    move-result v4

    if-gtz v4, :cond_2a

    .line 706
    new-instance v3, Ltk/elevenk/olapi/books/BookQuery;

    invoke-direct {v3}, Ltk/elevenk/olapi/books/BookQuery;-><init>()V

    .line 708
    .local v3, "query":Ltk/elevenk/olapi/books/BookQuery;
    :try_start_d
    invoke-virtual {p0}, Ltk/elevenk/olapi/data/BookData;->getEditionKeys()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ltk/elevenk/olapi/books/BookQuery;->olid(Ljava/lang/String;)V
    :try_end_1a
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_1a} :catch_2b

    .line 722
    :goto_1a
    invoke-virtual {v3}, Ltk/elevenk/olapi/books/BookQuery;->size()I

    move-result v4

    if-lez v4, :cond_2a

    .line 723
    invoke-interface {p1, v3}, Ltk/elevenk/olapi/Library;->getBookDetails(Ltk/elevenk/olapi/books/BookQuery;)Ltk/elevenk/olapi/data/BookData;

    move-result-object v4

    invoke-virtual {v4}, Ltk/elevenk/olapi/data/BookData;->getBookData()Lorg/json/JSONObject;

    move-result-object v4

    iput-object v4, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    .line 726
    .end local v3    # "query":Ltk/elevenk/olapi/books/BookQuery;
    :cond_2a
    return-void

    .line 709
    .restart local v3    # "query":Ltk/elevenk/olapi/books/BookQuery;
    :catch_2b
    move-exception v0

    .line 711
    .local v0, "e":Ljava/lang/Exception;
    :try_start_2c
    invoke-virtual {p0}, Ltk/elevenk/olapi/data/BookData;->getKey()Ljava/lang/String;

    move-result-object v4

    const-string v5, "/.*/"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ltk/elevenk/olapi/books/BookQuery;->olid(Ljava/lang/String;)V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_3b} :catch_3c

    goto :goto_1a

    .line 712
    :catch_3c
    move-exception v1

    .line 714
    .local v1, "e2":Ljava/lang/Exception;
    :try_start_3d
    invoke-virtual {p0}, Ltk/elevenk/olapi/data/BookData;->getOlid()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ltk/elevenk/olapi/books/BookQuery;->olid(Ljava/lang/String;)V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_44} :catch_45

    goto :goto_1a

    .line 715
    :catch_45
    move-exception v2

    .line 716
    .local v2, "e3":Ljava/lang/Exception;
    invoke-virtual {v1, v0}, Ljava/lang/Exception;->addSuppressed(Ljava/lang/Throwable;)V

    .line 717
    invoke-virtual {v2, v1}, Ljava/lang/Exception;->addSuppressed(Ljava/lang/Throwable;)V

    .line 718
    const-string v4, "Unable to add book details"

    invoke-static {v4, v2}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1a
.end method

.method public addReadingDetails(Ltk/elevenk/olapi/Library;)V
    .registers 3
    .param p1, "lib"    # Ltk/elevenk/olapi/Library;

    .prologue
    .line 729
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Ltk/elevenk/olapi/data/BookData;->addReadingDetails(Ltk/elevenk/olapi/Library;I)V

    .line 730
    return-void
.end method

.method public addReadingDetails(Ltk/elevenk/olapi/Library;I)V
    .registers 7
    .param p1, "lib"    # Ltk/elevenk/olapi/Library;
    .param p2, "edition"    # I

    .prologue
    .line 733
    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->readingDataFromApi:Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->length()I

    move-result v3

    if-gtz v3, :cond_2a

    .line 734
    new-instance v2, Ltk/elevenk/olapi/read/ReadQuery;

    invoke-direct {v2}, Ltk/elevenk/olapi/read/ReadQuery;-><init>()V

    .line 736
    .local v2, "query":Ltk/elevenk/olapi/read/ReadQuery;
    :try_start_d
    invoke-virtual {p0}, Ltk/elevenk/olapi/data/BookData;->getEditionKeys()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ltk/elevenk/olapi/read/ReadQuery;->olid(Ljava/lang/String;)V
    :try_end_1a
    .catch Ljava/lang/NullPointerException; {:try_start_d .. :try_end_1a} :catch_2b

    .line 744
    :goto_1a
    invoke-virtual {v2}, Ltk/elevenk/olapi/read/ReadQuery;->size()I

    move-result v3

    if-lez v3, :cond_2a

    .line 745
    invoke-interface {p1, v2}, Ltk/elevenk/olapi/Library;->getReadingDetails(Ltk/elevenk/olapi/read/ReadQuery;)Ltk/elevenk/olapi/data/BookData;

    move-result-object v3

    invoke-virtual {v3}, Ltk/elevenk/olapi/data/BookData;->getReadingData()Lorg/json/JSONObject;

    move-result-object v3

    iput-object v3, p0, Ltk/elevenk/olapi/data/BookData;->readingDataFromApi:Lorg/json/JSONObject;

    .line 748
    .end local v2    # "query":Ltk/elevenk/olapi/read/ReadQuery;
    :cond_2a
    return-void

    .line 737
    .restart local v2    # "query":Ltk/elevenk/olapi/read/ReadQuery;
    :catch_2b
    move-exception v0

    .line 739
    .local v0, "e":Ljava/lang/NullPointerException;
    :try_start_2c
    invoke-virtual {p0}, Ltk/elevenk/olapi/data/BookData;->getOlid()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ltk/elevenk/olapi/read/ReadQuery;->olid(Ljava/lang/String;)V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_33} :catch_34

    goto :goto_1a

    .line 740
    :catch_34
    move-exception v1

    .line 741
    .local v1, "e2":Ljava/lang/Exception;
    const-string v3, "Unable to get olid for reading api"

    invoke-static {v3, v1}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1a
.end method

.method public getAuthorAlternativeNames()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 366
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->authorAlternativeNames:Ljava/util/List;

    if-nez v1, :cond_16

    .line 367
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 369
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "author_alternative_name"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->authorAlternativeNames:Ljava/util/List;
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_16} :catch_19

    .line 375
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->authorAlternativeNames:Ljava/util/List;

    return-object v1

    .line 370
    :catch_19
    move-exception v0

    .line 371
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get author alternative names"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getAuthorKeys()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 568
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->authorKeys:Ljava/util/List;

    if-nez v1, :cond_16

    .line 569
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 571
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "author_key"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->authorKeys:Ljava/util/List;
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_16} :catch_19

    .line 577
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->authorKeys:Ljava/util/List;

    return-object v1

    .line 572
    :catch_19
    move-exception v0

    .line 573
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get author key"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getAuthorNames()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 424
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->authors:Ljava/util/List;

    if-nez v1, :cond_16

    .line 425
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 427
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "author_name"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->authors:Ljava/util/List;
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_16} :catch_19

    .line 433
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->authors:Ljava/util/List;

    return-object v1

    .line 428
    :catch_19
    move-exception v0

    .line 429
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get author name"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getAuthorsMap()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 288
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->authorsMap:Ljava/util/List;

    if-nez v1, :cond_16

    .line 289
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 291
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v2, "authors"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayOfJSONObjectsToListOfMaps(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->authorsMap:Ljava/util/List;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_16} :catch_19

    .line 297
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->authorsMap:Ljava/util/List;

    return-object v1

    .line 292
    :catch_19
    move-exception v0

    .line 293
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Unable to parse subjects"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getBookData()Lorg/json/JSONObject;
    .registers 2

    .prologue
    .line 755
    iget-object v0, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getByStatement()Ljava/lang/String;
    .registers 4

    .prologue
    .line 109
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->byStatement:Ljava/lang/String;

    if-nez v1, :cond_12

    .line 110
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v1, :cond_12

    .line 112
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v2, "by_statement"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->byStatement:Ljava/lang/String;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_12} :catch_15

    .line 118
    :cond_12
    :goto_12
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->byStatement:Ljava/lang/String;

    return-object v1

    .line 113
    :catch_15
    move-exception v0

    .line 114
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Unable to get by statement"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_12
.end method

.method public getClassifications()Ljava/util/Map;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List;",
            ">;"
        }
    .end annotation

    .prologue
    .line 227
    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->classifications:Ljava/util/Map;

    if-nez v7, :cond_4d

    .line 228
    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v7, :cond_4d

    .line 230
    :try_start_8
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, p0, Ltk/elevenk/olapi/data/BookData;->classifications:Ljava/util/Map;

    .line 231
    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v8, "classifications"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 232
    .local v6, "object":Lorg/json/JSONObject;
    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .line 233
    .local v3, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_1b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4d

    .line 234
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 235
    .local v4, "key":Ljava/lang/String;
    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 236
    .local v0, "array":Lorg/json/JSONArray;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 237
    .local v5, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_31
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v2, v7, :cond_41

    .line 238
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 237
    add-int/lit8 v2, v2, 0x1

    goto :goto_31

    .line 240
    :cond_41
    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->classifications:Ljava/util/Map;

    invoke-interface {v7, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_46} :catch_47

    goto :goto_1b

    .line 242
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v2    # "i":I
    .end local v3    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v6    # "object":Lorg/json/JSONObject;
    :catch_47
    move-exception v1

    .line 243
    .local v1, "e":Ljava/lang/Exception;
    const-string v7, "Unable to parse classifications"

    invoke-static {v7, v1}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 247
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_4d
    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->classifications:Ljava/util/Map;

    return-object v7
.end method

.method public getContributors()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 688
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->contributors:Ljava/util/List;

    if-nez v1, :cond_16

    .line 689
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 691
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "contributor"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->contributors:Ljava/util/List;
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_16} :catch_19

    .line 697
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->contributors:Ljava/util/List;

    return-object v1

    .line 692
    :catch_19
    move-exception v0

    .line 693
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get contributors"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getCoverEditionKey()Ljava/lang/String;
    .registers 4

    .prologue
    .line 595
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->coverEditionKey:Ljava/lang/String;

    if-nez v1, :cond_12

    .line 596
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_12

    .line 598
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "cover_edition_key"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->coverEditionKey:Ljava/lang/String;
    :try_end_12
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_12} :catch_15

    .line 604
    :cond_12
    :goto_12
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->coverEditionKey:Ljava/lang/String;

    return-object v1

    .line 599
    :catch_15
    move-exception v0

    .line 600
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get cover edition key"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_12
.end method

.method public getCoverId()I
    .registers 4

    .prologue
    .line 581
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->coverId:Ljava/lang/Integer;

    if-nez v1, :cond_1d

    .line 582
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->coverId:Ljava/lang/Integer;

    .line 583
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_1d

    .line 585
    :try_start_f
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "cover_i"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->coverId:Ljava/lang/Integer;
    :try_end_1d
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_1d} :catch_24

    .line 591
    :cond_1d
    :goto_1d
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->coverId:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1

    .line 586
    :catch_24
    move-exception v0

    .line 587
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get cover id"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1d
.end method

.method public getCoverImage()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 867
    iget-object v0, p0, Ltk/elevenk/olapi/data/BookData;->coverImage:Ljava/lang/Object;

    return-object v0
.end method

.method public getCovers()Ljava/util/Map;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 161
    iget-object v4, p0, Ltk/elevenk/olapi/data/BookData;->covers:Ljava/util/Map;

    if-nez v4, :cond_37

    .line 162
    iget-object v4, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v4, :cond_37

    .line 164
    :try_start_8
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    iput-object v4, p0, Ltk/elevenk/olapi/data/BookData;->covers:Ljava/util/Map;

    .line 165
    iget-object v4, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v5, "cover"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 166
    .local v3, "object":Lorg/json/JSONObject;
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 167
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_1b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_37

    .line 168
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 169
    .local v2, "key":Ljava/lang/String;
    iget-object v4, p0, Ltk/elevenk/olapi/data/BookData;->covers:Ljava/util/Map;

    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_30} :catch_31

    goto :goto_1b

    .line 171
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "object":Lorg/json/JSONObject;
    :catch_31
    move-exception v0

    .line 172
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "Unable to get covers"

    invoke-static {v4, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 176
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_37
    iget-object v4, p0, Ltk/elevenk/olapi/data/BookData;->covers:Ljava/util/Map;

    return-object v4
.end method

.method public getDjvuUrl()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 789
    const-string v0, "djvu"

    invoke-direct {p0, v0}, Ltk/elevenk/olapi/data/BookData;->getEbookUrl(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getEditionKeys()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 622
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->editionKeys:Ljava/util/List;

    if-nez v1, :cond_16

    .line 623
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 625
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "edition_key"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->editionKeys:Ljava/util/List;
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_16} :catch_19

    .line 631
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->editionKeys:Ljava/util/List;

    return-object v1

    .line 626
    :catch_19
    move-exception v0

    .line 627
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get edition keys"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getEpubUrl()Ljava/lang/Object;
    .registers 3

    .prologue
    .line 773
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->epubUrl:Ljava/lang/String;

    if-nez v1, :cond_15

    .line 774
    const-string v1, "epub"

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->getEbookUrl(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 775
    .local v0, "data":Ljava/lang/Object;
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_14

    .line 776
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->epubUrl:Ljava/lang/String;

    .line 781
    .end local v0    # "data":Ljava/lang/Object;
    :cond_14
    :goto_14
    return-object v0

    .line 779
    :cond_15
    iget-object v0, p0, Ltk/elevenk/olapi/data/BookData;->epubUrl:Ljava/lang/String;

    .local v0, "data":Ljava/lang/String;
    goto :goto_14
.end method

.method public getFirstPublishYear()Ljava/lang/String;
    .registers 4

    .prologue
    .line 513
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->firstPublishedYear:Ljava/lang/String;

    if-nez v1, :cond_12

    .line 514
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_12

    .line 516
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "first_publish_year"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->firstPublishedYear:Ljava/lang/String;
    :try_end_12
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_12} :catch_15

    .line 522
    :cond_12
    :goto_12
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->firstPublishedYear:Ljava/lang/String;

    return-object v1

    .line 517
    :catch_15
    move-exception v0

    .line 518
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get first published year"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_12
.end method

.method public getFirstSentences()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 340
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->firstSentences:Ljava/util/List;

    if-nez v1, :cond_16

    .line 341
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 343
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "first_sentence"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->firstSentences:Ljava/util/List;
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_16} :catch_19

    .line 349
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->firstSentences:Ljava/util/List;

    return-object v1

    .line 344
    :catch_19
    move-exception v0

    .line 345
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get publish places"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getIdentifiers()Ljava/util/Map;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List;",
            ">;"
        }
    .end annotation

    .prologue
    .line 251
    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->identifiers:Ljava/util/Map;

    if-nez v7, :cond_4d

    .line 252
    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v7, :cond_4d

    .line 254
    :try_start_8
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    iput-object v7, p0, Ltk/elevenk/olapi/data/BookData;->identifiers:Ljava/util/Map;

    .line 255
    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v8, "identifiers"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 256
    .local v6, "object":Lorg/json/JSONObject;
    invoke-virtual {v6}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .line 257
    .local v3, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_1b
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4d

    .line 258
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 259
    .local v4, "key":Ljava/lang/String;
    invoke-virtual {v6, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 260
    .local v0, "array":Lorg/json/JSONArray;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 261
    .local v5, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_31
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v2, v7, :cond_41

    .line 262
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 261
    add-int/lit8 v2, v2, 0x1

    goto :goto_31

    .line 264
    :cond_41
    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->identifiers:Ljava/util/Map;

    invoke-interface {v7, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_46} :catch_47

    goto :goto_1b

    .line 266
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v2    # "i":I
    .end local v3    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v4    # "key":Ljava/lang/String;
    .end local v5    # "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v6    # "object":Lorg/json/JSONObject;
    :catch_47
    move-exception v1

    .line 267
    .local v1, "e":Ljava/lang/Exception;
    const-string v7, "Unable to parse identifiers"

    invoke-static {v7, v1}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 271
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_4d
    iget-object v7, p0, Ltk/elevenk/olapi/data/BookData;->identifiers:Ljava/util/Map;

    return-object v7
.end method

.method public getIsbns()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 675
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->isbns:Ljava/util/List;

    if-nez v1, :cond_16

    .line 676
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 678
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "isbn"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->isbns:Ljava/util/List;
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_16} :catch_19

    .line 684
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->isbns:Ljava/util/List;

    return-object v1

    .line 679
    :catch_19
    move-exception v0

    .line 680
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get ISBNs"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getKey()Ljava/lang/String;
    .registers 6

    .prologue
    .line 122
    iget-object v2, p0, Ltk/elevenk/olapi/data/BookData;->key:Ljava/lang/String;

    if-nez v2, :cond_34

    .line 123
    const-string v2, ""

    iput-object v2, p0, Ltk/elevenk/olapi/data/BookData;->key:Ljava/lang/String;

    .line 124
    iget-object v2, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v2, :cond_16

    .line 126
    :try_start_c
    iget-object v2, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v3, "key"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Ltk/elevenk/olapi/data/BookData;->key:Ljava/lang/String;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_16} :catch_37

    .line 131
    :cond_16
    :goto_16
    iget-object v2, p0, Ltk/elevenk/olapi/data/BookData;->key:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_34

    iget-object v2, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v2, :cond_34

    .line 133
    :try_start_22
    iget-object v2, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v3, "key"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "/.*/"

    const-string v4, ""

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Ltk/elevenk/olapi/data/BookData;->key:Ljava/lang/String;
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_34} :catch_3e

    .line 144
    :cond_34
    :goto_34
    iget-object v2, p0, Ltk/elevenk/olapi/data/BookData;->key:Ljava/lang/String;

    return-object v2

    .line 127
    :catch_37
    move-exception v0

    .line 128
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "Unable to get key"

    invoke-static {v2, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16

    .line 134
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_3e
    move-exception v0

    .line 136
    .restart local v0    # "e":Ljava/lang/Exception;
    :try_start_3f
    invoke-virtual {p0}, Ltk/elevenk/olapi/data/BookData;->getEditionKeys()Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Ltk/elevenk/olapi/data/BookData;->key:Ljava/lang/String;
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_4c} :catch_4d

    goto :goto_34

    .line 137
    :catch_4d
    move-exception v1

    .line 138
    .local v1, "e2":Ljava/lang/Exception;
    invoke-virtual {v1, v0}, Ljava/lang/Exception;->addSuppressed(Ljava/lang/Throwable;)V

    .line 139
    const-string v2, "Unable to get key"

    invoke-static {v2, v1}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_34
.end method

.method public getLanguages()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 353
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->languages:Ljava/util/List;

    if-nez v1, :cond_16

    .line 354
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 356
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "language"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->languages:Ljava/util/List;
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_16} :catch_19

    .line 362
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->languages:Ljava/util/List;

    return-object v1

    .line 357
    :catch_19
    move-exception v0

    .line 358
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get publish places"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getLinks()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 275
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->links:Ljava/util/List;

    if-nez v1, :cond_16

    .line 276
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 278
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v2, "links"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayOfJSONObjectsToListOfMaps(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->links:Ljava/util/List;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_16} :catch_19

    .line 284
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->links:Ljava/util/List;

    return-object v1

    .line 279
    :catch_19
    move-exception v0

    .line 280
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Unable to parse links"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getNotes()Ljava/lang/String;
    .registers 4

    .prologue
    .line 180
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->notes:Ljava/lang/String;

    if-nez v1, :cond_12

    .line 181
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v1, :cond_12

    .line 183
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v2, "notes"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->notes:Ljava/lang/String;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_12} :catch_15

    .line 189
    :cond_12
    :goto_12
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->notes:Ljava/lang/String;

    return-object v1

    .line 184
    :catch_15
    move-exception v0

    .line 185
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Unable to get notes"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_12
.end method

.method public getNumEbooks()I
    .registers 4

    .prologue
    .line 554
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->numEbooks:Ljava/lang/Integer;

    if-nez v1, :cond_1d

    .line 555
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->numEbooks:Ljava/lang/Integer;

    .line 556
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_1d

    .line 558
    :try_start_f
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "ebook_count_i"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->numEbooks:Ljava/lang/Integer;
    :try_end_1d
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_1d} :catch_24

    .line 564
    :cond_1d
    :goto_1d
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->numEbooks:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1

    .line 559
    :catch_24
    move-exception v0

    .line 560
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get num ebooks"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1d
.end method

.method public getNumEditions()I
    .registers 4

    .prologue
    .line 526
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->numEditions:Ljava/lang/Integer;

    if-nez v1, :cond_1d

    .line 527
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->numEditions:Ljava/lang/Integer;

    .line 528
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_1d

    .line 530
    :try_start_f
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "edition_count"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->numEditions:Ljava/lang/Integer;
    :try_end_1d
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_1d} :catch_24

    .line 536
    :cond_1d
    :goto_1d
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->numEditions:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1

    .line 531
    :catch_24
    move-exception v0

    .line 532
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get num editions"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1d
.end method

.method public getNumPages()I
    .registers 4

    .prologue
    .line 540
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->numPages:Ljava/lang/Integer;

    if-nez v1, :cond_1d

    .line 541
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->numPages:Ljava/lang/Integer;

    .line 542
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_1d

    .line 544
    :try_start_f
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "number_of_pages"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->numPages:Ljava/lang/Integer;
    :try_end_1d
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_1d} :catch_24

    .line 550
    :cond_1d
    :goto_1d
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->numPages:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    return v1

    .line 545
    :catch_24
    move-exception v0

    .line 546
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get num pages"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1d
.end method

.method public getOclcs()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 463
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->oclcs:Ljava/util/List;

    if-nez v1, :cond_16

    .line 464
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 466
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "oclc"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->oclcs:Ljava/util/List;
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_16} :catch_19

    .line 472
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->oclcs:Ljava/util/List;

    return-object v1

    .line 467
    :catch_19
    move-exception v0

    .line 468
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get oclc"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getOlid()Ljava/lang/String;
    .registers 8

    .prologue
    .line 635
    iget-object v4, p0, Ltk/elevenk/olapi/data/BookData;->olid:Ljava/lang/String;

    if-nez v4, :cond_1e

    .line 636
    iget-object v4, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v4, :cond_1e

    .line 638
    :try_start_8
    iget-object v4, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    invoke-virtual {v4}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    const-string v5, "OLID:?"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Ltk/elevenk/olapi/data/BookData;->olid:Ljava/lang/String;
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_1e} :catch_21

    .line 657
    :cond_1e
    :goto_1e
    iget-object v4, p0, Ltk/elevenk/olapi/data/BookData;->olid:Ljava/lang/String;

    return-object v4

    .line 639
    :catch_21
    move-exception v0

    .line 641
    .local v0, "e":Ljava/lang/Exception;
    :try_start_22
    invoke-virtual {p0}, Ltk/elevenk/olapi/data/BookData;->getIdentifiers()Ljava/util/Map;

    move-result-object v4

    const-string v5, "openlibrary"

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Ltk/elevenk/olapi/data/BookData;->olid:Ljava/lang/String;
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_39} :catch_3a

    goto :goto_1e

    .line 642
    :catch_3a
    move-exception v1

    .line 644
    .local v1, "e2":Ljava/lang/Exception;
    :try_start_3b
    invoke-virtual {p0}, Ltk/elevenk/olapi/data/BookData;->getKey()Ljava/lang/String;

    move-result-object v3

    .line 645
    .local v3, "key":Ljava/lang/String;
    const-string v4, "OL"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 646
    iput-object v3, p0, Ltk/elevenk/olapi/data/BookData;->olid:Ljava/lang/String;
    :try_end_49
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_49} :catch_4a

    goto :goto_1e

    .line 648
    .end local v3    # "key":Ljava/lang/String;
    :catch_4a
    move-exception v2

    .line 649
    .local v2, "e3":Ljava/lang/Exception;
    invoke-virtual {v1, v0}, Ljava/lang/Exception;->addSuppressed(Ljava/lang/Throwable;)V

    .line 650
    invoke-virtual {v2, v1}, Ljava/lang/Exception;->addSuppressed(Ljava/lang/Throwable;)V

    .line 651
    const-string v4, "Unable to get olid"

    invoke-static {v4, v2}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1e
.end method

.method public getPagination()Ljava/lang/String;
    .registers 4

    .prologue
    .line 193
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->pagination:Ljava/lang/String;

    if-nez v1, :cond_12

    .line 194
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v1, :cond_12

    .line 196
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v2, "pagination"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->url:Ljava/lang/String;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_12} :catch_15

    .line 202
    :cond_12
    :goto_12
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->pagination:Ljava/lang/String;

    return-object v1

    .line 197
    :catch_15
    move-exception v0

    .line 198
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Unable to get pagination"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_12
.end method

.method public getPdfUrl()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 785
    const-string v0, "pdf"

    invoke-direct {p0, v0}, Ltk/elevenk/olapi/data/BookData;->getEbookUrl(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getPersons()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 327
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->persons:Ljava/util/List;

    if-nez v1, :cond_16

    .line 328
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 330
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "publish_place"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->persons:Ljava/util/List;
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_16} :catch_19

    .line 336
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->persons:Ljava/util/List;

    return-object v1

    .line 331
    :catch_19
    move-exception v0

    .line 332
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get publish places"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getPublishDate()Ljava/lang/String;
    .registers 4

    .prologue
    .line 148
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->publishDate:Ljava/lang/String;

    if-nez v1, :cond_12

    .line 149
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v1, :cond_12

    .line 151
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v2, "notes"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->publishDate:Ljava/lang/String;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_12} :catch_15

    .line 157
    :cond_12
    :goto_12
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->publishDate:Ljava/lang/String;

    return-object v1

    .line 152
    :catch_15
    move-exception v0

    .line 153
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Unable to get publish date"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_12
.end method

.method public getPublishDates()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 450
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->publishDates:Ljava/util/List;

    if-nez v1, :cond_16

    .line 451
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 453
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "publish_date"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->publishDates:Ljava/util/List;
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_16} :catch_19

    .line 459
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->publishDates:Ljava/util/List;

    return-object v1

    .line 454
    :catch_19
    move-exception v0

    .line 455
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get publish date"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getPublishPlaces()Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 379
    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->publishPlaces:Ljava/util/List;

    if-nez v3, :cond_5d

    .line 380
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Ltk/elevenk/olapi/data/BookData;->publishPlaces:Ljava/util/List;

    .line 381
    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v3, :cond_1d

    .line 383
    :try_start_f
    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v4, "publish_place"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-direct {p0, v3}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Ltk/elevenk/olapi/data/BookData;->publishPlaces:Ljava/util/List;
    :try_end_1d
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_1d} :catch_60

    .line 388
    :cond_1d
    :goto_1d
    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->publishPlaces:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_5d

    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v3, :cond_5d

    .line 390
    :try_start_29
    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v4, "publish_places"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-direct {p0, v3}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayOfJSONObjectsToListOfMaps(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v2

    .line 391
    .local v2, "mapList":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_39
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5d

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 392
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v4, p0, Ltk/elevenk/olapi/data/BookData;->publishPlaces:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_56} :catch_57

    goto :goto_39

    .line 394
    .end local v1    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "mapList":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;>;"
    :catch_57
    move-exception v0

    .line 395
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "Unable to parse publish places"

    invoke-static {v3, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 399
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_5d
    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->publishPlaces:Ljava/util/List;

    return-object v3

    .line 384
    :catch_60
    move-exception v0

    .line 385
    .local v0, "e":Lorg/json/JSONException;
    const-string v3, "Unable to get publish places"

    invoke-static {v3, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1d
.end method

.method public getPublishYears()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 500
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->publishYears:Ljava/util/List;

    if-nez v1, :cond_16

    .line 501
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 503
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "publish_year"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->publishYears:Ljava/util/List;
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_16} :catch_19

    .line 509
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->publishYears:Ljava/util/List;

    return-object v1

    .line 504
    :catch_19
    move-exception v0

    .line 505
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get publish year"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getPublishers()Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 476
    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->publishers:Ljava/util/List;

    if-nez v3, :cond_57

    .line 477
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Ltk/elevenk/olapi/data/BookData;->publishers:Ljava/util/List;

    .line 478
    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v3, :cond_1d

    .line 480
    :try_start_f
    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v4, "publisher"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-direct {p0, v3}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Ltk/elevenk/olapi/data/BookData;->publishers:Ljava/util/List;
    :try_end_1d
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_1d} :catch_4a

    .line 485
    :cond_1d
    :goto_1d
    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->publishers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_57

    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v3, :cond_57

    .line 487
    :try_start_29
    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v4, "publishers"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 488
    .local v0, "array":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_32
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_57

    .line 489
    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->publishers:Ljava/util/List;

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "name"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_47
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_47} :catch_51

    .line 488
    add-int/lit8 v2, v2, 0x1

    goto :goto_32

    .line 481
    .end local v0    # "array":Lorg/json/JSONArray;
    .end local v2    # "i":I
    :catch_4a
    move-exception v1

    .line 482
    .local v1, "e":Lorg/json/JSONException;
    const-string v3, "Unable to get publisher"

    invoke-static {v3, v1}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1d

    .line 491
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_51
    move-exception v1

    .line 492
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "Unable to get publishers"

    invoke-static {v3, v1}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 496
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_57
    iget-object v3, p0, Ltk/elevenk/olapi/data/BookData;->publishers:Ljava/util/List;

    return-object v3
.end method

.method public getReadingData()Lorg/json/JSONObject;
    .registers 2

    .prologue
    .line 759
    iget-object v0, p0, Ltk/elevenk/olapi/data/BookData;->readingDataFromApi:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getSearchData()Lorg/json/JSONObject;
    .registers 2

    .prologue
    .line 751
    iget-object v0, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getSubjects()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 437
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->subjects:Ljava/util/List;

    if-nez v1, :cond_16

    .line 438
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 440
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "subject"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayToStringList(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->subjects:Ljava/util/List;
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_16} :catch_19

    .line 446
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->subjects:Ljava/util/List;

    return-object v1

    .line 441
    :catch_19
    move-exception v0

    .line 442
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get subject"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getSubjectsMap()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 301
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->subjectsMap:Ljava/util/List;

    if-nez v1, :cond_16

    .line 302
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 304
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v2, "subjects"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayOfJSONObjectsToListOfMaps(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->subjectsMap:Ljava/util/List;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_16} :catch_19

    .line 310
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->subjectsMap:Ljava/util/List;

    return-object v1

    .line 305
    :catch_19
    move-exception v0

    .line 306
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Unable to parse subjects"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getTableOfContents()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 314
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->tableOfContents:Ljava/util/List;

    if-nez v1, :cond_16

    .line 315
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 317
    :try_start_8
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v2, "table_of_contents"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-direct {p0, v1}, Ltk/elevenk/olapi/data/BookData;->convertJSONArrayOfJSONObjectsToListOfMaps(Lorg/json/JSONArray;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->tableOfContents:Ljava/util/List;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_16} :catch_19

    .line 323
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->tableOfContents:Ljava/util/List;

    return-object v1

    .line 318
    :catch_19
    move-exception v0

    .line 319
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Unable to parse table of contents"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16
.end method

.method public getTextUrl()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 793
    const-string v0, "text"

    invoke-direct {p0, v0}, Ltk/elevenk/olapi/data/BookData;->getEbookUrl(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 4

    .prologue
    .line 403
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->title:Ljava/lang/String;

    if-nez v1, :cond_2c

    .line 404
    const-string v1, ""

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->title:Ljava/lang/String;

    .line 405
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 407
    :try_start_c
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v2, "title"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->title:Ljava/lang/String;
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_16} :catch_2f

    .line 412
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->title:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2c

    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_2c

    .line 414
    :try_start_22
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "title"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->title:Ljava/lang/String;
    :try_end_2c
    .catch Lorg/json/JSONException; {:try_start_22 .. :try_end_2c} :catch_36

    .line 420
    :cond_2c
    :goto_2c
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->title:Ljava/lang/String;

    return-object v1

    .line 408
    :catch_2f
    move-exception v0

    .line 409
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get title"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16

    .line 415
    .end local v0    # "e":Lorg/json/JSONException;
    :catch_36
    move-exception v0

    .line 416
    .restart local v0    # "e":Lorg/json/JSONException;
    const-string v1, "Unable to get title"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2c
.end method

.method public getUrl()Ljava/lang/String;
    .registers 4

    .prologue
    .line 206
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->url:Ljava/lang/String;

    if-nez v1, :cond_2c

    .line 207
    const-string v1, ""

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->url:Ljava/lang/String;

    .line 208
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    if-eqz v1, :cond_16

    .line 210
    :try_start_c
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromApi:Lorg/json/JSONObject;

    const-string v2, "url"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->url:Ljava/lang/String;
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_16} :catch_2f

    .line 215
    :cond_16
    :goto_16
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->url:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2c

    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_2c

    .line 217
    :try_start_22
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "key"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->url:Ljava/lang/String;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_2c} :catch_36

    .line 223
    :cond_2c
    :goto_2c
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->url:Ljava/lang/String;

    return-object v1

    .line 211
    :catch_2f
    move-exception v0

    .line 212
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Unable to get URL"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_16

    .line 218
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_36
    move-exception v0

    .line 219
    .restart local v0    # "e":Ljava/lang/Exception;
    const-string v1, "Unable to get url"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2c
.end method

.method public hasEpubUrl()Z
    .registers 3

    .prologue
    .line 763
    const/4 v0, 0x0

    .line 764
    .local v0, "value":Z
    invoke-virtual {p0}, Ltk/elevenk/olapi/data/BookData;->getEpubUrl()Ljava/lang/Object;

    .line 765
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->epubUrl:Ljava/lang/String;

    if-eqz v1, :cond_11

    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->epubUrl:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_11

    .line 766
    const/4 v0, 0x1

    .line 768
    :cond_11
    return v0
.end method

.method public hasFullText()Z
    .registers 4

    .prologue
    .line 608
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->fullText:Ljava/lang/Boolean;

    if-nez v1, :cond_1d

    .line 609
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->fullText:Ljava/lang/Boolean;

    .line 610
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_1d

    .line 612
    :try_start_f
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "has_fulltext"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->fullText:Ljava/lang/Boolean;
    :try_end_1d
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_1d} :catch_24

    .line 618
    :cond_1d
    :goto_1d
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->fullText:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1

    .line 613
    :catch_24
    move-exception v0

    .line 614
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "Unable to get fullText"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1d
.end method

.method public isPublicScannedBook()Z
    .registers 4

    .prologue
    .line 661
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->publicScannedBook:Ljava/lang/Boolean;

    if-nez v1, :cond_1d

    .line 662
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->publicScannedBook:Ljava/lang/Boolean;

    .line 663
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    if-eqz v1, :cond_1d

    .line 665
    :try_start_f
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->bookDataFromSearch:Lorg/json/JSONObject;

    const-string v2, "public_scan_b"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Ltk/elevenk/olapi/data/BookData;->publicScannedBook:Ljava/lang/Boolean;
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_1d} :catch_24

    .line 671
    :cond_1d
    :goto_1d
    iget-object v1, p0, Ltk/elevenk/olapi/data/BookData;->publicScannedBook:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1

    .line 666
    :catch_24
    move-exception v0

    .line 667
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "Unable to get public scanned book"

    invoke-static {v1, v0}, Ltk/elevenk/olapi/logging/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1d
.end method

.method public setCoverImage(Ljava/lang/Object;)V
    .registers 2
    .param p1, "coverImage"    # Ljava/lang/Object;

    .prologue
    .line 871
    iput-object p1, p0, Ltk/elevenk/olapi/data/BookData;->coverImage:Ljava/lang/Object;

    .line 872
    return-void
.end method
