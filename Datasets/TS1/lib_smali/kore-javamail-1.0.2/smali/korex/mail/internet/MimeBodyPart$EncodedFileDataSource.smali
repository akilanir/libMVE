.class Lkorex/mail/internet/MimeBodyPart$EncodedFileDataSource;
.super Lkorex/activation/FileDataSource;
.source "MimeBodyPart.java"

# interfaces
.implements Lkorex/mail/EncodingAware;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkorex/mail/internet/MimeBodyPart;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "EncodedFileDataSource"
.end annotation


# instance fields
.field private contentType:Ljava/lang/String;

.field private encoding:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .param p2, "contentType"    # Ljava/lang/String;
    .param p3, "encoding"    # Ljava/lang/String;

    .prologue
    .line 894
    invoke-direct {p0, p1}, Lkorex/activation/FileDataSource;-><init>(Ljava/io/File;)V

    .line 895
    iput-object p2, p0, Lkorex/mail/internet/MimeBodyPart$EncodedFileDataSource;->contentType:Ljava/lang/String;

    .line 896
    iput-object p3, p0, Lkorex/mail/internet/MimeBodyPart$EncodedFileDataSource;->encoding:Ljava/lang/String;

    .line 897
    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 901
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart$EncodedFileDataSource;->contentType:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart$EncodedFileDataSource;->contentType:Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    invoke-super {p0}, Lkorex/activation/FileDataSource;->getContentType()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public getEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 906
    iget-object v0, p0, Lkorex/mail/internet/MimeBodyPart$EncodedFileDataSource;->encoding:Ljava/lang/String;

    return-object v0
.end method
