.class public Lezvcard/Ezvcard$ParserChainHtmlReader;
.super Lezvcard/Ezvcard$ParserChainHtml;
.source "Ezvcard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/Ezvcard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParserChainHtmlReader"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/Ezvcard$ParserChainHtml",
        "<",
        "Lezvcard/Ezvcard$ParserChainHtmlReader;",
        ">;"
    }
.end annotation


# instance fields
.field private final file:Ljava/io/File;

.field private final reader:Ljava/io/Reader;

.field private final url:Ljava/net/URL;


# direct methods
.method private constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    const/4 v0, 0x0

    .line 1064
    invoke-direct {p0}, Lezvcard/Ezvcard$ParserChainHtml;-><init>()V

    .line 1065
    iput-object v0, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->reader:Ljava/io/Reader;

    .line 1066
    iput-object p1, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->file:Ljava/io/File;

    .line 1067
    iput-object v0, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->url:Ljava/net/URL;

    .line 1068
    return-void
.end method

.method synthetic constructor <init>(Ljava/io/File;Lezvcard/Ezvcard$1;)V
    .registers 3
    .param p1, "x0"    # Ljava/io/File;
    .param p2, "x1"    # Lezvcard/Ezvcard$1;

    .prologue
    .line 1053
    invoke-direct {p0, p1}, Lezvcard/Ezvcard$ParserChainHtmlReader;-><init>(Ljava/io/File;)V

    return-void
.end method

.method private constructor <init>(Ljava/io/Reader;)V
    .registers 3
    .param p1, "reader"    # Ljava/io/Reader;

    .prologue
    const/4 v0, 0x0

    .line 1058
    invoke-direct {p0}, Lezvcard/Ezvcard$ParserChainHtml;-><init>()V

    .line 1059
    iput-object p1, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->reader:Ljava/io/Reader;

    .line 1060
    iput-object v0, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->file:Ljava/io/File;

    .line 1061
    iput-object v0, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->url:Ljava/net/URL;

    .line 1062
    return-void
.end method

.method synthetic constructor <init>(Ljava/io/Reader;Lezvcard/Ezvcard$1;)V
    .registers 3
    .param p1, "x0"    # Ljava/io/Reader;
    .param p2, "x1"    # Lezvcard/Ezvcard$1;

    .prologue
    .line 1053
    invoke-direct {p0, p1}, Lezvcard/Ezvcard$ParserChainHtmlReader;-><init>(Ljava/io/Reader;)V

    return-void
.end method

.method private constructor <init>(Ljava/net/URL;)V
    .registers 3
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    const/4 v0, 0x0

    .line 1070
    invoke-direct {p0}, Lezvcard/Ezvcard$ParserChainHtml;-><init>()V

    .line 1071
    iput-object v0, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->reader:Ljava/io/Reader;

    .line 1072
    iput-object v0, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->file:Ljava/io/File;

    .line 1073
    iput-object p1, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->url:Ljava/net/URL;

    .line 1074
    return-void
.end method

.method synthetic constructor <init>(Ljava/net/URL;Lezvcard/Ezvcard$1;)V
    .registers 3
    .param p1, "x0"    # Ljava/net/URL;
    .param p2, "x1"    # Lezvcard/Ezvcard$1;

    .prologue
    .line 1053
    invoke-direct {p0, p1}, Lezvcard/Ezvcard$ParserChainHtmlReader;-><init>(Ljava/net/URL;)V

    return-void
.end method


