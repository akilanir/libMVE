.class public Lcom/wutka/dtd/DTDParser;
.super Ljava/lang/Object;
.source "DTDParser.java"

# interfaces
.implements Lcom/wutka/dtd/EntityExpansion;


# instance fields
.field protected defaultLocation:Ljava/lang/Object;

.field protected dtd:Lcom/wutka/dtd/DTD;

.field protected scanner:Lcom/wutka/dtd/Scanner;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .registers 5
    .param p1, "in"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/wutka/dtd/DTDParser;->defaultLocation:Ljava/lang/Object;

    .line 42
    new-instance v0, Lcom/wutka/dtd/Scanner;

    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0}, Lcom/wutka/dtd/Scanner;-><init>(Ljava/io/Reader;ZLcom/wutka/dtd/EntityExpansion;)V

    iput-object v0, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    .line 44
    new-instance v0, Lcom/wutka/dtd/DTD;

    invoke-direct {v0}, Lcom/wutka/dtd/DTD;-><init>()V

    iput-object v0, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/io/File;Z)V
    .registers 6
    .param p1, "in"    # Ljava/io/File;
    .param p2, "trace"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/wutka/dtd/DTDParser;->defaultLocation:Ljava/lang/Object;

    .line 57
    new-instance v0, Lcom/wutka/dtd/Scanner;

    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-direct {v0, v1, p2, p0}, Lcom/wutka/dtd/Scanner;-><init>(Ljava/io/Reader;ZLcom/wutka/dtd/EntityExpansion;)V

    iput-object v0, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    .line 59
    new-instance v0, Lcom/wutka/dtd/DTD;

    invoke-direct {v0}, Lcom/wutka/dtd/DTD;-><init>()V

    iput-object v0, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .registers 4
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Lcom/wutka/dtd/Scanner;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1, p0}, Lcom/wutka/dtd/Scanner;-><init>(Ljava/io/Reader;ZLcom/wutka/dtd/EntityExpansion;)V

    iput-object v0, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    .line 22
    new-instance v0, Lcom/wutka/dtd/DTD;

    invoke-direct {v0}, Lcom/wutka/dtd/DTD;-><init>()V

    iput-object v0, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    .line 23
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;Z)V
    .registers 4
    .param p1, "in"    # Ljava/io/Reader;
    .param p2, "trace"    # Z

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Lcom/wutka/dtd/Scanner;

    invoke-direct {v0, p1, p2, p0}, Lcom/wutka/dtd/Scanner;-><init>(Ljava/io/Reader;ZLcom/wutka/dtd/EntityExpansion;)V

    iput-object v0, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    .line 33
    new-instance v0, Lcom/wutka/dtd/DTD;

    invoke-direct {v0}, Lcom/wutka/dtd/DTD;-><init>()V

    iput-object v0, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;)V
    .registers 9
    .param p1, "in"    # Ljava/net/URL;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    invoke-virtual {p1}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v0

    .line 70
    .local v0, "file":Ljava/lang/String;
    new-instance v1, Ljava/net/URL;

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Ljava/net/URL;->getPort()I

    move-result v4

    const/16 v5, 0x2f

    invoke-virtual {v0, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v0, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v2, v3, v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    iput-object v1, p0, Lcom/wutka/dtd/DTDParser;->defaultLocation:Ljava/lang/Object;

    .line 72
    new-instance v1, Lcom/wutka/dtd/Scanner;

    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-direct {v1, v2, v6, p0}, Lcom/wutka/dtd/Scanner;-><init>(Ljava/io/Reader;ZLcom/wutka/dtd/EntityExpansion;)V

    iput-object v1, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    .line 74
    new-instance v1, Lcom/wutka/dtd/DTD;

    invoke-direct {v1}, Lcom/wutka/dtd/DTD;-><init>()V

    iput-object v1, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    .line 75
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Z)V
    .registers 10
    .param p1, "in"    # Ljava/net/URL;
    .param p2, "trace"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    invoke-virtual {p1}, Ljava/net/URL;->getFile()Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "file":Ljava/lang/String;
    new-instance v1, Ljava/net/URL;

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Ljava/net/URL;->getPort()I

    move-result v4

    const/4 v5, 0x0

    const/16 v6, 0x2f

    invoke-virtual {v0, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    add-int/lit8 v6, v6, 0x1

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v2, v3, v4, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    iput-object v1, p0, Lcom/wutka/dtd/DTDParser;->defaultLocation:Ljava/lang/Object;

    .line 92
    new-instance v1, Lcom/wutka/dtd/Scanner;

    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Ljava/net/URL;->openStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-direct {v1, v2, p2, p0}, Lcom/wutka/dtd/Scanner;-><init>(Ljava/io/Reader;ZLcom/wutka/dtd/EntityExpansion;)V

    iput-object v1, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    .line 94
    new-instance v1, Lcom/wutka/dtd/DTD;

    invoke-direct {v1}, Lcom/wutka/dtd/DTD;-><init>()V

    iput-object v1, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    .line 95
    return-void
.end method


# virtual methods
.method public expandEntity(Ljava/lang/String;)Lcom/wutka/dtd/DTDEntity;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 965
    iget-object v0, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v0, v0, Lcom/wutka/dtd/DTD;->entities:Ljava/util/Hashtable;

    invoke-virtual {v0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wutka/dtd/DTDEntity;

    return-object v0
.end method

.method protected expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;
    .registers 8
    .param p1, "expected"    # Lcom/wutka/dtd/TokenType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 299
    iget-object v1, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v1}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v0

    .line 301
    .local v0, "token":Lcom/wutka/dtd/Token;
    iget-object v1, v0, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    if-eq v1, p1, :cond_96

    .line 303
    iget-object v1, v0, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    if-nez v1, :cond_49

    .line 305
    new-instance v1, Lcom/wutka/dtd/DTDParseException;

    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v2}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Expected "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p1, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " instead of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, v0, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    iget-object v4, v4, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v4

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v1

    .line 311
    :cond_49
    new-instance v1, Lcom/wutka/dtd/DTDParseException;

    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v2}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Expected "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p1, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " instead of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, v0, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    iget-object v4, v4, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, v0, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v4

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v1

    .line 318
    :cond_96
    return-object v0
.end method

.method public parse()Lcom/wutka/dtd/DTD;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 103
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/wutka/dtd/DTDParser;->parse(Z)Lcom/wutka/dtd/DTD;

    move-result-object v0

    return-object v0
.end method

