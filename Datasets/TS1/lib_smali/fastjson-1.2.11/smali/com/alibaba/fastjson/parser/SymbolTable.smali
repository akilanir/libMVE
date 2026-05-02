.class public Lcom/alibaba/fastjson/parser/SymbolTable;
.super Ljava/lang/Object;
.source "SymbolTable.java"


# instance fields
.field private final indexMask:I

.field private final symbols:[Ljava/lang/String;


# direct methods
.method public constructor <init>(I)V
    .registers 6
    .param p1, "tableSize"    # I

    .prologue
    const/4 v3, 0x0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    add-int/lit8 v0, p1, -0x1

    iput v0, p0, Lcom/alibaba/fastjson/parser/SymbolTable;->indexMask:I

    .line 30
    new-array v0, p1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/alibaba/fastjson/parser/SymbolTable;->symbols:[Ljava/lang/String;

    .line 32
    const-string v0, "$ref"

    const/4 v1, 0x4

    const-string v2, "$ref"

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    invoke-virtual {p0, v0, v3, v1, v2}, Lcom/alibaba/fastjson/parser/SymbolTable;->addSymbol(Ljava/lang/String;III)Ljava/lang/String;

    .line 33
    sget-object v0, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    const/4 v1, 0x5

    sget-object v2, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    invoke-virtual {p0, v0, v3, v1, v2}, Lcom/alibaba/fastjson/parser/SymbolTable;->addSymbol(Ljava/lang/String;III)Ljava/lang/String;

    .line 34
    return-void
.end method

.method public static hash([CII)I
    .registers 9
    .param p0, "buffer"    # [C
    .param p1, "offset"    # I
    .param p2, "len"    # I

    .prologue
    .line 110
    const/4 v0, 0x0

    .line 111
    .local v0, "h":I
    move v2, p1

    .line 113
    .local v2, "off":I
    const/4 v1, 0x0

    .local v1, "i":I
    move v3, v2

    .end local v2    # "off":I
    .local v3, "off":I
    :goto_4
    if-ge v1, p2, :cond_12

    .line 114
    mul-int/lit8 v4, v0, 0x1f

    add-int/lit8 v2, v3, 0x1

    .end local v3    # "off":I
    .restart local v2    # "off":I
    aget-char v5, p0, v3

    add-int v0, v4, v5

    .line 113
    add-int/lit8 v1, v1, 0x1

    move v3, v2

    .end local v2    # "off":I
    .restart local v3    # "off":I
    goto :goto_4

    .line 116
    :cond_12
    return v0
.end method

.method private static subString(Ljava/lang/String;II)Ljava/lang/String;
    .registers 6
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "offset"    # I
    .param p2, "len"    # I

    .prologue
    .line 104
    new-array v0, p2, [C

    .line 105
    .local v0, "chars":[C
    add-int v1, p1, p2

    const/4 v2, 0x0

    invoke-virtual {p0, p1, v1, v0, v2}, Ljava/lang/String;->getChars(II[CI)V

    .line 106
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    return-object v1
.end method


# virtual methods
.method public addSymbol(Ljava/lang/String;III)Ljava/lang/String;
    .registers 8
    .param p1, "buffer"    # Ljava/lang/String;
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .param p4, "hash"    # I

    .prologue
    .line 82
    iget v2, p0, Lcom/alibaba/fastjson/parser/SymbolTable;->indexMask:I

    and-int v0, p4, v2

    .line 84
    .local v0, "bucket":I
    iget-object v2, p0, Lcom/alibaba/fastjson/parser/SymbolTable;->symbols:[Ljava/lang/String;

    aget-object v1, v2, v0

    .line 85
    .local v1, "symbol":Ljava/lang/String;
    if-eqz v1, :cond_23

    .line 86
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    if-ne p4, v2, :cond_1e

    .line 87
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-ne p3, v2, :cond_1e

    .line 88
    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_1e

    move-object v2, v1

    .line 100
    :goto_1d
    return-object v2

    .line 92
    :cond_1e
    invoke-static {p1, p2, p3}, Lcom/alibaba/fastjson/parser/SymbolTable;->subString(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v2

    goto :goto_1d

    .line 95
    :cond_23
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ne p3, v2, :cond_34

    move-object v1, p1

    .line 98
    :goto_2a
    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    .line 99
    iget-object v2, p0, Lcom/alibaba/fastjson/parser/SymbolTable;->symbols:[Ljava/lang/String;

    aput-object v1, v2, v0

    move-object v2, v1

    .line 100
    goto :goto_1d

    .line 97
    :cond_34
    invoke-static {p1, p2, p3}, Lcom/alibaba/fastjson/parser/SymbolTable;->subString(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    goto :goto_2a
.end method

.method public addSymbol([CII)Ljava/lang/String;
    .registers 6
    .param p1, "buffer"    # [C
    .param p2, "offset"    # I
    .param p3, "len"    # I

    .prologue
    .line 38
    invoke-static {p1, p2, p3}, Lcom/alibaba/fastjson/parser/SymbolTable;->hash([CII)I

    move-result v0

    .line 39
    .local v0, "hash":I
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/alibaba/fastjson/parser/SymbolTable;->addSymbol([CIII)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public addSymbol([CIII)Ljava/lang/String;
    .registers 11
    .param p1, "buffer"    # [C
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .param p4, "hash"    # I

    .prologue
    .line 52
    iget v4, p0, Lcom/alibaba/fastjson/parser/SymbolTable;->indexMask:I

    and-int v0, p4, v4

    .line 54
    .local v0, "bucket":I
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/SymbolTable;->symbols:[Ljava/lang/String;

    aget-object v3, v4, v0

    .line 55
    .local v3, "symbol":Ljava/lang/String;
    if-eqz v3, :cond_34

    .line 56
    const/4 v1, 0x1

    .line 57
    .local v1, "eq":Z
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v4

    if-ne p4, v4, :cond_2c

    .line 58
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-ne p3, v4, :cond_2c

    .line 59
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_18
    if-ge v2, p3, :cond_25

    .line 60
    add-int v4, p2, v2

    aget-char v4, p1, v4

    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-eq v4, v5, :cond_29

    .line 61
    const/4 v1, 0x0

    .line 69
    .end local v2    # "i":I
    :cond_25
    :goto_25
    if-eqz v1, :cond_2e

    move-object v4, v3

    .line 78
    .end local v1    # "eq":Z
    :goto_28
    return-object v4

    .line 59
    .restart local v1    # "eq":Z
    .restart local v2    # "i":I
    :cond_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_18

    .line 66
    .end local v2    # "i":I
    :cond_2c
    const/4 v1, 0x0

    goto :goto_25

    .line 72
    :cond_2e
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    goto :goto_28

    .line 76
    .end local v1    # "eq":Z
    :cond_34
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v4}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v3

    .line 77
    iget-object v4, p0, Lcom/alibaba/fastjson/parser/SymbolTable;->symbols:[Ljava/lang/String;

    aput-object v3, v4, v0

    move-object v4, v3

    .line 78
    goto :goto_28
.end method
