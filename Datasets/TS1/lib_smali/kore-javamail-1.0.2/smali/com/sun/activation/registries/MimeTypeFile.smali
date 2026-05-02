.class public Lcom/sun/activation/registries/MimeTypeFile;
.super Ljava/lang/Object;
.source "MimeTypeFile.java"


# instance fields
.field private fname:Ljava/lang/String;

.field private type_hash:Ljava/util/Hashtable;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/activation/registries/MimeTypeFile;->fname:Ljava/lang/String;

    .line 35
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/sun/activation/registries/MimeTypeFile;->type_hash:Ljava/util/Hashtable;

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .registers 5
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sun/activation/registries/MimeTypeFile;->fname:Ljava/lang/String;

    .line 35
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lcom/sun/activation/registries/MimeTypeFile;->type_hash:Ljava/util/Hashtable;

    .line 64
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    const-string v2, "iso-8859-1"

    invoke-direct {v1, p1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-direct {p0, v0}, Lcom/sun/activation/registries/MimeTypeFile;->parse(Ljava/io/BufferedReader;)V

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 6
    .param p1, "new_fname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/sun/activation/registries/MimeTypeFile;->fname:Ljava/lang/String;

    .line 35
    new-instance v2, Ljava/util/Hashtable;

    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    iput-object v2, p0, Lcom/sun/activation/registries/MimeTypeFile;->type_hash:Ljava/util/Hashtable;

    .line 43
    const/4 v1, 0x0

    .line 44
    .local v1, "mime_file":Ljava/io/File;
    const/4 v0, 0x0

    .line 46
    .local v0, "fr":Ljava/io/FileReader;
    iput-object p1, p0, Lcom/sun/activation/registries/MimeTypeFile;->fname:Ljava/lang/String;

    .line 48
    new-instance v1, Ljava/io/File;

    .end local v1    # "mime_file":Ljava/io/File;
    iget-object v2, p0, Lcom/sun/activation/registries/MimeTypeFile;->fname:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 50
    .restart local v1    # "mime_file":Ljava/io/File;
    new-instance v0, Ljava/io/FileReader;

    .end local v0    # "fr":Ljava/io/FileReader;
    invoke-direct {v0, v1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 53
    .restart local v0    # "fr":Ljava/io/FileReader;
    :try_start_1d
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-direct {p0, v2}, Lcom/sun/activation/registries/MimeTypeFile;->parse(Ljava/io/BufferedReader;)V
    :try_end_25
    .catchall {:try_start_1d .. :try_end_25} :catchall_29

    .line 56
    :try_start_25
    invoke-virtual {v0}, Ljava/io/FileReader;->close()V
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_28} :catch_2e

    .line 61
    :goto_28
    return-void

    .line 55
    :catchall_29
    move-exception v2

    .line 56
    :try_start_2a
    invoke-virtual {v0}, Ljava/io/FileReader;->close()V
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_2d} :catch_30

    .line 59
    :goto_2d
    throw v2

    .line 57
    :catch_2e
    move-exception v2

    goto :goto_28

    :catch_30
    move-exception v3

    goto :goto_2d
.end method

.method private parse(Ljava/io/BufferedReader;)V
    .registers 7
    .param p1, "buf_reader"    # Ljava/io/BufferedReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 119
    const/4 v1, 0x0

    .local v1, "line":Ljava/lang/String;
    const/4 v2, 0x0

    .line 121
    .local v2, "prev":Ljava/lang/String;
    :goto_2
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3e

    .line 122
    if-nez v2, :cond_27

    .line 123
    move-object v2, v1

    .line 126
    :goto_b
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    .line 127
    .local v0, "end":I
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_39

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x5c

    if-ne v3, v4, :cond_39

    .line 128
    const/4 v3, 0x0

    add-int/lit8 v4, v0, -0x1

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 129
    goto :goto_2

    .line 125
    .end local v0    # "end":I
    :cond_27
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_b

    .line 131
    .restart local v0    # "end":I
    :cond_39
    invoke-direct {p0, v2}, Lcom/sun/activation/registries/MimeTypeFile;->parseEntry(Ljava/lang/String;)V

    .line 132
    const/4 v2, 0x0

    .line 133
    goto :goto_2

    .line 134
    .end local v0    # "end":I
    :cond_3e
    if-eqz v2, :cond_43

    .line 135
    invoke-direct {p0, v2}, Lcom/sun/activation/registries/MimeTypeFile;->parseEntry(Ljava/lang/String;)V

    .line 136
    :cond_43
    return-void
.end method