.method public parse(Z)Lcom/wutka/dtd/DTD;
    .registers 10
    .param p1, "guessRootElement"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 117
    :goto_1
    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->peek()Lcom/wutka/dtd/Token;

    move-result-object v4

    .line 119
    .local v4, "token":Lcom/wutka/dtd/Token;
    iget-object v5, v4, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v6, Lcom/wutka/dtd/Scanner;->EOF:Lcom/wutka/dtd/TokenType;

    if-ne v5, v6, :cond_2e

    .line 124
    if-eqz p1, :cond_87

    .line 126
    new-instance v3, Ljava/util/Hashtable;

    invoke-direct {v3}, Ljava/util/Hashtable;-><init>()V

    .line 128
    .local v3, "roots":Ljava/util/Hashtable;
    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v5, v5, Lcom/wutka/dtd/DTD;->elements:Ljava/util/Hashtable;

    invoke-virtual {v5}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 130
    .local v0, "e":Ljava/util/Enumeration;
    :goto_1c
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_32

    .line 132
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/wutka/dtd/DTDElement;

    .line 133
    .local v1, "element":Lcom/wutka/dtd/DTDElement;
    iget-object v5, v1, Lcom/wutka/dtd/DTDElement;->name:Ljava/lang/String;

    invoke-virtual {v3, v5, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1c

    .line 121
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v1    # "element":Lcom/wutka/dtd/DTDElement;
    .end local v3    # "roots":Ljava/util/Hashtable;
    :cond_2e
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDParser;->parseTopLevelElement()V

    goto :goto_1

    .line 136
    .restart local v0    # "e":Ljava/util/Enumeration;
    .restart local v3    # "roots":Ljava/util/Hashtable;
    :cond_32
    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v5, v5, Lcom/wutka/dtd/DTD;->elements:Ljava/util/Hashtable;

    invoke-virtual {v5}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 137
    :cond_3a
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_6a

    .line 139
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/wutka/dtd/DTDElement;

    .line 140
    .restart local v1    # "element":Lcom/wutka/dtd/DTDElement;
    iget-object v5, v1, Lcom/wutka/dtd/DTDElement;->content:Lcom/wutka/dtd/DTDItem;

    instance-of v5, v5, Lcom/wutka/dtd/DTDContainer;

    if-eqz v5, :cond_3a

    .line 142
    iget-object v5, v1, Lcom/wutka/dtd/DTDElement;->content:Lcom/wutka/dtd/DTDItem;

    check-cast v5, Lcom/wutka/dtd/DTDContainer;

    invoke-virtual {v5}, Lcom/wutka/dtd/DTDContainer;->getItemsVec()Ljava/util/Vector;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v2

    .line 145
    .local v2, "items":Ljava/util/Enumeration;
    :goto_58
    invoke-interface {v2}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_3a

    .line 147
    iget-object v6, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    invoke-interface {v2}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/wutka/dtd/DTDItem;

    invoke-virtual {p0, v3, v6, v5}, Lcom/wutka/dtd/DTDParser;->removeElements(Ljava/util/Hashtable;Lcom/wutka/dtd/DTD;Lcom/wutka/dtd/DTDItem;)V

    goto :goto_58

    .line 151
    .end local v1    # "element":Lcom/wutka/dtd/DTDElement;
    .end local v2    # "items":Ljava/util/Enumeration;
    :cond_6a
    invoke-virtual {v3}, Ljava/util/Hashtable;->size()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_82

    .line 153
    invoke-virtual {v3}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 154
    iget-object v6, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/wutka/dtd/DTDElement;

    iput-object v5, v6, Lcom/wutka/dtd/DTD;->rootElement:Lcom/wutka/dtd/DTDElement;

    .line 166
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v3    # "roots":Ljava/util/Hashtable;
    :goto_7f
    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    return-object v5

    .line 158
    .restart local v0    # "e":Ljava/util/Enumeration;
    .restart local v3    # "roots":Ljava/util/Hashtable;
    :cond_82
    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iput-object v7, v5, Lcom/wutka/dtd/DTD;->rootElement:Lcom/wutka/dtd/DTDElement;

    goto :goto_7f

    .line 163
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v3    # "roots":Ljava/util/Hashtable;
    :cond_87
    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iput-object v7, v5, Lcom/wutka/dtd/DTD;->rootElement:Lcom/wutka/dtd/DTDElement;

    goto :goto_7f
.end method

.method protected parseAttdef(Lcom/wutka/dtd/Scanner;Lcom/wutka/dtd/DTDElement;Lcom/wutka/dtd/DTDAttlist;)V
    .registers 11
    .param p1, "scanner"    # Lcom/wutka/dtd/Scanner;
    .param p2, "element"    # Lcom/wutka/dtd/DTDElement;
    .param p3, "attlist"    # Lcom/wutka/dtd/DTDAttlist;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 632
    sget-object v2, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v2}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    move-result-object v1

    .line 634
    .local v1, "token":Lcom/wutka/dtd/Token;
    new-instance v0, Lcom/wutka/dtd/DTDAttribute;

    iget-object v2, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-direct {v0, v2}, Lcom/wutka/dtd/DTDAttribute;-><init>(Ljava/lang/String;)V

    .line 636
    .local v0, "attr":Lcom/wutka/dtd/DTDAttribute;
    iget-object v2, p3, Lcom/wutka/dtd/DTDAttlist;->attributes:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 638
    iget-object v2, p2, Lcom/wutka/dtd/DTDElement;->attributes:Ljava/util/Hashtable;

    iget-object v3, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 640
    invoke-virtual {p1}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v1

    .line 642
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    if-ne v2, v3, :cond_5c

    .line 644
    iget-object v2, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v3, "NOTATION"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_57

    .line 646
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDParser;->parseNotationList()Lcom/wutka/dtd/DTDNotationList;

    move-result-object v2

    iput-object v2, v0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    .line 658
    :cond_33
    :goto_33
    invoke-virtual {p1}, Lcom/wutka/dtd/Scanner;->peek()Lcom/wutka/dtd/Token;

    move-result-object v1

    .line 660
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    if-ne v2, v3, :cond_ae

    .line 662
    invoke-virtual {p1}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    .line 663
    iget-object v2, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v3, "#FIXED"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_69

    .line 665
    sget-object v2, Lcom/wutka/dtd/DTDDecl;->FIXED:Lcom/wutka/dtd/DTDDecl;

    iput-object v2, v0, Lcom/wutka/dtd/DTDAttribute;->decl:Lcom/wutka/dtd/DTDDecl;

    .line 667
    invoke-virtual {p1}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v1

    .line 668
    iget-object v2, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    iput-object v2, v0, Lcom/wutka/dtd/DTDAttribute;->defaultValue:Ljava/lang/String;

    .line 691
    :cond_56
    :goto_56
    return-void

    .line 650
    :cond_57
    iget-object v2, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    iput-object v2, v0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    goto :goto_33

    .line 653
    :cond_5c
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->LPAREN:Lcom/wutka/dtd/TokenType;

    if-ne v2, v3, :cond_33

    .line 655
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDParser;->parseEnumeration()Lcom/wutka/dtd/DTDEnumeration;

    move-result-object v2

    iput-object v2, v0, Lcom/wutka/dtd/DTDAttribute;->type:Ljava/lang/Object;

    goto :goto_33

    .line 670
    :cond_69
    iget-object v2, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v3, "#REQUIRED"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_78

    .line 672
    sget-object v2, Lcom/wutka/dtd/DTDDecl;->REQUIRED:Lcom/wutka/dtd/DTDDecl;

    iput-object v2, v0, Lcom/wutka/dtd/DTDAttribute;->decl:Lcom/wutka/dtd/DTDDecl;

    goto :goto_56

    .line 674
    :cond_78
    iget-object v2, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v3, "#IMPLIED"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_87

    .line 676
    sget-object v2, Lcom/wutka/dtd/DTDDecl;->IMPLIED:Lcom/wutka/dtd/DTDDecl;

    iput-object v2, v0, Lcom/wutka/dtd/DTDAttribute;->decl:Lcom/wutka/dtd/DTDDecl;

    goto :goto_56

    .line 680
    :cond_87
    new-instance v2, Lcom/wutka/dtd/DTDParseException;

    invoke-virtual {p1}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Invalid token in attribute declaration: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v5

    invoke-virtual {p1}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v2

    .line 685
    :cond_ae
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->STRING:Lcom/wutka/dtd/TokenType;

    if-ne v2, v3, :cond_56

    .line 687
    invoke-virtual {p1}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    .line 688
    sget-object v2, Lcom/wutka/dtd/DTDDecl;->VALUE:Lcom/wutka/dtd/DTDDecl;

    iput-object v2, v0, Lcom/wutka/dtd/DTDAttribute;->decl:Lcom/wutka/dtd/DTDDecl;

    .line 689
    iget-object v2, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    iput-object v2, v0, Lcom/wutka/dtd/DTDAttribute;->defaultValue:Ljava/lang/String;

    goto :goto_56
