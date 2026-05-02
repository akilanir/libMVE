.class public Lezvcard/Ezvcard$ParserChainJsonString;
.super Lezvcard/Ezvcard$ParserChainJson;
.source "Ezvcard.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lezvcard/Ezvcard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ParserChainJsonString"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lezvcard/Ezvcard$ParserChainJson",
        "<",
        "Lezvcard/Ezvcard$ParserChainJsonString;",
        ">;"
    }
.end annotation


# instance fields
.field private final json:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "json"    # Ljava/lang/String;

    .prologue
    .line 1284
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lezvcard/Ezvcard$ParserChainJson;-><init>(ZLezvcard/Ezvcard$1;)V

    .line 1285
    iput-object p1, p0, Lezvcard/Ezvcard$ParserChainJsonString;->json:Ljava/lang/String;

    .line 1286
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lezvcard/Ezvcard$1;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lezvcard/Ezvcard$1;

    .prologue
    .line 1280
    invoke-direct {p0, p1}, Lezvcard/Ezvcard$ParserChainJsonString;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method _constructReader()Lezvcard/io/json/JCardReader;
    .registers 3

    .prologue
    .line 1300
    new-instance v0, Lezvcard/io/json/JCardReader;

    iget-object v1, p0, Lezvcard/Ezvcard$ParserChainJsonString;->json:Ljava/lang/String;

    invoke-direct {v0, v1}, Lezvcard/io/json/JCardReader;-><init>(Ljava/lang/String;)V

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
    .line 1316
    :try_start_0
    invoke-super {p0}, Lezvcard/Ezvcard$ParserChainJson;->all()Ljava/util/List;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 1317
    :catch_5
    move-exception v0

    .line 1319
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public first()Lezvcard/VCard;
    .registers 3

    .prologue
    .line 1306
    :try_start_0
    invoke-super {p0}, Lezvcard/Ezvcard$ParserChainJson;->first()Lezvcard/VCard;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    .line 1307
    :catch_5
    move-exception v0

    .line 1309
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public register(Lezvcard/io/scribe/VCardPropertyScribe;)Lezvcard/Ezvcard$ParserChainJsonString;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lezvcard/io/scribe/VCardPropertyScribe",
            "<+",
            "Lezvcard/property/VCardProperty;",
            ">;)",
            "Lezvcard/Ezvcard$ParserChainJsonString;"
        }
    .end annotation

    .prologue
    .line 1290
    .local p1, "scribe":Lezvcard/io/scribe/VCardPropertyScribe;, "Lezvcard/io/scribe/VCardPropertyScribe<+Lezvcard/property/VCardProperty;>;"
    invoke-super {p0, p1}, Lezvcard/Ezvcard$ParserChainJson;->register(Lezvcard/io/scribe/VCardPropertyScribe;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/Ezvcard$ParserChainJsonString;

    return-object v0
.end method

.method public bridge synthetic register(Lezvcard/io/scribe/VCardPropertyScribe;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Lezvcard/io/scribe/VCardPropertyScribe;

    .prologue
    .line 1280
    invoke-virtual {p0, p1}, Lezvcard/Ezvcard$ParserChainJsonString;->register(Lezvcard/io/scribe/VCardPropertyScribe;)Lezvcard/Ezvcard$ParserChainJsonString;

    move-result-object v0

    return-object v0
.end method

.method public warnings(Ljava/util/List;)Lezvcard/Ezvcard$ParserChainJsonString;
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
            "Lezvcard/Ezvcard$ParserChainJsonString;"
        }
    .end annotation

    .prologue
    .line 1295
    .local p1, "warnings":Ljava/util/List;, "Ljava/util/List<Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-super {p0, p1}, Lezvcard/Ezvcard$ParserChainJson;->warnings(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lezvcard/Ezvcard$ParserChainJsonString;

    return-object v0
.end method

.method public bridge synthetic warnings(Ljava/util/List;)Ljava/lang/Object;
    .registers 3
    .param p1, "x0"    # Ljava/util/List;

    .prologue
    .line 1280
    invoke-virtual {p0, p1}, Lezvcard/Ezvcard$ParserChainJsonString;->warnings(Ljava/util/List;)Lezvcard/Ezvcard$ParserChainJsonString;

    move-result-object v0

    return-object v0
.end method
