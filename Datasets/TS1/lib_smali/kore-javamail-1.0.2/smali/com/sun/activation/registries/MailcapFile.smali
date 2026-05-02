.class public Lcom/sun/activation/registries/MailcapFile;
.super Ljava/lang/Object;
.source "MailcapFile.java"


# static fields
.field private static addReverse:Z


# instance fields
.field private fallback_hash:Ljava/util/Map;

.field private native_commands:Ljava/util/Map;

.field private type_hash:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 54
    const/4 v0, 0x0

    sput-boolean v0, Lcom/sun/activation/registries/MailcapFile;->addReverse:Z

    .line 58
    :try_start_3
    const-string v0, "korex.activation.addreverse"

    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/sun/activation/registries/MailcapFile;->addReverse:Z
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_b} :catch_c

    .line 62
    :goto_b
    return-void

    .line 59
    :catch_c
    move-exception v0

    goto :goto_b
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/sun/activation/registries/MailcapFile;->type_hash:Ljava/util/Map;

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/sun/activation/registries/MailcapFile;->fallback_hash:Ljava/util/Map;

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/sun/activation/registries/MailcapFile;->native_commands:Ljava/util/Map;

    .line 100
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v0

    if-eqz v0, :cond_23

    .line 101
    const-string v0, "new MailcapFile: default"

    invoke-static {v0}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 102
    :cond_23
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
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/sun/activation/registries/MailcapFile;->type_hash:Ljava/util/Map;

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/sun/activation/registries/MailcapFile;->fallback_hash:Ljava/util/Map;

    .line 52
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/sun/activation/registries/MailcapFile;->native_commands:Ljava/util/Map;

    .line 91
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v0

    if-eqz v0, :cond_23

    .line 92
    const-string v0, "new MailcapFile: InputStream"

    invoke-static {v0}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 93
    :cond_23
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    const-string v2, "iso-8859-1"

    invoke-direct {v1, p1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-direct {p0, v0}, Lcom/sun/activation/registries/MailcapFile;->parse(Ljava/io/Reader;)V

    .line 94
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
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/sun/activation/registries/MailcapFile;->type_hash:Ljava/util/Map;

    .line 46
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/sun/activation/registries/MailcapFile;->fallback_hash:Ljava/util/Map;

    .line 52
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/sun/activation/registries/MailcapFile;->native_commands:Ljava/util/Map;

    .line 70
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v2

    if-eqz v2, :cond_34

    .line 71
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "new MailcapFile: file "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 72
    :cond_34
    const/4 v0, 0x0

    .line 74
    .local v0, "reader":Ljava/io/FileReader;
    :try_start_35
    new-instance v1, Ljava/io/FileReader;

    invoke-direct {v1, p1}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    :try_end_3a
    .catchall {:try_start_35 .. :try_end_3a} :catchall_48

    .line 75
    .end local v0    # "reader":Ljava/io/FileReader;
    .local v1, "reader":Ljava/io/FileReader;
    :try_start_3a
    new-instance v2, Ljava/io/BufferedReader;

    invoke-direct {v2, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-direct {p0, v2}, Lcom/sun/activation/registries/MailcapFile;->parse(Ljava/io/Reader;)V
    :try_end_42
    .catchall {:try_start_3a .. :try_end_42} :catchall_53

    .line 77
    if-eqz v1, :cond_47

    .line 79
    :try_start_44
    invoke-virtual {v1}, Ljava/io/FileReader;->close()V
    :try_end_47
    .catch Ljava/io/IOException; {:try_start_44 .. :try_end_47} :catch_4f

    .line 83
    :cond_47
    :goto_47
    return-void

    .line 77
    .end local v1    # "reader":Ljava/io/FileReader;
    .restart local v0    # "reader":Ljava/io/FileReader;
    :catchall_48
    move-exception v2

    :goto_49
    if-eqz v0, :cond_4e

    .line 79
    :try_start_4b
    invoke-virtual {v0}, Ljava/io/FileReader;->close()V
    :try_end_4e
    .catch Ljava/io/IOException; {:try_start_4b .. :try_end_4e} :catch_51

    .line 80
    :cond_4e
    :goto_4e
    throw v2

    .end local v0    # "reader":Ljava/io/FileReader;
    .restart local v1    # "reader":Ljava/io/FileReader;
    :catch_4f
    move-exception v2

    goto :goto_47

    .end local v1    # "reader":Ljava/io/FileReader;
    .restart local v0    # "reader":Ljava/io/FileReader;
    :catch_51
    move-exception v3

    goto :goto_4e

    .line 77
    .end local v0    # "reader":Ljava/io/FileReader;
    .restart local v1    # "reader":Ljava/io/FileReader;
    :catchall_53
    move-exception v2

    move-object v0, v1

    .end local v1    # "reader":Ljava/io/FileReader;
    .restart local v0    # "reader":Ljava/io/FileReader;
    goto :goto_49
.end method

.method private mergeResults(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;
    .registers 10
    .param p1, "first"    # Ljava/util/Map;
    .param p2, "second"    # Ljava/util/Map;

    .prologue
    .line 202
    invoke-interface {p2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 203
    .local v5, "verb_enum":Ljava/util/Iterator;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 206
    .local v0, "clonedHash":Ljava/util/Map;
    :goto_d
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3c

    .line 207
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 208
    .local v4, "verb":Ljava/lang/String;
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 209
    .local v1, "cmdVector":Ljava/util/List;
    if-nez v1, :cond_29

    .line 210
    invoke-interface {p2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v0, v4, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d

    .line 213
    :cond_29
    invoke-interface {p2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .line 214
    .local v3, "oldV":Ljava/util/List;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 215
    .end local v1    # "cmdVector":Ljava/util/List;
    .local v2, "cmdVector":Ljava/util/List;
    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 216
    invoke-interface {v0, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v1, v2

    .end local v2    # "cmdVector":Ljava/util/List;
    .restart local v1    # "cmdVector":Ljava/util/List;
    goto :goto_d

    .line 219
    .end local v1    # "cmdVector":Ljava/util/List;
    .end local v3    # "oldV":Ljava/util/List;
    .end local v4    # "verb":Ljava/lang/String;
    :cond_3c
    return-object v0
.end method

.method private parse(Ljava/io/Reader;)V
    .registers 8
    .param p1, "reader"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 246
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 247
    .local v0, "buf_reader":Ljava/io/BufferedReader;
    const/4 v2, 0x0

    .line 248
    .local v2, "line":Ljava/lang/String;
    const/4 v1, 0x0

    .line 250
    .local v1, "continued":Ljava/lang/String;
    :cond_7
    :goto_7
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_73

    .line 253
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 256
    const/4 v3, 0x0

    :try_start_12
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x23

    if-eq v3, v4, :cond_7

    .line 258
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x5c

    if-ne v3, v4, :cond_53

    .line 259
    if-eqz v1, :cond_47

    .line 260
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_7

    .line 262
    :cond_47
    const/4 v3, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_7

    .line 263
    :cond_53
    if-eqz v1, :cond_6b

    .line 265
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_65
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_12 .. :try_end_65} :catch_74

    move-result-object v1

    .line 268
    :try_start_66
    invoke-virtual {p0, v1}, Lcom/sun/activation/registries/MailcapFile;->parseLine(Ljava/lang/String;)V
    :try_end_69
    .catch Lcom/sun/activation/registries/MailcapParseException; {:try_start_66 .. :try_end_69} :catch_71
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_66 .. :try_end_69} :catch_74

    .line 272
    :goto_69
    const/4 v1, 0x0

    goto :goto_7

    .line 277
    :cond_6b
    :try_start_6b
    invoke-virtual {p0, v2}, Lcom/sun/activation/registries/MailcapFile;->parseLine(Ljava/lang/String;)V
    :try_end_6e
    .catch Lcom/sun/activation/registries/MailcapParseException; {:try_start_6b .. :try_end_6e} :catch_6f
    .catch Ljava/lang/StringIndexOutOfBoundsException; {:try_start_6b .. :try_end_6e} :catch_74

    goto :goto_7

    .line 279
    :catch_6f
    move-exception v3

    goto :goto_7

    .line 269
    :catch_71
    move-exception v3

    goto :goto_69

    .line 285
    :cond_73
    return-void

    .line 283
    :catch_74
    move-exception v3

    goto :goto_7
.end method

.method protected static reportParseError(IIIILjava/lang/String;)V
    .registers 8
    .param p0, "expectedToken"    # I
    .param p1, "otherExpectedToken"    # I
    .param p2, "anotherExpectedToken"    # I
    .param p3, "actualToken"    # I
    .param p4, "actualTokenValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/activation/registries/MailcapParseException;
        }
    .end annotation

    .prologue
    .line 517
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v0

    if-eqz v0, :cond_5a

    .line 518
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PARSE ERROR: Encountered a "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 519
    invoke-static {p3}, Lcom/sun/activation/registries/MailcapTokenizer;->nameForToken(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " token ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") while expecting a "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 521
    invoke-static {p0}, Lcom/sun/activation/registries/MailcapTokenizer;->nameForToken(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", a "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 522
    invoke-static {p1}, Lcom/sun/activation/registries/MailcapTokenizer;->nameForToken(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", or a "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 523
    invoke-static {p2}, Lcom/sun/activation/registries/MailcapTokenizer;->nameForToken(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " token."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 518
    invoke-static {v0}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 524
    :cond_5a
    new-instance v0, Lcom/sun/activation/registries/MailcapParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Encountered a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 525
    invoke-static {p3}, Lcom/sun/activation/registries/MailcapTokenizer;->nameForToken(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " token ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") while expecting a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 527
    invoke-static {p0}, Lcom/sun/activation/registries/MailcapTokenizer;->nameForToken(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 528
    invoke-static {p1}, Lcom/sun/activation/registries/MailcapTokenizer;->nameForToken(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", or a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 529
    invoke-static {p2}, Lcom/sun/activation/registries/MailcapTokenizer;->nameForToken(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " token."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/sun/activation/registries/MailcapParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected static reportParseError(IIILjava/lang/String;)V
    .registers 7
    .param p0, "expectedToken"    # I
    .param p1, "otherExpectedToken"    # I
    .param p2, "actualToken"    # I
    .param p3, "actualTokenValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/activation/registries/MailcapParseException;
        }
    .end annotation

    .prologue
    .line 507
    new-instance v0, Lcom/sun/activation/registries/MailcapParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Encountered a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 508
    invoke-static {p2}, Lcom/sun/activation/registries/MailcapTokenizer;->nameForToken(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " token ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") while expecting a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 510
    invoke-static {p0}, Lcom/sun/activation/registries/MailcapTokenizer;->nameForToken(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " or a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 511
    invoke-static {p1}, Lcom/sun/activation/registries/MailcapTokenizer;->nameForToken(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " token."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/sun/activation/registries/MailcapParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected static reportParseError(IILjava/lang/String;)V
    .registers 6
    .param p0, "expectedToken"    # I
    .param p1, "actualToken"    # I
    .param p2, "actualTokenValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/activation/registries/MailcapParseException;
        }
    .end annotation

    .prologue
    .line 498
    new-instance v0, Lcom/sun/activation/registries/MailcapParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Encountered a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 499
    invoke-static {p1}, Lcom/sun/activation/registries/MailcapTokenizer;->nameForToken(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " token ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") while expecting a "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 501
    invoke-static {p0}, Lcom/sun/activation/registries/MailcapTokenizer;->nameForToken(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " token."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/sun/activation/registries/MailcapParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public appendToMailcap(Ljava/lang/String;)V
    .registers 4
    .param p1, "mail_cap"    # Ljava/lang/String;

    .prologue
    .line 233
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 234
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "appendToMailcap: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 236
    :cond_1c
    :try_start_1c
    new-instance v0, Ljava/io/StringReader;

    invoke-direct {v0, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/sun/activation/registries/MailcapFile;->parse(Ljava/io/Reader;)V
    :try_end_24
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_24} :catch_25

    .line 240
    :goto_24
    return-void

    .line 237
    :catch_25
    move-exception v0

    goto :goto_24
.end method

.method public getMailcapFallbackList(Ljava/lang/String;)Ljava/util/Map;
    .registers 10
    .param p1, "mime_type"    # Ljava/lang/String;

    .prologue
    .line 146
    const/4 v0, 0x0

    .line 147
    .local v0, "search_result":Ljava/util/Map;
    const/4 v4, 0x0

    .line 150
    .local v4, "wildcard_result":Ljava/util/Map;
    iget-object v5, p0, Lcom/sun/activation/registries/MailcapFile;->fallback_hash:Ljava/util/Map;

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "search_result":Ljava/util/Map;
    check-cast v0, Ljava/util/Map;

    .line 153
    .restart local v0    # "search_result":Ljava/util/Map;
    const/16 v5, 0x2f

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 154
    .local v1, "separator":I
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 155
    .local v2, "subtype":Ljava/lang/String;
    const-string v5, "*"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_48

    .line 156
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v6, 0x0

    add-int/lit8 v7, v1, 0x1

    invoke-virtual {p1, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "*"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 157
    .local v3, "type":Ljava/lang/String;
    iget-object v5, p0, Lcom/sun/activation/registries/MailcapFile;->fallback_hash:Ljava/util/Map;

    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "wildcard_result":Ljava/util/Map;
    check-cast v4, Ljava/util/Map;

    .line 159
    .restart local v4    # "wildcard_result":Ljava/util/Map;
    if-eqz v4, :cond_48

    .line 160
    if-eqz v0, :cond_49

    .line 162
    invoke-direct {p0, v0, v4}, Lcom/sun/activation/registries/MailcapFile;->mergeResults(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 167
    .end local v3    # "type":Ljava/lang/String;
    :cond_48
    :goto_48
    return-object v0

    .line 164
    .restart local v3    # "type":Ljava/lang/String;
    :cond_49
    move-object v0, v4

    goto :goto_48
.end method

.method public getMailcapList(Ljava/lang/String;)Ljava/util/Map;
    .registers 10
    .param p1, "mime_type"    # Ljava/lang/String;

    .prologue
    .line 113
    const/4 v0, 0x0

    .line 114
    .local v0, "search_result":Ljava/util/Map;
    const/4 v4, 0x0

    .line 117
    .local v4, "wildcard_result":Ljava/util/Map;
    iget-object v5, p0, Lcom/sun/activation/registries/MailcapFile;->type_hash:Ljava/util/Map;

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "search_result":Ljava/util/Map;
    check-cast v0, Ljava/util/Map;

    .line 120
    .restart local v0    # "search_result":Ljava/util/Map;
    const/16 v5, 0x2f

    invoke-virtual {p1, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 121
    .local v1, "separator":I
    add-int/lit8 v5, v1, 0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 122
    .local v2, "subtype":Ljava/lang/String;
    const-string v5, "*"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_48

    .line 123
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v6, 0x0

    add-int/lit8 v7, v1, 0x1

    invoke-virtual {p1, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "*"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 124
    .local v3, "type":Ljava/lang/String;
    iget-object v5, p0, Lcom/sun/activation/registries/MailcapFile;->type_hash:Ljava/util/Map;

    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "wildcard_result":Ljava/util/Map;
    check-cast v4, Ljava/util/Map;

    .line 126
    .restart local v4    # "wildcard_result":Ljava/util/Map;
    if-eqz v4, :cond_48

    .line 127
    if-eqz v0, :cond_49

    .line 129
    invoke-direct {p0, v0, v4}, Lcom/sun/activation/registries/MailcapFile;->mergeResults(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    .line 134
    .end local v3    # "type":Ljava/lang/String;
    :cond_48
    :goto_48
    return-object v0

    .line 131
    .restart local v3    # "type":Ljava/lang/String;
    :cond_49
    move-object v0, v4

    goto :goto_48
.end method

.method public getMimeTypes()[Ljava/lang/String;
    .registers 4

    .prologue
    .line 174
    new-instance v1, Ljava/util/HashSet;

    iget-object v2, p0, Lcom/sun/activation/registries/MailcapFile;->type_hash:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 175
    .local v1, "types":Ljava/util/Set;
    iget-object v2, p0, Lcom/sun/activation/registries/MailcapFile;->fallback_hash:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 176
    iget-object v2, p0, Lcom/sun/activation/registries/MailcapFile;->native_commands:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 177
    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v2

    new-array v0, v2, [Ljava/lang/String;

    .line 178
    .local v0, "mts":[Ljava/lang/String;
    invoke-interface {v1, v0}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    move-object v0, v2

    check-cast v0, [Ljava/lang/String;

    .line 179
    return-object v0
.end method

.method public getNativeCommands(Ljava/lang/String;)[Ljava/lang/String;
    .registers 6
    .param p1, "mime_type"    # Ljava/lang/String;

    .prologue
    .line 186
    const/4 v0, 0x0

    .line 187
    .local v0, "cmds":[Ljava/lang/String;
    iget-object v2, p0, Lcom/sun/activation/registries/MailcapFile;->native_commands:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 188
    .local v1, "v":Ljava/util/List;
    if-eqz v1, :cond_1e

    .line 189
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v0, v2, [Ljava/lang/String;

    .line 190
    invoke-interface {v1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    move-object v0, v2

    check-cast v0, [Ljava/lang/String;

    .line 192
    :cond_1e
    return-object v0
.end method

.method protected parseLine(Ljava/lang/String;)V
    .registers 30
    .param p1, "mailcapEntry"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/activation/registries/MailcapParseException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 295
    new-instance v22, Lcom/sun/activation/registries/MailcapTokenizer;

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lcom/sun/activation/registries/MailcapTokenizer;-><init>(Ljava/lang/String;)V

    .line 296
    .local v22, "tokenizer":Lcom/sun/activation/registries/MailcapTokenizer;
    const/16 v24, 0x0

    move-object/from16 v0, v22

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/sun/activation/registries/MailcapTokenizer;->setIsAutoquoting(Z)V

    .line 298
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v24

    if-eqz v24, :cond_32

    .line 299
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "parse: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 301
    :cond_32
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->nextToken()I

    move-result v12

    .line 302
    .local v12, "currentToken":I
    const/16 v24, 0x2

    move/from16 v0, v24

    if-eq v12, v0, :cond_49

    .line 303
    const/16 v24, 0x2

    .line 304
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->getCurrentTokenValue()Ljava/lang/String;

    move-result-object v25

    .line 303
    move/from16 v0, v24

    move-object/from16 v1, v25

    invoke-static {v0, v12, v1}, Lcom/sun/activation/registries/MailcapFile;->reportParseError(IILjava/lang/String;)V

    .line 306
    :cond_49
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->getCurrentTokenValue()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v20

    .line 307
    .local v20, "primaryType":Ljava/lang/String;
    const-string v21, "*"

    .line 311
    .local v21, "subType":Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->nextToken()I

    move-result v12

    .line 312
    const/16 v24, 0x2f

    move/from16 v0, v24

    if-eq v12, v0, :cond_74

    const/16 v24, 0x3b

    move/from16 v0, v24

    if-eq v12, v0, :cond_74

    .line 314
    const/16 v24, 0x2f

    const/16 v25, 0x3b

    .line 316
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->getCurrentTokenValue()Ljava/lang/String;

    move-result-object v26

    .line 314
    move/from16 v0, v24

    move/from16 v1, v25

    move-object/from16 v2, v26

    invoke-static {v0, v1, v12, v2}, Lcom/sun/activation/registries/MailcapFile;->reportParseError(IIILjava/lang/String;)V

    .line 320
    :cond_74
    const/16 v24, 0x2f

    move/from16 v0, v24

    if-ne v12, v0, :cond_9d

    .line 322
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->nextToken()I

    move-result v12

    .line 323
    const/16 v24, 0x2

    move/from16 v0, v24

    if-eq v12, v0, :cond_91

    .line 324
    const/16 v24, 0x2

    .line 325
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->getCurrentTokenValue()Ljava/lang/String;

    move-result-object v25

    .line 324
    move/from16 v0, v24

    move-object/from16 v1, v25

    invoke-static {v0, v12, v1}, Lcom/sun/activation/registries/MailcapFile;->reportParseError(IILjava/lang/String;)V

    .line 327
    :cond_91
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->getCurrentTokenValue()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v21

    .line 330
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->nextToken()I

    move-result v12

    .line 333
    :cond_9d
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, "/"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 335
    .local v17, "mimeType":Ljava/lang/String;
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v24

    if-eqz v24, :cond_dc

    .line 336
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "  Type: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 339
    :cond_dc
    new-instance v10, Ljava/util/LinkedHashMap;

    invoke-direct {v10}, Ljava/util/LinkedHashMap;-><init>()V

    .line 342
    .local v10, "commands":Ljava/util/Map;
    const/16 v24, 0x3b

    move/from16 v0, v24

    if-eq v12, v0, :cond_f4

    .line 343
    const/16 v24, 0x3b

    .line 344
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->getCurrentTokenValue()Ljava/lang/String;

    move-result-object v25

    .line 343
    move/from16 v0, v24

    move-object/from16 v1, v25

    invoke-static {v0, v12, v1}, Lcom/sun/activation/registries/MailcapFile;->reportParseError(IILjava/lang/String;)V

    .line 349
    :cond_f4
    const/16 v24, 0x1

    move-object/from16 v0, v22

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/sun/activation/registries/MailcapTokenizer;->setIsAutoquoting(Z)V

    .line 350
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->nextToken()I

    move-result v12

    .line 351
    const/16 v24, 0x0

    move-object/from16 v0, v22

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/sun/activation/registries/MailcapTokenizer;->setIsAutoquoting(Z)V

    .line 352
    const/16 v24, 0x2

    move/from16 v0, v24

    if-eq v12, v0, :cond_127

    const/16 v24, 0x3b

    move/from16 v0, v24

    if-eq v12, v0, :cond_127

    .line 354
    const/16 v24, 0x2

    const/16 v25, 0x3b

    .line 356
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->getCurrentTokenValue()Ljava/lang/String;

    move-result-object v26

    .line 354
    move/from16 v0, v24

    move/from16 v1, v25

    move-object/from16 v2, v26

    invoke-static {v0, v1, v12, v2}, Lcom/sun/activation/registries/MailcapFile;->reportParseError(IIILjava/lang/String;)V

    .line 359
    :cond_127
    const/16 v24, 0x2

    move/from16 v0, v24

    if-ne v12, v0, :cond_15a

    .line 362
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/activation/registries/MailcapFile;->native_commands:Ljava/util/Map;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/util/List;

    .line 363
    .local v23, "v":Ljava/util/List;
    if-nez v23, :cond_237

    .line 364
    new-instance v23, Ljava/util/ArrayList;

    .end local v23    # "v":Ljava/util/List;
    invoke-direct/range {v23 .. v23}, Ljava/util/ArrayList;-><init>()V

    .line 365
    .restart local v23    # "v":Ljava/util/List;
    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 366
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/activation/registries/MailcapFile;->native_commands:Ljava/util/Map;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v17

    move-object/from16 v2, v23

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    .end local v23    # "v":Ljava/util/List;
    :cond_15a
    :goto_15a
    const/16 v24, 0x3b

    move/from16 v0, v24

    if-eq v12, v0, :cond_164

    .line 375
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->nextToken()I

    move-result v12

    .line 380
    :cond_164
    const/16 v24, 0x3b

    move/from16 v0, v24

    if-ne v12, v0, :cond_323

    .line 381
    const/4 v15, 0x0

    .line 386
    .local v15, "isFallback":Z
    :cond_16b
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->nextToken()I

    move-result v12

    .line 387
    const/16 v24, 0x2

    move/from16 v0, v24

    if-eq v12, v0, :cond_182

    .line 388
    const/16 v24, 0x2

    .line 389
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->getCurrentTokenValue()Ljava/lang/String;

    move-result-object v25

    .line 388
    move/from16 v0, v24

    move-object/from16 v1, v25

    invoke-static {v0, v12, v1}, Lcom/sun/activation/registries/MailcapFile;->reportParseError(IILjava/lang/String;)V

    .line 392
    :cond_182
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->getCurrentTokenValue()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v18

    .line 395
    .local v18, "paramName":Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->nextToken()I

    move-result v12

    .line 396
    const/16 v24, 0x3d

    move/from16 v0, v24

    if-eq v12, v0, :cond_1b5

    const/16 v24, 0x3b

    move/from16 v0, v24

    if-eq v12, v0, :cond_1b5

    const/16 v24, 0x5

    move/from16 v0, v24

    if-eq v12, v0, :cond_1b5

    .line 399
    const/16 v24, 0x3d

    const/16 v25, 0x3b

    const/16 v26, 0x5

    .line 402
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->getCurrentTokenValue()Ljava/lang/String;

    move-result-object v27

    .line 399
    move/from16 v0, v24

    move/from16 v1, v25

    move/from16 v2, v26

    move-object/from16 v3, v27

    invoke-static {v0, v1, v2, v12, v3}, Lcom/sun/activation/registries/MailcapFile;->reportParseError(IIIILjava/lang/String;)V

    .line 406
    :cond_1b5
    const/16 v24, 0x3d

    move/from16 v0, v24

    if-ne v12, v0, :cond_219

    .line 410
    const/16 v24, 0x1

    move-object/from16 v0, v22

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/sun/activation/registries/MailcapTokenizer;->setIsAutoquoting(Z)V

    .line 411
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->nextToken()I

    move-result v12

    .line 412
    const/16 v24, 0x0

    move-object/from16 v0, v22

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/sun/activation/registries/MailcapTokenizer;->setIsAutoquoting(Z)V

    .line 413
    const/16 v24, 0x2

    move/from16 v0, v24

    if-eq v12, v0, :cond_1e4

    .line 414
    const/16 v24, 0x2

    .line 415
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->getCurrentTokenValue()Ljava/lang/String;

    move-result-object v25

    .line 414
    move/from16 v0, v24

    move-object/from16 v1, v25

    invoke-static {v0, v12, v1}, Lcom/sun/activation/registries/MailcapFile;->reportParseError(IILjava/lang/String;)V

    .line 418
    :cond_1e4
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->getCurrentTokenValue()Ljava/lang/String;

    move-result-object v19

    .line 421
    .local v19, "paramValue":Ljava/lang/String;
    const-string v24, "x-java-"

    move-object/from16 v0, v18

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_215

    .line 422
    const/16 v24, 0x7

    move-object/from16 v0, v18

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 425
    .local v9, "commandName":Ljava/lang/String;
    const-string v24, "fallback-entry"

    move-object/from16 v0, v24

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_240

    const-string v24, "true"

    .line 426
    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_240

    .line 427
    const/4 v15, 0x1

    .line 447
    .end local v9    # "commandName":Ljava/lang/String;
    :cond_215
    :goto_215
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->nextToken()I

    move-result v12

    .line 449
    .end local v19    # "paramValue":Ljava/lang/String;
    :cond_219
    const/16 v24, 0x3b

    move/from16 v0, v24

    if-eq v12, v0, :cond_16b

    .line 451
    if-eqz v15, :cond_290

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/activation/registries/MailcapFile;->fallback_hash:Ljava/util/Map;

    move-object/from16 v16, v0

    .line 453
    .local v16, "masterHash":Ljava/util/Map;
    :goto_227
    invoke-interface/range {v16 .. v17}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/Map;

    .line 454
    .local v11, "curcommands":Ljava/util/Map;
    if-nez v11, :cond_297

    .line 455
    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-interface {v0, v1, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 494
    .end local v11    # "curcommands":Ljava/util/Map;
    .end local v15    # "isFallback":Z
    .end local v16    # "masterHash":Ljava/util/Map;
    .end local v18    # "paramName":Ljava/lang/String;
    :cond_236
    :goto_236
    return-void

    .line 369
    .restart local v23    # "v":Ljava/util/List;
    :cond_237
    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_15a

    .line 431
    .end local v23    # "v":Ljava/util/List;
    .restart local v9    # "commandName":Ljava/lang/String;
    .restart local v15    # "isFallback":Z
    .restart local v18    # "paramName":Ljava/lang/String;
    .restart local v19    # "paramValue":Ljava/lang/String;
    :cond_240
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v24

    if-eqz v24, :cond_26c

    .line 432
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "    Command: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    const-string v25, ", Class: "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 434
    :cond_26c
    invoke-interface {v10, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 435
    .local v5, "classes":Ljava/util/List;
    if-nez v5, :cond_27c

    .line 436
    new-instance v5, Ljava/util/ArrayList;

    .end local v5    # "classes":Ljava/util/List;
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 437
    .restart local v5    # "classes":Ljava/util/List;
    invoke-interface {v10, v9, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 439
    :cond_27c
    sget-boolean v24, Lcom/sun/activation/registries/MailcapFile;->addReverse:Z

    if-eqz v24, :cond_28a

    .line 440
    const/16 v24, 0x0

    move/from16 v0, v24

    move-object/from16 v1, v19

    invoke-interface {v5, v0, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_215

    .line 442
    :cond_28a
    move-object/from16 v0, v19

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_215

    .line 451
    .end local v5    # "classes":Ljava/util/List;
    .end local v9    # "commandName":Ljava/lang/String;
    .end local v19    # "paramValue":Ljava/lang/String;
    :cond_290
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/sun/activation/registries/MailcapFile;->type_hash:Ljava/util/Map;

    move-object/from16 v16, v0

    goto :goto_227

    .line 457
    .restart local v11    # "curcommands":Ljava/util/Map;
    .restart local v16    # "masterHash":Ljava/util/Map;
    :cond_297
    invoke-static {}, Lcom/sun/activation/registries/LogSupport;->isLoggable()Z

    move-result v24

    if-eqz v24, :cond_2b7

    .line 458
    new-instance v24, Ljava/lang/StringBuilder;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuilder;-><init>()V

    const-string v25, "Merging commands for type "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/sun/activation/registries/LogSupport;->log(Ljava/lang/String;)V

    .line 461
    :cond_2b7
    invoke-interface {v11}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .line 462
    .local v8, "cn":Ljava/util/Iterator;
    :cond_2bf
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_2ff

    .line 463
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 464
    .local v7, "cmdName":Ljava/lang/String;
    invoke-interface {v11, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .line 465
    .local v4, "ccv":Ljava/util/List;
    invoke-interface {v10, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    .line 466
    .local v13, "cv":Ljava/util/List;
    if-eqz v13, :cond_2bf

    .line 469
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .line 470
    .local v14, "cvn":Ljava/util/Iterator;
    :cond_2dd
    :goto_2dd
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_2bf

    .line 471
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 472
    .local v6, "clazz":Ljava/lang/String;
    invoke-interface {v4, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_2dd

    .line 473
    sget-boolean v24, Lcom/sun/activation/registries/MailcapFile;->addReverse:Z

    if-eqz v24, :cond_2fb

    .line 474
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-interface {v4, v0, v6}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_2dd

    .line 476
    :cond_2fb
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2dd

    .line 480
    .end local v4    # "ccv":Ljava/util/List;
    .end local v6    # "clazz":Ljava/lang/String;
    .end local v7    # "cmdName":Ljava/lang/String;
    .end local v13    # "cv":Ljava/util/List;
    .end local v14    # "cvn":Ljava/util/Iterator;
    :cond_2ff
    invoke-interface {v10}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .line 481
    :cond_307
    :goto_307
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_236

    .line 482
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 483
    .restart local v7    # "cmdName":Ljava/lang/String;
    invoke-interface {v11, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_307

    .line 485
    invoke-interface {v10, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    .line 486
    .restart local v13    # "cv":Ljava/util/List;
    invoke-interface {v11, v7, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_307

    .line 489
    .end local v7    # "cmdName":Ljava/lang/String;
    .end local v8    # "cn":Ljava/util/Iterator;
    .end local v11    # "curcommands":Ljava/util/Map;
    .end local v13    # "cv":Ljava/util/List;
    .end local v15    # "isFallback":Z
    .end local v16    # "masterHash":Ljava/util/Map;
    .end local v18    # "paramName":Ljava/lang/String;
    :cond_323
    const/16 v24, 0x5

    move/from16 v0, v24

    if-eq v12, v0, :cond_236

    .line 490
    const/16 v24, 0x5

    const/16 v25, 0x3b

    .line 492
    invoke-virtual/range {v22 .. v22}, Lcom/sun/activation/registries/MailcapTokenizer;->getCurrentTokenValue()Ljava/lang/String;

    move-result-object v26

    .line 490
    move/from16 v0, v24

    move/from16 v1, v25

    move-object/from16 v2, v26

    invoke-static {v0, v1, v12, v2}, Lcom/sun/activation/registries/MailcapFile;->reportParseError(IIILjava/lang/String;)V

    goto/16 :goto_236
.end method
