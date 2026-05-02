.class Lcz/msebera/android/httpclient/entity/mime/HttpRFC6532Multipart;
.super Lcz/msebera/android/httpclient/entity/mime/AbstractMultipartForm;
.source "HttpRFC6532Multipart.java"


# instance fields
.field private final parts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcz/msebera/android/httpclient/entity/mime/FormBodyPart;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/util/List;)V
    .registers 5
    .param p1, "subType"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .param p3, "boundary"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/nio/charset/Charset;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcz/msebera/android/httpclient/entity/mime/FormBodyPart;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 51
    .local p4, "parts":Ljava/util/List;, "Ljava/util/List<Lcz/msebera/android/httpclient/entity/mime/FormBodyPart;>;"
    invoke-direct {p0, p1, p2, p3}, Lcz/msebera/android/httpclient/entity/mime/AbstractMultipartForm;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;)V

    .line 52
    iput-object p4, p0, Lcz/msebera/android/httpclient/entity/mime/HttpRFC6532Multipart;->parts:Ljava/util/List;

    .line 53
    return-void
.end method


# virtual methods
.method protected formatMultipartHeader(Lcz/msebera/android/httpclient/entity/mime/FormBodyPart;Ljava/io/OutputStream;)V
    .registers 7
    .param p1, "part"    # Lcz/msebera/android/httpclient/entity/mime/FormBodyPart;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    invoke-virtual {p1}, Lcz/msebera/android/httpclient/entity/mime/FormBodyPart;->getHeader()Lcz/msebera/android/httpclient/entity/mime/Header;

    move-result-object v1

    .line 67
    .local v1, "header":Lcz/msebera/android/httpclient/entity/mime/Header;
    invoke-virtual {v1}, Lcz/msebera/android/httpclient/entity/mime/Header;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz/msebera/android/httpclient/entity/mime/MinimalField;

    .line 68
    .local v0, "field":Lcz/msebera/android/httpclient/entity/mime/MinimalField;
    sget-object v3, Lcz/msebera/android/httpclient/entity/mime/MIME;->UTF8_CHARSET:Ljava/nio/charset/Charset;

    invoke-static {v0, v3, p2}, Lcz/msebera/android/httpclient/entity/mime/HttpRFC6532Multipart;->writeField(Lcz/msebera/android/httpclient/entity/mime/MinimalField;Ljava/nio/charset/Charset;Ljava/io/OutputStream;)V

    goto :goto_8

    .line 70
    .end local v0    # "field":Lcz/msebera/android/httpclient/entity/mime/MinimalField;
    :cond_1a
    return-void
.end method

.method public getBodyParts()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcz/msebera/android/httpclient/entity/mime/FormBodyPart;",
            ">;"
        }
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lcz/msebera/android/httpclient/entity/mime/HttpRFC6532Multipart;->parts:Ljava/util/List;

    return-object v0
.end method
