.class public Lcom/koushikdutta/ion/gson/GsonArrayParser;
.super Lcom/koushikdutta/ion/gson/GsonParser;
.source "GsonArrayParser.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/koushikdutta/ion/gson/GsonParser",
        "<",
        "Lcom/google/gson/JsonArray;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 12
    const-class v0, Lcom/google/gson/JsonArray;

    invoke-direct {p0, v0}, Lcom/koushikdutta/ion/gson/GsonParser;-><init>(Ljava/lang/Class;)V

    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .registers 3
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 16
    const-class v0, Lcom/google/gson/JsonArray;

    invoke-direct {p0, v0, p1}, Lcom/koushikdutta/ion/gson/GsonParser;-><init>(Ljava/lang/Class;Ljava/nio/charset/Charset;)V

    .line 17
    return-void
.end method