.end method

.method protected parseAttlist()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 599
    sget-object v3, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v3}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 601
    .local v2, "token":Lcom/wutka/dtd/Token;
    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v3, v3, Lcom/wutka/dtd/DTD;->elements:Ljava/util/Hashtable;

    iget-object v4, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/wutka/dtd/DTDElement;

    .line 603
    .local v1, "element":Lcom/wutka/dtd/DTDElement;
    new-instance v0, Lcom/wutka/dtd/DTDAttlist;

    iget-object v3, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-direct {v0, v3}, Lcom/wutka/dtd/DTDAttlist;-><init>(Ljava/lang/String;)V

    .line 605
    .local v0, "attlist":Lcom/wutka/dtd/DTDAttlist;
    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v3, v3, Lcom/wutka/dtd/DTD;->items:Ljava/util/Vector;

    invoke-virtual {v3, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 607
    if-nez v1, :cond_32

    .line 609
    new-instance v1, Lcom/wutka/dtd/DTDElement;

    .end local v1    # "element":Lcom/wutka/dtd/DTDElement;
    iget-object v3, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-direct {v1, v3}, Lcom/wutka/dtd/DTDElement;-><init>(Ljava/lang/String;)V

    .line 610
    .restart local v1    # "element":Lcom/wutka/dtd/DTDElement;
    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v3, v3, Lcom/wutka/dtd/DTD;->elements:Ljava/util/Hashtable;

    iget-object v4, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-virtual {v3, v4, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 613
    :cond_32
    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->peek()Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 615
    :goto_38
    iget-object v3, v2, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v4, Lcom/wutka/dtd/Scanner;->GT:Lcom/wutka/dtd/TokenType;

    if-eq v3, v4, :cond_4a

    .line 617
    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {p0, v3, v1, v0}, Lcom/wutka/dtd/DTDParser;->parseAttdef(Lcom/wutka/dtd/Scanner;Lcom/wutka/dtd/DTDElement;Lcom/wutka/dtd/DTDAttlist;)V

    .line 618
    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->peek()Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 619
    goto :goto_38

    .line 625
    :cond_4a
    sget-object v3, Lcom/wutka/dtd/Scanner;->GT:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v3}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    .line 626
    return-void
.end method

.method protected parseCP()Lcom/wutka/dtd/DTDItem;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 545
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v2}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v1

    .line 547
    .local v1, "token":Lcom/wutka/dtd/Token;
    const/4 v0, 0x0

    .line 549
    .local v0, "item":Lcom/wutka/dtd/DTDItem;
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    if-ne v2, v3, :cond_1b

    .line 551
    new-instance v0, Lcom/wutka/dtd/DTDName;

    .end local v0    # "item":Lcom/wutka/dtd/DTDItem;
    iget-object v2, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-direct {v0, v2}, Lcom/wutka/dtd/DTDName;-><init>(Ljava/lang/String;)V

    .line 565
    .restart local v0    # "item":Lcom/wutka/dtd/DTDItem;
    :goto_14
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDParser;->parseCardinality()Lcom/wutka/dtd/DTDCardinal;

    move-result-object v2

    iput-object v2, v0, Lcom/wutka/dtd/DTDItem;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    .line 567
    return-object v0

    .line 553
    :cond_1b
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->LPAREN:Lcom/wutka/dtd/TokenType;

    if-ne v2, v3, :cond_26

    .line 555
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDParser;->parseChoiceSequence()Lcom/wutka/dtd/DTDContainer;

    move-result-object v0

    .line 556
    goto :goto_14

    .line 559
    :cond_26
    new-instance v2, Lcom/wutka/dtd/DTDParseException;

    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Found invalid token in sequence: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    iget-object v5, v5, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v5

    iget-object v6, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v6}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v2
.end method

.method protected parseCardinality()Lcom/wutka/dtd/DTDCardinal;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 573
    iget-object v1, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v1}, Lcom/wutka/dtd/Scanner;->peek()Lcom/wutka/dtd/Token;

    move-result-object v0

    .line 575
    .local v0, "token":Lcom/wutka/dtd/Token;
    iget-object v1, v0, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v2, Lcom/wutka/dtd/Scanner;->QUES:Lcom/wutka/dtd/TokenType;

    if-ne v1, v2, :cond_14

    .line 577
    iget-object v1, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v1}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    .line 578
    sget-object v1, Lcom/wutka/dtd/DTDCardinal;->OPTIONAL:Lcom/wutka/dtd/DTDCardinal;

    .line 592
    :goto_13
    return-object v1

    .line 580
    :cond_14
    iget-object v1, v0, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v2, Lcom/wutka/dtd/Scanner;->ASTERISK:Lcom/wutka/dtd/TokenType;

    if-ne v1, v2, :cond_22

    .line 582
    iget-object v1, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v1}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    .line 583
    sget-object v1, Lcom/wutka/dtd/DTDCardinal;->ZEROMANY:Lcom/wutka/dtd/DTDCardinal;

    goto :goto_13

    .line 585
    :cond_22
    iget-object v1, v0, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v2, Lcom/wutka/dtd/Scanner;->PLUS:Lcom/wutka/dtd/TokenType;

    if-ne v1, v2, :cond_30

    .line 587
    iget-object v1, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v1}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    .line 588
    sget-object v1, Lcom/wutka/dtd/DTDCardinal;->ONEMANY:Lcom/wutka/dtd/DTDCardinal;

    goto :goto_13

    .line 592
    :cond_30
    sget-object v1, Lcom/wutka/dtd/DTDCardinal;->NONE:Lcom/wutka/dtd/DTDCardinal;

    goto :goto_13
.end method

.method protected parseChildren(Lcom/wutka/dtd/DTDElement;)V
    .registers 6
    .param p1, "element"    # Lcom/wutka/dtd/DTDElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 461
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDParser;->parseChoiceSequence()Lcom/wutka/dtd/DTDContainer;

    move-result-object v0

    .line 463
    .local v0, "choiceSeq":Lcom/wutka/dtd/DTDContainer;
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v2}, Lcom/wutka/dtd/Scanner;->peek()Lcom/wutka/dtd/Token;

    move-result-object v1

    .line 465
    .local v1, "token":Lcom/wutka/dtd/Token;
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDParser;->parseCardinality()Lcom/wutka/dtd/DTDCardinal;

    move-result-object v2

    iput-object v2, v0, Lcom/wutka/dtd/DTDContainer;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    .line 467
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->QUES:Lcom/wutka/dtd/TokenType;

    if-ne v2, v3, :cond_1d

    .line 469
    sget-object v2, Lcom/wutka/dtd/DTDCardinal;->OPTIONAL:Lcom/wutka/dtd/DTDCardinal;

    iput-object v2, v0, Lcom/wutka/dtd/DTDContainer;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    .line 484
    :goto_1a
    iput-object v0, p1, Lcom/wutka/dtd/DTDElement;->content:Lcom/wutka/dtd/DTDItem;

    .line 485
    return-void

    .line 471
    :cond_1d
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->ASTERISK:Lcom/wutka/dtd/TokenType;

    if-ne v2, v3, :cond_28

    .line 473
    sget-object v2, Lcom/wutka/dtd/DTDCardinal;->ZEROMANY:Lcom/wutka/dtd/DTDCardinal;

    iput-object v2, v0, Lcom/wutka/dtd/DTDContainer;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    goto :goto_1a

    .line 475
    :cond_28
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->PLUS:Lcom/wutka/dtd/TokenType;

    if-ne v2, v3, :cond_33

    .line 477
    sget-object v2, Lcom/wutka/dtd/DTDCardinal;->ONEMANY:Lcom/wutka/dtd/DTDCardinal;

    iput-object v2, v0, Lcom/wutka/dtd/DTDContainer;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    goto :goto_1a

    .line 481
    :cond_33
    sget-object v2, Lcom/wutka/dtd/DTDCardinal;->NONE:Lcom/wutka/dtd/DTDCardinal;

    iput-object v2, v0, Lcom/wutka/dtd/DTDContainer;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    goto :goto_1a