.method private parseEntry(Ljava/lang/String;)V
    .registers 13
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 142
    const/4 v3, 0x0

    .line 143
    .local v3, "mime_type":Ljava/lang/String;
    const/4 v1, 0x0

    .line 144
    .local v1, "file_ext":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 146
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_d

    .line 203
    :cond_c
    :goto_c
    return-void

    .line 150
    :cond_d
    const/4 v9, 0x0

    invoke-virtual {p1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const/16 v10, 0x23

    if-eq v9, v10, :cond_c

    .line 154
    const/16 v9, 0x3d

    invoke-virtual {p1, v9}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    if-lez v9, :cond_b7

    .line 156
    new-instance v2, Lcom/sun/activation/registries/LineTokenizer;

    invoke-direct {v2, p1}, Lcom/sun/activation/registries/LineTokenizer;-><init>(Ljava/lang/String;)V

    .line 157
    .local v2, "lt":Lcom/sun/activation/registries/LineTokenizer;
    :cond_23
    :goto_23
    invoke-virtual {v2}, Lcom/sun/activation/registries/LineTokenizer;->hasMoreTokens()Z

    move-result v9

    if-eqz v9, :cond_c

    .line 158
    invoke-virtual {v2}, Lcom/sun/activation/registries/LineTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    .line 159
    .local v4, "name":Ljava/lang/String;
    const/4 v8, 0x0

    .line 160
    .local v8, "value":Ljava/lang/String;
    invoke-virtual {v2}, Lcom/sun/activation/registries/LineTokenizer;->hasMoreTokens()Z

    move-result v9

    if-eqz v9, :cond_4a

    invoke-virtual {v2}, Lcom/sun/activation/registries/LineTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v9

    const-string v10, "="

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4a

    .line 161
    invoke-virtual {v2}, Lcom/sun/activation/registries/LineTokenizer;->hasMoreTokens()Z

    move-result v9

    if-eqz v9, :cond_4a

    .line 162
    invoke-virtual {v2}, Lcom/sun/activation/registries/LineTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v8

    .line 163
    :cond_4a
    if-nez v8, :cond_69

    .line 164
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v9

    if-eqz v9, :cond_c

    .line 165
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Bad .mime.types entry: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    goto :goto_c

    .line 168
    :cond_69
    const-string v9, "type"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_73

    .line 169
    move-object v3, v8

    goto :goto_23

    .line 170
    :cond_73
    const-string v9, "exts"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_23

    .line 171
    new-instance v6, Ljava/util/StringTokenizer;

    const-string v9, ","

    invoke-direct {v6, v8, v9}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .local v6, "st":Ljava/util/StringTokenizer;
    :cond_82
    :goto_82
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v9

    if-eqz v9, :cond_23

    .line 173
    invoke-virtual {v6}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 174
    new-instance v0, Lcom/sun/activation/registries/MimeTypeEntry;

    invoke-direct {v0, v3, v1}, Lcom/sun/activation/registries/MimeTypeEntry;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    .local v0, "entry":Lcom/sun/activation/registries/MimeTypeEntry;
    iget-object v9, p0, Lcom/sun/activation/registries/MimeTypeFile;->type_hash:Ljava/util/Hashtable;

    invoke-virtual {v9, v1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v9

    if-eqz v9, :cond_82

    .line 178
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Added: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Lcom/sun/activation/registries/MimeTypeEntry;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    goto :goto_82

    .line 185
    .end local v0    # "entry":Lcom/sun/activation/registries/MimeTypeEntry;
    .end local v2    # "lt":Lcom/sun/activation/registries/LineTokenizer;
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "st":Ljava/util/StringTokenizer;
    .end local v8    # "value":Ljava/lang/String;
    :cond_b7
    new-instance v7, Ljava/util/StringTokenizer;

    invoke-direct {v7, p1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;)V

    .line 186
    .local v7, "strtok":Ljava/util/StringTokenizer;
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v5

    .line 188
    .local v5, "num_tok":I
    if-eqz v5, :cond_c

    .line 191
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    .line 193
    :cond_c6
    :goto_c6
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v9

    if-eqz v9, :cond_c

    .line 194
    const/4 v0, 0x0

    .line 196
    .restart local v0    # "entry":Lcom/sun/activation/registries/MimeTypeEntry;
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 197
    new-instance v0, Lcom/sun/activation/registries/MimeTypeEntry;

    .end local v0    # "entry":Lcom/sun/activation/registries/MimeTypeEntry;
    invoke-direct {v0, v3, v1}, Lcom/sun/activation/registries/MimeTypeEntry;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    .restart local v0    # "entry":Lcom/sun/activation/registries/MimeTypeEntry;
    iget-object v9, p0, Lcom/sun/activation/registries/MimeTypeFile;->type_hash:Ljava/util/Hashtable;

    invoke-virtual {v9, v1, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v9

    if-eqz v9, :cond_c6

    .line 200
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Added: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Lcom/sun/activation/registries/MimeTypeEntry;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    goto :goto_c6
.end method


# virtual methods
.method public appendToRegistry(Ljava/lang/String;)V
    .registers 4
    .param p1, "mime_types"    # Ljava/lang/String;

    .prologue
    .line 109
    :try_start_0
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/StringReader;

    invoke-direct {v1, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-direct {p0, v0}, Lcom/sun/activation/registries/MimeTypeFile;->parse(Ljava/io/BufferedReader;)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_d} :catch_e

    .line 113
    :goto_d
    return-void

    .line 110
    :catch_e
    move-exception v0

    goto :goto_d
.end method

.method public getMIMETypeString(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "file_ext"    # Ljava/lang/String;

    .prologue
    .line 84
    invoke-virtual {p0, p1}, Lcom/sun/activation/registries/MimeTypeFile;->getMimeTypeEntry(Ljava/lang/String;)Lcom/sun/activation/registries/MimeTypeEntry;

    move-result-object v0

    .line 86
    .local v0, "entry":Lcom/sun/activation/registries/MimeTypeEntry;
    if-eqz v0, :cond_b

    .line 87
    invoke-virtual {v0}, Lcom/sun/activation/registries/MimeTypeEntry;->getMIMEType()Ljava/lang/String;

    move-result-object v1

    .line 89
    :goto_a
    return-object v1

    :cond_b
    const/4 v1, 0x0

    goto :goto_a
.end method

.method public getMimeTypeEntry(Ljava/lang/String;)Lcom/sun/activation/registries/MimeTypeEntry;
    .registers 3
    .param p1, "file_ext"    # Ljava/lang/String;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/sun/activation/registries/MimeTypeFile;->type_hash:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sun/activation/registries/MimeTypeEntry;

    return-object v0
.end method
