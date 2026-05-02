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

.field private value:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 676
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 677
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->key:Ljava/lang/String;

    .line 678
    iput-object p2, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->value:Ljava/lang/String;

    .line 679
    return-void
.end method

.method public static create(Ljava/lang/String;Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;
    .registers 3
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 671
    const-string v0, "Data key must not be empty"

    invoke-static {p0, v0}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 672
    const-string v0, "Data value must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 673
    new-instance v0, Lorg/jsoup/helper/HttpConnection$KeyVal;

    invoke-direct {v0, p0, p1}, Lorg/jsoup/helper/HttpConnection$KeyVal;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public key()Ljava/lang/String;
    .registers 2

    .prologue
    .line 688
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->key:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic key(Ljava/lang/String;)Lorg/jsoup/Connection$KeyVal;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 666
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$KeyVal;->key(Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v0

    return-object v0
.end method

.method public key(Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 682
    const-string v0, "Data key must not be empty"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 683
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->key:Ljava/lang/String;

    .line 684
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 703
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
    .line 698
    iget-object v0, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->value:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic value(Ljava/lang/String;)Lorg/jsoup/Connection$KeyVal;
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 666
    invoke-virtual {p0, p1}, Lorg/jsoup/helper/HttpConnection$KeyVal;->value(Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;

    move-result-object v0

    return-object v0
.end method

.method public value(Ljava/lang/String;)Lorg/jsoup/helper/HttpConnection$KeyVal;
    .registers 3
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 692
    const-string v0, "Data value must not be null"

    invoke-static {p1, v0}, Lorg/jsoup/helper/Validate;->notNull(Ljava/lang/Object;Ljava/lang/String;)V

    .line 693
    iput-object p1, p0, Lorg/jsoup/helper/HttpConnection$KeyVal;->value:Ljava/lang/String;

    .line 694
    return-object p0
.end method