.end method

.method protected parseChoiceSequence()Lcom/wutka/dtd/DTDContainer;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 490
    const/4 v2, 0x0

    .line 492
    .local v2, "separator":Lcom/wutka/dtd/TokenType;
    const/4 v0, 0x0

    .line 496
    .local v0, "cs":Lcom/wutka/dtd/DTDContainer;
    :goto_2
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDParser;->parseCP()Lcom/wutka/dtd/DTDItem;

    move-result-object v1

    .line 498
    .local v1, "item":Lcom/wutka/dtd/DTDItem;
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v3

    .line 500
    .local v3, "token":Lcom/wutka/dtd/Token;
    iget-object v4, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v5, Lcom/wutka/dtd/Scanner;->PIPE:Lcom/wutka/dtd/TokenType;

    if-eq v4, v5, :cond_18

    iget-object v4, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v5, Lcom/wutka/dtd/Scanner;->COMMA:Lcom/wutka/dtd/TokenType;

    if-ne v4, v5, :cond_51

    .line 503
    :cond_18
    if-eqz v2, :cond_38

    iget-object v4, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    if-eq v2, v4, :cond_38

    .line 505
    new-instance v4, Lcom/wutka/dtd/DTDParseException;

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Can\'t mix separators in a choice/sequence"

    iget-object v7, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v7}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v7

    iget-object v8, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v8}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v4

    .line 509
    :cond_38
    iget-object v2, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    .line 511
    if-nez v0, :cond_47

    .line 513
    iget-object v4, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v5, Lcom/wutka/dtd/Scanner;->PIPE:Lcom/wutka/dtd/TokenType;

    if-ne v4, v5, :cond_4b

    .line 515
    new-instance v0, Lcom/wutka/dtd/DTDChoice;

    .end local v0    # "cs":Lcom/wutka/dtd/DTDContainer;
    invoke-direct {v0}, Lcom/wutka/dtd/DTDChoice;-><init>()V

    .line 522
    .restart local v0    # "cs":Lcom/wutka/dtd/DTDContainer;
    :cond_47
    :goto_47
    invoke-virtual {v0, v1}, Lcom/wutka/dtd/DTDContainer;->add(Lcom/wutka/dtd/DTDItem;)V

    goto :goto_2

    .line 519
    :cond_4b
    new-instance v0, Lcom/wutka/dtd/DTDSequence;

    .end local v0    # "cs":Lcom/wutka/dtd/DTDContainer;
    invoke-direct {v0}, Lcom/wutka/dtd/DTDSequence;-><init>()V

    .restart local v0    # "cs":Lcom/wutka/dtd/DTDContainer;
    goto :goto_47

    .line 524
    :cond_51
    iget-object v4, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v5, Lcom/wutka/dtd/Scanner;->RPAREN:Lcom/wutka/dtd/TokenType;

    if-ne v4, v5, :cond_62

    .line 526
    if-nez v0, :cond_5e

    .line 528
    new-instance v0, Lcom/wutka/dtd/DTDSequence;

    .end local v0    # "cs":Lcom/wutka/dtd/DTDContainer;
    invoke-direct {v0}, Lcom/wutka/dtd/DTDSequence;-><init>()V

    .line 530
    .restart local v0    # "cs":Lcom/wutka/dtd/DTDContainer;
    :cond_5e
    invoke-virtual {v0, v1}, Lcom/wutka/dtd/DTDContainer;->add(Lcom/wutka/dtd/DTDItem;)V

    .line 531
    return-object v0

    .line 535
    :cond_62
    new-instance v4, Lcom/wutka/dtd/DTDParseException;

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Found invalid token in sequence: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    iget-object v7, v7, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v7}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v7

    iget-object v8, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v8}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v4
.end method

.method protected parseContentSpec(Lcom/wutka/dtd/Scanner;Lcom/wutka/dtd/DTDElement;)V
    .registers 9
    .param p1, "scanner"    # Lcom/wutka/dtd/Scanner;
    .param p2, "element"    # Lcom/wutka/dtd/DTDElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 354
    invoke-virtual {p1}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v0

    .line 356
    .local v0, "token":Lcom/wutka/dtd/Token;
    iget-object v1, v0, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v2, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    if-ne v1, v2, :cond_55

    .line 358
    iget-object v1, v0, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v2, "EMPTY"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 360
    new-instance v1, Lcom/wutka/dtd/DTDEmpty;

    invoke-direct {v1}, Lcom/wutka/dtd/DTDEmpty;-><init>()V

    iput-object v1, p2, Lcom/wutka/dtd/DTDElement;->content:Lcom/wutka/dtd/DTDItem;

    .line 394
    :cond_1b
    :goto_1b
    return-void

    .line 362
    :cond_1c
    iget-object v1, v0, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v2, "ANY"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 364
    new-instance v1, Lcom/wutka/dtd/DTDAny;

    invoke-direct {v1}, Lcom/wutka/dtd/DTDAny;-><init>()V

    iput-object v1, p2, Lcom/wutka/dtd/DTDElement;->content:Lcom/wutka/dtd/DTDItem;

    goto :goto_1b

    .line 368
    :cond_2e
    new-instance v1, Lcom/wutka/dtd/DTDParseException;

    invoke-virtual {p1}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Invalid token in entity content spec "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, v0, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v4

    invoke-virtual {p1}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v1

    .line 374
    :cond_55
    iget-object v1, v0, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v2, Lcom/wutka/dtd/Scanner;->LPAREN:Lcom/wutka/dtd/TokenType;

    if-ne v1, v2, :cond_1b

    .line 376
    invoke-virtual {p1}, Lcom/wutka/dtd/Scanner;->peek()Lcom/wutka/dtd/Token;

    move-result-object v0

    .line 378
    iget-object v1, v0, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v2, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    if-ne v1, v2, :cond_77

    .line 380
    iget-object v1, v0, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v2, "#PCDATA"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_73

    .line 382
    invoke-virtual {p0, p2}, Lcom/wutka/dtd/DTDParser;->parseMixed(Lcom/wutka/dtd/DTDElement;)V

    goto :goto_1b

    .line 386
    :cond_73
    invoke-virtual {p0, p2}, Lcom/wutka/dtd/DTDParser;->parseChildren(Lcom/wutka/dtd/DTDElement;)V

    goto :goto_1b

    .line 389
    :cond_77
    iget-object v1, v0, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v2, Lcom/wutka/dtd/Scanner;->LPAREN:Lcom/wutka/dtd/TokenType;

    if-ne v1, v2, :cond_1b

    .line 391
    invoke-virtual {p0, p2}, Lcom/wutka/dtd/DTDParser;->parseChildren(Lcom/wutka/dtd/DTDElement;)V

    goto :goto_1b