# virtual methods
.method _constructReader()Lezvcard/io/html/HCardParser;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1093
    iget-object v0, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->reader:Ljava/io/Reader;

    if-eqz v0, :cond_e

    .line 1094
    new-instance v0, Lezvcard/io/html/HCardParser;

    iget-object v1, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->reader:Ljava/io/Reader;

    iget-object v2, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->pageUrl:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lezvcard/io/html/HCardParser;-><init>(Ljava/io/Reader;Ljava/lang/String;)V

    .line 1102
    :goto_d
    return-object v0

    .line 1097
    :cond_e
    iget-object v0, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->file:Ljava/io/File;

    if-eqz v0, :cond_1c

    .line 1099
    new-instance v0, Lezvcard/io/html/HCardParser;

    iget-object v1, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->file:Ljava/io/File;

    iget-object v2, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->pageUrl:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lezvcard/io/html/HCardParser;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_d

    .line 1102
    :cond_1c
    new-instance v0, Lezvcard/io/html/HCardParser;

    iget-object v1, p0, Lezvcard/Ezvcard$ParserChainHtmlReader;->url:Ljava/net/URL;

    invoke-direct {v0, v1}, Lezvcard/io/html/HCardParser;-><init>(Ljava/net/URL;)V

    goto :goto_d
.end method

.method public bridge synthetic all()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1053
    invoke-super {p0}, Lezvcard/Ezvcard$ParserChainHtml;->all()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic first()Lezvcard/VCard;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1053
    invoke-super {p0}, Lezvcard/Ezvcard$ParserChainHtml;->first()Lezvcard/VCard;

    move-result-object v0

    return-object v0
.end method

.method public pageUrl(Ljava/lang/String;)Lezvcard/Ezvcard$ParserChainHtmlReader;
    .registers 3
    .param p1, "pageUrl"    # Ljava/lang/String;

    .prologue
    .line 1088
    invoke-super {p0, p1}, Lezvcard/Ezvcard$ParserChainHtml;->pageUrl(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/Ezvcard$ParserChainHtmlReader;

    return-object v0
.end method

.method public bridge synthetic pageUrl(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 1053
    invoke-virtual {p0, p1}, Lezvcard/Ezvcard$ParserChainHtmlReader;->pageUrl(Ljava/lang/String;)Lezvcard/Ezvcard$ParserChainHtmlReader;

    move-result-object v0

    return-object v0
.end method

.method public register(Lezvcard/io/scribe/VCardPropertyScribe;)Lezvcard/Ezvcard$ParserChainHtmlReader;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/scribe/VCardPropertyScribe",
            "<+",
            "Lezvcard/property/VCardProperty;",
            ">;)",
            "Lezvcard/Ezvcard$ParserChainHtmlReader;"
        }
    .end annotation

    .prologue
    .line 1078
    .local p1, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    invoke-super {p0, p1}, Lezvcard/Ezvcard$ParserChainHtml;->register(Lezvcard/io/scribe/VCardPropertyScribe;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/Ezvcard$ParserChainHtmlReader;

    return-object v0
.end method

.method public bridge synthetic register(Lezvcard/io/scribe/VCardPropertyScribe;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lezvcard/io/scribe/VCardPropertyScribe;

    .prologue
    .line 1053
    invoke-virtual {p0, p1}, Lezvcard/Ezvcard$ParserChainHtmlReader;->register(Lezvcard/io/scribe/VCardPropertyScribe;)Lezvcard/Ezvcard$ParserChainHtmlReader;

    move-result-object v0

    return-object v0
.end method

.method public warnings(Ljava/util/List;)Lezvcard/Ezvcard$ParserChainHtmlReader;
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
            "Lezvcard/Ezvcard$ParserChainHtmlReader;"
        }
    .end annotation

    .prologue
    .line 1083
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-super {p0, p1}, Lezvcard/Ezvcard$ParserChainHtml;->warnings(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/Ezvcard$ParserChainHtmlReader;

    return-object v0
.end method

.method public bridge synthetic warnings(Ljava/util/List;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/util/List;

    .prologue
    .line 1053
    invoke-virtual {p0, p1}, Lezvcard/Ezvcard$ParserChainHtmlReader;->warnings(Ljava/util/List;)Lezvcard/Ezvcard$ParserChainHtmlReader;

    move-result-object v0

    return-object v0
.end method
