.class public Lcom/sun/mail/handlers/text_plain;
.super Ljava/lang/Object;
.source "text_plain.java"

# interfaces
.implements Lkorex/activation/DataContentHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sun/mail/handlers/text_plain$NoCloseOutputStream;
    }
.end annotation


# static fields
.field private static myDF:Lkorex/activation/ActivationDataFlavor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    .line 61
    new-instance v0, Lkorex/activation/ActivationDataFlavor;

    const-class v1, Ljava/lang/String;

    const-string v2, "text/plain"

    const-string v3, "Text String"

    invoke-direct {v0, v1, v2, v3}, Lkorex/activation/ActivationDataFlavor;-><init>(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sun/mail/handlers/text_plain;->myDF:Lkorex/activation/ActivationDataFlavor;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getCharset(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 198
    :try_start_0
    new-instance v1, Lkorex/mail/internet/ContentType;

    invoke-direct {v1, p1}, Lkorex/mail/internet/ContentType;-><init>(Ljava/lang/String;)V

    .line 199
    .local v1, "ct":Lkorex/mail/internet/ContentType;
    const-string v3, "charset"

    invoke-virtual {v1, v3}, Lkorex/mail/internet/ContentType;->getParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 200
    .local v0, "charset":Ljava/lang/String;
    if-nez v0, :cond_f

    .line 202
    const-string v0, "us-ascii"

    .line 203
    :cond_f
    invoke-static {v0}, Lkorex/mail/internet/MimeUtility;->javaCharset(Ljava/lang/String;)Ljava/lang/String;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_12} :catch_14

    move-result-object v3

    .line 205
    .end local v0    # "charset":Ljava/lang/String;
    .end local v1    # "ct":Lkorex/mail/internet/ContentType;
    :goto_13
    return-object v3

    .line 204
    :catch_14
    move-exception v2

    .line 205
    .local v2, "ex":Ljava/lang/Exception;
    const/4 v3, 0x0

    goto :goto_13
.end method


# virtual methods
.method public getContent(Lkorex/activation/DataSource;)Ljava/lang/Object;
    .registers 13
    .param p1, "ds"    # Lkorex/activation/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/high16 v10, 0x40000

    .line 110
    const/4 v2, 0x0

    .line 111
    .local v2, "enc":Ljava/lang/String;
    const/4 v4, 0x0

    .line 114
    .local v4, "is":Ljava/io/InputStreamReader;
    :try_start_4
    invoke-interface {p1}, Lkorex/activation/DataSource;->getContentType()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/sun/mail/handlers/text_plain;->getCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 115
    new-instance v4, Ljava/io/InputStreamReader;

    .end local v4    # "is":Ljava/io/InputStreamReader;
    invoke-interface {p1}, Lkorex/activation/DataSource;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v4, v8, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_15
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_15} :catch_34

    .line 129
    .restart local v4    # "is":Ljava/io/InputStreamReader;
    const/4 v5, 0x0

    .line 131
    .local v5, "pos":I
    const/16 v8, 0x400

    :try_start_18
    new-array v0, v8, [C

    .line 133
    .local v0, "buf":[C
    :cond_1a
    :goto_1a
    array-length v8, v0

    sub-int/2addr v8, v5

    invoke-virtual {v4, v0, v5, v8}, Ljava/io/InputStreamReader;->read([CII)I

    move-result v1

    .local v1, "count":I
    const/4 v8, -0x1

    if-eq v1, v8, :cond_3d

    .line 134
    add-int/2addr v5, v1

    .line 135
    array-length v8, v0

    if-lt v5, v8, :cond_1a

    .line 136
    array-length v6, v0

    .line 137
    .local v6, "size":I
    if-ge v6, v10, :cond_3b

    .line 138
    add-int/2addr v6, v6

    .line 141
    :goto_2b
    new-array v7, v6, [C

    .line 142
    .local v7, "tbuf":[C
    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v0, v8, v7, v9, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_32
    .catchall {:try_start_18 .. :try_end_32} :catchall_47

    .line 143
    move-object v0, v7

    .line 144
    goto :goto_1a

    .line 116
    .end local v0    # "buf":[C
    .end local v1    # "count":I
    .end local v4    # "is":Ljava/io/InputStreamReader;
    .end local v5    # "pos":I
    .end local v6    # "size":I
    .end local v7    # "tbuf":[C
    :catch_34
    move-exception v3

    .line 125
    .local v3, "iex":Ljava/lang/IllegalArgumentException;
    new-instance v8, Ljava/io/UnsupportedEncodingException;

    invoke-direct {v8, v2}, Ljava/io/UnsupportedEncodingException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 140
    .end local v3    # "iex":Ljava/lang/IllegalArgumentException;
    .restart local v0    # "buf":[C
    .restart local v1    # "count":I
    .restart local v4    # "is":Ljava/io/InputStreamReader;
    .restart local v5    # "pos":I
    .restart local v6    # "size":I
    :cond_3b
    add-int/2addr v6, v10

    goto :goto_2b

    .line 146
    .end local v6    # "size":I
    :cond_3d
    :try_start_3d
    new-instance v8, Ljava/lang/String;

    const/4 v9, 0x0

    invoke-direct {v8, v0, v9, v5}, Ljava/lang/String;-><init>([CII)V
    :try_end_43
    .catchall {:try_start_3d .. :try_end_43} :catchall_47

    .line 149
    :try_start_43
    invoke-virtual {v4}, Ljava/io/InputStreamReader;->close()V
    :try_end_46
    .catch Ljava/io/IOException; {:try_start_43 .. :try_end_46} :catch_4c

    .line 152
    :goto_46
    return-object v8

    .line 148
    .end local v0    # "buf":[C
    .end local v1    # "count":I
    :catchall_47
    move-exception v8

    .line 149
    :try_start_48
    invoke-virtual {v4}, Ljava/io/InputStreamReader;->close()V
    :try_end_4b
    .catch Ljava/io/IOException; {:try_start_48 .. :try_end_4b} :catch_4e

    .line 152
    :goto_4b
    throw v8

    .line 150
    .restart local v0    # "buf":[C
    .restart local v1    # "count":I
    :catch_4c
    move-exception v9

    goto :goto_46

    .end local v0    # "buf":[C
    .end local v1    # "count":I
    :catch_4e
    move-exception v9

    goto :goto_4b
.end method

.method protected getDF()Lkorex/activation/ActivationDataFlavor;
    .registers 2

    .prologue
    .line 80
    sget-object v0, Lcom/sun/mail/handlers/text_plain;->myDF:Lkorex/activation/ActivationDataFlavor;

    return-object v0
.end method

.method public getTransferData(Lkore/awt/datatransfer/DataFlavor;Lkorex/activation/DataSource;)Ljava/lang/Object;
    .registers 4
    .param p1, "df"    # Lkore/awt/datatransfer/DataFlavor;
    .param p2, "ds"    # Lkorex/activation/DataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    invoke-virtual {p0}, Lcom/sun/mail/handlers/text_plain;->getDF()Lkorex/activation/ActivationDataFlavor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lkorex/activation/ActivationDataFlavor;->equals(Lkore/awt/datatransfer/DataFlavor;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 104
    invoke-virtual {p0, p2}, Lcom/sun/mail/handlers/text_plain;->getContent(Lkorex/activation/DataSource;)Ljava/lang/Object;

    move-result-object v0

    .line 106
    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method public getTransferDataFlavors()[Lkore/awt/datatransfer/DataFlavor;
    .registers 4

    .prologue
    .line 89
    const/4 v0, 0x1

    new-array v0, v0, [Lkore/awt/datatransfer/DataFlavor;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/sun/mail/handlers/text_plain;->getDF()Lkorex/activation/ActivationDataFlavor;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0
.end method

.method public writeTo(Ljava/lang/Object;Ljava/lang/String;Ljava/io/OutputStream;)V
    .registers 11
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "os"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 161
    instance-of v4, p1, Ljava/lang/String;

    if-nez v4, :cond_3d

    .line 162
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Lcom/sun/mail/handlers/text_plain;->getDF()Lkorex/activation/ActivationDataFlavor;

    move-result-object v6

    invoke-virtual {v6}, Lkorex/activation/ActivationDataFlavor;->getMimeType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\" DataContentHandler requires String object, "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "was given object of type "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 164
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 166
    :cond_3d
    const/4 v0, 0x0

    .line 167
    .local v0, "enc":Ljava/lang/String;
    const/4 v2, 0x0

    .line 170
    .local v2, "osw":Ljava/io/OutputStreamWriter;
    :try_start_3f
    invoke-direct {p0, p2}, Lcom/sun/mail/handlers/text_plain;->getCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 171
    new-instance v2, Ljava/io/OutputStreamWriter;

    .end local v2    # "osw":Ljava/io/OutputStreamWriter;
    new-instance v4, Lcom/sun/mail/handlers/text_plain$NoCloseOutputStream;

    invoke-direct {v4, p3}, Lcom/sun/mail/handlers/text_plain$NoCloseOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v2, v4, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_4d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3f .. :try_end_4d} :catch_5c

    .restart local v2    # "osw":Ljava/io/OutputStreamWriter;
    move-object v3, p1

    .line 184
    check-cast v3, Ljava/lang/String;

    .line 185
    .local v3, "s":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v2, v3, v4, v5}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;II)V

    .line 193
    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->close()V

    .line 194
    return-void

    .line 172
    .end local v2    # "osw":Ljava/io/OutputStreamWriter;
    .end local v3    # "s":Ljava/lang/String;
    :catch_5c
    move-exception v1

    .line 181
    .local v1, "iex":Ljava/lang/IllegalArgumentException;
    new-instance v4, Ljava/io/UnsupportedEncodingException;

    invoke-direct {v4, v0}, Ljava/io/UnsupportedEncodingException;-><init>(Ljava/lang/String;)V

    throw v4
.end method