.end method

.method protected parseElement()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 324
    sget-object v2, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v2}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    move-result-object v1

    .line 326
    .local v1, "name":Lcom/wutka/dtd/Token;
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v2, v2, Lcom/wutka/dtd/DTD;->elements:Ljava/util/Hashtable;

    iget-object v3, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wutka/dtd/DTDElement;

    .line 328
    .local v0, "element":Lcom/wutka/dtd/DTDElement;
    if-nez v0, :cond_36

    .line 330
    new-instance v0, Lcom/wutka/dtd/DTDElement;

    .end local v0    # "element":Lcom/wutka/dtd/DTDElement;
    iget-object v2, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-direct {v0, v2}, Lcom/wutka/dtd/DTDElement;-><init>(Ljava/lang/String;)V

    .line 331
    .restart local v0    # "element":Lcom/wutka/dtd/DTDElement;
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v2, v2, Lcom/wutka/dtd/DTD;->elements:Ljava/util/Hashtable;

    iget-object v3, v0, Lcom/wutka/dtd/DTDElement;->name:Ljava/lang/String;

    invoke-virtual {v2, v3, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    :cond_24
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v2, v2, Lcom/wutka/dtd/DTD;->items:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 346
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {p0, v2, v0}, Lcom/wutka/dtd/DTDParser;->parseContentSpec(Lcom/wutka/dtd/Scanner;Lcom/wutka/dtd/DTDElement;)V

    .line 348
    sget-object v2, Lcom/wutka/dtd/Scanner;->GT:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v2}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    .line 349
    return-void

    .line 333
    :cond_36
    iget-object v2, v0, Lcom/wutka/dtd/DTDElement;->content:Lcom/wutka/dtd/DTDItem;

    if-eqz v2, :cond_24

    .line 340
    new-instance v2, Lcom/wutka/dtd/DTDParseException;

    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Found second definition of element: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v5

    iget-object v6, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v6}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v2
.end method

.method protected parseEntity()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 780
    const/4 v1, 0x0

    .line 782
    .local v1, "isParsed":Z
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 784
    .local v2, "name":Lcom/wutka/dtd/Token;
    iget-object v4, v2, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v5, Lcom/wutka/dtd/Scanner;->PERCENT:Lcom/wutka/dtd/TokenType;

    if-ne v4, v5, :cond_55

    .line 786
    const/4 v1, 0x1

    .line 787
    sget-object v4, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v4}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 796
    :cond_14
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v4, v4, Lcom/wutka/dtd/DTD;->entities:Ljava/util/Hashtable;

    iget-object v5, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/wutka/dtd/DTDEntity;

    .line 798
    .local v0, "entity":Lcom/wutka/dtd/DTDEntity;
    const/4 v3, 0x0

    .line 800
    .local v3, "skip":Z
    if-nez v0, :cond_75

    .line 802
    new-instance v0, Lcom/wutka/dtd/DTDEntity;

    .end local v0    # "entity":Lcom/wutka/dtd/DTDEntity;
    iget-object v4, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->defaultLocation:Ljava/lang/Object;

    invoke-direct {v0, v4, v5}, Lcom/wutka/dtd/DTDEntity;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 803
    .restart local v0    # "entity":Lcom/wutka/dtd/DTDEntity;
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v4, v4, Lcom/wutka/dtd/DTD;->entities:Ljava/util/Hashtable;

    iget-object v5, v0, Lcom/wutka/dtd/DTDEntity;->name:Ljava/lang/String;

    invoke-virtual {v4, v5, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 814
    :goto_35
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v4, v4, Lcom/wutka/dtd/DTD;->items:Ljava/util/Vector;

    invoke-virtual {v4, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 816
    iput-boolean v1, v0, Lcom/wutka/dtd/DTDEntity;->isParsed:Z

    .line 818
    invoke-virtual {p0, v0}, Lcom/wutka/dtd/DTDParser;->parseEntityDef(Lcom/wutka/dtd/DTDEntity;)V

    .line 820
    iget-boolean v4, v0, Lcom/wutka/dtd/DTDEntity;->isParsed:Z

    if-eqz v4, :cond_54

    iget-object v4, v0, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    if-eqz v4, :cond_54

    if-nez v3, :cond_54

    .line 822
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    iget-object v5, v0, Lcom/wutka/dtd/DTDEntity;->name:Ljava/lang/String;

    iget-object v6, v0, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lcom/wutka/dtd/Scanner;->addEntity(Ljava/lang/String;Ljava/lang/String;)V

    .line 824
    :cond_54
    return-void

    .line 789
    .end local v0    # "entity":Lcom/wutka/dtd/DTDEntity;
    .end local v3    # "skip":Z
    :cond_55
    iget-object v4, v2, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v5, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    if-eq v4, v5, :cond_14

    .line 791
    new-instance v4, Lcom/wutka/dtd/DTDParseException;

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Invalid entity declaration"

    iget-object v7, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v7}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v7

    iget-object v8, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v8}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v4

    .line 810
    .restart local v0    # "entity":Lcom/wutka/dtd/DTDEntity;
    .restart local v3    # "skip":Z
    :cond_75
    new-instance v0, Lcom/wutka/dtd/DTDEntity;

    .end local v0    # "entity":Lcom/wutka/dtd/DTDEntity;
    iget-object v4, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->defaultLocation:Ljava/lang/Object;

    invoke-direct {v0, v4, v5}, Lcom/wutka/dtd/DTDEntity;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 811
    .restart local v0    # "entity":Lcom/wutka/dtd/DTDEntity;
    const/4 v3, 0x1

    goto :goto_35
.end method

