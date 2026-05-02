.class public Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;
.super Ljava/lang/Object;
.source "DefaultDecoderFactory.java"

# interfaces
.implements Lcom/journeyapps/barcodescanner/DecoderFactory;


# instance fields
.field private characterSet:Ljava/lang/String;

.field private decodeFormats:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;"
        }
    .end annotation
.end field

.field private hints:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;Ljava/util/Map;Ljava/lang/String;)V
    .registers 4
    .param p3, "characterSet"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/google/zxing/BarcodeFormat;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 22
    .local p1, "decodeFormats":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/google/zxing/BarcodeFormat;>;"
    .local p2, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;->decodeFormats:Ljava/util/Collection;

    .line 24
    iput-object p2, p0, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;->hints:Ljava/util/Map;

    .line 25
    iput-object p3, p0, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;->characterSet:Ljava/lang/String;

    .line 26
    return-void
.end method


# virtual methods
.method public createDecoder(Ljava/util/Map;)Lcom/journeyapps/barcodescanner/Decoder;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/journeyapps/barcodescanner/Decoder;"
        }
    .end annotation

    .prologue
    .line 30
    .local p1, "baseHints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;*>;"
    new-instance v0, Ljava/util/EnumMap;

    const-class v2, Lcom/google/zxing/DecodeHintType;

    invoke-direct {v0, v2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 32
    .local v0, "hints":Ljava/util/Map;, "Ljava/util/Map<Lcom/google/zxing/DecodeHintType;Ljava/lang/Object;>;"
    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 34
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;->hints:Ljava/util/Map;

    if-eqz v2, :cond_13

    .line 35
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;->hints:Ljava/util/Map;

    invoke-interface {v0, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 38
    :cond_13
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;->decodeFormats:Ljava/util/Collection;

    if-eqz v2, :cond_1e

    .line 39
    sget-object v2, Lcom/google/zxing/DecodeHintType;->POSSIBLE_FORMATS:Lcom/google/zxing/DecodeHintType;

    iget-object v3, p0, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;->decodeFormats:Ljava/util/Collection;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    :cond_1e
    iget-object v2, p0, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;->characterSet:Ljava/lang/String;

    if-eqz v2, :cond_29

    .line 43
    sget-object v2, Lcom/google/zxing/DecodeHintType;->CHARACTER_SET:Lcom/google/zxing/DecodeHintType;

    iget-object v3, p0, Lcom/journeyapps/barcodescanner/DefaultDecoderFactory;->characterSet:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    :cond_29
    new-instance v1, Lcom/google/zxing/MultiFormatReader;

    invoke-direct {v1}, Lcom/google/zxing/MultiFormatReader;-><init>()V

    .line 47
    .local v1, "reader":Lcom/google/zxing/MultiFormatReader;
    invoke-virtual {v1, v0}, Lcom/google/zxing/MultiFormatReader;->setHints(Ljava/util/Map;)V

    .line 49
    new-instance v2, Lcom/journeyapps/barcodescanner/Decoder;

    invoke-direct {v2, v1}, Lcom/journeyapps/barcodescanner/Decoder;-><init>(Lcom/google/zxing/Reader;)V

    return-object v2
.end method
