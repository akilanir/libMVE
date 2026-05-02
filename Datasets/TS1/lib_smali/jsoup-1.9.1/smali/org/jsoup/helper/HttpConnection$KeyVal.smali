.class public Lorg/jsoup/helper/HttpConnection$KeyVal;
.super Ljava/lang/Object;
.source "HttpConnection.java"

# interfaces
.implements Lorg/jsoup/Connection$KeyVal;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/helper/HttpConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "KeyVal"
.end annotation


# instance fields
.field private key:Ljava/lang/String;

.field private stream:Ljava/io/InputStream;

.field private value:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 975
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;
    .registers 3
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 968
    new-instance v0, Lorg/jsoup/helper/HttpConnection$KeyVal;

    invoke-direct {v0}, Lorg/jsoup/helper/HttpConnection$KeyVal;-><init>()V

    invoke-virtual {v0, p0}, Lorg/jsoup/helper/HttpConnection$KeyVal;->key(Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jsoup/helper/HttpConnection$KeyVal;->value(Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;)Lorg/jsoup/helper/HttpConnection$KeyVal;
    .registers 4
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "stream"    # Ljava/io/InputStream;

    .prologue
    .line 972
    new-instance v0, Lorg/jsoup/helper/HttpConnection$KeyVal;

    invoke-direct {v0}, Lorg/jsoup/helper/HttpConnection$KeyVal;-><init>()V

    invoke-virtual {v0, p0}, Lorg/jsoup/helper/HttpConnection$KeyVal;->key(Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jsoup/helper/HttpConnection$KeyVal;->value(Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/jsoup/helper/HttpConnection$KeyVal;->inputStream(Ljava/io/InputStream;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public hasInputStream()Z
    .registers 2

    .prologue
    .line 1008
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->stream:Ljava/io/InputStream;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public inputStream()Ljava/io/InputStream;
    .registers 2

    .prologue
    .line 1004
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->stream:Ljava/io/InputStream;

    return-object v0
.end method

.method public bridge synthetic inputStream(Ljava/io/InputStream;)Lorg/jsoup/Connection$KeyVal;
    .registers 3

    .prologue
    .line 962
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$KeyVal;->inputStream(Ljava/io/InputStream;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v0

    return-object v0
.end method

.method public inputStream(Ljava/io/InputStream;)Lorg/jsoup/helper/HttpConnection$KeyVal;
    .registers 4
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 998
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->value:Ljava/lang/String;

    const-string v1, "Data input stream must not be null"

    invoke-static {v0, v1}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 999
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->stream:Ljava/io/InputStream;

    .line 1000
    return-object p0
.end method

.method public key()Ljava/lang/String;
    .registers 2

    .prologue
    .line 984
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->key:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic key(Ljava/lang/String;)Lorg/jsoup/Connection$KeyVal;
    .registers 3

    .prologue
    .line 962
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$KeyVal;->key(Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v0

    return-object v0
.end method

.method public key(Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 978
    const-string v0, "Data key must not be empty"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 979
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->key:Ljava/lang/String;

    .line 980
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1013
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->value:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public value()Ljava/lang/String;
    .registers 2

    .prologue
    .line 994
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->value:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic value(Ljava/lang/String;)Lorg/jsoup/Connection$KeyVal;
    .registers 3

    .prologue
    .line 962
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$KeyVal;->value(Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v0

    return-object v0
.end method

.method public value(Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 988
    const-string v0, "Data value must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 989
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->value:Ljava/lang/String;

    .line 990
    return-object p0
.end method