.method protected parseEntityDef(Lcom/wutka/dtd/DTDEntity;)V
    .registers 10
    .param p1, "entity"    # Lcom/wutka/dtd/DTDEntity;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 829
    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 831
    .local v2, "token":Lcom/wutka/dtd/Token;
    iget-object v3, v2, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v4, Lcom/wutka/dtd/Scanner;->STRING:Lcom/wutka/dtd/TokenType;

    if-ne v3, v4, :cond_1a

    .line 836
    iget-object v3, p1, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    if-nez v3, :cond_14

    .line 838
    iget-object v3, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    iput-object v3, p1, Lcom/wutka/dtd/DTDEntity;->value:Ljava/lang/String;

    .line 916
    :cond_14
    :goto_14
    sget-object v3, Lcom/wutka/dtd/Scanner;->GT:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v3}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    .line 917
    return-void

    .line 841
    :cond_1a
    iget-object v3, v2, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v4, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    if-ne v3, v4, :cond_c1

    .line 843
    iget-object v3, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v4, "SYSTEM"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6f

    .line 845
    new-instance v1, Lcom/wutka/dtd/DTDSystem;

    invoke-direct {v1}, Lcom/wutka/dtd/DTDSystem;-><init>()V

    .line 846
    .local v1, "sys":Lcom/wutka/dtd/DTDSystem;
    sget-object v3, Lcom/wutka/dtd/Scanner;->STRING:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v3}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 848
    iget-object v3, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    iput-object v3, v1, Lcom/wutka/dtd/DTDSystem;->system:Ljava/lang/String;

    .line 849
    iput-object v1, p1, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    .line 888
    .end local v1    # "sys":Lcom/wutka/dtd/DTDSystem;
    :goto_3b
    iget-boolean v3, p1, Lcom/wutka/dtd/DTDEntity;->isParsed:Z

    if-nez v3, :cond_14

    .line 890
    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->peek()Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 891
    iget-object v3, v2, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v4, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    if-ne v3, v4, :cond_14

    .line 893
    iget-object v3, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v4, "NDATA"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_af

    .line 895
    new-instance v3, Lcom/wutka/dtd/DTDParseException;

    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Invalid NData declaration"

    iget-object v6, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v6}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v6

    iget-object v7, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v7}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v3

    .line 851
    :cond_6f
    iget-object v3, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v4, "PUBLIC"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_95

    .line 853
    new-instance v0, Lcom/wutka/dtd/DTDPublic;

    invoke-direct {v0}, Lcom/wutka/dtd/DTDPublic;-><init>()V

    .line 855
    .local v0, "pub":Lcom/wutka/dtd/DTDPublic;
    sget-object v3, Lcom/wutka/dtd/Scanner;->STRING:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v3}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 856
    iget-object v3, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    iput-object v3, v0, Lcom/wutka/dtd/DTDPublic;->pub:Ljava/lang/String;

    .line 857
    sget-object v3, Lcom/wutka/dtd/Scanner;->STRING:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v3}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 858
    iget-object v3, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    iput-object v3, v0, Lcom/wutka/dtd/DTDPublic;->system:Ljava/lang/String;

    .line 859
    iput-object v0, p1, Lcom/wutka/dtd/DTDEntity;->externalID:Lcom/wutka/dtd/DTDExternalID;

    goto :goto_3b

    .line 863
    .end local v0    # "pub":Lcom/wutka/dtd/DTDPublic;
    :cond_95
    new-instance v3, Lcom/wutka/dtd/DTDParseException;

    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Invalid External ID specification"

    iget-object v6, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v6}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v6

    iget-object v7, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v7}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v3

    .line 901
    :cond_af
    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 903
    sget-object v3, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v3}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 905
    iget-object v3, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    iput-object v3, p1, Lcom/wutka/dtd/DTDEntity;->ndata:Ljava/lang/String;

    goto/16 :goto_14

    .line 911
    :cond_c1
    new-instance v3, Lcom/wutka/dtd/DTDParseException;

    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Invalid entity definition"

    iget-object v6, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v6}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v6

    iget-object v7, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v7}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v3
.end method

.method protected parseEnumeration()Lcom/wutka/dtd/DTDEnumeration;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 742
    new-instance v0, Lcom/wutka/dtd/DTDEnumeration;

    invoke-direct {v0}, Lcom/wutka/dtd/DTDEnumeration;-><init>()V

    .line 746
    .local v0, "enumeration":Lcom/wutka/dtd/DTDEnumeration;
    :goto_5
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v2}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v1

    .line 748
    .local v1, "token":Lcom/wutka/dtd/Token;
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    if-eq v2, v3, :cond_46

    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->NMTOKEN:Lcom/wutka/dtd/TokenType;

    if-eq v2, v3, :cond_46

    .line 751
    new-instance v2, Lcom/wutka/dtd/DTDParseException;

    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Invalid token in enumeration: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    iget-object v5, v5, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v5

    iget-object v6, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v6}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v2

    .line 757
    :cond_46
    iget-object v2, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/wutka/dtd/DTDEnumeration;->add(Ljava/lang/String;)V

    .line 759
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v2}, Lcom/wutka/dtd/Scanner;->peek()Lcom/wutka/dtd/Token;

    move-result-object v1

    .line 761
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->RPAREN:Lcom/wutka/dtd/TokenType;

    if-ne v2, v3, :cond_5d

    .line 763
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v2}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    .line 764
    return-object v0

    .line 766
    :cond_5d
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->PIPE:Lcom/wutka/dtd/TokenType;

    if-eq v2, v3, :cond_92

    .line 768
    new-instance v2, Lcom/wutka/dtd/DTDParseException;

    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Invalid token in enumeration: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    iget-object v5, v5, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v5

    iget-object v6, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v6}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v2

    .line 773
    :cond_92
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v2}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    goto/16 :goto_5
.end method

.method protected parseMixed(Lcom/wutka/dtd/DTDElement;)V
    .registers 10
    .param p1, "element"    # Lcom/wutka/dtd/DTDElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 403
    const/4 v0, 0x1

    .line 405
    .local v0, "isPcdataOnly":Z
    new-instance v1, Lcom/wutka/dtd/DTDMixed;

    invoke-direct {v1}, Lcom/wutka/dtd/DTDMixed;-><init>()V

    .line 407
    .local v1, "mixed":Lcom/wutka/dtd/DTDMixed;
    new-instance v3, Lcom/wutka/dtd/DTDPCData;

    invoke-direct {v3}, Lcom/wutka/dtd/DTDPCData;-><init>()V

    invoke-virtual {v1, v3}, Lcom/wutka/dtd/DTDMixed;->add(Lcom/wutka/dtd/DTDItem;)V

    .line 409
    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    .line 411
    iput-object v1, p1, Lcom/wutka/dtd/DTDElement;->content:Lcom/wutka/dtd/DTDItem;

    .line 415
    :goto_15
    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 417
    .local v2, "token":Lcom/wutka/dtd/Token;
    iget-object v3, v2, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v4, Lcom/wutka/dtd/Scanner;->RPAREN:Lcom/wutka/dtd/TokenType;

    if-ne v3, v4, :cond_6d

    .line 419
    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->peek()Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 421
    iget-object v3, v2, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v4, Lcom/wutka/dtd/Scanner;->ASTERISK:Lcom/wutka/dtd/TokenType;

    if-ne v3, v4, :cond_37

    .line 423
    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    .line 424
    sget-object v3, Lcom/wutka/dtd/DTDCardinal;->ZEROMANY:Lcom/wutka/dtd/DTDCardinal;

    iput-object v3, v1, Lcom/wutka/dtd/DTDMixed;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    .line 438
    :goto_36
    return-void

    .line 428
    :cond_37
    if-nez v0, :cond_68

    .line 430
    new-instance v3, Lcom/wutka/dtd/DTDParseException;

    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Invalid token in Mixed content type, \'*\' required after (#PCDATA|xx ...): "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, v2, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    iget-object v6, v6, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v6}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v6

    iget-object v7, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v7}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v3

    .line 435
    :cond_68
    sget-object v3, Lcom/wutka/dtd/DTDCardinal;->NONE:Lcom/wutka/dtd/DTDCardinal;

    iput-object v3, v1, Lcom/wutka/dtd/DTDMixed;->cardinal:Lcom/wutka/dtd/DTDCardinal;

    goto :goto_36

    .line 440
    :cond_6d
    iget-object v3, v2, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v4, Lcom/wutka/dtd/Scanner;->PIPE:Lcom/wutka/dtd/TokenType;

    if-ne v3, v4, :cond_85

    .line 442
    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v2

    .line 444
    new-instance v3, Lcom/wutka/dtd/DTDName;

    iget-object v4, v2, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-direct {v3, v4}, Lcom/wutka/dtd/DTDName;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Lcom/wutka/dtd/DTDMixed;->add(Lcom/wutka/dtd/DTDItem;)V

    .line 447
    const/4 v0, 0x0

    .line 448
    goto :goto_15

    .line 451
    :cond_85
    new-instance v3, Lcom/wutka/dtd/DTDParseException;

    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "Invalid token in Mixed content type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, v2, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    iget-object v6, v6, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v6}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v6

    iget-object v7, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v7}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v7

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v3
.end method

