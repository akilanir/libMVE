.class public Lorg/apache/commons/io/filefilter/NameFileFilter;
.super Lorg/apache/commons/io/filefilter/AbstractFileFilter;
.source "NameFileFilter.java"


# instance fields
.field private caseSensitivity:Lorg/apache/commons/io/IOCase;

.field private names:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 60
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/io/filefilter/NameFileFilter;-><init>(Ljava/lang/String;Lorg/apache/commons/io/IOCase;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/apache/commons/io/IOCase;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "caseSensitivity"    # Lorg/apache/commons/io/IOCase;

    .prologue
    .line 70
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 71
    if-nez p1, :cond_d

    .line 72
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The wildcard must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_d
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iput-object v0, p0, Lorg/apache/commons/io/filefilter/NameFileFilter;->names:[Ljava/lang/String;

    .line 75
    if-nez p2, :cond_19

    sget-object p2, Lorg/apache/commons/io/IOCase;->SENSITIVE:Lorg/apache/commons/io/IOCase;

    .end local p2    # "caseSensitivity":Lorg/apache/commons/io/IOCase;
    :cond_19
    iput-object p2, p0, Lorg/apache/commons/io/filefilter/NameFileFilter;->caseSensitivity:Lorg/apache/commons/io/IOCase;

    .line 76
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 3
    .param p1, "names"    # Ljava/util/List;

    .prologue
    .line 117
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/io/filefilter/NameFileFilter;-><init>(Ljava/util/List;Lorg/apache/commons/io/IOCase;)V

    .line 118
    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lorg/apache/commons/io/IOCase;)V
    .registers 5
    .param p1, "names"    # Ljava/util/List;
    .param p2, "caseSensitivity"    # Lorg/apache/commons/io/IOCase;

    .prologue
    .line 128
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 129
    if-nez p1, :cond_d

    .line 130
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The list of names must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 132
    :cond_d
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    check-cast v0, [Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/commons/io/filefilter/NameFileFilter;->names:[Ljava/lang/String;

    .line 133
    if-nez p2, :cond_21

    sget-object p2, Lorg/apache/commons/io/IOCase;->SENSITIVE:Lorg/apache/commons/io/IOCase;

    .end local p2    # "caseSensitivity":Lorg/apache/commons/io/IOCase;
    :cond_21
    iput-object p2, p0, Lorg/apache/commons/io/filefilter/NameFileFilter;->caseSensitivity:Lorg/apache/commons/io/IOCase;

    .line 134
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 3
    .param p1, "names"    # [Ljava/lang/String;

    .prologue
    .line 88
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/commons/io/filefilter/NameFileFilter;-><init>([Ljava/lang/String;Lorg/apache/commons/io/IOCase;)V

    .line 89
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;Lorg/apache/commons/io/IOCase;)V
    .registers 5
    .param p1, "names"    # [Ljava/lang/String;
    .param p2, "caseSensitivity"    # Lorg/apache/commons/io/IOCase;

    .prologue
    .line 101
    invoke-direct {p0}, Lorg/apache/commons/io/filefilter/AbstractFileFilter;-><init>()V

    .line 102
    if-nez p1, :cond_d

    .line 103
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The array of names must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 105
    :cond_d
    iput-object p1, p0, Lorg/apache/commons/io/filefilter/NameFileFilter;->names:[Ljava/lang/String;

    .line 106
    if-nez p2, :cond_13

    sget-object p2, Lorg/apache/commons/io/IOCase;->SENSITIVE:Lorg/apache/commons/io/IOCase;

    .end local p2    # "caseSensitivity":Lorg/apache/commons/io/IOCase;
    :cond_13
    iput-object p2, p0, Lorg/apache/commons/io/filefilter/NameFileFilter;->caseSensitivity:Lorg/apache/commons/io/IOCase;

    .line 107
    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .registers 6
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 144
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 145
    .local v1, "name":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    iget-object v2, p0, Lorg/apache/commons/io/filefilter/NameFileFilter;->names:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_1b

    .line 146
    iget-object v2, p0, Lorg/apache/commons/io/filefilter/NameFileFilter;->caseSensitivity:Lorg/apache/commons/io/IOCase;

    iget-object v3, p0, Lorg/apache/commons/io/filefilter/NameFileFilter;->names:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-virtual {v2, v1, v3}, Lorg/apache/commons/io/IOCase;->checkEquals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_18

    .line 147
    const/4 v2, 0x1

    .line 150
    :goto_17
    return v2

    .line 145
    :cond_18
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 150
    :cond_1b
    const/4 v2, 0x0

    goto :goto_17
.end method

.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .registers 6
    .param p1, "file"    # Ljava/io/File;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 161
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lorg/apache/commons/io/filefilter/NameFileFilter;->names:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_17

    .line 162
    iget-object v1, p0, Lorg/apache/commons/io/filefilter/NameFileFilter;->caseSensitivity:Lorg/apache/commons/io/IOCase;

    iget-object v2, p0, Lorg/apache/commons/io/filefilter/NameFileFilter;->names:[Ljava/lang/String;

    aget-object v2, v2, v0

    invoke-virtual {v1, p2, v2}, Lorg/apache/commons/io/IOCase;->checkEquals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 163
    const/4 v1, 0x1

    .line 166
    :goto_13
    return v1

    .line 161
    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 166
    :cond_17
    const/4 v1, 0x0

    goto :goto_13
.end method
