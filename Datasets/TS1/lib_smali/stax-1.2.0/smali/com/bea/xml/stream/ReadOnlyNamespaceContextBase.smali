.class public Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;
.super Ljava/lang/Object;
.source "ReadOnlyNamespaceContextBase.java"

# interfaces
.implements Ljavax/xml/namespace/NamespaceContext;


# instance fields
.field private prefixes:[Ljava/lang/String;

.field private uris:[Ljava/lang/String;


# direct methods
.method public constructor <init>([Ljava/lang/String;[Ljava/lang/String;I)V
    .registers 7
    .param p1, "prefixArray"    # [Ljava/lang/String;
    .param p2, "uriArray"    # [Ljava/lang/String;
    .param p3, "size"    # I

    .prologue
    const/4 v2, 0x0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-array v0, p3, [Ljava/lang/String;

    iput-object v0, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->prefixes:[Ljava/lang/String;

    .line 40
    new-array v0, p3, [Ljava/lang/String;

    iput-object v0, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    .line 41
    iget-object v0, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->prefixes:[Ljava/lang/String;

    iget-object v1, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->prefixes:[Ljava/lang/String;

    array-length v1, v1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    iget-object v0, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    iget-object v1, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    array-length v1, v1

    invoke-static {p2, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 43
    return-void
.end method

.method private checkNull(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 117
    if-nez p1, :cond_4

    const-string p1, ""

    .line 118
    .end local p1    # "s":Ljava/lang/String;
    :cond_4
    return-object p1
.end method

.method public static main([Ljava/lang/String;)V
    .registers 6
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 167
    new-instance v1, Lcom/bea/xml/stream/MXParser;

    invoke-direct {v1}, Lcom/bea/xml/stream/MXParser;-><init>()V

    .line 168
    .local v1, "p":Lcom/bea/xml/stream/MXParser;
    new-instance v2, Ljava/io/FileReader;

    const/4 v3, 0x0

    aget-object v3, p0, v3

    invoke-direct {v2, v3}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/bea/xml/stream/MXParser;->setInput(Ljava/io/Reader;)V

    .line 169
    :goto_10
    invoke-virtual {v1}, Lcom/bea/xml/stream/MXParser;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6f

    .line 170
    invoke-virtual {v1}, Lcom/bea/xml/stream/MXParser;->isStartElement()Z

    move-result v2

    if-eqz v2, :cond_6b

    .line 171
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "context["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v1}, Lcom/bea/xml/stream/MXParser;->getNamespaceContext()Ljavax/xml/namespace/NamespaceContext;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, "]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 172
    invoke-virtual {v1}, Lcom/bea/xml/stream/MXParser;->getNamespaceContext()Ljavax/xml/namespace/NamespaceContext;

    move-result-object v2

    const-string v3, "a"

    invoke-interface {v2, v3}, Ljavax/xml/namespace/NamespaceContext;->getPrefixes(Ljava/lang/String;)Ljava/util/Iterator;

    move-result-object v0

    .line 173
    .local v0, "i":Ljava/util/Iterator;
    :goto_48
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6b

    .line 174
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "Found prefix:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_48

    .line 176
    .end local v0    # "i":Ljava/util/Iterator;
    :cond_6b
    invoke-virtual {v1}, Lcom/bea/xml/stream/MXParser;->next()I

    goto :goto_10

    .line 178
    :cond_6f
    return-void
.end method


# virtual methods
.method public getDefaultNameSpace()Ljava/lang/String;
    .registers 3

    .prologue
    .line 108
    iget-object v1, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    array-length v1, v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_5
    if-ltz v0, :cond_15

    .line 109
    iget-object v1, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->prefixes:[Ljava/lang/String;

    aget-object v1, v1, v0

    if-nez v1, :cond_12

    .line 110
    iget-object v1, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    aget-object v1, v1, v0

    .line 113
    :goto_11
    return-object v1

    .line 108
    :cond_12
    add-int/lit8 v0, v0, -0x1

    goto :goto_5

    .line 113
    :cond_15
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public getNamespaceURI(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 46
    if-nez p1, :cond_a

    .line 47
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Prefix may not be null."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 48
    :cond_a
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3f

    .line 49
    iget-object v1, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    array-length v1, v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_15
    if-ltz v0, :cond_29

    .line 50
    iget-object v1, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->prefixes:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_26

    .line 51
    iget-object v1, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    aget-object v1, v1, v0

    .line 66
    :goto_25
    return-object v1

    .line 49
    :cond_26
    add-int/lit8 v0, v0, -0x1

    goto :goto_15

    .line 54
    :cond_29
    const-string v1, "xml"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_34

    .line 55
    const-string v1, "http://www.w3.org/XML/1998/namespace"

    goto :goto_25

    .line 56
    :cond_34
    const-string v1, "xmlns"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_54

    .line 57
    const-string v1, "http://www.w3.org/2000/xmlns/"

    goto :goto_25

    .line 60
    .end local v0    # "i":I
    :cond_3f
    iget-object v1, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    array-length v1, v1

    add-int/lit8 v0, v1, -0x1

    .restart local v0    # "i":I
    :goto_44
    if-ltz v0, :cond_54

    .line 61
    iget-object v1, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->prefixes:[Ljava/lang/String;

    aget-object v1, v1, v0

    if-nez v1, :cond_51

    .line 62
    iget-object v1, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    aget-object v1, v1, v0

    goto :goto_25

    .line 60
    :cond_51
    add-int/lit8 v0, v0, -0x1

    goto :goto_44

    .line 66
    :cond_54
    const/4 v1, 0x0

    goto :goto_25
.end method

.method public getPrefix(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 69
    if-nez p1, :cond_a

    .line 70
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "uri may not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 71
    :cond_a
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_18

    .line 72
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "uri may not be empty string"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 75
    :cond_18
    iget-object v3, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    array-length v3, v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_1d
    if-ltz v0, :cond_59

    .line 76
    iget-object v3, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3c

    .line 80
    iget-object v3, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->prefixes:[Ljava/lang/String;

    aget-object v2, v3, v0

    .line 81
    .local v2, "prefix":Ljava/lang/String;
    if-nez v2, :cond_45

    .line 82
    iget-object v3, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    array-length v3, v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "j":I
    :goto_34
    if-le v1, v0, :cond_42

    .line 83
    iget-object v3, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->prefixes:[Ljava/lang/String;

    aget-object v3, v3, v1

    if-nez v3, :cond_3f

    .line 75
    .end local v1    # "j":I
    .end local v2    # "prefix":Ljava/lang/String;
    :cond_3c
    add-int/lit8 v0, v0, -0x1

    goto :goto_1d

    .line 82
    .restart local v1    # "j":I
    .restart local v2    # "prefix":Ljava/lang/String;
    :cond_3f
    add-int/lit8 v1, v1, -0x1

    goto :goto_34

    .line 87
    :cond_42
    const-string v2, ""

    .line 104
    .end local v1    # "j":I
    .end local v2    # "prefix":Ljava/lang/String;
    :cond_44
    :goto_44
    return-object v2

    .line 90
    .restart local v2    # "prefix":Ljava/lang/String;
    :cond_45
    iget-object v3, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    array-length v3, v3

    add-int/lit8 v1, v3, -0x1

    .restart local v1    # "j":I
    :goto_4a
    if-le v1, v0, :cond_44

    .line 91
    iget-object v3, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->prefixes:[Ljava/lang/String;

    aget-object v3, v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3c

    .line 90
    add-int/lit8 v1, v1, -0x1

    goto :goto_4a

    .line 98
    .end local v1    # "j":I
    .end local v2    # "prefix":Ljava/lang/String;
    :cond_59
    const-string v3, "http://www.w3.org/XML/1998/namespace"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_64

    .line 99
    const-string v2, "xml"

    goto :goto_44

    .line 101
    :cond_64
    const-string v3, "http://www.w3.org/2000/xmlns/"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6f

    .line 102
    const-string v2, "xmlns"

    goto :goto_44

    .line 104
    :cond_6f
    const/4 v2, 0x0

    goto :goto_44
.end method

.method public getPrefixes(Ljava/lang/String;)Ljava/util/Iterator;
    .registers 8
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 122
    if-nez p1, :cond_a

    .line 123
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "uri may not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 124
    :cond_a
    const-string v4, ""

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 125
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "uri may not be empty string"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 126
    :cond_1a
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 129
    .local v3, "s":Ljava/util/HashSet;
    iget-object v4, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    array-length v4, v4

    add-int/lit8 v0, v4, -0x1

    .local v0, "i":I
    :goto_24
    if-ltz v0, :cond_6f

    .line 130
    iget-object v4, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->prefixes:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-direct {p0, v4}, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->checkNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 131
    .local v2, "prefix":Ljava/lang/String;
    iget-object v4, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3e

    invoke-virtual {v3, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_41

    .line 129
    :cond_3e
    :goto_3e
    add-int/lit8 v0, v0, -0x1

    goto :goto_24

    .line 138
    :cond_41
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_57

    .line 139
    iget-object v4, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    array-length v4, v4

    add-int/lit8 v1, v4, -0x1

    .local v1, "j":I
    :goto_4c
    if-le v1, v0, :cond_6b

    .line 140
    iget-object v4, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->prefixes:[Ljava/lang/String;

    aget-object v4, v4, v1

    if-eqz v4, :cond_3e

    .line 139
    add-int/lit8 v1, v1, -0x1

    goto :goto_4c

    .line 146
    .end local v1    # "j":I
    :cond_57
    iget-object v4, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    array-length v4, v4

    add-int/lit8 v1, v4, -0x1

    .restart local v1    # "j":I
    :goto_5c
    if-le v1, v0, :cond_6b

    .line 147
    iget-object v4, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->prefixes:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3e

    .line 146
    add-int/lit8 v1, v1, -0x1

    goto :goto_5c

    .line 153
    :cond_6b
    invoke-virtual {v3, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_3e

    .line 155
    .end local v1    # "j":I
    .end local v2    # "prefix":Ljava/lang/String;
    :cond_6f
    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    return-object v4
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 159
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 160
    .local v0, "b":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    iget-object v2, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_40

    .line 161
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->prefixes:[Ljava/lang/String;

    aget-object v3, v3, v1

    invoke-direct {p0, v3}, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->checkNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "<->"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lcom/bea/xml/stream/ReadOnlyNamespaceContextBase;->uris:[Ljava/lang/String;

    aget-object v3, v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 160
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 163
    :cond_40
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