.method protected parseNotation()V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 922
    new-instance v0, Lcom/wutka/dtd/DTDNotation;

    invoke-direct {v0}, Lcom/wutka/dtd/DTDNotation;-><init>()V

    .line 924
    .local v0, "notation":Lcom/wutka/dtd/DTDNotation;
    sget-object v4, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v4}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    move-result-object v3

    .line 926
    .local v3, "token":Lcom/wutka/dtd/Token;
    iget-object v4, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    iput-object v4, v0, Lcom/wutka/dtd/DTDNotation;->name:Ljava/lang/String;

    .line 928
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v4, v4, Lcom/wutka/dtd/DTD;->notations:Ljava/util/Hashtable;

    iget-object v5, v0, Lcom/wutka/dtd/DTDNotation;->name:Ljava/lang/String;

    invoke-virtual {v4, v5, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 929
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v4, v4, Lcom/wutka/dtd/DTD;->items:Ljava/util/Vector;

    invoke-virtual {v4, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 931
    sget-object v4, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v4}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    move-result-object v3

    .line 933
    iget-object v4, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v5, "SYSTEM"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_46

    .line 935
    new-instance v2, Lcom/wutka/dtd/DTDSystem;

    invoke-direct {v2}, Lcom/wutka/dtd/DTDSystem;-><init>()V

    .line 936
    .local v2, "sys":Lcom/wutka/dtd/DTDSystem;
    sget-object v4, Lcom/wutka/dtd/Scanner;->STRING:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v4}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    move-result-object v3

    .line 938
    iget-object v4, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    iput-object v4, v2, Lcom/wutka/dtd/DTDSystem;->system:Ljava/lang/String;

    .line 939
    iput-object v2, v0, Lcom/wutka/dtd/DTDNotation;->externalID:Lcom/wutka/dtd/DTDExternalID;

    .line 960
    .end local v2    # "sys":Lcom/wutka/dtd/DTDSystem;
    :cond_40
    :goto_40
    sget-object v4, Lcom/wutka/dtd/Scanner;->GT:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v4}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    .line 961
    return-void

    .line 941
    :cond_46
    iget-object v4, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v5, "PUBLIC"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_40

    .line 943
    new-instance v1, Lcom/wutka/dtd/DTDPublic;

    invoke-direct {v1}, Lcom/wutka/dtd/DTDPublic;-><init>()V

    .line 944
    .local v1, "pub":Lcom/wutka/dtd/DTDPublic;
    sget-object v4, Lcom/wutka/dtd/Scanner;->STRING:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v4}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    move-result-object v3

    .line 946
    iget-object v4, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    iput-object v4, v1, Lcom/wutka/dtd/DTDPublic;->pub:Ljava/lang/String;

    .line 947
    const/4 v4, 0x0

    iput-object v4, v1, Lcom/wutka/dtd/DTDPublic;->system:Ljava/lang/String;

    .line 951
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->peek()Lcom/wutka/dtd/Token;

    move-result-object v3

    .line 952
    iget-object v4, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v5, Lcom/wutka/dtd/Scanner;->STRING:Lcom/wutka/dtd/TokenType;

    if-ne v4, v5, :cond_78

    .line 954
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v3

    .line 955
    iget-object v4, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    iput-object v4, v1, Lcom/wutka/dtd/DTDPublic;->system:Ljava/lang/String;

    .line 958
    :cond_78
    iput-object v1, v0, Lcom/wutka/dtd/DTDNotation;->externalID:Lcom/wutka/dtd/DTDExternalID;

    goto :goto_40
.end method

.method protected parseNotationList()Lcom/wutka/dtd/DTDNotationList;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 696
    new-instance v0, Lcom/wutka/dtd/DTDNotationList;

    invoke-direct {v0}, Lcom/wutka/dtd/DTDNotationList;-><init>()V

    .line 698
    .local v0, "notation":Lcom/wutka/dtd/DTDNotationList;
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v2}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v1

    .line 699
    .local v1, "token":Lcom/wutka/dtd/Token;
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->LPAREN:Lcom/wutka/dtd/TokenType;

    if-eq v2, v3, :cond_45

    .line 701
    new-instance v2, Lcom/wutka/dtd/DTDParseException;

    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Invalid token in notation: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    iget-object v5, v5, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v5

    iget-object v6, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v6}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v2

    .line 735
    :cond_40
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v2}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    .line 709
    :cond_45
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v2}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v1

    .line 711
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    if-eq v2, v3, :cond_80

    .line 713
    new-instance v2, Lcom/wutka/dtd/DTDParseException;

    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Invalid token in notation: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    iget-object v5, v5, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v5

    iget-object v6, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v6}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v2

    .line 719
    :cond_80
    iget-object v2, v1, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/wutka/dtd/DTDNotationList;->add(Ljava/lang/String;)V

    .line 721
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v2}, Lcom/wutka/dtd/Scanner;->peek()Lcom/wutka/dtd/Token;

    move-result-object v1

    .line 723
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->RPAREN:Lcom/wutka/dtd/TokenType;

    if-ne v2, v3, :cond_97

    .line 725
    iget-object v2, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v2}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    .line 726
    return-object v0

    .line 728
    :cond_97
    iget-object v2, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v3, Lcom/wutka/dtd/Scanner;->PIPE:Lcom/wutka/dtd/TokenType;

    if-eq v2, v3, :cond_40

    .line 730
    new-instance v2, Lcom/wutka/dtd/DTDParseException;

    iget-object v3, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v3}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "Invalid token in notation: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, v1, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    iget-object v5, v5, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v5

    iget-object v6, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v6}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v2
.end method

