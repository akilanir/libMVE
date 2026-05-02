.class public Lezvcard/Ezvcard$ParserChainHtmlString;
.super Lezvcard/Ezvcard$ParserChainHtml;
.source "Ezvcard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/Ezvcard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParserChainHtmlString"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/Ezvcard$ParserChainHtml",
        "<",
        "Lezvcard/Ezvcard$ParserChainHtmlString;",
        ">;"
    }
.end annotation


# instance fields
.field private final html:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "html"    # Ljava/lang/String;

    .prologue
    .line 1113
    invoke-direct {p0}, Lezvcard/Ezvcard$ParserChainHtml;-><init>()V

    .line 1114
    iput-object p1, p0, Lezvcard/Ezvcard$ParserChainHtmlString;->html:Ljava/lang/String;

    .line 1115
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lezvcard/Ezvcard$1;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lezvcard/Ezvcard$1;

    .prologue
    .line 1110
    invoke-direct {p0, p1}, Lezvcard/Ezvcard$ParserChainHtmlString;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method _constructReader()Lezvcard/io/html/HCardParser;
    .registers 4

    .prologue
    .line 1134
    new-instance v0, Lezvcard/io/html/HCardParser;

    iget-object v1, p0, Lezvcard/Ezvcard$ParserChainHtmlString;->html:Ljava/lang/String;

    iget-object v2, p0, Lezvcard/Ezvcard$ParserChainHtmlString;->pageUrl:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lezvcard/io/html/HCardParser;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public all()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lezvcard/VCard;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1150
    :try_start_0
    invoke-super {p0}, Lezvcard/Ezvcard$ParserChainHtml;->all()Ljava/util/List;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 1151
    :catch_5
    move-exception v0

    .line 1153
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public first()Lezvcard/VCard;
    .registers 3

    .prologue
    .line 1140
    :try_start_0
    invoke-super {p0}, Lezvcard/Ezvcard$ParserChainHtml;->first()Lezvcard/VCard;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 1141
    :catch_5
    move-exception v0

    .line 1143
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public pageUrl(Ljava/lang/String;)Lezvcard/Ezvcard$ParserChainHtmlString;
    .registers 3
    .param p1, "pageUrl"    # Ljava/lang/String;

    .prologue
    .line 1129
    invoke-super {p0, p1}, Lezvcard/Ezvcard$ParserChainHtml;->pageUrl(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/Ezvcard$ParserChainHtmlString;

    return-object v0
.end method

.method public bridge synthetic pageUrl(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 1110
    invoke-virtual {p0, p1}, Lezvcard/Ezvcard$ParserChainHtmlString;->pageUrl(Ljava/lang/String;)Lezvcard/Ezvcard$ParserChainHtmlString;

    move-result-object v0

    return-object v0
.end method

.method public register(Lezvcard/io/scribe/VCardPropertyScribe;)Lezvcard/Ezvcard$ParserChainHtmlString;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/scribe/VCardPropertyScribe",
            "<+",
            "Lezvcard/property/VCardProperty;",
            ">;)",
            "Lezvcard/Ezvcard$ParserChainHtmlString;"
        }
    .end annotation

    .prologue
    .line 1119
    .local p1, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    invoke-super {p0, p1}, Lezvcard/Ezvcard$ParserChainHtml;->register(Lezvcard/io/scribe/VCardPropertyScribe;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/Ezvcard$ParserChainHtmlString;

    return-object v0
.end method

.method public bridge synthetic register(Lezvcard/io/scribe/VCardPropertyScribe;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lezvcard/io/scribe/VCardPropertyScribe;

    .prologue
    .line 1110
    invoke-virtual {p0, p1}, Lezvcard/Ezvcard$ParserChainHtmlString;->register(Lezvcard/io/scribe/VCardPropertyScribe;)Lezvcard/Ezvcard$ParserChainHtmlString;

    move-result-object v0

    return-object v0
.end method

.method public warnings(Ljava/util/List;)Lezvcard/Ezvcard$ParserChainHtmlString;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lezvcard/Ezvcard$ParserChainHtmlString;"
        }
    .end annotation

    .prologue
    .line 1124
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-super {p0, p1}, Lezvcard/Ezvcard$ParserChainHtml;->warnings(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/Ezvcard$ParserChainHtmlString;

    return-object v0
.end method

.method public bridge synthetic warnings(Ljava/util/List;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/util/List;

    .prologue
    .line 1110
    invoke-virtual {p0, p1}, Lezvcard/Ezvcard$ParserChainHtmlString;->warnings(Ljava/util/List;)Lezvcard/Ezvcard$ParserChainHtmlString;

    move-result-object v0

    return-object v0
.end method