.method protected parseTopLevelElement()V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v6, 0x3f

    .line 189
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v3

    .line 192
    .local v3, "token":Lcom/wutka/dtd/Token;
    iget-object v4, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v5, Lcom/wutka/dtd/Scanner;->LTQUES:Lcom/wutka/dtd/TokenType;

    if-ne v4, v5, :cond_42

    .line 194
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 198
    .local v2, "textBuffer":Ljava/lang/StringBuffer;
    :goto_13
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4, v6}, Lcom/wutka/dtd/Scanner;->getUntil(C)Ljava/lang/String;

    move-result-object v1

    .line 199
    .local v1, "text":Ljava/lang/String;
    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 201
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->peek()Lcom/wutka/dtd/Token;

    move-result-object v3

    .line 202
    iget-object v4, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v5, Lcom/wutka/dtd/Scanner;->GT:Lcom/wutka/dtd/TokenType;

    if-ne v4, v5, :cond_3e

    .line 204
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    .line 209
    new-instance v0, Lcom/wutka/dtd/DTDProcessingInstruction;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/wutka/dtd/DTDProcessingInstruction;-><init>(Ljava/lang/String;)V

    .line 212
    .local v0, "instruct":Lcom/wutka/dtd/DTDProcessingInstruction;
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v4, v4, Lcom/wutka/dtd/DTD;->items:Ljava/util/Vector;

    invoke-virtual {v4, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 283
    .end local v0    # "instruct":Lcom/wutka/dtd/DTDProcessingInstruction;
    .end local v1    # "text":Ljava/lang/String;
    .end local v2    # "textBuffer":Ljava/lang/StringBuffer;
    :cond_3d
    :goto_3d
    return-void

    .line 207
    .restart local v1    # "text":Ljava/lang/String;
    .restart local v2    # "textBuffer":Ljava/lang/StringBuffer;
    :cond_3e
    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_13

    .line 216
    .end local v1    # "text":Ljava/lang/String;
    .end local v2    # "textBuffer":Ljava/lang/StringBuffer;
    :cond_42
    iget-object v4, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v5, Lcom/wutka/dtd/Scanner;->CONDITIONAL:Lcom/wutka/dtd/TokenType;

    if-ne v4, v5, :cond_9d

    .line 218
    sget-object v4, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v4}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    move-result-object v3

    .line 220
    iget-object v4, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v5, "IGNORE"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5e

    .line 222
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v4}, Lcom/wutka/dtd/Scanner;->skipConditional()V

    goto :goto_3d

    .line 226
    :cond_5e
    iget-object v4, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v5, "INCLUDE"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_70

    .line 228
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    const/16 v5, 0x5b

    invoke-virtual {v4, v5}, Lcom/wutka/dtd/Scanner;->skipUntil(C)V

    goto :goto_3d

    .line 232
    :cond_70
    new-instance v4, Lcom/wutka/dtd/DTDParseException;

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Invalid token in conditional: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v7}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v7

    iget-object v8, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v8}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v4

    .line 238
    :cond_9d
    iget-object v4, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v5, Lcom/wutka/dtd/Scanner;->ENDCONDITIONAL:Lcom/wutka/dtd/TokenType;

    if-eq v4, v5, :cond_3d

    .line 242
    iget-object v4, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v5, Lcom/wutka/dtd/Scanner;->COMMENT:Lcom/wutka/dtd/TokenType;

    if-ne v4, v5, :cond_b8

    .line 244
    iget-object v4, p0, Lcom/wutka/dtd/DTDParser;->dtd:Lcom/wutka/dtd/DTD;

    iget-object v4, v4, Lcom/wutka/dtd/DTD;->items:Ljava/util/Vector;

    new-instance v5, Lcom/wutka/dtd/DTDComment;

    iget-object v6, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-direct {v5, v6}, Lcom/wutka/dtd/DTDComment;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_3d

    .line 247
    :cond_b8
    iget-object v4, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    sget-object v5, Lcom/wutka/dtd/Scanner;->LTBANG:Lcom/wutka/dtd/TokenType;

    if-ne v4, v5, :cond_107

    .line 250
    sget-object v4, Lcom/wutka/dtd/Scanner;->IDENTIFIER:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v4}, Lcom/wutka/dtd/DTDParser;->expect(Lcom/wutka/dtd/TokenType;)Lcom/wutka/dtd/Token;

    move-result-object v3

    .line 252
    iget-object v4, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v5, "ELEMENT"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d3

    .line 254
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDParser;->parseElement()V

    goto/16 :goto_3d

    .line 256
    :cond_d3
    iget-object v4, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v5, "ATTLIST"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e2

    .line 258
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDParser;->parseAttlist()V

    goto/16 :goto_3d

    .line 260
    :cond_e2
    iget-object v4, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v5, "ENTITY"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f1

    .line 262
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDParser;->parseEntity()V

    goto/16 :goto_3d

    .line 264
    :cond_f1
    iget-object v4, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    const-string v5, "NOTATION"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_100

    .line 266
    invoke-virtual {p0}, Lcom/wutka/dtd/DTDParser;->parseNotation()V

    goto/16 :goto_3d

    .line 270
    :cond_100
    sget-object v4, Lcom/wutka/dtd/Scanner;->GT:Lcom/wutka/dtd/TokenType;

    invoke-virtual {p0, v4}, Lcom/wutka/dtd/DTDParser;->skipUntil(Lcom/wutka/dtd/TokenType;)V

    goto/16 :goto_3d

    .line 278
    :cond_107
    new-instance v4, Lcom/wutka/dtd/DTDParseException;

    iget-object v5, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v5}, Lcom/wutka/dtd/Scanner;->getUriId()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "Unexpected token: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, v3, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    iget-object v7, v7, Lcom/wutka/dtd/TokenType;->name:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, v3, Lcom/wutka/dtd/Token;->value:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v7}, Lcom/wutka/dtd/Scanner;->getLineNumber()I

    move-result v7

    iget-object v8, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v8}, Lcom/wutka/dtd/Scanner;->getColumn()I

    move-result v8

    invoke-direct {v4, v5, v6, v7, v8}, Lcom/wutka/dtd/DTDParseException;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    throw v4
.end method

.method protected removeElements(Ljava/util/Hashtable;Lcom/wutka/dtd/DTD;Lcom/wutka/dtd/DTDItem;)V
    .registers 6
    .param p1, "h"    # Ljava/util/Hashtable;
    .param p2, "dtd"    # Lcom/wutka/dtd/DTD;
    .param p3, "item"    # Lcom/wutka/dtd/DTDItem;

    .prologue
    .line 171
    instance-of v1, p3, Lcom/wutka/dtd/DTDName;

    if-eqz v1, :cond_c

    .line 173
    check-cast p3, Lcom/wutka/dtd/DTDName;

    .end local p3    # "item":Lcom/wutka/dtd/DTDItem;
    iget-object v1, p3, Lcom/wutka/dtd/DTDName;->value:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/util/Hashtable;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    :cond_b
    return-void

    .line 175
    .restart local p3    # "item":Lcom/wutka/dtd/DTDItem;
    :cond_c
    instance-of v1, p3, Lcom/wutka/dtd/DTDContainer;

    if-eqz v1, :cond_b

    .line 177
    check-cast p3, Lcom/wutka/dtd/DTDContainer;

    .end local p3    # "item":Lcom/wutka/dtd/DTDItem;
    invoke-virtual {p3}, Lcom/wutka/dtd/DTDContainer;->getItemsVec()Ljava/util/Vector;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 179
    .local v0, "e":Ljava/util/Enumeration;
    :goto_1a
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 181
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/wutka/dtd/DTDItem;

    invoke-virtual {p0, p1, p2, v1}, Lcom/wutka/dtd/DTDParser;->removeElements(Ljava/util/Hashtable;Lcom/wutka/dtd/DTD;Lcom/wutka/dtd/DTDItem;)V

    goto :goto_1a
.end method

.method protected skipUntil(Lcom/wutka/dtd/TokenType;)V
    .registers 4
    .param p1, "stopToken"    # Lcom/wutka/dtd/TokenType;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 288
    iget-object v1, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v1}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v0

    .line 290
    .local v0, "token":Lcom/wutka/dtd/Token;
    :goto_6
    iget-object v1, v0, Lcom/wutka/dtd/Token;->type:Lcom/wutka/dtd/TokenType;

    if-eq v1, p1, :cond_11

    .line 292
    iget-object v1, p0, Lcom/wutka/dtd/DTDParser;->scanner:Lcom/wutka/dtd/Scanner;

    invoke-virtual {v1}, Lcom/wutka/dtd/Scanner;->get()Lcom/wutka/dtd/Token;

    move-result-object v0

    .line 293
    goto :goto_6

    .line 294
    :cond_11
    return-void
.end method
