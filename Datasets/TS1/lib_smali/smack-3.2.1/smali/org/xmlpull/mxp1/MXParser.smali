.class public Lorg/xmlpull/mxp1/MXParser;
.super Ljava/lang/Object;
.source "MXParser.java"

# interfaces
.implements Lorg/xmlpull/v1/XmlPullParser;


# static fields
.field protected static final FEATURE_NAMES_INTERNED:Ljava/lang/String; = "http://xmlpull.org/v1/doc/features.html#names-interned"

.field protected static final FEATURE_XML_ROUNDTRIP:Ljava/lang/String; = "http://xmlpull.org/v1/doc/features.html#xml-roundtrip"

.field protected static final LOOKUP_MAX:I = 0x400

.field protected static final LOOKUP_MAX_CHAR:C = '\u0400'

.field protected static final NCODING:[C

.field protected static final NO:[C

.field protected static final PROPERTY_LOCATION:Ljava/lang/String; = "http://xmlpull.org/v1/doc/properties.html#location"

.field protected static final PROPERTY_XMLDECL_CONTENT:Ljava/lang/String; = "http://xmlpull.org/v1/doc/properties.html#xmldecl-content"

.field protected static final PROPERTY_XMLDECL_STANDALONE:Ljava/lang/String; = "http://xmlpull.org/v1/doc/properties.html#xmldecl-standalone"

.field protected static final PROPERTY_XMLDECL_VERSION:Ljava/lang/String; = "http://xmlpull.org/v1/doc/properties.html#xmldecl-version"

.field protected static final READ_CHUNK_SIZE:I = 0x2000

.field protected static final TANDALONE:[C

.field private static final TRACE_SIZING:Z = false

.field protected static final VERSION:[C

.field protected static final XMLNS_URI:Ljava/lang/String; = "http://www.w3.org/2000/xmlns/"

.field protected static final XML_URI:Ljava/lang/String; = "http://www.w3.org/XML/1998/namespace"

.field protected static final YES:[C

.field protected static lookupNameChar:[Z

.field protected static lookupNameStartChar:[Z


# instance fields
.field protected allStringsInterned:Z

.field protected attributeCount:I

.field protected attributeName:[Ljava/lang/String;

.field protected attributeNameHash:[I

.field protected attributePrefix:[Ljava/lang/String;

.field protected attributeUri:[Ljava/lang/String;

.field protected attributeValue:[Ljava/lang/String;

.field protected buf:[C

.field protected bufAbsoluteStart:I

.field protected bufEnd:I

.field protected bufLoadFactor:I

.field protected bufSoftLimit:I

.field protected bufStart:I

.field protected charRefOneCharBuf:[C

.field protected columnNumber:I

.field protected depth:I

.field protected elName:[Ljava/lang/String;

.field protected elNamespaceCount:[I

.field protected elPrefix:[Ljava/lang/String;

.field protected elRawName:[[C

.field protected elRawNameEnd:[I

.field protected elRawNameLine:[I

.field protected elUri:[Ljava/lang/String;

.field protected emptyElementTag:Z

.field protected entityEnd:I

.field protected entityName:[Ljava/lang/String;

.field protected entityNameBuf:[[C

.field protected entityNameHash:[I

.field protected entityRefName:Ljava/lang/String;

.field protected entityReplacement:[Ljava/lang/String;

.field protected entityReplacementBuf:[[C

.field protected eventType:I

.field protected inputEncoding:Ljava/lang/String;

.field protected inputStream:Ljava/io/InputStream;

.field protected lineNumber:I

.field protected location:Ljava/lang/String;

.field protected namespaceEnd:I

.field protected namespacePrefix:[Ljava/lang/String;

.field protected namespacePrefixHash:[I

.field protected namespaceUri:[Ljava/lang/String;

.field protected pastEndTag:Z

.field protected pc:[C

.field protected pcEnd:I

.field protected pcStart:I

.field protected pos:I

.field protected posEnd:I

.field protected posStart:I

.field protected preventBufferCompaction:Z

.field protected processNamespaces:Z

.field protected reachedEnd:Z

.field protected reader:Ljava/io/Reader;

.field protected roundtripSupported:Z

.field protected seenAmpersand:Z

.field protected seenDocdecl:Z

.field protected seenEndTag:Z

.field protected seenMarkup:Z

.field protected seenRoot:Z

.field protected seenStartTag:Z

.field protected text:Ljava/lang/String;

.field protected tokenize:Z

.field protected usePC:Z

.field protected xmlDeclContent:Ljava/lang/String;

.field protected xmlDeclStandalone:Ljava/lang/Boolean;

.field protected xmlDeclVersion:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/16 v2, 0x400

    .line 2540
    const-string v1, "version"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/xmlpull/mxp1/MXParser;->VERSION:[C

    .line 2541
    const-string v1, "ncoding"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/xmlpull/mxp1/MXParser;->NCODING:[C

    .line 2542
    const-string v1, "tandalone"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/xmlpull/mxp1/MXParser;->TANDALONE:[C

    .line 2543
    const-string v1, "yes"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/xmlpull/mxp1/MXParser;->YES:[C

    .line 2544
    const-string v1, "no"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lorg/xmlpull/mxp1/MXParser;->NO:[C

    .line 3129
    new-array v1, v2, [Z

    sput-object v1, Lorg/xmlpull/mxp1/MXParser;->lookupNameStartChar:[Z

    .line 3130
    new-array v1, v2, [Z

    sput-object v1, Lorg/xmlpull/mxp1/MXParser;->lookupNameChar:[Z

    .line 3140
    const/16 v1, 0x3a

    invoke-static {v1}, Lorg/xmlpull/mxp1/MXParser;->setNameStart(C)V

    .line 3141
    const/16 v0, 0x41

    .local v0, "ch":C
    :goto_39
    const/16 v1, 0x5a

    if-gt v0, v1, :cond_44

    invoke-static {v0}, Lorg/xmlpull/mxp1/MXParser;->setNameStart(C)V

    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_39

    .line 3142
    :cond_44
    const/16 v1, 0x5f

    invoke-static {v1}, Lorg/xmlpull/mxp1/MXParser;->setNameStart(C)V

    .line 3143
    const/16 v0, 0x61

    :goto_4b
    const/16 v1, 0x7a

    if-gt v0, v1, :cond_56

    invoke-static {v0}, Lorg/xmlpull/mxp1/MXParser;->setNameStart(C)V

    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_4b

    .line 3144
    :cond_56
    const/16 v0, 0xc0

    :goto_58
    const/16 v1, 0x2ff

    if-gt v0, v1, :cond_63

    invoke-static {v0}, Lorg/xmlpull/mxp1/MXParser;->setNameStart(C)V

    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_58

    .line 3145
    :cond_63
    const/16 v0, 0x370

    :goto_65
    const/16 v1, 0x37d

    if-gt v0, v1, :cond_70

    invoke-static {v0}, Lorg/xmlpull/mxp1/MXParser;->setNameStart(C)V

    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_65

    .line 3146
    :cond_70
    const/16 v0, 0x37f

    :goto_72
    if-ge v0, v2, :cond_7b

    invoke-static {v0}, Lorg/xmlpull/mxp1/MXParser;->setNameStart(C)V

    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_72

    .line 3148
    :cond_7b
    const/16 v1, 0x2d

    invoke-static {v1}, Lorg/xmlpull/mxp1/MXParser;->setName(C)V

    .line 3149
    const/16 v1, 0x2e

    invoke-static {v1}, Lorg/xmlpull/mxp1/MXParser;->setName(C)V

    .line 3150
    const/16 v0, 0x30

    :goto_87
    const/16 v1, 0x39

    if-gt v0, v1, :cond_92

    invoke-static {v0}, Lorg/xmlpull/mxp1/MXParser;->setName(C)V

    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_87

    .line 3151
    :cond_92
    const/16 v1, 0xb7

    invoke-static {v1}, Lorg/xmlpull/mxp1/MXParser;->setName(C)V

    .line 3152
    const/16 v0, 0x300

    :goto_99
    const/16 v1, 0x36f

    if-gt v0, v1, :cond_a4

    invoke-static {v0}, Lorg/xmlpull/mxp1/MXParser;->setName(C)V

    add-int/lit8 v1, v0, 0x1

    int-to-char v0, v1

    goto :goto_99

    .line 3153
    :cond_a4
    return-void
.end method

.method public constructor <init>()V
    .registers 7

    .prologue
    const-wide/32 v4, 0xf4240

    const/16 v1, 0x2000

    .line 424
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 337
    const/16 v0, 0x5f

    iput v0, p0, Lorg/xmlpull/mxp1/MXParser;->bufLoadFactor:I

    .line 340
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v2

    cmp-long v0, v2, v4

    if-lez v0, :cond_3d

    move v0, v1

    :goto_19
    new-array v0, v0, [C

    iput-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    .line 342
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->bufLoadFactor:I

    iget-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    array-length v2, v2

    mul-int/2addr v0, v2

    div-int/lit8 v0, v0, 0x64

    iput v0, p0, Lorg/xmlpull/mxp1/MXParser;->bufSoftLimit:I

    .line 352
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->freeMemory()J

    move-result-wide v2

    cmp-long v0, v2, v4

    if-lez v0, :cond_40

    :goto_33
    new-array v0, v1, [C

    iput-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    .line 2153
    const/4 v0, 0x1

    new-array v0, v0, [C

    iput-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->charRefOneCharBuf:[C

    .line 425
    return-void

    .line 340
    :cond_3d
    const/16 v0, 0x100

    goto :goto_19

    .line 352
    :cond_40
    const/16 v1, 0x40

    goto :goto_33
.end method

.method protected static final fastHash([CII)I
    .registers 6
    .param p0, "ch"    # [C
    .param p1, "off"    # I
    .param p2, "len"    # I

    .prologue
    .line 271
    if-nez p2, :cond_4

    const/4 v0, 0x0

    .line 285
    :cond_3
    :goto_3
    return v0

    .line 273
    :cond_4
    aget-char v0, p0, p1

    .line 275
    .local v0, "hash":I
    shl-int/lit8 v1, v0, 0x7

    add-int v2, p1, p2

    add-int/lit8 v2, v2, -0x1

    aget-char v2, p0, v2

    add-int v0, v1, v2

    .line 280
    const/16 v1, 0x10

    if-le p2, v1, :cond_1d

    shl-int/lit8 v1, v0, 0x7

    div-int/lit8 v2, p2, 0x4

    add-int/2addr v2, p1

    aget-char v2, p0, v2

    add-int v0, v1, v2

    .line 281
    :cond_1d
    const/16 v1, 0x8

    if-le p2, v1, :cond_3

    shl-int/lit8 v1, v0, 0x7

    div-int/lit8 v2, p2, 0x2

    add-int/2addr v2, p1

    aget-char v2, p0, v2

    add-int v0, v1, v2

    goto :goto_3
.end method

.method private static findFragment(I[CII)I
    .registers 9
    .param p0, "bufMinPos"    # I
    .param p1, "b"    # [C
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    const/16 v4, 0x41

    .line 657
    if-ge p2, p0, :cond_a

    .line 658
    move p2, p0

    .line 659
    if-le p2, p3, :cond_8

    move p2, p3

    :cond_8
    move v1, p2

    .line 671
    :cond_9
    :goto_9
    return v1

    .line 662
    :cond_a
    sub-int v2, p3, p2

    if-le v2, v4, :cond_10

    .line 663
    add-int/lit8 p2, p3, -0xa

    .line 665
    :cond_10
    add-int/lit8 v1, p2, 0x1

    .line 666
    .local v1, "i":I
    :cond_12
    add-int/lit8 v1, v1, -0x1

    if-le v1, p0, :cond_9

    .line 667
    sub-int v2, p3, v1

    if-gt v2, v4, :cond_9

    .line 668
    aget-char v0, p1, v1

    .line 669
    .local v0, "c":C
    const/16 v2, 0x3c

    if-ne v0, v2, :cond_12

    sub-int v2, p2, v1

    const/16 v3, 0xa

    if-le v2, v3, :cond_12

    goto :goto_9
.end method

.method private static final setName(C)V
    .registers 3
    .param p0, "ch"    # C

    .prologue
    .line 3134
    sget-object v0, Lorg/xmlpull/mxp1/MXParser;->lookupNameChar:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p0

    return-void
.end method

.method private static final setNameStart(C)V
    .registers 3
    .param p0, "ch"    # C

    .prologue
    .line 3137
    sget-object v0, Lorg/xmlpull/mxp1/MXParser;->lookupNameStartChar:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p0

    invoke-static {p0}, Lorg/xmlpull/mxp1/MXParser;->setName(C)V

    return-void
.end method


# virtual methods
.method public defineEntityReplacementText(Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "entityName"    # Ljava/lang/String;
    .param p2, "replacementText"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 566
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->ensureEntityCapacity()V

    .line 569
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->entityName:[Ljava/lang/String;

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p0, v2, v5, v3}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 570
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->entityNameBuf:[[C

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    aput-object v2, v0, v1

    .line 572
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->entityReplacement:[Ljava/lang/String;

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    aput-object p2, v0, v1

    .line 573
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->entityReplacementBuf:[[C

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    invoke-virtual {p2}, Ljava/lang/String;->toCharArray()[C

    move-result-object v2

    aput-object v2, v0, v1

    .line 574
    iget-boolean v0, p0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    if-nez v0, :cond_4b

    .line 575
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->entityNameHash:[I

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    iget-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->entityNameBuf:[[C

    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    aget-object v2, v2, v3

    iget-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->entityNameBuf:[[C

    iget v4, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    aget-object v3, v3, v4

    array-length v3, v3

    invoke-static {v2, v5, v3}, Lorg/xmlpull/mxp1/MXParser;->fastHash([CII)I

    move-result v2

    aput v2, v0, v1

    .line 578
    :cond_4b
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    .line 581
    return-void
.end method

.method protected ensureAttributesCapacity(I)V
    .registers 9
    .param p1, "size"    # I

    .prologue
    const/4 v5, 0x0

    .line 191
    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    if-eqz v6, :cond_4f

    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    array-length v1, v6

    .line 192
    .local v1, "attrPosSize":I
    :goto_8
    if-lt p1, v1, :cond_4e

    .line 193
    const/4 v6, 0x7

    if-le p1, v6, :cond_51

    mul-int/lit8 v4, p1, 0x2

    .line 197
    .local v4, "newSize":I
    :goto_f
    if-lez v1, :cond_54

    const/4 v3, 0x1

    .line 198
    .local v3, "needsCopying":Z
    :goto_12
    const/4 v0, 0x0

    .line 200
    .local v0, "arr":[Ljava/lang/String;
    new-array v0, v4, [Ljava/lang/String;

    .line 201
    if-eqz v3, :cond_1c

    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    invoke-static {v6, v5, v0, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 202
    :cond_1c
    iput-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    .line 204
    new-array v0, v4, [Ljava/lang/String;

    .line 205
    if-eqz v3, :cond_27

    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->attributePrefix:[Ljava/lang/String;

    invoke-static {v6, v5, v0, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 206
    :cond_27
    iput-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributePrefix:[Ljava/lang/String;

    .line 208
    new-array v0, v4, [Ljava/lang/String;

    .line 209
    if-eqz v3, :cond_32

    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->attributeUri:[Ljava/lang/String;

    invoke-static {v6, v5, v0, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 210
    :cond_32
    iput-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributeUri:[Ljava/lang/String;

    .line 212
    new-array v0, v4, [Ljava/lang/String;

    .line 213
    if-eqz v3, :cond_3d

    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->attributeValue:[Ljava/lang/String;

    invoke-static {v6, v5, v0, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 214
    :cond_3d
    iput-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributeValue:[Ljava/lang/String;

    .line 216
    iget-boolean v6, p0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    if-nez v6, :cond_4e

    .line 217
    new-array v2, v4, [I

    .line 218
    .local v2, "iarr":[I
    if-eqz v3, :cond_4c

    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->attributeNameHash:[I

    invoke-static {v6, v5, v2, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 219
    :cond_4c
    iput-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->attributeNameHash:[I

    .line 225
    .end local v0    # "arr":[Ljava/lang/String;
    .end local v2    # "iarr":[I
    .end local v3    # "needsCopying":Z
    .end local v4    # "newSize":I
    :cond_4e
    return-void

    .end local v1    # "attrPosSize":I
    :cond_4f
    move v1, v5

    .line 191
    goto :goto_8

    .line 193
    .restart local v1    # "attrPosSize":I
    :cond_51
    const/16 v4, 0x8

    goto :goto_f

    .restart local v4    # "newSize":I
    :cond_54
    move v3, v5

    .line 197
    goto :goto_12
.end method

.method protected ensureElementsCapacity()V
    .registers 10

    .prologue
    const/4 v6, 0x0

    .line 108
    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->elName:[Ljava/lang/String;

    if-eqz v7, :cond_6b

    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->elName:[Ljava/lang/String;

    array-length v2, v7

    .line 109
    .local v2, "elStackSize":I
    :goto_8
    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    add-int/lit8 v7, v7, 0x1

    if-lt v7, v2, :cond_6a

    .line 111
    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    const/4 v8, 0x7

    if-lt v7, v8, :cond_6d

    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    mul-int/lit8 v7, v7, 0x2

    :goto_17
    add-int/lit8 v5, v7, 0x2

    .line 115
    .local v5, "newSize":I
    if-lez v2, :cond_70

    const/4 v4, 0x1

    .line 116
    .local v4, "needsCopying":Z
    :goto_1c
    const/4 v0, 0x0

    .line 118
    .local v0, "arr":[Ljava/lang/String;
    new-array v0, v5, [Ljava/lang/String;

    .line 119
    if-eqz v4, :cond_26

    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->elName:[Ljava/lang/String;

    invoke-static {v7, v6, v0, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 120
    :cond_26
    iput-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->elName:[Ljava/lang/String;

    .line 121
    new-array v0, v5, [Ljava/lang/String;

    .line 122
    if-eqz v4, :cond_31

    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->elPrefix:[Ljava/lang/String;

    invoke-static {v7, v6, v0, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 123
    :cond_31
    iput-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->elPrefix:[Ljava/lang/String;

    .line 124
    new-array v0, v5, [Ljava/lang/String;

    .line 125
    if-eqz v4, :cond_3c

    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->elUri:[Ljava/lang/String;

    invoke-static {v7, v6, v0, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 126
    :cond_3c
    iput-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->elUri:[Ljava/lang/String;

    .line 128
    new-array v3, v5, [I

    .line 129
    .local v3, "iarr":[I
    if-eqz v4, :cond_72

    .line 130
    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->elNamespaceCount:[I

    invoke-static {v7, v6, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 135
    :goto_47
    iput-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->elNamespaceCount:[I

    .line 138
    new-array v3, v5, [I

    .line 139
    if-eqz v4, :cond_52

    .line 140
    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->elRawNameEnd:[I

    invoke-static {v7, v6, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 142
    :cond_52
    iput-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->elRawNameEnd:[I

    .line 144
    new-array v3, v5, [I

    .line 145
    if-eqz v4, :cond_5d

    .line 146
    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->elRawNameLine:[I

    invoke-static {v7, v6, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 148
    :cond_5d
    iput-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->elRawNameLine:[I

    .line 150
    new-array v1, v5, [[C

    .line 151
    .local v1, "carr":[[C
    if-eqz v4, :cond_68

    .line 152
    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->elRawName:[[C

    invoke-static {v7, v6, v1, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 154
    :cond_68
    iput-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->elRawName:[[C

    .line 170
    .end local v0    # "arr":[Ljava/lang/String;
    .end local v1    # "carr":[[C
    .end local v3    # "iarr":[I
    .end local v4    # "needsCopying":Z
    .end local v5    # "newSize":I
    :cond_6a
    return-void

    .end local v2    # "elStackSize":I
    :cond_6b
    move v2, v6

    .line 108
    goto :goto_8

    .line 111
    .restart local v2    # "elStackSize":I
    :cond_6d
    const/16 v7, 0x8

    goto :goto_17

    .restart local v5    # "newSize":I
    :cond_70
    move v4, v6

    .line 115
    goto :goto_1c

    .line 133
    .restart local v0    # "arr":[Ljava/lang/String;
    .restart local v3    # "iarr":[I
    .restart local v4    # "needsCopying":Z
    :cond_72
    aput v6, v3, v6

    goto :goto_47
.end method

.method protected ensureEntityCapacity()V
    .registers 11

    .prologue
    const/4 v7, 0x0

    .line 299
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->entityReplacementBuf:[[C

    if-eqz v8, :cond_59

    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->entityReplacementBuf:[[C

    array-length v0, v8

    .line 300
    .local v0, "entitySize":I
    :goto_8
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    if-lt v8, v0, :cond_58

    .line 301
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    const/4 v9, 0x7

    if-le v8, v9, :cond_5b

    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    mul-int/lit8 v6, v8, 0x2

    .line 305
    .local v6, "newSize":I
    :goto_15
    new-array v1, v6, [Ljava/lang/String;

    .line 306
    .local v1, "newEntityName":[Ljava/lang/String;
    new-array v2, v6, [[C

    .line 307
    .local v2, "newEntityNameBuf":[[C
    new-array v4, v6, [Ljava/lang/String;

    .line 308
    .local v4, "newEntityReplacement":[Ljava/lang/String;
    new-array v5, v6, [[C

    .line 309
    .local v5, "newEntityReplacementBuf":[[C
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->entityName:[Ljava/lang/String;

    if-eqz v8, :cond_3d

    .line 310
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->entityName:[Ljava/lang/String;

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    invoke-static {v8, v7, v1, v7, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 311
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->entityNameBuf:[[C

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    invoke-static {v8, v7, v2, v7, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 312
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->entityReplacement:[Ljava/lang/String;

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    invoke-static {v8, v7, v4, v7, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 313
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->entityReplacementBuf:[[C

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    invoke-static {v8, v7, v5, v7, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 315
    :cond_3d
    iput-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->entityName:[Ljava/lang/String;

    .line 316
    iput-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->entityNameBuf:[[C

    .line 317
    iput-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->entityReplacement:[Ljava/lang/String;

    .line 318
    iput-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->entityReplacementBuf:[[C

    .line 320
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    if-nez v8, :cond_58

    .line 321
    new-array v3, v6, [I

    .line 322
    .local v3, "newEntityNameHash":[I
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->entityNameHash:[I

    if-eqz v8, :cond_56

    .line 323
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->entityNameHash:[I

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    invoke-static {v8, v7, v3, v7, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 325
    :cond_56
    iput-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->entityNameHash:[I

    .line 328
    .end local v1    # "newEntityName":[Ljava/lang/String;
    .end local v2    # "newEntityNameBuf":[[C
    .end local v3    # "newEntityNameHash":[I
    .end local v4    # "newEntityReplacement":[Ljava/lang/String;
    .end local v5    # "newEntityReplacementBuf":[[C
    .end local v6    # "newSize":I
    :cond_58
    return-void

    .end local v0    # "entitySize":I
    :cond_59
    move v0, v7

    .line 299
    goto :goto_8

    .line 301
    .restart local v0    # "entitySize":I
    :cond_5b
    const/16 v6, 0x8

    goto :goto_15
.end method

.method protected ensureNamespacesCapacity(I)V
    .registers 10
    .param p1, "size"    # I

    .prologue
    const/4 v5, 0x0

    .line 234
    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefix:[Ljava/lang/String;

    if-eqz v6, :cond_3d

    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefix:[Ljava/lang/String;

    array-length v0, v6

    .line 235
    .local v0, "namespaceSize":I
    :goto_8
    if-lt p1, v0, :cond_3c

    .line 236
    const/4 v6, 0x7

    if-le p1, v6, :cond_3f

    mul-int/lit8 v4, p1, 0x2

    .line 240
    .local v4, "newSize":I
    :goto_f
    new-array v1, v4, [Ljava/lang/String;

    .line 241
    .local v1, "newNamespacePrefix":[Ljava/lang/String;
    new-array v3, v4, [Ljava/lang/String;

    .line 242
    .local v3, "newNamespaceUri":[Ljava/lang/String;
    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefix:[Ljava/lang/String;

    if-eqz v6, :cond_25

    .line 243
    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefix:[Ljava/lang/String;

    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    invoke-static {v6, v5, v1, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 245
    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceUri:[Ljava/lang/String;

    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    invoke-static {v6, v5, v3, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 248
    :cond_25
    iput-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefix:[Ljava/lang/String;

    .line 249
    iput-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceUri:[Ljava/lang/String;

    .line 252
    iget-boolean v6, p0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    if-nez v6, :cond_3c

    .line 253
    new-array v2, v4, [I

    .line 254
    .local v2, "newNamespacePrefixHash":[I
    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefixHash:[I

    if-eqz v6, :cond_3a

    .line 255
    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefixHash:[I

    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    invoke-static {v6, v5, v2, v5, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 258
    :cond_3a
    iput-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefixHash:[I

    .line 263
    .end local v1    # "newNamespacePrefix":[Ljava/lang/String;
    .end local v2    # "newNamespacePrefixHash":[I
    .end local v3    # "newNamespaceUri":[Ljava/lang/String;
    .end local v4    # "newSize":I
    :cond_3c
    return-void

    .end local v0    # "namespaceSize":I
    :cond_3d
    move v0, v5

    .line 234
    goto :goto_8

    .line 236
    .restart local v0    # "namespaceSize":I
    :cond_3f
    const/16 v4, 0x8

    goto :goto_f
.end method

.method protected ensurePC(I)V
    .registers 7
    .param p1, "end"    # I

    .prologue
    const/4 v4, 0x0

    .line 3070
    const/16 v2, 0x2000

    if-le p1, v2, :cond_13

    mul-int/lit8 v1, p1, 0x2

    .line 3071
    .local v1, "newSize":I
    :goto_7
    new-array v0, v1, [C

    .line 3073
    .local v0, "newPC":[C
    iget-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-static {v2, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3074
    iput-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    .line 3076
    return-void

    .line 3070
    .end local v0    # "newPC":[C
    .end local v1    # "newSize":I
    :cond_13
    const/16 v1, 0x4000

    goto :goto_7
.end method

.method protected fillBuf()V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 2930
    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->reader:Ljava/io/Reader;

    if-nez v9, :cond_c

    new-instance v9, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v10, "reader must be set before parsing is started"

    invoke-direct {v9, v10}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 2934
    :cond_c
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufEnd:I

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->bufSoftLimit:I

    if-le v9, v10, :cond_57

    .line 2937
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->bufSoftLimit:I

    if-le v9, v10, :cond_75

    const/4 v0, 0x1

    .line 2938
    .local v0, "compact":Z
    :goto_19
    const/4 v1, 0x0

    .line 2939
    .local v1, "expand":Z
    iget-boolean v9, p0, Lorg/xmlpull/mxp1/MXParser;->preventBufferCompaction:Z

    if-eqz v9, :cond_77

    .line 2940
    const/4 v0, 0x0

    .line 2941
    const/4 v1, 0x1

    .line 2954
    :cond_20
    :goto_20
    if-eqz v0, :cond_86

    .line 2957
    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    const/4 v12, 0x0

    iget v13, p0, Lorg/xmlpull/mxp1/MXParser;->bufEnd:I

    iget v14, p0, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    sub-int/2addr v13, v14

    invoke-static {v9, v10, v11, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2979
    :cond_31
    :goto_31
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufEnd:I

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    sub-int/2addr v9, v10

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufEnd:I

    .line 2980
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    sub-int/2addr v9, v10

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    .line 2981
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    sub-int/2addr v9, v10

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 2982
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    sub-int/2addr v9, v10

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 2983
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    add-int/2addr v9, v10

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    .line 2984
    const/4 v9, 0x0

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    .line 2991
    .end local v0    # "compact":Z
    .end local v1    # "expand":Z
    :cond_57
    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    array-length v9, v9

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->bufEnd:I

    sub-int/2addr v9, v10

    const/16 v10, 0x2000

    if-le v9, v10, :cond_b9

    const/16 v4, 0x2000

    .line 2992
    .local v4, "len":I
    :goto_63
    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->reader:Ljava/io/Reader;

    iget-object v10, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->bufEnd:I

    invoke-virtual {v9, v10, v11, v4}, Ljava/io/Reader;->read([CII)I

    move-result v7

    .line 2993
    .local v7, "ret":I
    if-lez v7, :cond_c1

    .line 2994
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufEnd:I

    add-int/2addr v9, v7

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufEnd:I

    .line 3007
    :goto_74
    return-void

    .line 2937
    .end local v4    # "len":I
    .end local v7    # "ret":I
    :cond_75
    const/4 v0, 0x0

    goto :goto_19

    .line 2942
    .restart local v0    # "compact":Z
    .restart local v1    # "expand":Z
    :cond_77
    if-nez v0, :cond_20

    .line 2944
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    iget-object v10, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    array-length v10, v10

    div-int/lit8 v10, v10, 0x2

    if-ge v9, v10, :cond_84

    .line 2946
    const/4 v1, 0x1

    .line 2947
    goto :goto_20

    .line 2949
    :cond_84
    const/4 v0, 0x1

    goto :goto_20

    .line 2965
    :cond_86
    if-eqz v1, :cond_b1

    .line 2966
    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    array-length v9, v9

    mul-int/lit8 v6, v9, 0x2

    .line 2967
    .local v6, "newSize":I
    new-array v5, v6, [C

    .line 2969
    .local v5, "newBuf":[C
    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    const/4 v11, 0x0

    iget v12, p0, Lorg/xmlpull/mxp1/MXParser;->bufEnd:I

    iget v13, p0, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    sub-int/2addr v12, v13

    invoke-static {v9, v10, v5, v11, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2970
    iput-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    .line 2971
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufLoadFactor:I

    if-lez v9, :cond_31

    .line 2973
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufLoadFactor:I

    int-to-long v9, v9

    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    array-length v11, v11

    int-to-long v11, v11

    mul-long/2addr v9, v11

    const-wide/16 v11, 0x64

    div-long/2addr v9, v11

    long-to-int v9, v9

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufSoftLimit:I

    goto :goto_31

    .line 2977
    .end local v5    # "newBuf":[C
    .end local v6    # "newSize":I
    :cond_b1
    new-instance v9, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v10, "internal error in fillBuffer()"

    invoke-direct {v9, v10}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 2991
    .end local v0    # "compact":Z
    .end local v1    # "expand":Z
    :cond_b9
    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    array-length v9, v9

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->bufEnd:I

    sub-int v4, v9, v10

    goto :goto_63

    .line 3001
    .restart local v4    # "len":I
    .restart local v7    # "ret":I
    :cond_c1
    const/4 v9, -0x1

    if-ne v7, v9, :cond_1a4

    .line 3002
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    if-nez v9, :cond_d4

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    if-nez v9, :cond_d4

    .line 3003
    new-instance v9, Ljava/io/EOFException;

    const-string v10, "input contained no data"

    invoke-direct {v9, v10}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 3005
    :cond_d4
    iget-boolean v9, p0, Lorg/xmlpull/mxp1/MXParser;->seenRoot:Z

    if-eqz v9, :cond_e0

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    if-nez v9, :cond_e0

    .line 3006
    const/4 v9, 0x1

    iput-boolean v9, p0, Lorg/xmlpull/mxp1/MXParser;->reachedEnd:Z

    goto :goto_74

    .line 3009
    :cond_e0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 3010
    .local v2, "expectedTagStack":Ljava/lang/StringBuffer;
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    if-lez v9, :cond_17f

    .line 3013
    const-string v9, " - expected end tag"

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3014
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    const/4 v10, 0x1

    if-le v9, v10, :cond_f8

    .line 3015
    const-string v9, "s"

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3017
    :cond_f8
    const-string v9, " "

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3018
    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    .local v3, "i":I
    :goto_ff
    if-lez v3, :cond_121

    .line 3020
    new-instance v8, Ljava/lang/String;

    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->elRawName:[[C

    aget-object v9, v9, v3

    const/4 v10, 0x0

    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->elRawNameEnd:[I

    aget v11, v11, v3

    invoke-direct {v8, v9, v10, v11}, Ljava/lang/String;-><init>([CII)V

    .line 3021
    .local v8, "tagName":Ljava/lang/String;
    const-string v9, "</"

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const/16 v10, 0x3e

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 3018
    add-int/lit8 v3, v3, -0x1

    goto :goto_ff

    .line 3023
    .end local v8    # "tagName":Ljava/lang/String;
    :cond_121
    const-string v9, " to close"

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3024
    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    :goto_128
    if-lez v3, :cond_17a

    .line 3026
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    if-eq v3, v9, :cond_133

    .line 3027
    const-string v9, " and"

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3029
    :cond_133
    new-instance v8, Ljava/lang/String;

    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->elRawName:[[C

    aget-object v9, v9, v3

    const/4 v10, 0x0

    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->elRawNameEnd:[I

    aget v11, v11, v3

    invoke-direct {v8, v9, v10, v11}, Ljava/lang/String;-><init>([CII)V

    .line 3030
    .restart local v8    # "tagName":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, " start tag <"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, ">"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3031
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, " from line "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/xmlpull/mxp1/MXParser;->elRawNameLine:[I

    aget v10, v10, v3

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3024
    add-int/lit8 v3, v3, -0x1

    goto :goto_128

    .line 3033
    .end local v8    # "tagName":Ljava/lang/String;
    :cond_17a
    const-string v9, ", parser stopped on"

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3035
    .end local v3    # "i":I
    :cond_17f
    new-instance v9, Ljava/io/EOFException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "no more data available"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getPositionDescription()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 3040
    .end local v2    # "expectedTagStack":Ljava/lang/StringBuffer;
    :cond_1a4
    new-instance v9, Ljava/io/IOException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "error reading input, returned "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9
.end method

.method public getAttributeCount()I
    .registers 3

    .prologue
    .line 866
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_7

    const/4 v0, -0x1

    .line 867
    :goto_6
    return v0

    :cond_7
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    goto :goto_6
.end method

.method public getAttributeName(I)Ljava/lang/String;
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 882
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_d

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "only START_TAG can have attributes"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 884
    :cond_d
    if-ltz p1, :cond_13

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    if-lt p1, v0, :cond_3a

    :cond_13
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "attribute position must be 0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " and not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 886
    :cond_3a
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getAttributeNamespace(I)Ljava/lang/String;
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 872
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_d

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "only START_TAG can have attributes"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 874
    :cond_d
    iget-boolean v0, p0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    if-nez v0, :cond_14

    const-string v0, ""

    .line 877
    :goto_13
    return-object v0

    .line 875
    :cond_14
    if-ltz p1, :cond_1a

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    if-lt p1, v0, :cond_41

    :cond_1a
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "attribute position must be 0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " and not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 877
    :cond_41
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributeUri:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_13
.end method

.method public getAttributePrefix(I)Ljava/lang/String;
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 891
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_d

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "only START_TAG can have attributes"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 893
    :cond_d
    iget-boolean v0, p0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    if-nez v0, :cond_13

    const/4 v0, 0x0

    .line 896
    :goto_12
    return-object v0

    .line 894
    :cond_13
    if-ltz p1, :cond_19

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    if-lt p1, v0, :cond_40

    :cond_19
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "attribute position must be 0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " and not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 896
    :cond_40
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributePrefix:[Ljava/lang/String;

    aget-object v0, v0, p1

    goto :goto_12
.end method

.method public getAttributeType(I)Ljava/lang/String;
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 900
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_d

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "only START_TAG can have attributes"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 902
    :cond_d
    if-ltz p1, :cond_13

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    if-lt p1, v0, :cond_3a

    :cond_13
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "attribute position must be 0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " and not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 904
    :cond_3a
    const-string v0, "CDATA"

    return-object v0
.end method

.method public getAttributeValue(I)Ljava/lang/String;
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 917
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_d

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "only START_TAG can have attributes"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 919
    :cond_d
    if-ltz p1, :cond_13

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    if-lt p1, v0, :cond_3a

    :cond_13
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "attribute position must be 0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " and not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 921
    :cond_3a
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributeValue:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 927
    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_22

    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "only START_TAG can have attributes"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getPositionDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 929
    :cond_22
    if-nez p2, :cond_2c

    .line 930
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "attribute name can not be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 933
    :cond_2c
    iget-boolean v1, p0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    if-eqz v1, :cond_5b

    .line 934
    if-nez p1, :cond_34

    .line 935
    const-string p1, ""

    .line 938
    :cond_34
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_35
    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    if-ge v0, v1, :cond_85

    .line 939
    iget-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->attributeUri:[Ljava/lang/String;

    aget-object v1, v1, v0

    if-eq p1, v1, :cond_49

    iget-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->attributeUri:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_58

    :cond_49
    iget-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_58

    .line 945
    iget-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->attributeValue:[Ljava/lang/String;

    aget-object v1, v1, v0

    .line 961
    :goto_57
    return-object v1

    .line 938
    :cond_58
    add-int/lit8 v0, v0, 0x1

    goto :goto_35

    .line 949
    .end local v0    # "i":I
    :cond_5b
    if-eqz p1, :cond_64

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_64

    .line 950
    const/4 p1, 0x0

    .line 952
    :cond_64
    if-eqz p1, :cond_6e

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "when namespaces processing is disabled attribute namespace must be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 954
    :cond_6e
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_6f
    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    if-ge v0, v1, :cond_85

    .line 955
    iget-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_82

    .line 957
    iget-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->attributeValue:[Ljava/lang/String;

    aget-object v1, v1, v0

    goto :goto_57

    .line 954
    :cond_82
    add-int/lit8 v0, v0, 0x1

    goto :goto_6f

    .line 961
    :cond_85
    const/4 v1, 0x0

    goto :goto_57
.end method

.method public getColumnNumber()I
    .registers 2

    .prologue
    .line 706
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->columnNumber:I

    return v0
.end method

.method public getDepth()I
    .registers 2

    .prologue
    .line 651
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    return v0
.end method

.method public getEventType()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 968
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    return v0
.end method

.method public getFeature(Ljava/lang/String;)Z
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 475
    if-nez p1, :cond_b

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "feature name should not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 476
    :cond_b
    const-string v1, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 477
    iget-boolean v0, p0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    .line 490
    :cond_15
    :goto_15
    return v0

    .line 480
    :cond_16
    const-string v1, "http://xmlpull.org/v1/doc/features.html#names-interned"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_15

    .line 482
    const-string v1, "http://xmlpull.org/v1/doc/features.html#process-docdecl"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_15

    .line 486
    const-string v1, "http://xmlpull.org/v1/doc/features.html#xml-roundtrip"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 488
    iget-boolean v0, p0, Lorg/xmlpull/mxp1/MXParser;->roundtripSupported:Z

    goto :goto_15
.end method

.method public getInputEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 556
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->inputEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public getLineNumber()I
    .registers 2

    .prologue
    .line 701
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->lineNumber:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 5

    .prologue
    .line 827
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_c

    .line 829
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->elName:[Ljava/lang/String;

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    aget-object v0, v0, v1

    .line 838
    :goto_b
    return-object v0

    .line 830
    :cond_c
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_18

    .line 831
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->elName:[Ljava/lang/String;

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    aget-object v0, v0, v1

    goto :goto_b

    .line 832
    :cond_18
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_33

    .line 833
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->entityRefName:Ljava/lang/String;

    if-nez v0, :cond_30

    .line 834
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    sub-int/2addr v2, v3

    invoke-virtual {p0, v0, v1, v2}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->entityRefName:Ljava/lang/String;

    .line 836
    :cond_30
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->entityRefName:Ljava/lang/String;

    goto :goto_b

    .line 838
    :cond_33
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public getNamespace()Ljava/lang/String;
    .registers 3

    .prologue
    .line 800
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_13

    .line 802
    iget-boolean v0, p0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    if-eqz v0, :cond_10

    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->elUri:[Ljava/lang/String;

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    aget-object v0, v0, v1

    .line 806
    :goto_f
    return-object v0

    .line 802
    :cond_10
    const-string v0, ""

    goto :goto_f

    .line 803
    :cond_13
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_26

    .line 804
    iget-boolean v0, p0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    if-eqz v0, :cond_23

    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->elUri:[Ljava/lang/String;

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    aget-object v0, v0, v1

    goto :goto_f

    :cond_23
    const-string v0, ""

    goto :goto_f

    .line 806
    :cond_26
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public getNamespace(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 626
    if-eqz p1, :cond_30

    .line 627
    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_6
    if-ltz v0, :cond_1a

    .line 628
    iget-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefix:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_17

    .line 629
    iget-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceUri:[Ljava/lang/String;

    aget-object v1, v1, v0

    .line 645
    :goto_16
    return-object v1

    .line 627
    :cond_17
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 632
    :cond_1a
    const-string v1, "xml"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 633
    const-string v1, "http://www.w3.org/XML/1998/namespace"

    goto :goto_16

    .line 634
    :cond_25
    const-string v1, "xmlns"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    .line 635
    const-string v1, "http://www.w3.org/2000/xmlns/"

    goto :goto_16

    .line 638
    .end local v0    # "i":I
    :cond_30
    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    add-int/lit8 v0, v1, -0x1

    .restart local v0    # "i":I
    :goto_34
    if-ltz v0, :cond_44

    .line 639
    iget-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefix:[Ljava/lang/String;

    aget-object v1, v1, v0

    if-nez v1, :cond_41

    .line 640
    iget-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceUri:[Ljava/lang/String;

    aget-object v1, v1, v0

    goto :goto_16

    .line 638
    :cond_41
    add-int/lit8 v0, v0, -0x1

    goto :goto_34

    .line 645
    :cond_44
    const/4 v1, 0x0

    goto :goto_16
.end method

.method public getNamespaceCount(I)I
    .registers 5
    .param p1, "depth"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 586
    iget-boolean v0, p0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    if-eqz v0, :cond_6

    if-nez p1, :cond_8

    .line 587
    :cond_6
    const/4 v0, 0x0

    .line 593
    :goto_7
    return v0

    .line 591
    :cond_8
    if-ltz p1, :cond_e

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    if-le p1, v0, :cond_33

    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "allowed namespace depth 0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 593
    :cond_33
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->elNamespaceCount:[I

    aget v0, v0, p1

    goto :goto_7
.end method

.method public getNamespacePrefix(I)Ljava/lang/String;
    .registers 5
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 602
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    if-ge p1, v0, :cond_9

    .line 603
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefix:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0

    .line 605
    :cond_9
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "position "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " exceeded number of available namespaces "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getNamespaceUri(I)Ljava/lang/String;
    .registers 5
    .param p1, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 614
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    if-ge p1, v0, :cond_9

    .line 615
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceUri:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0

    .line 617
    :cond_9
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "position "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " exceeded number of available namespaces "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getPositionDescription()Ljava/lang/String;
    .registers 7

    .prologue
    .line 681
    const/4 v0, 0x0

    .line 682
    .local v0, "fragment":Ljava/lang/String;
    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    if-gt v2, v3, :cond_39

    .line 683
    const/4 v2, 0x0

    iget-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v4, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    iget v5, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    invoke-static {v2, v3, v4, v5}, Lorg/xmlpull/mxp1/MXParser;->findFragment(I[CII)I

    move-result v1

    .line 685
    .local v1, "start":I
    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    if-ge v1, v2, :cond_20

    .line 686
    new-instance v0, Ljava/lang/String;

    .end local v0    # "fragment":Ljava/lang/String;
    iget-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    sub-int/2addr v3, v1

    invoke-direct {v0, v2, v1, v3}, Ljava/lang/String;-><init>([CII)V

    .line 688
    .restart local v0    # "fragment":Ljava/lang/String;
    :cond_20
    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    if-gtz v2, :cond_26

    if-lez v1, :cond_39

    :cond_26
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "..."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 693
    .end local v1    # "start":I
    :cond_39
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-object v3, Lorg/xmlpull/v1/XmlPullParser;->TYPES:[Ljava/lang/String;

    iget v4, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    aget-object v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    if-eqz v0, :cond_a2

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, " seen "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v4, "..."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_6d
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->location:Ljava/lang/String;

    if-eqz v2, :cond_a5

    iget-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->location:Ljava/lang/String;

    :goto_7d
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "@"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getLineNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getColumnNumber()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    :cond_a2
    const-string v2, ""

    goto :goto_6d

    :cond_a5
    const-string v2, ""

    goto :goto_7d
.end method

.method public getPrefix()Ljava/lang/String;
    .registers 3

    .prologue
    .line 844
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_c

    .line 846
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->elPrefix:[Ljava/lang/String;

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    aget-object v0, v0, v1

    .line 850
    :goto_b
    return-object v0

    .line 847
    :cond_c
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_18

    .line 848
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->elPrefix:[Ljava/lang/String;

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    aget-object v0, v0, v1

    goto :goto_b

    .line 850
    :cond_18
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 507
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "property name should not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 508
    :cond_a
    const-string v0, "http://xmlpull.org/v1/doc/properties.html#xmldecl-version"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 509
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->xmlDeclVersion:Ljava/lang/String;

    .line 517
    :goto_14
    return-object v0

    .line 510
    :cond_15
    const-string v0, "http://xmlpull.org/v1/doc/properties.html#xmldecl-standalone"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 511
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->xmlDeclStandalone:Ljava/lang/Boolean;

    goto :goto_14

    .line 512
    :cond_20
    const-string v0, "http://xmlpull.org/v1/doc/properties.html#xmldecl-content"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 513
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->xmlDeclContent:Ljava/lang/String;

    goto :goto_14

    .line 514
    :cond_2b
    const-string v0, "http://xmlpull.org/v1/doc/properties.html#location"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    .line 515
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->location:Ljava/lang/String;

    goto :goto_14

    .line 517
    :cond_36
    const/4 v0, 0x0

    goto :goto_14
.end method

.method public getText()Ljava/lang/String;
    .registers 6

    .prologue
    .line 734
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    if-eqz v0, :cond_9

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_b

    .line 739
    :cond_9
    const/4 v0, 0x0

    .line 751
    :goto_a
    return-object v0

    .line 741
    :cond_b
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_13

    .line 742
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    goto :goto_a

    .line 744
    :cond_13
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    if-nez v0, :cond_35

    .line 745
    iget-boolean v0, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v0, :cond_25

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_25

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_38

    .line 746
    :cond_25
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v4, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    sub-int/2addr v3, v4

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    iput-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    .line 751
    :cond_35
    :goto_35
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    goto :goto_a

    .line 748
    :cond_38
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget v4, p0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    sub-int/2addr v3, v4

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    iput-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    goto :goto_35
.end method

.method public getTextCharacters([I)[C
    .registers 6
    .param p1, "holderForStartAndLength"    # [I

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 756
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_27

    .line 757
    iget-boolean v0, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v0, :cond_19

    .line 758
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    aput v0, p1, v3

    .line 759
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    sub-int/2addr v0, v1

    aput v0, p1, v2

    .line 760
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    .line 783
    :goto_18
    return-object v0

    .line 762
    :cond_19
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    aput v0, p1, v3

    .line 763
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    sub-int/2addr v0, v1

    aput v0, p1, v2

    .line 764
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    goto :goto_18

    .line 767
    :cond_27
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_52

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_52

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_52

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/16 v1, 0x9

    if-eq v0, v1, :cond_52

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x6

    if-eq v0, v1, :cond_52

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/16 v1, 0x8

    if-eq v0, v1, :cond_52

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x7

    if-eq v0, v1, :cond_52

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_60

    .line 776
    :cond_52
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    aput v0, p1, v3

    .line 777
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    sub-int/2addr v0, v1

    aput v0, p1, v2

    .line 778
    iget-object v0, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    goto :goto_18

    .line 779
    :cond_60
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    if-eqz v0, :cond_68

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    if-ne v0, v2, :cond_6f

    .line 782
    :cond_68
    const/4 v0, -0x1

    aput v0, p1, v2

    aput v0, p1, v3

    .line 783
    const/4 v0, 0x0

    goto :goto_18

    .line 785
    :cond_6f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "unknown text eventType: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isAttributeDefault(I)Z
    .registers 5
    .param p1, "index"    # I

    .prologue
    .line 908
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_d

    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "only START_TAG can have attributes"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 910
    :cond_d
    if-ltz p1, :cond_13

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    if-lt p1, v0, :cond_3a

    :cond_13
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "attribute position must be 0.."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " and not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 912
    :cond_3a
    const/4 v0, 0x0

    return v0
.end method

.method public isEmptyElementTag()Z
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 859
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_e

    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v1, "parser must be on START_TAG to check for empty element"

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v0

    .line 861
    :cond_e
    iget-boolean v0, p0, Lorg/xmlpull/mxp1/MXParser;->emptyElementTag:Z

    return v0
.end method

.method protected isNameChar(C)Z
    .registers 4
    .param p1, "ch"    # C

    .prologue
    const/16 v1, 0x400

    .line 3191
    if-ge p1, v1, :cond_a

    sget-object v0, Lorg/xmlpull/mxp1/MXParser;->lookupNameChar:[Z

    aget-boolean v0, v0, p1

    if-nez v0, :cond_21

    :cond_a
    if-lt p1, v1, :cond_10

    const/16 v0, 0x2027

    if-le p1, v0, :cond_21

    :cond_10
    const/16 v0, 0x202a

    if-lt p1, v0, :cond_18

    const/16 v0, 0x218f

    if-le p1, v0, :cond_21

    :cond_18
    const/16 v0, 0x2800

    if-lt p1, v0, :cond_23

    const v0, 0xffef

    if-gt p1, v0, :cond_23

    :cond_21
    const/4 v0, 0x1

    :goto_22
    return v0

    :cond_23
    const/4 v0, 0x0

    goto :goto_22
.end method

.method protected isNameStartChar(C)Z
    .registers 4
    .param p1, "ch"    # C

    .prologue
    const/16 v1, 0x400

    .line 3157
    if-ge p1, v1, :cond_a

    sget-object v0, Lorg/xmlpull/mxp1/MXParser;->lookupNameStartChar:[Z

    aget-boolean v0, v0, p1

    if-nez v0, :cond_21

    :cond_a
    if-lt p1, v1, :cond_10

    const/16 v0, 0x2027

    if-le p1, v0, :cond_21

    :cond_10
    const/16 v0, 0x202a

    if-lt p1, v0, :cond_18

    const/16 v0, 0x218f

    if-le p1, v0, :cond_21

    :cond_18
    const/16 v0, 0x2800

    if-lt p1, v0, :cond_23

    const v0, 0xffef

    if-gt p1, v0, :cond_23

    :cond_21
    const/4 v0, 0x1

    :goto_22
    return v0

    :cond_23
    const/4 v0, 0x0

    goto :goto_22
.end method

.method protected isS(C)Z
    .registers 3
    .param p1, "ch"    # C

    .prologue
    .line 3213
    const/16 v0, 0x20

    if-eq p1, v0, :cond_10

    const/16 v0, 0xa

    if-eq p1, v0, :cond_10

    const/16 v0, 0xd

    if-eq p1, v0, :cond_10

    const/16 v0, 0x9

    if-ne p1, v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public isWhitespace()Z
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 712
    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v4, 0x4

    if-eq v3, v4, :cond_c

    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v4, 0x5

    if-ne v3, v4, :cond_3a

    .line 713
    :cond_c
    iget-boolean v3, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v3, :cond_25

    .line 714
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    .local v0, "i":I
    :goto_12
    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    if-ge v0, v3, :cond_21

    .line 716
    iget-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    aget-char v3, v3, v0

    invoke-virtual {p0, v3}, Lorg/xmlpull/mxp1/MXParser;->isS(C)Z

    move-result v3

    if-nez v3, :cond_22

    move v1, v2

    .line 727
    .end local v0    # "i":I
    :cond_21
    :goto_21
    return v1

    .line 714
    .restart local v0    # "i":I
    :cond_22
    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 720
    .end local v0    # "i":I
    :cond_25
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .restart local v0    # "i":I
    :goto_27
    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    if-ge v0, v3, :cond_21

    .line 722
    iget-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    aget-char v3, v3, v0

    invoke-virtual {p0, v3}, Lorg/xmlpull/mxp1/MXParser;->isS(C)Z

    move-result v3

    if-nez v3, :cond_37

    move v1, v2

    goto :goto_21

    .line 720
    :cond_37
    add-int/lit8 v0, v0, 0x1

    goto :goto_27

    .line 726
    .end local v0    # "i":I
    :cond_3a
    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v3, 0x7

    if-eq v2, v3, :cond_21

    .line 729
    new-instance v1, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v2, "no content available to check for white spaces"

    invoke-direct {v1, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method protected joinPC()V
    .registers 7

    .prologue
    .line 3081
    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    sub-int v0, v2, v3

    .line 3082
    .local v0, "len":I
    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/2addr v2, v0

    add-int/lit8 v1, v2, 0x1

    .line 3083
    .local v1, "newEnd":I
    iget-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v2, v2

    if-lt v1, v2, :cond_13

    invoke-virtual {p0, v1}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 3085
    :cond_13
    iget-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v5, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-static {v2, v3, v4, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 3086
    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/2addr v2, v0

    iput v2, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    .line 3087
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 3089
    return-void
.end method

.method protected lookuEntityReplacement(I)[C
    .registers 10
    .param p1, "entitNameLen"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2284
    iget-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    if-nez v4, :cond_4b

    .line 2285
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v5, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    sub-int/2addr v6, v7

    invoke-static {v4, v5, v6}, Lorg/xmlpull/mxp1/MXParser;->fastHash([CII)I

    move-result v1

    .line 2287
    .local v1, "hash":I
    iget v4, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    add-int/lit8 v2, v4, -0x1

    .local v2, "i":I
    :goto_15
    if-ltz v2, :cond_7a

    .line 2289
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->entityNameHash:[I

    aget v4, v4, v2

    if-ne v1, v4, :cond_36

    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->entityNameBuf:[[C

    aget-object v4, v4, v2

    array-length v4, v4

    if-ne p1, v4, :cond_36

    .line 2290
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->entityNameBuf:[[C

    aget-object v0, v4, v2

    .line 2291
    .local v0, "entityBuf":[C
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_29
    if-ge v3, p1, :cond_3c

    .line 2293
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v5, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    add-int/2addr v5, v3

    aget-char v4, v4, v5

    aget-char v5, v0, v3

    if-eq v4, v5, :cond_39

    .line 2287
    .end local v0    # "entityBuf":[C
    .end local v3    # "j":I
    :cond_36
    add-int/lit8 v2, v2, -0x1

    goto :goto_15

    .line 2291
    .restart local v0    # "entityBuf":[C
    .restart local v3    # "j":I
    :cond_39
    add-int/lit8 v3, v3, 0x1

    goto :goto_29

    .line 2295
    :cond_3c
    iget-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v4, :cond_46

    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->entityReplacement:[Ljava/lang/String;

    aget-object v4, v4, v2

    iput-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    .line 2296
    :cond_46
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->entityReplacementBuf:[[C

    aget-object v4, v4, v2

    .line 2310
    .end local v0    # "entityBuf":[C
    .end local v1    # "hash":I
    .end local v3    # "j":I
    :goto_4a
    return-object v4

    .line 2300
    .end local v2    # "i":I
    :cond_4b
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v5, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    sub-int/2addr v6, v7

    invoke-virtual {p0, v4, v5, v6}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->entityRefName:Ljava/lang/String;

    .line 2301
    iget v4, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    add-int/lit8 v2, v4, -0x1

    .restart local v2    # "i":I
    :goto_5e
    if-ltz v2, :cond_7a

    .line 2304
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->entityRefName:Ljava/lang/String;

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->entityName:[Ljava/lang/String;

    aget-object v5, v5, v2

    if-ne v4, v5, :cond_77

    .line 2305
    iget-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v4, :cond_72

    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->entityReplacement:[Ljava/lang/String;

    aget-object v4, v4, v2

    iput-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    .line 2306
    :cond_72
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->entityReplacementBuf:[[C

    aget-object v4, v4, v2

    goto :goto_4a

    .line 2301
    :cond_77
    add-int/lit8 v2, v2, -0x1

    goto :goto_5e

    .line 2310
    :cond_7a
    const/4 v4, 0x0

    goto :goto_4a
.end method

.method protected more()C
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 3045
    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->bufEnd:I

    if-lt v1, v2, :cond_11

    .line 3046
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->fillBuf()V

    .line 3048
    iget-boolean v1, p0, Lorg/xmlpull/mxp1/MXParser;->reachedEnd:Z

    if-eqz v1, :cond_11

    const v0, 0xffff

    .line 3055
    :goto_10
    return v0

    .line 3050
    :cond_11
    iget-object v1, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    aget-char v0, v1, v2

    .line 3052
    .local v0, "ch":C
    const/16 v1, 0xa

    if-ne v0, v1, :cond_29

    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->lineNumber:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->lineNumber:I

    const/4 v1, 0x1

    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->columnNumber:I

    goto :goto_10

    .line 3053
    :cond_29
    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->columnNumber:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->columnNumber:I

    goto :goto_10
.end method

.method protected newString([CII)Ljava/lang/String;
    .registers 5
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 68
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method

.method protected newStringIntern([CII)Ljava/lang/String;
    .registers 5
    .param p1, "cbuf"    # [C
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 72
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public next()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1092
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    .line 1093
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->nextImpl()I

    move-result v0

    return v0
.end method

.method protected nextImpl()I
    .registers 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1107
    const/16 v18, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    .line 1108
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    .line 1109
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 1110
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    .line 1111
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->pastEndTag:Z

    move/from16 v18, v0

    if-eqz v18, :cond_5c

    .line 1112
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->pastEndTag:Z

    .line 1113
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->depth:I

    .line 1114
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elNamespaceCount:[I

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v19, v0

    aget v18, v18, v19

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    .line 1116
    :cond_5c
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->emptyElementTag:Z

    move/from16 v18, v0

    if-eqz v18, :cond_7d

    .line 1117
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->emptyElementTag:Z

    .line 1118
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->pastEndTag:Z

    .line 1119
    const/16 v18, 0x3

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    .line 1395
    :goto_7c
    return v18

    .line 1123
    :cond_7d
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v18, v0

    if-lez v18, :cond_550

    .line 1125
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->seenStartTag:Z

    move/from16 v18, v0

    if-eqz v18, :cond_a0

    .line 1126
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->seenStartTag:Z

    .line 1127
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->parseStartTag()I

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto :goto_7c

    .line 1129
    :cond_a0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->seenEndTag:Z

    move/from16 v18, v0

    if-eqz v18, :cond_bb

    .line 1130
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->seenEndTag:Z

    .line 1131
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->parseEndTag()I

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto :goto_7c

    .line 1137
    :cond_bb
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->seenMarkup:Z

    move/from16 v18, v0

    if-eqz v18, :cond_ff

    .line 1138
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->seenMarkup:Z

    .line 1139
    const/16 v7, 0x3c

    .line 1146
    .local v7, "ch":C
    :goto_cd
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 1149
    const/4 v8, 0x0

    .line 1152
    .local v8, "hadCharData":Z
    const/4 v10, 0x0

    .line 1157
    .local v10, "needsMerging":Z
    :goto_dd
    const/16 v18, 0x3c

    move/from16 v0, v18

    if-ne v7, v0, :cond_278

    .line 1158
    if-eqz v8, :cond_117

    .line 1160
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    move/from16 v18, v0

    if-eqz v18, :cond_117

    .line 1161
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->seenMarkup:Z

    .line 1162
    const/16 v18, 0x4

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto/16 :goto_7c

    .line 1140
    .end local v7    # "ch":C
    .end local v8    # "hadCharData":Z
    .end local v10    # "needsMerging":Z
    :cond_ff
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->seenAmpersand:Z

    move/from16 v18, v0

    if-eqz v18, :cond_112

    .line 1141
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->seenAmpersand:Z

    .line 1142
    const/16 v7, 0x26

    .line 1143
    .restart local v7    # "ch":C
    goto :goto_cd

    .line 1144
    .end local v7    # "ch":C
    :cond_112
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v7

    .restart local v7    # "ch":C
    goto :goto_cd

    .line 1165
    .restart local v8    # "hadCharData":Z
    .restart local v10    # "needsMerging":Z
    :cond_117
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v7

    .line 1166
    const/16 v18, 0x2f

    move/from16 v0, v18

    if-ne v7, v0, :cond_149

    .line 1167
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    move/from16 v18, v0

    if-nez v18, :cond_13d

    if-eqz v8, :cond_13d

    .line 1168
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->seenEndTag:Z

    .line 1170
    const/16 v18, 0x4

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto/16 :goto_7c

    .line 1172
    :cond_13d
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->parseEndTag()I

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto/16 :goto_7c

    .line 1173
    :cond_149
    const/16 v18, 0x21

    move/from16 v0, v18

    if-ne v7, v0, :cond_1e9

    .line 1174
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v7

    .line 1175
    const/16 v18, 0x2d

    move/from16 v0, v18

    if-ne v7, v0, :cond_18c

    .line 1177
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->parseComment()V

    .line 1178
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    move/from16 v18, v0

    if-eqz v18, :cond_16e

    const/16 v18, 0x9

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto/16 :goto_7c

    .line 1179
    :cond_16e
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    move/from16 v18, v0

    if-nez v18, :cond_17f

    if-eqz v8, :cond_17f

    .line 1180
    const/4 v10, 0x1

    .line 1389
    :cond_179
    :goto_179
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v7

    .line 1390
    goto/16 :goto_dd

    .line 1182
    :cond_17f
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    goto :goto_179

    .line 1184
    :cond_18c
    const/16 v18, 0x5b

    move/from16 v0, v18

    if-ne v7, v0, :cond_1c0

    .line 1189
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/xmlpull/mxp1/MXParser;->parseCDSect(Z)V

    .line 1190
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    move/from16 v18, v0

    if-eqz v18, :cond_1a9

    const/16 v18, 0x5

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto/16 :goto_7c

    .line 1191
    :cond_1a9
    move-object/from16 v0, p0

    iget v6, v0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 1192
    .local v6, "cdStart":I
    move-object/from16 v0, p0

    iget v4, v0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 1193
    .local v4, "cdEnd":I
    sub-int v5, v4, v6

    .line 1196
    .local v5, "cdLen":I
    if-lez v5, :cond_179

    .line 1197
    const/4 v8, 0x1

    .line 1198
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    move/from16 v18, v0

    if-nez v18, :cond_179

    .line 1199
    const/4 v10, 0x1

    goto :goto_179

    .line 1241
    .end local v4    # "cdEnd":I
    .end local v5    # "cdLen":I
    .end local v6    # "cdStart":I
    :cond_1c0
    new-instance v18, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string v20, "unexpected character in markup "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, p0

    move-object/from16 v3, v20

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v18

    .line 1244
    :cond_1e9
    const/16 v18, 0x3f

    move/from16 v0, v18

    if-ne v7, v0, :cond_21f

    .line 1245
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->parsePI()Z

    .line 1246
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    move/from16 v18, v0

    if-eqz v18, :cond_204

    const/16 v18, 0x8

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto/16 :goto_7c

    .line 1247
    :cond_204
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    move/from16 v18, v0

    if-nez v18, :cond_211

    if-eqz v8, :cond_211

    .line 1248
    const/4 v10, 0x1

    .line 1249
    goto/16 :goto_179

    .line 1250
    :cond_211
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    goto/16 :goto_179

    .line 1253
    :cond_21f
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lorg/xmlpull/mxp1/MXParser;->isNameStartChar(C)Z

    move-result v18

    if-eqz v18, :cond_24f

    .line 1254
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    move/from16 v18, v0

    if-nez v18, :cond_243

    if-eqz v8, :cond_243

    .line 1255
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->seenStartTag:Z

    .line 1257
    const/16 v18, 0x4

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto/16 :goto_7c

    .line 1259
    :cond_243
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->parseStartTag()I

    move-result v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto/16 :goto_7c

    .line 1261
    :cond_24f
    new-instance v18, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string v20, "unexpected character in markup "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, p0

    move-object/from16 v3, v20

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v18

    .line 1266
    :cond_278
    const/16 v18, 0x26

    move/from16 v0, v18

    if-ne v7, v0, :cond_3c4

    .line 1269
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    move/from16 v18, v0

    if-eqz v18, :cond_29a

    if-eqz v8, :cond_29a

    .line 1270
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->seenAmpersand:Z

    .line 1271
    const/16 v18, 0x4

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto/16 :goto_7c

    .line 1273
    :cond_29a
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v19, v0

    add-int v14, v18, v19

    .line 1274
    .local v14, "oldStart":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v19, v0

    add-int v13, v18, v19

    .line 1275
    .local v13, "oldEnd":I
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->parseEntityRef()[C

    move-result-object v15

    .line 1276
    .local v15, "resolvedEntity":[C
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    move/from16 v18, v0

    if-eqz v18, :cond_2cc

    const/16 v18, 0x6

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto/16 :goto_7c

    .line 1278
    :cond_2cc
    if-nez v15, :cond_339

    .line 1279
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->entityRefName:Ljava/lang/String;

    move-object/from16 v18, v0

    if-nez v18, :cond_302

    .line 1280
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    move/from16 v20, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    move/from16 v21, v0

    sub-int v20, v20, v21

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/xmlpull/mxp1/MXParser;->entityRefName:Ljava/lang/String;

    .line 1282
    :cond_302
    new-instance v18, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    const-string v20, "could not resolve entity named \'"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->entityRefName:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/xmlpull/mxp1/MXParser;->printable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string v20, "\'"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, p0

    move-object/from16 v3, v20

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v18

    .line 1288
    :cond_339
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v18, v0

    sub-int v18, v14, v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 1289
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v18, v0

    sub-int v18, v13, v18

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 1290
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    move/from16 v18, v0

    if-nez v18, :cond_363

    .line 1291
    if-eqz v8, :cond_3aa

    .line 1292
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->joinPC()V

    .line 1293
    const/4 v10, 0x0

    .line 1301
    :cond_363
    :goto_363
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_364
    array-length v0, v15

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v9, v0, :cond_3c1

    .line 1303
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-lt v0, v1, :cond_38f

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 1304
    :cond_38f
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v19, v0

    add-int/lit8 v20, v19, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    aget-char v20, v15, v9

    aput-char v20, v18, v19

    .line 1301
    add-int/lit8 v9, v9, 0x1

    goto :goto_364

    .line 1295
    .end local v9    # "i":I
    :cond_3aa
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 1296
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    goto :goto_363

    .line 1307
    .restart local v9    # "i":I
    :cond_3c1
    const/4 v8, 0x1

    .line 1309
    goto/16 :goto_179

    .line 1311
    .end local v9    # "i":I
    .end local v13    # "oldEnd":I
    .end local v14    # "oldStart":I
    .end local v15    # "resolvedEntity":[C
    :cond_3c4
    if-eqz v10, :cond_3ca

    .line 1313
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->joinPC()V

    .line 1315
    const/4 v10, 0x0

    .line 1326
    :cond_3ca
    const/4 v8, 0x1

    .line 1328
    const/4 v12, 0x0

    .line 1329
    .local v12, "normalizedCR":Z
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    move/from16 v18, v0

    if-eqz v18, :cond_3dc

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->roundtripSupported:Z

    move/from16 v18, v0

    if-nez v18, :cond_47b

    :cond_3dc
    const/4 v11, 0x1

    .line 1331
    .local v11, "normalizeInput":Z
    :goto_3dd
    const/16 v16, 0x0

    .line 1332
    .local v16, "seenBracket":Z
    const/16 v17, 0x0

    .line 1336
    :cond_3e1
    const/16 v18, 0x5d

    move/from16 v0, v18

    if-ne v7, v0, :cond_482

    .line 1337
    if-eqz v16, :cond_47e

    .line 1338
    const/16 v17, 0x1

    .line 1351
    :cond_3eb
    :goto_3eb
    if-eqz v11, :cond_45b

    .line 1353
    const/16 v18, 0xd

    move/from16 v0, v18

    if-ne v7, v0, :cond_4bc

    .line 1354
    const/4 v12, 0x1

    .line 1355
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 1357
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    move/from16 v18, v0

    if-nez v18, :cond_41f

    .line 1358
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_4a4

    .line 1359
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->joinPC()V

    .line 1366
    :cond_41f
    :goto_41f
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-lt v0, v1, :cond_443

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 1367
    :cond_443
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v19, v0

    add-int/lit8 v20, v19, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    const/16 v20, 0xa

    aput-char v20, v18, v19

    .line 1384
    :cond_45b
    :goto_45b
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v7

    .line 1385
    const/16 v18, 0x3c

    move/from16 v0, v18

    if-eq v7, v0, :cond_46b

    const/16 v18, 0x26

    move/from16 v0, v18

    if-ne v7, v0, :cond_3e1

    .line 1386
    :cond_46b
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    goto/16 :goto_dd

    .line 1329
    .end local v11    # "normalizeInput":Z
    .end local v16    # "seenBracket":Z
    :cond_47b
    const/4 v11, 0x0

    goto/16 :goto_3dd

    .line 1340
    .restart local v11    # "normalizeInput":Z
    .restart local v16    # "seenBracket":Z
    :cond_47e
    const/16 v16, 0x1

    .line 1342
    goto/16 :goto_3eb

    :cond_482
    if-eqz v17, :cond_49c

    const/16 v18, 0x3e

    move/from16 v0, v18

    if-ne v7, v0, :cond_49c

    .line 1343
    new-instance v18, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v19, "characters ]]> are not allowed in content"

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    move-object/from16 v2, p0

    move-object/from16 v3, v20

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v18

    .line 1346
    :cond_49c
    if-eqz v16, :cond_3eb

    .line 1347
    const/16 v16, 0x0

    move/from16 v17, v16

    .local v17, "seenBracketBracket":I
    goto/16 :goto_3eb

    .line 1361
    .end local v17    # "seenBracketBracket":I
    :cond_4a4
    const/16 v18, 0x1

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 1362
    const/16 v18, 0x0

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v0, v18

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    goto/16 :goto_41f

    .line 1368
    :cond_4bc
    const/16 v18, 0xa

    move/from16 v0, v18

    if-ne v7, v0, :cond_50b

    .line 1370
    if-nez v12, :cond_508

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    move/from16 v18, v0

    if-eqz v18, :cond_508

    .line 1371
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-lt v0, v1, :cond_4f0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 1372
    :cond_4f0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v19, v0

    add-int/lit8 v20, v19, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    const/16 v20, 0xa

    aput-char v20, v18, v19

    .line 1374
    :cond_508
    const/4 v12, 0x0

    .line 1375
    goto/16 :goto_45b

    .line 1376
    :cond_50b
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    move/from16 v18, v0

    if-eqz v18, :cond_54d

    .line 1377
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v18

    move/from16 v1, v19

    if-lt v0, v1, :cond_537

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 1378
    :cond_537
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v19, v0

    add-int/lit8 v20, v19, 0x1

    move/from16 v0, v20

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    aput-char v7, v18, v19

    .line 1380
    :cond_54d
    const/4 v12, 0x0

    goto/16 :goto_45b

    .line 1392
    .end local v7    # "ch":C
    .end local v8    # "hadCharData":Z
    .end local v10    # "needsMerging":Z
    .end local v11    # "normalizeInput":Z
    .end local v12    # "normalizedCR":Z
    .end local v16    # "seenBracket":Z
    :cond_550
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->seenRoot:Z

    move/from16 v18, v0

    if-eqz v18, :cond_55e

    .line 1393
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->parseEpilog()I

    move-result v18

    goto/16 :goto_7c

    .line 1395
    :cond_55e
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->parseProlog()I

    move-result v18

    goto/16 :goto_7c
.end method

.method public nextTag()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1078
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->next()I

    .line 1079
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_11

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->isWhitespace()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 1080
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->next()I

    .line 1082
    :cond_11
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3d

    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    const/4 v1, 0x3

    if-eq v0, v1, :cond_3d

    .line 1083
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "expected START_TAG or END_TAG not "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v2, Lorg/xmlpull/v1/XmlPullParser;->TYPES:[Ljava/lang/String;

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getEventType()I

    move-result v3

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v0

    .line 1086
    :cond_3d
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    return v0
.end method

.method public nextText()Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x3

    const/4 v6, 0x0

    .line 1054
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getEventType()I

    move-result v2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_11

    .line 1055
    new-instance v2, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v3, "parser must be on START_TAG to read next text"

    invoke-direct {v2, v3, p0, v6}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v2

    .line 1058
    :cond_11
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->next()I

    move-result v0

    .line 1059
    .local v0, "eventType":I
    const/4 v2, 0x4

    if-ne v0, v2, :cond_43

    .line 1060
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getText()Ljava/lang/String;

    move-result-object v1

    .line 1061
    .local v1, "result":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->next()I

    move-result v0

    .line 1062
    if-eq v0, v4, :cond_47

    .line 1063
    new-instance v2, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "TEXT must be immediately followed by END_TAG and not "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    sget-object v4, Lorg/xmlpull/v1/XmlPullParser;->TYPES:[Ljava/lang/String;

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getEventType()I

    move-result v5

    aget-object v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, p0, v6}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v2

    .line 1068
    .end local v1    # "result":Ljava/lang/String;
    :cond_43
    if-ne v0, v4, :cond_48

    .line 1069
    const-string v1, ""

    :cond_47
    return-object v1

    .line 1071
    :cond_48
    new-instance v2, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v3, "parser must be on START_TAG or TEXT to read text"

    invoke-direct {v2, v3, p0, v6}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public nextToken()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1099
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    .line 1100
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->nextImpl()I

    move-result v0

    return v0
.end method

.method protected parseAttribute()C
    .registers 31
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1909
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v24, v0

    add-int v17, v23, v24

    .line 1910
    .local v17, "prevPosStart":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v24, v0

    add-int v11, v23, v24

    .line 1911
    .local v11, "nameStart":I
    const/4 v5, -0x1

    .line 1912
    .local v5, "colonPos":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v24, v0

    add-int/lit8 v24, v24, -0x1

    aget-char v4, v23, v24

    .line 1913
    .local v4, "ch":C
    const/16 v23, 0x3a

    move/from16 v0, v23

    if-ne v4, v0, :cond_4f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    move/from16 v23, v0

    if-eqz v23, :cond_4f

    new-instance v23, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v24, "when namespaces processing enabled colon can not be at attribute name start"

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p0

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v23

    .line 1918
    :cond_4f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    move/from16 v23, v0

    if-eqz v23, :cond_af

    const/16 v23, 0x78

    move/from16 v0, v23

    if-ne v4, v0, :cond_af

    const/16 v21, 0x1

    .line 1919
    .local v21, "startsWithXmlns":Z
    :goto_5f
    const/16 v22, 0x0

    .line 1921
    .local v22, "xmlnsPos":I
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v4

    .line 1922
    :goto_65
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/xmlpull/mxp1/MXParser;->isNameChar(C)Z

    move-result v23

    if-eqz v23, :cond_11b

    .line 1923
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    move/from16 v23, v0

    if-eqz v23, :cond_115

    .line 1924
    if-eqz v21, :cond_91

    const/16 v23, 0x5

    move/from16 v0, v22

    move/from16 v1, v23

    if-ge v0, v1, :cond_91

    .line 1925
    add-int/lit8 v22, v22, 0x1

    .line 1926
    const/16 v23, 0x1

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_b2

    const/16 v23, 0x6d

    move/from16 v0, v23

    if-eq v4, v0, :cond_91

    const/16 v21, 0x0

    .line 1937
    :cond_91
    :goto_91
    const/16 v23, 0x3a

    move/from16 v0, v23

    if-ne v4, v0, :cond_115

    .line 1938
    const/16 v23, -0x1

    move/from16 v0, v23

    if-eq v5, v0, :cond_105

    new-instance v23, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v24, "only one colon is allowed in attribute name when namespaces are enabled"

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p0

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v23

    .line 1918
    .end local v21    # "startsWithXmlns":Z
    .end local v22    # "xmlnsPos":I
    :cond_af
    const/16 v21, 0x0

    goto :goto_5f

    .line 1927
    .restart local v21    # "startsWithXmlns":Z
    .restart local v22    # "xmlnsPos":I
    :cond_b2
    const/16 v23, 0x2

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_c3

    const/16 v23, 0x6c

    move/from16 v0, v23

    if-eq v4, v0, :cond_91

    const/16 v21, 0x0

    goto :goto_91

    .line 1928
    :cond_c3
    const/16 v23, 0x3

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_d4

    const/16 v23, 0x6e

    move/from16 v0, v23

    if-eq v4, v0, :cond_91

    const/16 v21, 0x0

    goto :goto_91

    .line 1929
    :cond_d4
    const/16 v23, 0x4

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_e5

    const/16 v23, 0x73

    move/from16 v0, v23

    if-eq v4, v0, :cond_91

    const/16 v21, 0x0

    goto :goto_91

    .line 1930
    :cond_e5
    const/16 v23, 0x5

    move/from16 v0, v22

    move/from16 v1, v23

    if-ne v0, v1, :cond_91

    .line 1931
    const/16 v23, 0x3a

    move/from16 v0, v23

    if-eq v4, v0, :cond_91

    new-instance v23, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v24, "after xmlns in attribute name must be colonwhen namespaces are enabled"

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p0

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v23

    .line 1941
    :cond_105
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v24, v0

    add-int v5, v23, v24

    .line 1944
    :cond_115
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v4

    .line 1945
    goto/16 :goto_65

    .line 1947
    :cond_11b
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/xmlpull/mxp1/MXParser;->ensureAttributesCapacity(I)V

    .line 1950
    const/4 v9, 0x0

    .line 1951
    .local v9, "name":Ljava/lang/String;
    const/4 v14, 0x0

    .line 1953
    .local v14, "prefix":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    move/from16 v23, v0

    if-eqz v23, :cond_261

    .line 1954
    const/16 v23, 0x4

    move/from16 v0, v22

    move/from16 v1, v23

    if-ge v0, v1, :cond_13c

    const/16 v21, 0x0

    .line 1955
    :cond_13c
    if-eqz v21, :cond_191

    .line 1956
    const/16 v23, -0x1

    move/from16 v0, v23

    if-eq v5, v0, :cond_184

    .line 1958
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x2

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v24, v0

    sub-int v24, v5, v24

    sub-int v10, v23, v24

    .line 1959
    .local v10, "nameLen":I
    if-nez v10, :cond_16a

    .line 1960
    new-instance v23, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v24, "namespace prefix is required after xmlns:  when namespaces are enabled"

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p0

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v23

    .line 1964
    :cond_16a
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v24, v0

    sub-int v24, v5, v24

    add-int/lit8 v24, v24, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v24

    invoke-virtual {v0, v1, v2, v10}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v9

    .line 2003
    .end local v10    # "nameLen":I
    :cond_184
    :goto_184
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/xmlpull/mxp1/MXParser;->isS(C)Z

    move-result v23

    if-eqz v23, :cond_2b7

    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v4

    goto :goto_184

    .line 1969
    :cond_191
    const/16 v23, -0x1

    move/from16 v0, v23

    if-eq v5, v0, :cond_217

    .line 1970
    sub-int v16, v5, v11

    .line 1971
    .local v16, "prefixLen":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributePrefix:[Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v26, v0

    sub-int v26, v11, v26

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v16

    invoke-virtual {v0, v1, v2, v3}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v14

    .end local v14    # "prefix":Ljava/lang/String;
    aput-object v14, v23, v24

    .line 1974
    .restart local v14    # "prefix":Ljava/lang/String;
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x2

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v24, v0

    sub-int v24, v5, v24

    sub-int v10, v23, v24

    .line 1975
    .restart local v10    # "nameLen":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v26, v0

    sub-int v26, v5, v26

    add-int/lit8 v26, v26, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move/from16 v2, v26

    invoke-virtual {v0, v1, v2, v10}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v9

    .end local v9    # "name":Ljava/lang/String;
    aput-object v9, v23, v24

    .line 1986
    .end local v10    # "nameLen":I
    .end local v16    # "prefixLen":I
    .restart local v9    # "name":Ljava/lang/String;
    :goto_1fb
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    move/from16 v23, v0

    if-nez v23, :cond_184

    .line 1987
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeNameHash:[I

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    move/from16 v24, v0

    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    move-result v25

    aput v25, v23, v24

    goto/16 :goto_184

    .line 1981
    :cond_217
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributePrefix:[Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    move/from16 v24, v0

    const/4 v14, 0x0

    aput-object v14, v23, v24

    .line 1982
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v26, v0

    sub-int v26, v11, v26

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v27, v0

    add-int/lit8 v27, v27, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v28, v0

    sub-int v28, v11, v28

    sub-int v27, v27, v28

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v27

    invoke-virtual {v0, v1, v2, v3}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v9

    .end local v9    # "name":Ljava/lang/String;
    aput-object v9, v23, v24

    .restart local v9    # "name":Ljava/lang/String;
    goto :goto_1fb

    .line 1993
    :cond_261
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v26, v0

    sub-int v26, v11, v26

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v27, v0

    add-int/lit8 v27, v27, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v28, v0

    sub-int v28, v11, v28

    sub-int v27, v27, v28

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    move/from16 v2, v26

    move/from16 v3, v27

    invoke-virtual {v0, v1, v2, v3}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v9

    .end local v9    # "name":Ljava/lang/String;
    aput-object v9, v23, v24

    .line 1997
    .restart local v9    # "name":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    move/from16 v23, v0

    if-nez v23, :cond_184

    .line 1998
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeNameHash:[I

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    move/from16 v24, v0

    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    move-result v25

    aput v25, v23, v24

    goto/16 :goto_184

    .line 2004
    :cond_2b7
    const/16 v23, 0x3d

    move/from16 v0, v23

    if-eq v4, v0, :cond_2cf

    new-instance v23, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v24, "expected = after attribute name"

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p0

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v23

    .line 2006
    :cond_2cf
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v4

    .line 2007
    :goto_2d3
    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lorg/xmlpull/mxp1/MXParser;->isS(C)Z

    move-result v23

    if-eqz v23, :cond_2e0

    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v4

    goto :goto_2d3

    .line 2011
    :cond_2e0
    move v6, v4

    .line 2012
    .local v6, "delimit":C
    const/16 v23, 0x22

    move/from16 v0, v23

    if-eq v6, v0, :cond_316

    const/16 v23, 0x27

    move/from16 v0, v23

    if-eq v6, v0, :cond_316

    new-instance v23, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string v25, "attribute value must start with quotation or apostrophe not "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p0

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v23

    .line 2020
    :cond_316
    const/4 v12, 0x0

    .line 2021
    .local v12, "normalizedCR":Z
    const/16 v23, 0x0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 2022
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v23, v0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    .line 2023
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v23, v0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 2026
    :goto_337
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v4

    .line 2027
    if-ne v4, v6, :cond_3a4

    .line 2093
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    move/from16 v23, v0

    if-eqz v23, :cond_6f7

    if-eqz v21, :cond_6f7

    .line 2094
    const/4 v13, 0x0

    .line 2095
    .local v13, "ns":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    move/from16 v23, v0

    if-nez v23, :cond_5aa

    .line 2096
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v25, v0

    add-int/lit8 v25, v25, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    move/from16 v26, v0

    sub-int v25, v25, v26

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v25

    invoke-virtual {v0, v1, v2, v3}, Lorg/xmlpull/mxp1/MXParser;->newStringIntern([CII)Ljava/lang/String;

    move-result-object v13

    .line 2100
    :goto_378
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/xmlpull/mxp1/MXParser;->ensureNamespacesCapacity(I)V

    .line 2101
    const/4 v15, -0x1

    .line 2102
    .local v15, "prefixHash":I
    const/16 v23, -0x1

    move/from16 v0, v23

    if-eq v5, v0, :cond_691

    .line 2103
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v23

    if-nez v23, :cond_5d2

    .line 2104
    new-instance v23, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v24, "non-default namespace can not be declared to be empty string"

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p0

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v23

    .line 2029
    .end local v13    # "ns":Ljava/lang/String;
    .end local v15    # "prefixHash":I
    :cond_3a4
    const/16 v23, 0x3c

    move/from16 v0, v23

    if-ne v4, v0, :cond_3bc

    .line 2030
    new-instance v23, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v24, "markup not allowed inside attribute value - illegal < "

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p0

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v23

    .line 2032
    :cond_3bc
    const/16 v23, 0x26

    move/from16 v0, v23

    if-ne v4, v0, :cond_4c4

    .line 2034
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 2035
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    move/from16 v23, v0

    if-nez v23, :cond_3f0

    .line 2036
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_461

    const/4 v7, 0x1

    .line 2037
    .local v7, "hadCharData":Z
    :goto_3eb
    if-eqz v7, :cond_463

    .line 2039
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->joinPC()V

    .line 2047
    .end local v7    # "hadCharData":Z
    :cond_3f0
    :goto_3f0
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->parseEntityRef()[C

    move-result-object v18

    .line 2049
    .local v18, "resolvedEntity":[C
    if-nez v18, :cond_47b

    .line 2050
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->entityRefName:Ljava/lang/String;

    move-object/from16 v23, v0

    if-nez v23, :cond_42a

    .line 2051
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    move/from16 v26, v0

    sub-int v25, v25, v26

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v25

    invoke-virtual {v0, v1, v2, v3}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/xmlpull/mxp1/MXParser;->entityRefName:Ljava/lang/String;

    .line 2053
    :cond_42a
    new-instance v23, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string v25, "could not resolve entity named \'"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->entityRefName:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Lorg/xmlpull/mxp1/MXParser;->printable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string v25, "\'"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p0

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v23

    .line 2036
    .end local v18    # "resolvedEntity":[C
    :cond_461
    const/4 v7, 0x0

    goto :goto_3eb

    .line 2041
    .restart local v7    # "hadCharData":Z
    :cond_463
    const/16 v23, 0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 2042
    const/16 v23, 0x0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    goto/16 :goto_3f0

    .line 2058
    .end local v7    # "hadCharData":Z
    .restart local v18    # "resolvedEntity":[C
    :cond_47b
    const/4 v8, 0x0

    .local v8, "i":I
    :goto_47c
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v23, v0

    move/from16 v0, v23

    if-ge v8, v0, :cond_545

    .line 2060
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_4a9

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2061
    :cond_4a9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v24, v0

    add-int/lit8 v25, v24, 0x1

    move/from16 v0, v25

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    aget-char v25, v18, v8

    aput-char v25, v23, v24

    .line 2058
    add-int/lit8 v8, v8, 0x1

    goto :goto_47c

    .line 2063
    .end local v8    # "i":I
    .end local v18    # "resolvedEntity":[C
    :cond_4c4
    const/16 v23, 0x9

    move/from16 v0, v23

    if-eq v4, v0, :cond_4d6

    const/16 v23, 0xa

    move/from16 v0, v23

    if-eq v4, v0, :cond_4d6

    const/16 v23, 0xd

    move/from16 v0, v23

    if-ne v4, v0, :cond_565

    .line 2068
    :cond_4d6
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    move/from16 v23, v0

    if-nez v23, :cond_501

    .line 2069
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, -0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 2070
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-le v0, v1, :cond_54e

    .line 2071
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->joinPC()V

    .line 2078
    :cond_501
    :goto_501
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_525

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2079
    :cond_525
    const/16 v23, 0xa

    move/from16 v0, v23

    if-ne v4, v0, :cond_52d

    if-nez v12, :cond_545

    .line 2080
    :cond_52d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v24, v0

    add-int/lit8 v25, v24, 0x1

    move/from16 v0, v25

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    const/16 v25, 0x20

    aput-char v25, v23, v24

    .line 2089
    :cond_545
    :goto_545
    const/16 v23, 0xd

    move/from16 v0, v23

    if-ne v4, v0, :cond_5a8

    const/4 v12, 0x1

    .line 2090
    :goto_54c
    goto/16 :goto_337

    .line 2073
    :cond_54e
    const/16 v23, 0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 2074
    const/16 v23, 0x0

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    goto :goto_501

    .line 2084
    :cond_565
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    move/from16 v23, v0

    if-eqz v23, :cond_545

    .line 2085
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    array-length v0, v0

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-lt v0, v1, :cond_591

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v23, v0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2086
    :cond_591
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v24, v0

    add-int/lit8 v25, v24, 0x1

    move/from16 v0, v25

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    aput-char v4, v23, v24

    goto :goto_545

    .line 2089
    :cond_5a8
    const/4 v12, 0x0

    goto :goto_54c

    .line 2098
    .restart local v13    # "ns":Ljava/lang/String;
    :cond_5aa
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    move/from16 v24, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v25, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    move/from16 v26, v0

    sub-int v25, v25, v26

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    move/from16 v2, v24

    move/from16 v3, v25

    invoke-virtual {v0, v1, v2, v3}, Lorg/xmlpull/mxp1/MXParser;->newStringIntern([CII)Ljava/lang/String;

    move-result-object v13

    goto/16 :goto_378

    .line 2108
    .restart local v15    # "prefixHash":I
    :cond_5d2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefix:[Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    move/from16 v24, v0

    aput-object v9, v23, v24

    .line 2109
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    move/from16 v23, v0

    if-nez v23, :cond_5fa

    .line 2110
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefixHash:[I

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    move/from16 v24, v0

    invoke-virtual {v9}, Ljava/lang/String;->hashCode()I

    move-result v15

    .end local v15    # "prefixHash":I
    aput v15, v23, v24

    .line 2119
    .restart local v15    # "prefixHash":I
    :cond_5fa
    :goto_5fa
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespaceUri:[Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    move/from16 v24, v0

    aput-object v13, v23, v24

    .line 2122
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elNamespaceCount:[I

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v24, v0

    add-int/lit8 v24, v24, -0x1

    aget v20, v23, v24

    .line 2123
    .local v20, "startNs":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    move/from16 v23, v0

    add-int/lit8 v8, v23, -0x1

    .restart local v8    # "i":I
    :goto_620
    move/from16 v0, v20

    if-lt v8, v0, :cond_6da

    .line 2125
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    move/from16 v23, v0

    if-nez v23, :cond_62e

    if-nez v9, :cond_63a

    :cond_62e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefix:[Ljava/lang/String;

    move-object/from16 v23, v0

    aget-object v23, v23, v8

    move-object/from16 v0, v23

    if-eq v0, v9, :cond_660

    :cond_63a
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    move/from16 v23, v0

    if-nez v23, :cond_6d6

    if-eqz v9, :cond_6d6

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefixHash:[I

    move-object/from16 v23, v0

    aget v23, v23, v8

    move/from16 v0, v23

    if-ne v0, v15, :cond_6d6

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefix:[Ljava/lang/String;

    move-object/from16 v23, v0

    aget-object v23, v23, v8

    move-object/from16 v0, v23

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    if-eqz v23, :cond_6d6

    .line 2131
    :cond_660
    if-nez v9, :cond_6ba

    const-string v19, "default"

    .line 2132
    .local v19, "s":Ljava/lang/String;
    :goto_664
    new-instance v23, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string v25, "duplicated namespace declaration for "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string v25, " prefix"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    move-object/from16 v2, p0

    move-object/from16 v3, v25

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v23

    .line 2114
    .end local v8    # "i":I
    .end local v19    # "s":Ljava/lang/String;
    .end local v20    # "startNs":I
    :cond_691
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefix:[Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    move/from16 v24, v0

    const/16 v25, 0x0

    aput-object v25, v23, v24

    .line 2115
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    move/from16 v23, v0

    if-nez v23, :cond_5fa

    .line 2116
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespacePrefixHash:[I

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    move/from16 v24, v0

    const/4 v15, -0x1

    aput v15, v23, v24

    goto/16 :goto_5fa

    .line 2131
    .restart local v8    # "i":I
    .restart local v20    # "startNs":I
    :cond_6ba
    new-instance v23, Ljava/lang/StringBuffer;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuffer;-><init>()V

    const-string v24, "\'"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    const-string v24, "\'"

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    goto :goto_664

    .line 2123
    :cond_6d6
    add-int/lit8 v8, v8, -0x1

    goto/16 :goto_620

    .line 2137
    :cond_6da
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, 0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    .line 2149
    .end local v8    # "i":I
    .end local v13    # "ns":Ljava/lang/String;
    .end local v15    # "prefixHash":I
    .end local v20    # "startNs":I
    :goto_6e8
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v23, v0

    sub-int v23, v17, v23

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 2150
    return v4

    .line 2140
    :cond_6f7
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    move/from16 v23, v0

    if-nez v23, :cond_73d

    .line 2141
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeValue:[Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    move/from16 v24, v0

    new-instance v25, Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v28, v0

    add-int/lit8 v28, v28, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    move/from16 v29, v0

    sub-int v28, v28, v29

    invoke-direct/range {v25 .. v28}, Ljava/lang/String;-><init>([CII)V

    aput-object v25, v23, v24

    .line 2147
    :goto_72e
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    move/from16 v23, v0

    add-int/lit8 v23, v23, 0x1

    move/from16 v0, v23

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    goto :goto_6e8

    .line 2144
    :cond_73d
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeValue:[Ljava/lang/String;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    move/from16 v24, v0

    new-instance v25, Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    move-object/from16 v26, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    move/from16 v27, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    move/from16 v28, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    move/from16 v29, v0

    sub-int v28, v28, v29

    invoke-direct/range {v25 .. v28}, Ljava/lang/String;-><init>([CII)V

    aput-object v25, v23, v24

    goto :goto_72e
.end method

.method protected parseCDSect(Z)V
    .registers 16
    .param p1, "hadCharData"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v13, 0x41

    const/16 v12, 0xa

    const/4 v9, 0x1

    const/4 v5, 0x0

    const/4 v11, 0x0

    .line 2819
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 2820
    .local v1, "ch":C
    const/16 v10, 0x43

    if-eq v1, v10, :cond_17

    new-instance v9, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v10, "expected <[CDATA[ for comment start"

    invoke-direct {v9, v10, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v9

    .line 2822
    :cond_17
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 2823
    const/16 v10, 0x44

    if-eq v1, v10, :cond_27

    new-instance v9, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v10, "expected <[CDATA[ for comment start"

    invoke-direct {v9, v10, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v9

    .line 2825
    :cond_27
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 2826
    if-eq v1, v13, :cond_35

    new-instance v9, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v10, "expected <[CDATA[ for comment start"

    invoke-direct {v9, v10, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v9

    .line 2828
    :cond_35
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 2829
    const/16 v10, 0x54

    if-eq v1, v10, :cond_45

    new-instance v9, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v10, "expected <[CDATA[ for comment start"

    invoke-direct {v9, v10, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v9

    .line 2831
    :cond_45
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 2832
    if-eq v1, v13, :cond_53

    new-instance v9, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v10, "expected <[CDATA[ for comment start"

    invoke-direct {v9, v10, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v9

    .line 2834
    :cond_53
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 2835
    const/16 v10, 0x5b

    if-eq v1, v10, :cond_63

    new-instance v9, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v10, "expected <![CDATA[ for comment start"

    invoke-direct {v9, v10, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v9

    .line 2839
    :cond_63
    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    add-int v0, v10, v11

    .line 2840
    .local v0, "cdStart":I
    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->lineNumber:I

    .line 2841
    .local v3, "curLine":I
    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->columnNumber:I

    .line 2842
    .local v2, "curColumn":I
    iget-boolean v10, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v10, :cond_75

    iget-boolean v10, p0, Lorg/xmlpull/mxp1/MXParser;->roundtripSupported:Z

    if-nez v10, :cond_76

    :cond_75
    move v5, v9

    .line 2844
    .local v5, "normalizeInput":Z
    :cond_76
    if-eqz v5, :cond_87

    .line 2845
    if-eqz p1, :cond_87

    .line 2846
    :try_start_7a
    iget-boolean v9, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-nez v9, :cond_87

    .line 2848
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    if-le v9, v10, :cond_f8

    .line 2849
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->joinPC()V

    .line 2857
    :cond_87
    :goto_87
    const/4 v7, 0x0

    .line 2858
    .local v7, "seenBracket":Z
    const/4 v8, 0x0

    .line 2859
    .local v8, "seenBracketBracket":Z
    const/4 v6, 0x0

    .line 2862
    .local v6, "normalizedCR":Z
    :cond_8a
    :goto_8a
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 2863
    const/16 v9, 0x5d

    if-ne v1, v9, :cond_103

    .line 2864
    if-nez v7, :cond_101

    .line 2865
    const/4 v7, 0x1

    .line 2882
    :cond_95
    :goto_95
    if-eqz v5, :cond_8a

    .line 2884
    const/16 v9, 0xd

    if-ne v1, v9, :cond_136

    .line 2885
    const/4 v6, 0x1

    .line 2886
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    sub-int v9, v0, v9

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 2887
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v9, v9, -0x1

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 2888
    iget-boolean v9, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-nez v9, :cond_b5

    .line 2889
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    if-le v9, v10, :cond_12d

    .line 2890
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->joinPC()V

    .line 2897
    :cond_b5
    :goto_b5
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v10, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v10, v10

    if-lt v9, v10, :cond_c1

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v9}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2898
    :cond_c1
    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    const/16 v11, 0xa

    aput-char v11, v9, v10
    :try_end_cd
    .catch Ljava/io/EOFException; {:try_start_7a .. :try_end_cd} :catch_ce

    goto :goto_8a

    .line 2914
    .end local v6    # "normalizedCR":Z
    .end local v7    # "seenBracket":Z
    .end local v8    # "seenBracketBracket":Z
    :catch_ce
    move-exception v4

    .line 2916
    .local v4, "ex":Ljava/io/EOFException;
    new-instance v9, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "CDATA section started on line "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " and column "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " was not closed"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, p0, v4}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v9

    .line 2851
    .end local v4    # "ex":Ljava/io/EOFException;
    :cond_f8
    const/4 v9, 0x1

    :try_start_f9
    iput-boolean v9, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 2852
    const/4 v9, 0x0

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I
    :try_end_100
    .catch Ljava/io/EOFException; {:try_start_f9 .. :try_end_100} :catch_ce

    goto :goto_87

    .line 2867
    .restart local v6    # "normalizedCR":Z
    .restart local v7    # "seenBracket":Z
    .restart local v8    # "seenBracketBracket":Z
    :cond_101
    const/4 v8, 0x1

    .line 2870
    goto :goto_95

    :cond_103
    const/16 v9, 0x3e

    if-ne v1, v9, :cond_128

    .line 2871
    if-eqz v7, :cond_124

    if-eqz v8, :cond_124

    .line 2920
    if-eqz v5, :cond_117

    .line 2921
    iget-boolean v9, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v9, :cond_117

    .line 2922
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v9, v9, -0x2

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    .line 2925
    :cond_117
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    sub-int v9, v0, v9

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 2926
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v9, v9, -0x3

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 2927
    return-void

    .line 2874
    :cond_124
    const/4 v8, 0x0

    .line 2876
    const/4 v7, 0x0

    .line 2877
    goto/16 :goto_95

    .line 2878
    :cond_128
    if-eqz v7, :cond_95

    .line 2879
    const/4 v7, 0x0

    goto/16 :goto_95

    .line 2892
    :cond_12d
    const/4 v9, 0x1

    :try_start_12e
    iput-boolean v9, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 2893
    const/4 v9, 0x0

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    goto :goto_b5

    .line 2899
    :cond_136
    if-ne v1, v12, :cond_159

    .line 2900
    if-nez v6, :cond_156

    iget-boolean v9, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v9, :cond_156

    .line 2901
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v10, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v10, v10

    if-lt v9, v10, :cond_14a

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v9}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2902
    :cond_14a
    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    const/16 v11, 0xa

    aput-char v11, v9, v10

    .line 2904
    :cond_156
    const/4 v6, 0x0

    .line 2905
    goto/16 :goto_8a

    .line 2906
    :cond_159
    iget-boolean v9, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v9, :cond_173

    .line 2907
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v10, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v10, v10

    if-lt v9, v10, :cond_169

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v9}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2908
    :cond_169
    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    aput-char v1, v9, v10
    :try_end_173
    .catch Ljava/io/EOFException; {:try_start_12e .. :try_end_173} :catch_ce

    .line 2910
    :cond_173
    const/4 v6, 0x0

    .line 2912
    goto/16 :goto_8a
.end method

.method protected parseComment()V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v13, 0x3e

    const/16 v12, 0x2d

    const/4 v8, 0x0

    const/16 v11, 0xa

    const/4 v4, 0x1

    .line 2320
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2321
    .local v0, "ch":C
    if-eq v0, v12, :cond_17

    new-instance v8, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v9, "expected <!-- for comment start"

    const/4 v10, 0x0

    invoke-direct {v8, v9, p0, v10}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v8

    .line 2323
    :cond_17
    iget-boolean v9, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v9, :cond_1f

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 2325
    :cond_1f
    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->lineNumber:I

    .line 2326
    .local v2, "curLine":I
    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->columnNumber:I

    .line 2328
    .local v1, "curColumn":I
    :try_start_23
    iget-boolean v9, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-ne v9, v4, :cond_7e

    iget-boolean v9, p0, Lorg/xmlpull/mxp1/MXParser;->roundtripSupported:Z

    if-nez v9, :cond_7e

    .line 2329
    .local v4, "normalizeIgnorableWS":Z
    :goto_2b
    const/4 v5, 0x0

    .line 2331
    .local v5, "normalizedCR":Z
    const/4 v6, 0x0

    .line 2332
    .local v6, "seenDash":Z
    const/4 v7, 0x0

    .line 2335
    .local v7, "seenDashDash":Z
    :cond_2e
    :goto_2e
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2336
    if-eqz v7, :cond_80

    if-eq v0, v13, :cond_80

    .line 2337
    new-instance v8, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "in comment after two dashes (--) next character must be > not "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-direct {v8, v9, p0, v10}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v8
    :try_end_54
    .catch Ljava/io/EOFException; {:try_start_23 .. :try_end_54} :catch_54

    .line 2392
    .end local v4    # "normalizeIgnorableWS":Z
    .end local v5    # "normalizedCR":Z
    .end local v6    # "seenDash":Z
    .end local v7    # "seenDashDash":Z
    :catch_54
    move-exception v3

    .line 2394
    .local v3, "ex":Ljava/io/EOFException;
    new-instance v8, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string v10, "comment started on line "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " and column "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string v10, " was not closed"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, p0, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v8

    .end local v3    # "ex":Ljava/io/EOFException;
    :cond_7e
    move v4, v8

    .line 2328
    goto :goto_2b

    .line 2341
    .restart local v4    # "normalizeIgnorableWS":Z
    .restart local v5    # "normalizedCR":Z
    .restart local v6    # "seenDash":Z
    .restart local v7    # "seenDashDash":Z
    :cond_80
    if-ne v0, v12, :cond_bc

    .line 2342
    if-nez v6, :cond_b9

    .line 2343
    const/4 v6, 0x1

    .line 2358
    :goto_85
    if-eqz v4, :cond_2e

    .line 2359
    const/16 v8, 0xd

    if-ne v0, v8, :cond_e3

    .line 2360
    const/4 v5, 0x1

    .line 2364
    :try_start_8c
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-nez v8, :cond_9f

    .line 2365
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v8, v8, -0x1

    iput v8, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 2366
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    if-le v8, v9, :cond_da

    .line 2367
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->joinPC()V

    .line 2374
    :cond_9f
    :goto_9f
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v9, v9

    if-lt v8, v9, :cond_ab

    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v8}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2375
    :cond_ab
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    const/16 v10, 0xa

    aput-char v10, v8, v9
    :try_end_b7
    .catch Ljava/io/EOFException; {:try_start_8c .. :try_end_b7} :catch_54

    goto/16 :goto_2e

    .line 2345
    :cond_b9
    const/4 v7, 0x1

    .line 2346
    const/4 v6, 0x0

    .line 2348
    goto :goto_85

    :cond_bc
    if-ne v0, v13, :cond_d8

    .line 2349
    if-eqz v7, :cond_d5

    .line 2398
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v8, :cond_d4

    .line 2399
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v8, v8, -0x3

    iput v8, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 2400
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v8, :cond_d4

    .line 2401
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v8, v8, -0x2

    iput v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    .line 2404
    :cond_d4
    return-void

    .line 2352
    :cond_d5
    const/4 v7, 0x0

    .line 2354
    const/4 v6, 0x0

    .line 2355
    goto :goto_85

    .line 2356
    :cond_d8
    const/4 v6, 0x0

    goto :goto_85

    .line 2369
    :cond_da
    const/4 v8, 0x1

    :try_start_db
    iput-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 2370
    const/4 v8, 0x0

    iput v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iput v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    goto :goto_9f

    .line 2376
    :cond_e3
    if-ne v0, v11, :cond_106

    .line 2377
    if-nez v5, :cond_103

    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v8, :cond_103

    .line 2378
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v9, v9

    if-lt v8, v9, :cond_f7

    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v8}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2379
    :cond_f7
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    const/16 v10, 0xa

    aput-char v10, v8, v9

    .line 2381
    :cond_103
    const/4 v5, 0x0

    .line 2382
    goto/16 :goto_2e

    .line 2383
    :cond_106
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v8, :cond_120

    .line 2384
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v9, v9

    if-lt v8, v9, :cond_116

    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v8}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2385
    :cond_116
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    aput-char v0, v8, v9
    :try_end_120
    .catch Ljava/io/EOFException; {:try_start_db .. :try_end_120} :catch_54

    .line 2387
    :cond_120
    const/4 v5, 0x0

    .line 2389
    goto/16 :goto_2e
.end method

.method protected parseDocdecl()V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/16 v9, 0xa

    const/4 v4, 0x1

    const/4 v7, 0x0

    .line 2740
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 2741
    .local v1, "ch":C
    const/16 v6, 0x4f

    if-eq v1, v6, :cond_15

    new-instance v4, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v5, "expected <!DOCTYPE"

    invoke-direct {v4, v5, p0, v7}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v4

    .line 2743
    :cond_15
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 2744
    const/16 v6, 0x43

    if-eq v1, v6, :cond_25

    new-instance v4, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v5, "expected <!DOCTYPE"

    invoke-direct {v4, v5, p0, v7}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v4

    .line 2746
    :cond_25
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 2747
    const/16 v6, 0x54

    if-eq v1, v6, :cond_35

    new-instance v4, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v5, "expected <!DOCTYPE"

    invoke-direct {v4, v5, p0, v7}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v4

    .line 2749
    :cond_35
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 2750
    const/16 v6, 0x59

    if-eq v1, v6, :cond_45

    new-instance v4, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v5, "expected <!DOCTYPE"

    invoke-direct {v4, v5, p0, v7}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v4

    .line 2752
    :cond_45
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 2753
    const/16 v6, 0x50

    if-eq v1, v6, :cond_55

    new-instance v4, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v5, "expected <!DOCTYPE"

    invoke-direct {v4, v5, p0, v7}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v4

    .line 2755
    :cond_55
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 2756
    const/16 v6, 0x45

    if-eq v1, v6, :cond_65

    new-instance v4, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v5, "expected <!DOCTYPE"

    invoke-direct {v4, v5, p0, v7}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v4

    .line 2758
    :cond_65
    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    iput v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 2763
    const/4 v0, 0x0

    .line 2764
    .local v0, "bracketLevel":I
    iget-boolean v6, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-ne v6, v4, :cond_91

    iget-boolean v6, p0, Lorg/xmlpull/mxp1/MXParser;->roundtripSupported:Z

    if-nez v6, :cond_91

    move v2, v4

    .line 2765
    .local v2, "normalizeIgnorableWS":Z
    :goto_73
    const/4 v3, 0x0

    .line 2767
    .local v3, "normalizedCR":Z
    :cond_74
    :goto_74
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 2768
    const/16 v6, 0x5b

    if-ne v1, v6, :cond_7e

    add-int/lit8 v0, v0, 0x1

    .line 2769
    :cond_7e
    const/16 v6, 0x5d

    if-ne v1, v6, :cond_84

    add-int/lit8 v0, v0, -0x1

    .line 2770
    :cond_84
    const/16 v6, 0x3e

    if-ne v1, v6, :cond_93

    if-nez v0, :cond_93

    .line 2805
    iget v4, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 2806
    return-void

    .end local v2    # "normalizeIgnorableWS":Z
    .end local v3    # "normalizedCR":Z
    :cond_91
    move v2, v5

    .line 2764
    goto :goto_73

    .line 2771
    .restart local v2    # "normalizeIgnorableWS":Z
    .restart local v3    # "normalizedCR":Z
    :cond_93
    if-eqz v2, :cond_74

    .line 2772
    const/16 v6, 0xd

    if-ne v1, v6, :cond_cb

    .line 2773
    const/4 v3, 0x1

    .line 2777
    iget-boolean v6, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-nez v6, :cond_ad

    .line 2778
    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v6, v6, -0x1

    iput v6, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 2779
    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    if-le v6, v7, :cond_c4

    .line 2780
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->joinPC()V

    .line 2787
    :cond_ad
    :goto_ad
    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v7, v7

    if-lt v6, v7, :cond_b9

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v6}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2788
    :cond_b9
    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    aput-char v9, v6, v7

    goto :goto_74

    .line 2782
    :cond_c4
    iput-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 2783
    iput v5, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iput v5, p0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    goto :goto_ad

    .line 2789
    :cond_cb
    if-ne v1, v9, :cond_eb

    .line 2790
    if-nez v3, :cond_e9

    iget-boolean v6, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v6, :cond_e9

    .line 2791
    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v7, v7

    if-lt v6, v7, :cond_df

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v6}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2792
    :cond_df
    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    aput-char v9, v6, v7

    .line 2794
    :cond_e9
    const/4 v3, 0x0

    .line 2795
    goto :goto_74

    .line 2796
    :cond_eb
    iget-boolean v6, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v6, :cond_105

    .line 2797
    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v7, v7

    if-lt v6, v7, :cond_fb

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v6}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2798
    :cond_fb
    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    aput-char v1, v6, v7

    .line 2800
    :cond_105
    const/4 v3, 0x0

    .line 2802
    goto/16 :goto_74
.end method

.method public parseEndTag()I
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    const/4 v13, 0x0

    .line 1663
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 1664
    .local v1, "ch":C
    invoke-virtual {p0, v1}, Lorg/xmlpull/mxp1/MXParser;->isNameStartChar(C)Z

    move-result v9

    if-nez v9, :cond_29

    .line 1665
    new-instance v9, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "expected name start and not "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {p0, v1}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, p0, v13}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v9

    .line 1668
    :cond_29
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v9, v9, -0x3

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 1669
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v9, v9, -0x1

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    add-int v5, v9, v10

    .line 1671
    .local v5, "nameStart":I
    :cond_37
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    .line 1672
    invoke-virtual {p0, v1}, Lorg/xmlpull/mxp1/MXParser;->isNameChar(C)Z

    move-result v9

    if-nez v9, :cond_37

    .line 1681
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    sub-int v6, v5, v9

    .line 1683
    .local v6, "off":I
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v9, v9, -0x1

    sub-int v4, v9, v6

    .line 1684
    .local v4, "len":I
    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->elRawName:[[C

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    aget-object v0, v9, v10

    .line 1685
    .local v0, "cbuf":[C
    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->elRawNameEnd:[I

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    aget v9, v9, v10

    if-eq v9, v4, :cond_a4

    .line 1687
    new-instance v8, Ljava/lang/String;

    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->elRawNameEnd:[I

    iget v10, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    aget v9, v9, v10

    invoke-direct {v8, v0, v11, v9}, Ljava/lang/String;-><init>([CII)V

    .line 1688
    .local v8, "startname":Ljava/lang/String;
    new-instance v2, Ljava/lang/String;

    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    invoke-direct {v2, v9, v6, v4}, Ljava/lang/String;-><init>([CII)V

    .line 1689
    .local v2, "endname":Ljava/lang/String;
    new-instance v9, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "end tag name </"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "> must match start tag name <"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, ">"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " from line "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->elRawNameLine:[I

    iget v12, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    aget v11, v11, v12

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, p0, v13}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v9

    .line 1693
    .end local v2    # "endname":Ljava/lang/String;
    .end local v8    # "startname":Ljava/lang/String;
    :cond_a4
    const/4 v3, 0x0

    .local v3, "i":I
    move v7, v6

    .end local v6    # "off":I
    .local v7, "off":I
    :goto_a6
    if-ge v3, v4, :cond_ff

    .line 1695
    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    add-int/lit8 v6, v7, 0x1

    .end local v7    # "off":I
    .restart local v6    # "off":I
    aget-char v9, v9, v7

    aget-char v10, v0, v3

    if-eq v9, v10, :cond_fb

    .line 1697
    new-instance v8, Ljava/lang/String;

    invoke-direct {v8, v0, v11, v4}, Ljava/lang/String;-><init>([CII)V

    .line 1698
    .restart local v8    # "startname":Ljava/lang/String;
    new-instance v2, Ljava/lang/String;

    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    sub-int v10, v6, v3

    add-int/lit8 v10, v10, -0x1

    invoke-direct {v2, v9, v10, v4}, Ljava/lang/String;-><init>([CII)V

    .line 1699
    .restart local v2    # "endname":Ljava/lang/String;
    new-instance v9, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "end tag name </"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, "> must be the same as start tag <"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, ">"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " from line "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->elRawNameLine:[I

    iget v12, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    aget v11, v11, v12

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, p0, v13}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v9

    .line 1693
    .end local v2    # "endname":Ljava/lang/String;
    .end local v8    # "startname":Ljava/lang/String;
    :cond_fb
    add-int/lit8 v3, v3, 0x1

    move v7, v6

    .end local v6    # "off":I
    .restart local v7    # "off":I
    goto :goto_a6

    .line 1705
    :cond_ff
    :goto_ff
    invoke-virtual {p0, v1}, Lorg/xmlpull/mxp1/MXParser;->isS(C)Z

    move-result v9

    if-eqz v9, :cond_10a

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v1

    goto :goto_ff

    .line 1706
    :cond_10a
    const/16 v9, 0x3e

    if-eq v1, v9, :cond_13b

    .line 1707
    new-instance v9, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string v11, "expected > to finish end tag not "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {p0, v1}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string v11, " from line "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->elRawNameLine:[I

    iget v12, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    aget v11, v11, v12

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, p0, v13}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v9

    .line 1715
    :cond_13b
    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 1716
    const/4 v9, 0x1

    iput-boolean v9, p0, Lorg/xmlpull/mxp1/MXParser;->pastEndTag:Z

    .line 1717
    const/4 v9, 0x3

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    return v9
.end method

.method protected parseEntityRef()[C
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x74

    const/16 v9, 0x61

    const/16 v8, 0x3b

    const/4 v4, 0x0

    const/4 v7, 0x0

    .line 2162
    iput-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->entityRefName:Ljava/lang/String;

    .line 2163
    iget v5, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    iput v5, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 2164
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2165
    .local v0, "ch":C
    const/16 v5, 0x23

    if-ne v0, v5, :cond_b9

    .line 2167
    const/4 v1, 0x0

    .line 2168
    .local v1, "charRef":C
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2169
    const/16 v5, 0x78

    if-ne v0, v5, :cond_87

    .line 2172
    :goto_1f
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2173
    const/16 v5, 0x30

    if-lt v0, v5, :cond_32

    const/16 v5, 0x39

    if-gt v0, v5, :cond_32

    .line 2174
    mul-int/lit8 v5, v1, 0x10

    add-int/lit8 v6, v0, -0x30

    add-int/2addr v5, v6

    int-to-char v1, v5

    .line 2175
    goto :goto_1f

    :cond_32
    if-lt v0, v9, :cond_3f

    const/16 v5, 0x66

    if-gt v0, v5, :cond_3f

    .line 2176
    mul-int/lit8 v5, v1, 0x10

    add-int/lit8 v6, v0, -0x57

    add-int/2addr v5, v6

    int-to-char v1, v5

    .line 2177
    goto :goto_1f

    :cond_3f
    const/16 v5, 0x41

    if-lt v0, v5, :cond_4e

    const/16 v5, 0x46

    if-gt v0, v5, :cond_4e

    .line 2178
    mul-int/lit8 v5, v1, 0x10

    add-int/lit8 v6, v0, -0x37

    add-int/2addr v5, v6

    int-to-char v1, v5

    .line 2179
    goto :goto_1f

    :cond_4e
    if-ne v0, v8, :cond_6a

    .line 2202
    :cond_50
    iget v4, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 2203
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->charRefOneCharBuf:[C

    aput-char v1, v4, v7

    .line 2204
    iget-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v4, :cond_67

    .line 2205
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->charRefOneCharBuf:[C

    const/4 v5, 0x1

    invoke-virtual {p0, v4, v7, v5}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    .line 2207
    :cond_67
    iget-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->charRefOneCharBuf:[C

    .line 2276
    .end local v1    # "charRef":C
    :cond_69
    :goto_69
    return-object v3

    .line 2182
    .restart local v1    # "charRef":C
    :cond_6a
    new-instance v5, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "character reference (with hex value) may not contain "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, p0, v4}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v5

    .line 2190
    :cond_87
    :goto_87
    const/16 v5, 0x30

    if-lt v0, v5, :cond_9a

    const/16 v5, 0x39

    if-gt v0, v5, :cond_9a

    .line 2191
    mul-int/lit8 v5, v1, 0xa

    add-int/lit8 v6, v0, -0x30

    add-int/2addr v5, v6

    int-to-char v1, v5

    .line 2199
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2200
    goto :goto_87

    .line 2192
    :cond_9a
    if-eq v0, v8, :cond_50

    .line 2195
    new-instance v5, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "character reference (with decimal value) may not contain "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, p0, v4}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v5

    .line 2211
    .end local v1    # "charRef":C
    :cond_b9
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->isNameStartChar(C)Z

    move-result v5

    if-nez v5, :cond_e2

    .line 2212
    new-instance v5, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "entity reference names can not start with character \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, p0, v4}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v5

    .line 2217
    :cond_e2
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2218
    if-ne v0, v8, :cond_11d

    .line 2227
    iget v5, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 2229
    iget v5, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    sub-int v2, v5, v6

    .line 2230
    .local v2, "len":I
    const/4 v5, 0x2

    if-ne v2, v5, :cond_146

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    aget-char v5, v5, v6

    const/16 v6, 0x6c

    if-ne v5, v6, :cond_146

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    add-int/lit8 v6, v6, 0x1

    aget-char v5, v5, v6

    if-ne v5, v10, :cond_146

    .line 2231
    iget-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v4, :cond_113

    .line 2232
    const-string v4, "<"

    iput-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    .line 2234
    :cond_113
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->charRefOneCharBuf:[C

    const/16 v5, 0x3c

    aput-char v5, v4, v7

    .line 2235
    iget-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->charRefOneCharBuf:[C

    goto/16 :goto_69

    .line 2221
    .end local v2    # "len":I
    :cond_11d
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->isNameChar(C)Z

    move-result v5

    if-nez v5, :cond_e2

    .line 2222
    new-instance v5, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string v7, "entity reference name can not contain character "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string v7, "\'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, p0, v4}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v5

    .line 2240
    .restart local v2    # "len":I
    :cond_146
    const/4 v5, 0x3

    if-ne v2, v5, :cond_17b

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    aget-char v5, v5, v6

    if-ne v5, v9, :cond_17b

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    add-int/lit8 v6, v6, 0x1

    aget-char v5, v5, v6

    const/16 v6, 0x6d

    if-ne v5, v6, :cond_17b

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    add-int/lit8 v6, v6, 0x2

    aget-char v5, v5, v6

    const/16 v6, 0x70

    if-ne v5, v6, :cond_17b

    .line 2242
    iget-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v4, :cond_171

    .line 2243
    const-string v4, "&"

    iput-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    .line 2245
    :cond_171
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->charRefOneCharBuf:[C

    const/16 v5, 0x26

    aput-char v5, v4, v7

    .line 2246
    iget-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->charRefOneCharBuf:[C

    goto/16 :goto_69

    .line 2247
    :cond_17b
    const/4 v5, 0x2

    if-ne v2, v5, :cond_1a4

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    aget-char v5, v5, v6

    const/16 v6, 0x67

    if-ne v5, v6, :cond_1a4

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    add-int/lit8 v6, v6, 0x1

    aget-char v5, v5, v6

    if-ne v5, v10, :cond_1a4

    .line 2248
    iget-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v4, :cond_19a

    .line 2249
    const-string v4, ">"

    iput-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    .line 2251
    :cond_19a
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->charRefOneCharBuf:[C

    const/16 v5, 0x3e

    aput-char v5, v4, v7

    .line 2252
    iget-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->charRefOneCharBuf:[C

    goto/16 :goto_69

    .line 2253
    :cond_1a4
    const/4 v5, 0x4

    if-ne v2, v5, :cond_1e5

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    aget-char v5, v5, v6

    if-ne v5, v9, :cond_1e5

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    add-int/lit8 v6, v6, 0x1

    aget-char v5, v5, v6

    const/16 v6, 0x70

    if-ne v5, v6, :cond_1e5

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    add-int/lit8 v6, v6, 0x2

    aget-char v5, v5, v6

    const/16 v6, 0x6f

    if-ne v5, v6, :cond_1e5

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    add-int/lit8 v6, v6, 0x3

    aget-char v5, v5, v6

    const/16 v6, 0x73

    if-ne v5, v6, :cond_1e5

    .line 2256
    iget-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v4, :cond_1db

    .line 2257
    const-string v4, "\'"

    iput-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    .line 2259
    :cond_1db
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->charRefOneCharBuf:[C

    const/16 v5, 0x27

    aput-char v5, v4, v7

    .line 2260
    iget-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->charRefOneCharBuf:[C

    goto/16 :goto_69

    .line 2261
    :cond_1e5
    const/4 v5, 0x4

    if-ne v2, v5, :cond_226

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    aget-char v5, v5, v6

    const/16 v6, 0x71

    if-ne v5, v6, :cond_226

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    add-int/lit8 v6, v6, 0x1

    aget-char v5, v5, v6

    const/16 v6, 0x75

    if-ne v5, v6, :cond_226

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    add-int/lit8 v6, v6, 0x2

    aget-char v5, v5, v6

    const/16 v6, 0x6f

    if-ne v5, v6, :cond_226

    iget-object v5, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    add-int/lit8 v6, v6, 0x3

    aget-char v5, v5, v6

    if-ne v5, v10, :cond_226

    .line 2264
    iget-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v4, :cond_21c

    .line 2265
    const-string v4, "\""

    iput-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    .line 2267
    :cond_21c
    iget-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->charRefOneCharBuf:[C

    const/16 v5, 0x22

    aput-char v5, v4, v7

    .line 2268
    iget-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->charRefOneCharBuf:[C

    goto/16 :goto_69

    .line 2270
    :cond_226
    invoke-virtual {p0, v2}, Lorg/xmlpull/mxp1/MXParser;->lookuEntityReplacement(I)[C

    move-result-object v3

    .line 2271
    .local v3, "result":[C
    if-nez v3, :cond_69

    .line 2275
    iget-boolean v5, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v5, :cond_232

    iput-object v4, p0, Lorg/xmlpull/mxp1/MXParser;->text:Ljava/lang/String;

    :cond_232
    move-object v3, v4

    .line 2276
    goto/16 :goto_69
.end method

.method protected parseEpilog()I
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x7

    const/4 v3, 0x0

    const/16 v7, 0xa

    const/4 v9, 0x0

    const/4 v5, 0x1

    .line 1530
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    if-ne v8, v5, :cond_12

    .line 1531
    new-instance v5, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v6, "already reached end of XML input"

    invoke-direct {v5, v6, p0, v9}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v5

    .line 1533
    :cond_12
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->reachedEnd:Z

    if-eqz v8, :cond_19

    .line 1534
    iput v5, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    .line 1653
    :goto_18
    return v5

    .line 1536
    :cond_19
    const/4 v2, 0x0

    .line 1537
    .local v2, "gotS":Z
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-ne v8, v5, :cond_23

    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->roundtripSupported:Z

    if-nez v8, :cond_23

    move v3, v5

    .line 1538
    .local v3, "normalizeIgnorableWS":Z
    :cond_23
    const/4 v4, 0x0

    .line 1542
    .local v4, "normalizedCR":Z
    :try_start_24
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->seenMarkup:Z

    if-eqz v8, :cond_55

    .line 1543
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v9, v9, -0x1

    aget-char v0, v8, v9

    .line 1547
    .local v0, "ch":C
    :goto_30
    const/4 v8, 0x0

    iput-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->seenMarkup:Z

    .line 1548
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v8, v8, -0x1

    iput v8, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 1549
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->reachedEnd:Z

    if-nez v8, :cond_62

    .line 1553
    :cond_3d
    const/16 v8, 0x3c

    if-ne v0, v8, :cond_13b

    .line 1554
    if-eqz v2, :cond_5a

    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v8, :cond_5a

    .line 1555
    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 1556
    const/4 v7, 0x1

    iput-boolean v7, p0, Lorg/xmlpull/mxp1/MXParser;->seenMarkup:Z

    .line 1557
    const/4 v7, 0x7

    iput v7, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    move v5, v6

    goto :goto_18

    .line 1545
    .end local v0    # "ch":C
    :cond_55
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .restart local v0    # "ch":C
    goto :goto_30

    .line 1559
    :cond_5a
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 1560
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->reachedEnd:Z
    :try_end_60
    .catch Ljava/io/EOFException; {:try_start_24 .. :try_end_60} :catch_d3

    if-eqz v8, :cond_74

    .line 1648
    .end local v0    # "ch":C
    :cond_62
    :goto_62
    iget-boolean v7, p0, Lorg/xmlpull/mxp1/MXParser;->reachedEnd:Z

    if-eqz v7, :cond_1e7

    .line 1649
    iget-boolean v7, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v7, :cond_1e3

    if-eqz v2, :cond_1e3

    .line 1650
    iget v5, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    iput v5, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 1651
    iput v6, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    move v5, v6

    goto :goto_18

    .line 1563
    .restart local v0    # "ch":C
    :cond_74
    const/16 v8, 0x3f

    if-ne v0, v8, :cond_85

    .line 1566
    :try_start_78
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->parsePI()Z

    .line 1567
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v8, :cond_174

    const/16 v7, 0x8

    iput v7, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    move v5, v7

    goto :goto_18

    .line 1569
    :cond_85
    const/16 v8, 0x21

    if-ne v0, v8, :cond_d7

    .line 1570
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 1571
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->reachedEnd:Z

    if-nez v8, :cond_62

    .line 1574
    const/16 v8, 0x44

    if-ne v0, v8, :cond_a3

    .line 1575
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->parseDocdecl()V

    .line 1576
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v8, :cond_174

    const/16 v8, 0xa

    iput v8, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    move v5, v7

    goto/16 :goto_18

    .line 1577
    :cond_a3
    const/16 v8, 0x2d

    if-ne v0, v8, :cond_b5

    .line 1578
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->parseComment()V

    .line 1579
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v8, :cond_174

    const/16 v7, 0x9

    iput v7, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    move v5, v7

    goto/16 :goto_18

    .line 1581
    :cond_b5
    new-instance v7, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "unexpected markup <!"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v7, v8, p0, v9}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v7
    :try_end_d3
    .catch Ljava/io/EOFException; {:try_start_78 .. :try_end_d3} :catch_d3

    .line 1645
    .end local v0    # "ch":C
    :catch_d3
    move-exception v1

    .line 1646
    .local v1, "ex":Ljava/io/EOFException;
    iput-boolean v5, p0, Lorg/xmlpull/mxp1/MXParser;->reachedEnd:Z

    goto :goto_62

    .line 1584
    .end local v1    # "ex":Ljava/io/EOFException;
    .restart local v0    # "ch":C
    :cond_d7
    const/16 v7, 0x2f

    if-ne v0, v7, :cond_f9

    .line 1585
    :try_start_db
    new-instance v7, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "end tag not allowed in epilog but got "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v7, v8, p0, v9}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v7

    .line 1587
    :cond_f9
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->isNameStartChar(C)Z

    move-result v7

    if-eqz v7, :cond_11d

    .line 1588
    new-instance v7, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "start tag not allowed in epilog but got "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v7, v8, p0, v9}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v7

    .line 1591
    :cond_11d
    new-instance v7, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "in epilog expected ignorable content and not "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v7, v8, p0, v9}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v7

    .line 1595
    :cond_13b
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->isS(C)Z

    move-result v8

    if-eqz v8, :cond_1c5

    .line 1596
    const/4 v2, 0x1

    .line 1597
    if-eqz v3, :cond_174

    .line 1598
    const/16 v8, 0xd

    if-ne v0, v8, :cond_187

    .line 1599
    const/4 v4, 0x1

    .line 1603
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-nez v8, :cond_15c

    .line 1604
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v8, v8, -0x1

    iput v8, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 1605
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    if-le v8, v9, :cond_17e

    .line 1606
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->joinPC()V

    .line 1613
    :cond_15c
    :goto_15c
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v9, v9

    if-lt v8, v9, :cond_168

    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v8}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 1614
    :cond_168
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    const/16 v10, 0xa

    aput-char v10, v8, v9

    .line 1634
    :cond_174
    :goto_174
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 1635
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->reachedEnd:Z

    if-eqz v8, :cond_3d

    goto/16 :goto_62

    .line 1608
    :cond_17e
    const/4 v8, 0x1

    iput-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 1609
    const/4 v8, 0x0

    iput v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iput v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    goto :goto_15c

    .line 1615
    :cond_187
    if-ne v0, v7, :cond_1a9

    .line 1616
    if-nez v4, :cond_1a7

    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v8, :cond_1a7

    .line 1617
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v9, v9

    if-lt v8, v9, :cond_19b

    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v8}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 1618
    :cond_19b
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    const/16 v10, 0xa

    aput-char v10, v8, v9

    .line 1620
    :cond_1a7
    const/4 v4, 0x0

    .line 1621
    goto :goto_174

    .line 1622
    :cond_1a9
    iget-boolean v8, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v8, :cond_1c3

    .line 1623
    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v9, v9

    if-lt v8, v9, :cond_1b9

    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v8}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 1624
    :cond_1b9
    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v10, v9, 0x1

    iput v10, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    aput-char v0, v8, v9

    .line 1626
    :cond_1c3
    const/4 v4, 0x0

    .line 1628
    goto :goto_174

    .line 1630
    :cond_1c5
    new-instance v7, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string v9, "in epilog non whitespace content is not allowed but got "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-direct {v7, v8, p0, v9}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v7
    :try_end_1e3
    .catch Ljava/io/EOFException; {:try_start_db .. :try_end_1e3} :catch_d3

    .line 1653
    .end local v0    # "ch":C
    :cond_1e3
    iput v5, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto/16 :goto_18

    .line 1655
    :cond_1e7
    new-instance v5, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v6, "internal error in parseEpilog"

    invoke-direct {v5, v6}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method protected parsePI()Z
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2414
    iget-boolean v11, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v11, :cond_8

    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    iput v11, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 2415
    :cond_8
    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->lineNumber:I

    .line 2416
    .local v2, "curLine":I
    iget v1, p0, Lorg/xmlpull/mxp1/MXParser;->columnNumber:I

    .line 2417
    .local v1, "curColumn":I
    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    iget v12, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    add-int v9, v11, v12

    .line 2418
    .local v9, "piTargetStart":I
    const/4 v8, -0x1

    .line 2419
    .local v8, "piTargetEnd":I
    iget-boolean v11, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    const/4 v12, 0x1

    if-ne v11, v12, :cond_5c

    iget-boolean v11, p0, Lorg/xmlpull/mxp1/MXParser;->roundtripSupported:Z

    if-nez v11, :cond_5c

    const/4 v5, 0x1

    .line 2420
    .local v5, "normalizeIgnorableWS":Z
    :goto_1d
    const/4 v6, 0x0

    .line 2423
    .local v6, "normalizedCR":Z
    const/4 v10, 0x0

    .line 2424
    .local v10, "seenQ":Z
    :try_start_1f
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2425
    .local v0, "ch":C
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->isS(C)Z

    move-result v11

    if-eqz v11, :cond_5e

    .line 2426
    new-instance v11, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v12, "processing instruction PITarget must be exactly after <? and not white space character"

    const/4 v13, 0x0

    invoke-direct {v11, v12, p0, v13}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v11
    :try_end_32
    .catch Ljava/io/EOFException; {:try_start_1f .. :try_end_32} :catch_32

    .line 2511
    .end local v0    # "ch":C
    :catch_32
    move-exception v3

    .line 2513
    .local v3, "ex":Ljava/io/EOFException;
    new-instance v11, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string v13, "processing instruction started on line "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string v13, " and column "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string v13, " was not closed"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12, p0, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v11

    .line 2419
    .end local v3    # "ex":Ljava/io/EOFException;
    .end local v5    # "normalizeIgnorableWS":Z
    .end local v6    # "normalizedCR":Z
    .end local v10    # "seenQ":Z
    :cond_5c
    const/4 v5, 0x0

    goto :goto_1d

    .line 2434
    .restart local v0    # "ch":C
    .restart local v5    # "normalizeIgnorableWS":Z
    .restart local v6    # "normalizedCR":Z
    .restart local v10    # "seenQ":Z
    :cond_5e
    :goto_5e
    const/16 v11, 0x3f

    if-ne v0, v11, :cond_9a

    .line 2435
    const/4 v10, 0x1

    .line 2477
    :goto_63
    if-eqz v5, :cond_95

    .line 2478
    const/16 v11, 0xd

    if-ne v0, v11, :cond_177

    .line 2479
    const/4 v6, 0x1

    .line 2483
    :try_start_6a
    iget-boolean v11, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-nez v11, :cond_7d

    .line 2484
    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v11, v11, -0x1

    iput v11, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 2485
    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v12, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    if-le v11, v12, :cond_16d

    .line 2486
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->joinPC()V

    .line 2493
    :cond_7d
    :goto_7d
    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v12, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v12, v12

    if-lt v11, v12, :cond_89

    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v11}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2494
    :cond_89
    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v12, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v13, v12, 0x1

    iput v13, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    const/16 v13, 0xa

    aput-char v13, v11, v12

    .line 2509
    :cond_95
    :goto_95
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C
    :try_end_98
    .catch Ljava/io/EOFException; {:try_start_6a .. :try_end_98} :catch_32

    move-result v0

    .line 2510
    goto :goto_5e

    .line 2436
    :cond_9a
    const/16 v11, 0x3e

    if-ne v0, v11, :cond_c7

    .line 2437
    if-eqz v10, :cond_c5

    .line 2518
    const/4 v11, -0x1

    if-ne v8, v11, :cond_ab

    .line 2519
    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v11, v11, -0x2

    iget v12, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    add-int v8, v11, v12

    .line 2523
    :cond_ab
    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    sub-int/2addr v9, v11

    .line 2524
    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    sub-int/2addr v8, v11

    .line 2525
    iget-boolean v11, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v11, :cond_c3

    .line 2526
    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v11, v11, -0x2

    iput v11, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 2527
    if-eqz v5, :cond_c3

    .line 2528
    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v11, v11, -0x1

    iput v11, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    .line 2531
    :cond_c3
    const/4 v11, 0x1

    :goto_c4
    return v11

    .line 2440
    :cond_c5
    const/4 v10, 0x0

    .line 2441
    goto :goto_63

    .line 2442
    :cond_c7
    const/4 v11, -0x1

    if-ne v8, v11, :cond_16a

    :try_start_ca
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->isS(C)Z

    move-result v11

    if-eqz v11, :cond_16a

    .line 2443
    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v11, v11, -0x1

    iget v12, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    add-int v8, v11, v12

    .line 2446
    sub-int v11, v8, v9

    const/4 v12, 0x3

    if-ne v11, v12, :cond_16a

    .line 2447
    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    aget-char v11, v11, v9

    const/16 v12, 0x78

    if-eq v11, v12, :cond_ed

    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    aget-char v11, v11, v9

    const/16 v12, 0x58

    if-ne v11, v12, :cond_16a

    :cond_ed
    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    add-int/lit8 v12, v9, 0x1

    aget-char v11, v11, v12

    const/16 v12, 0x6d

    if-eq v11, v12, :cond_101

    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    add-int/lit8 v12, v9, 0x1

    aget-char v11, v11, v12

    const/16 v12, 0x4d

    if-ne v11, v12, :cond_16a

    :cond_101
    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    add-int/lit8 v12, v9, 0x2

    aget-char v11, v11, v12

    const/16 v12, 0x6c

    if-eq v11, v12, :cond_115

    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    add-int/lit8 v12, v9, 0x2

    aget-char v11, v11, v12

    const/16 v12, 0x4c

    if-ne v11, v12, :cond_16a

    .line 2452
    :cond_115
    const/4 v11, 0x3

    if-le v9, v11, :cond_121

    .line 2453
    new-instance v11, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v12, "processing instruction can not have PITarget with reserveld xml name"

    const/4 v13, 0x0

    invoke-direct {v11, v12, p0, v13}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v11

    .line 2457
    :cond_121
    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    aget-char v11, v11, v9

    const/16 v12, 0x78

    if-eq v11, v12, :cond_146

    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    add-int/lit8 v12, v9, 0x1

    aget-char v11, v11, v12

    const/16 v12, 0x6d

    if-eq v11, v12, :cond_146

    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    add-int/lit8 v12, v9, 0x2

    aget-char v11, v11, v12

    const/16 v12, 0x6c

    if-eq v11, v12, :cond_146

    .line 2461
    new-instance v11, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v12, "XMLDecl must have xml name in lowercase"

    const/4 v13, 0x0

    invoke-direct {v11, v12, p0, v13}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v11

    .line 2466
    :cond_146
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->parseXmlDecl(C)V

    .line 2467
    iget-boolean v11, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v11, :cond_153

    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v11, v11, -0x2

    iput v11, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 2468
    :cond_153
    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    sub-int v11, v9, v11

    add-int/lit8 v7, v11, 0x3

    .line 2469
    .local v7, "off":I
    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v11, v11, -0x2

    sub-int v4, v11, v7

    .line 2470
    .local v4, "len":I
    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    invoke-virtual {p0, v11, v7, v4}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->xmlDeclContent:Ljava/lang/String;

    .line 2471
    const/4 v11, 0x0

    goto/16 :goto_c4

    .line 2475
    .end local v4    # "len":I
    .end local v7    # "off":I
    :cond_16a
    const/4 v10, 0x0

    goto/16 :goto_63

    .line 2488
    :cond_16d
    const/4 v11, 0x1

    iput-boolean v11, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 2489
    const/4 v11, 0x0

    iput v11, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iput v11, p0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    goto/16 :goto_7d

    .line 2495
    :cond_177
    const/16 v11, 0xa

    if-ne v0, v11, :cond_19c

    .line 2496
    if-nez v6, :cond_199

    iget-boolean v11, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v11, :cond_199

    .line 2497
    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v12, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v12, v12

    if-lt v11, v12, :cond_18d

    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v11}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2498
    :cond_18d
    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v12, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v13, v12, 0x1

    iput v13, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    const/16 v13, 0xa

    aput-char v13, v11, v12

    .line 2500
    :cond_199
    const/4 v6, 0x0

    .line 2501
    goto/16 :goto_95

    .line 2502
    :cond_19c
    iget-boolean v11, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v11, :cond_1b6

    .line 2503
    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v12, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v12, v12

    if-lt v11, v12, :cond_1ac

    iget v11, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v11}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 2504
    :cond_1ac
    iget-object v11, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v12, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v13, v12, 0x1

    iput v13, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    aput-char v0, v11, v12
    :try_end_1b6
    .catch Ljava/io/EOFException; {:try_start_ca .. :try_end_1b6} :catch_32

    .line 2506
    :cond_1b6
    const/4 v6, 0x0

    goto/16 :goto_95
.end method

.method protected parseProlog()I
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/16 v6, 0xa

    const/4 v10, 0x0

    const/4 v4, 0x1

    .line 1407
    iget-boolean v7, p0, Lorg/xmlpull/mxp1/MXParser;->seenMarkup:Z

    if-eqz v7, :cond_22

    .line 1408
    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v8, v8, -0x1

    aget-char v0, v7, v8

    .line 1413
    .local v0, "ch":C
    :goto_11
    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    if-nez v7, :cond_30

    .line 1417
    const v7, 0xfffe

    if-ne v0, v7, :cond_27

    .line 1418
    new-instance v4, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v5, "first character in input was UNICODE noncharacter (0xFFFE)- input requires int swapping"

    invoke-direct {v4, v5, p0, v10}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v4

    .line 1410
    .end local v0    # "ch":C
    :cond_22
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .restart local v0    # "ch":C
    goto :goto_11

    .line 1422
    :cond_27
    const v7, 0xfeff

    if-ne v0, v7, :cond_30

    .line 1424
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 1427
    :cond_30
    iput-boolean v5, p0, Lorg/xmlpull/mxp1/MXParser;->seenMarkup:Z

    .line 1428
    const/4 v1, 0x0

    .line 1429
    .local v1, "gotS":Z
    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 1430
    iget-boolean v7, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-ne v7, v4, :cond_59

    iget-boolean v7, p0, Lorg/xmlpull/mxp1/MXParser;->roundtripSupported:Z

    if-nez v7, :cond_59

    move v2, v4

    .line 1431
    .local v2, "normalizeIgnorableWS":Z
    :goto_42
    const/4 v3, 0x0

    .line 1437
    .local v3, "normalizedCR":Z
    :goto_43
    const/16 v7, 0x3c

    if-ne v0, v7, :cond_11a

    .line 1438
    if-eqz v1, :cond_5b

    iget-boolean v7, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v7, :cond_5b

    .line 1439
    iget v5, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 1440
    iput-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->seenMarkup:Z

    .line 1441
    const/4 v4, 0x7

    iput v4, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    .line 1479
    :goto_58
    return v4

    .end local v2    # "normalizeIgnorableWS":Z
    .end local v3    # "normalizedCR":Z
    :cond_59
    move v2, v5

    .line 1430
    goto :goto_42

    .line 1443
    .restart local v2    # "normalizeIgnorableWS":Z
    .restart local v3    # "normalizedCR":Z
    :cond_5b
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 1444
    const/16 v7, 0x3f

    if-ne v0, v7, :cond_7c

    .line 1447
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->parsePI()Z

    move-result v7

    if-eqz v7, :cond_72

    .line 1448
    iget-boolean v7, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v7, :cond_77

    .line 1449
    const/16 v4, 0x8

    iput v4, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto :goto_58

    .line 1453
    :cond_72
    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    iput v7, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 1454
    const/4 v1, 0x0

    .line 1523
    :cond_77
    :goto_77
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 1524
    goto :goto_43

    .line 1457
    :cond_7c
    const/16 v7, 0x21

    if-ne v0, v7, :cond_ce

    .line 1458
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 1459
    const/16 v7, 0x44

    if-ne v0, v7, :cond_a1

    .line 1460
    iget-boolean v7, p0, Lorg/xmlpull/mxp1/MXParser;->seenDocdecl:Z

    if-eqz v7, :cond_94

    .line 1461
    new-instance v4, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v5, "only one docdecl allowed in XML document"

    invoke-direct {v4, v5, p0, v10}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v4

    .line 1464
    :cond_94
    iput-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->seenDocdecl:Z

    .line 1465
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->parseDocdecl()V

    .line 1466
    iget-boolean v7, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v7, :cond_77

    iput v6, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    move v4, v6

    goto :goto_58

    .line 1467
    :cond_a1
    const/16 v7, 0x2d

    if-ne v0, v7, :cond_b1

    .line 1468
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->parseComment()V

    .line 1469
    iget-boolean v7, p0, Lorg/xmlpull/mxp1/MXParser;->tokenize:Z

    if-eqz v7, :cond_77

    const/16 v4, 0x9

    iput v4, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    goto :goto_58

    .line 1471
    :cond_b1
    new-instance v4, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "unexpected markup <!"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, p0, v10}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v4

    .line 1474
    :cond_ce
    const/16 v5, 0x2f

    if-ne v0, v5, :cond_ef

    .line 1475
    new-instance v4, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "expected start tag name and not "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, p0, v10}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v4

    .line 1477
    :cond_ef
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->isNameStartChar(C)Z

    move-result v5

    if-eqz v5, :cond_fd

    .line 1478
    iput-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->seenRoot:Z

    .line 1479
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->parseStartTag()I

    move-result v4

    goto/16 :goto_58

    .line 1481
    :cond_fd
    new-instance v4, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "expected start tag name and not "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, p0, v10}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v4

    .line 1484
    :cond_11a
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->isS(C)Z

    move-result v7

    if-eqz v7, :cond_198

    .line 1485
    const/4 v1, 0x1

    .line 1486
    if-eqz v2, :cond_77

    .line 1487
    const/16 v7, 0xd

    if-ne v0, v7, :cond_15a

    .line 1488
    const/4 v3, 0x1

    .line 1492
    iget-boolean v7, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-nez v7, :cond_13b

    .line 1493
    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 1494
    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    if-le v7, v8, :cond_153

    .line 1495
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->joinPC()V

    .line 1502
    :cond_13b
    :goto_13b
    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v8, v8

    if-lt v7, v8, :cond_147

    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v7}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 1503
    :cond_147
    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    aput-char v6, v7, v8

    goto/16 :goto_77

    .line 1497
    :cond_153
    iput-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 1498
    iput v5, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iput v5, p0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    goto :goto_13b

    .line 1504
    :cond_15a
    if-ne v0, v6, :cond_17b

    .line 1505
    if-nez v3, :cond_178

    iget-boolean v7, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v7, :cond_178

    .line 1506
    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v8, v8

    if-lt v7, v8, :cond_16e

    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v7}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 1507
    :cond_16e
    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    aput-char v6, v7, v8

    .line 1509
    :cond_178
    const/4 v3, 0x0

    .line 1510
    goto/16 :goto_77

    .line 1511
    :cond_17b
    iget-boolean v7, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    if-eqz v7, :cond_195

    .line 1512
    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    iget-object v8, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    array-length v8, v8

    if-lt v7, v8, :cond_18b

    iget v7, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    invoke-virtual {p0, v7}, Lorg/xmlpull/mxp1/MXParser;->ensurePC(I)V

    .line 1513
    :cond_18b
    iget-object v7, p0, Lorg/xmlpull/mxp1/MXParser;->pc:[C

    iget v8, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    aput-char v0, v7, v8

    .line 1515
    :cond_195
    const/4 v3, 0x0

    .line 1517
    goto/16 :goto_77

    .line 1519
    :cond_198
    new-instance v4, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string v6, "only whitespace content allowed before start tag and not "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, p0, v10}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public parseStartTag()I
    .registers 24
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1724
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->depth:I

    .line 1726
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, -0x2

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    .line 1728
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->emptyElementTag:Z

    .line 1729
    const/16 v17, 0x0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    .line 1731
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v18, v0

    add-int v14, v17, v18

    .line 1732
    .local v14, "nameStart":I
    const/4 v9, -0x1

    .line 1733
    .local v9, "colonPos":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v18, v0

    add-int/lit8 v18, v18, -0x1

    aget-char v8, v17, v18

    .line 1734
    .local v8, "ch":C
    const/16 v17, 0x3a

    move/from16 v0, v17

    if-ne v8, v0, :cond_7d

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    move/from16 v17, v0

    if-eqz v17, :cond_7d

    new-instance v17, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v18, "when namespaces processing enabled colon can not be at element name start"

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, p0

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v17

    .line 1744
    :cond_6d
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v18, v0

    add-int v9, v17, v18

    .line 1738
    :cond_7d
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v8

    .line 1739
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/xmlpull/mxp1/MXParser;->isNameChar(C)Z

    move-result v17

    if-nez v17, :cond_1a9

    .line 1749
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->ensureElementsCapacity()V

    .line 1754
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v17, v0

    add-int/lit8 v17, v17, -0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v18, v0

    sub-int v18, v14, v18

    sub-int v10, v17, v18

    .line 1755
    .local v10, "elLen":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elRawName:[[C

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v18, v0

    aget-object v17, v17, v18

    if-eqz v17, :cond_c5

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elRawName:[[C

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v18, v0

    aget-object v17, v17, v18

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v0, v10, :cond_db

    .line 1756
    :cond_c5
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elRawName:[[C

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v18, v0

    mul-int/lit8 v19, v10, 0x2

    move/from16 v0, v19

    new-array v0, v0, [C

    move-object/from16 v19, v0

    aput-object v19, v17, v18

    .line 1758
    :cond_db
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v18, v0

    sub-int v18, v14, v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elRawName:[[C

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v20, v0

    aget-object v19, v19, v20

    const/16 v20, 0x0

    move-object/from16 v0, v17

    move/from16 v1, v18

    move-object/from16 v2, v19

    move/from16 v3, v20

    invoke-static {v0, v1, v2, v3, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1759
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elRawNameEnd:[I

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v18, v0

    aput v10, v17, v18

    .line 1760
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elRawNameLine:[I

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->lineNumber:I

    move/from16 v19, v0

    aput v19, v17, v18

    .line 1762
    const/4 v13, 0x0

    .line 1765
    .local v13, "name":Ljava/lang/String;
    const/4 v15, 0x0

    .line 1766
    .local v15, "prefix":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    move/from16 v17, v0

    if-eqz v17, :cond_205

    .line 1767
    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v9, v0, :cond_1cf

    .line 1768
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elPrefix:[Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v20, v0

    sub-int v20, v14, v20

    sub-int v21, v9, v14

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v15

    .end local v15    # "prefix":Ljava/lang/String;
    aput-object v15, v17, v18

    .line 1770
    .restart local v15    # "prefix":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elName:[Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v19, v0

    add-int/lit8 v20, v9, 0x1

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v21, v0

    sub-int v20, v20, v21

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v21, v0

    add-int/lit8 v21, v21, -0x2

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v22, v0

    sub-int v22, v9, v22

    sub-int v21, v21, v22

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v13

    .end local v13    # "name":Ljava/lang/String;
    aput-object v13, v17, v18

    .line 1786
    .restart local v13    # "name":Ljava/lang/String;
    :goto_19c
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/xmlpull/mxp1/MXParser;->isS(C)Z

    move-result v17

    if-eqz v17, :cond_22d

    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v8

    goto :goto_19c

    .line 1740
    .end local v10    # "elLen":I
    .end local v13    # "name":Ljava/lang/String;
    .end local v15    # "prefix":Ljava/lang/String;
    :cond_1a9
    const/16 v17, 0x3a

    move/from16 v0, v17

    if-ne v8, v0, :cond_7d

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    move/from16 v17, v0

    if-eqz v17, :cond_7d

    .line 1741
    const/16 v17, -0x1

    move/from16 v0, v17

    if-eq v9, v0, :cond_6d

    new-instance v17, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v18, "only one colon is allowed in name of element when namespaces are enabled"

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, p0

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v17

    .line 1774
    .restart local v10    # "elLen":I
    .restart local v13    # "name":Ljava/lang/String;
    .restart local v15    # "prefix":Ljava/lang/String;
    :cond_1cf
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elPrefix:[Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v18, v0

    const/4 v15, 0x0

    aput-object v15, v17, v18

    .line 1775
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elName:[Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v20, v0

    sub-int v20, v14, v20

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2, v10}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v13

    .end local v13    # "name":Ljava/lang/String;
    aput-object v13, v17, v18

    .line 1777
    .restart local v13    # "name":Ljava/lang/String;
    goto :goto_19c

    .line 1779
    :cond_205
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elName:[Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    move/from16 v20, v0

    sub-int v20, v14, v20

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2, v10}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v13

    .end local v13    # "name":Ljava/lang/String;
    aput-object v13, v17, v18

    .restart local v13    # "name":Ljava/lang/String;
    goto/16 :goto_19c

    .line 1788
    :cond_22d
    const/16 v17, 0x3e

    move/from16 v0, v17

    if-ne v8, v0, :cond_297

    .line 1810
    :cond_233
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    move/from16 v17, v0

    if-eqz v17, :cond_47e

    .line 1811
    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lorg/xmlpull/mxp1/MXParser;->getNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 1812
    .local v16, "uri":Ljava/lang/String;
    if-nez v16, :cond_247

    .line 1813
    if-nez v15, :cond_32d

    .line 1814
    const-string v16, ""

    .line 1822
    :cond_247
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elUri:[Ljava/lang/String;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v18, v0

    aput-object v16, v17, v18

    .line 1830
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_256
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v11, v0, :cond_369

    .line 1832
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributePrefix:[Ljava/lang/String;

    move-object/from16 v17, v0

    aget-object v6, v17, v11

    .line 1833
    .local v6, "attrPrefix":Ljava/lang/String;
    if-eqz v6, :cond_35e

    .line 1834
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lorg/xmlpull/mxp1/MXParser;->getNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1835
    .local v7, "attrUri":Ljava/lang/String;
    if-nez v7, :cond_352

    .line 1836
    new-instance v17, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "could not determine namespace bound to attribute prefix "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, p0

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v17

    .line 1790
    .end local v6    # "attrPrefix":Ljava/lang/String;
    .end local v7    # "attrUri":Ljava/lang/String;
    .end local v11    # "i":I
    .end local v16    # "uri":Ljava/lang/String;
    :cond_297
    const/16 v17, 0x2f

    move/from16 v0, v17

    if-ne v8, v0, :cond_2f2

    .line 1791
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->emptyElementTag:Z

    move/from16 v17, v0

    if-eqz v17, :cond_2b7

    new-instance v17, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v18, "repeated / in tag declaration"

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, p0

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v17

    .line 1793
    :cond_2b7
    const/16 v17, 0x1

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/xmlpull/mxp1/MXParser;->emptyElementTag:Z

    .line 1794
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v8

    .line 1795
    const/16 v17, 0x3e

    move/from16 v0, v17

    if-eq v8, v0, :cond_233

    new-instance v17, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "expected > to end empty tag not "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, p0

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v17

    .line 1798
    :cond_2f2
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/xmlpull/mxp1/MXParser;->isNameStartChar(C)Z

    move-result v17

    if-eqz v17, :cond_304

    .line 1799
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->parseAttribute()C

    move-result v8

    .line 1800
    invoke-virtual/range {p0 .. p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v8

    .line 1801
    goto/16 :goto_19c

    .line 1803
    :cond_304
    new-instance v17, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "start tag unexpected character "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, p0

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v17

    .line 1816
    .restart local v16    # "uri":Ljava/lang/String;
    :cond_32d
    new-instance v17, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "could not determine namespace bound to element prefix "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, p0

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v17

    .line 1841
    .restart local v6    # "attrPrefix":Ljava/lang/String;
    .restart local v7    # "attrUri":Ljava/lang/String;
    .restart local v11    # "i":I
    :cond_352
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v17, v0

    aput-object v7, v17, v11

    .line 1830
    .end local v7    # "attrUri":Ljava/lang/String;
    :goto_35a
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_256

    .line 1843
    :cond_35e
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v17, v0

    const-string v18, ""

    aput-object v18, v17, v11

    goto :goto_35a

    .line 1851
    .end local v6    # "attrPrefix":Ljava/lang/String;
    :cond_369
    const/4 v11, 0x1

    :goto_36a
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v11, v0, :cond_527

    .line 1853
    const/4 v12, 0x0

    .local v12, "j":I
    :goto_375
    if-ge v12, v11, :cond_47a

    .line 1855
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v17, v0

    aget-object v17, v17, v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v18, v0

    aget-object v18, v18, v11

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_476

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    move/from16 v17, v0

    if-eqz v17, :cond_3ab

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v17, v0

    aget-object v17, v17, v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v18, v0

    aget-object v18, v18, v11

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_3df

    :cond_3ab
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    move/from16 v17, v0

    if-nez v17, :cond_476

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeNameHash:[I

    move-object/from16 v17, v0

    aget v17, v17, v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeNameHash:[I

    move-object/from16 v18, v0

    aget v18, v18, v11

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_476

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v17, v0

    aget-object v17, v17, v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v18, v0

    aget-object v18, v18, v11

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_476

    .line 1863
    :cond_3df
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v17, v0

    aget-object v4, v17, v12

    .line 1864
    .local v4, "attr1":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v17, v0

    aget-object v17, v17, v12

    if-eqz v17, :cond_412

    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v18, v0

    aget-object v18, v18, v12

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    const-string v18, ":"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1865
    :cond_412
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v17, v0

    aget-object v5, v17, v11

    .line 1866
    .local v5, "attr2":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v17, v0

    aget-object v17, v17, v11

    if-eqz v17, :cond_445

    new-instance v17, Ljava/lang/StringBuffer;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeUri:[Ljava/lang/String;

    move-object/from16 v18, v0

    aget-object v18, v18, v11

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    const-string v18, ":"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1867
    :cond_445
    new-instance v17, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "duplicated attributes "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, " and "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, p0

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v17

    .line 1853
    .end local v4    # "attr1":Ljava/lang/String;
    .end local v5    # "attr2":Ljava/lang/String;
    :cond_476
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_375

    .line 1851
    :cond_47a
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_36a

    .line 1878
    .end local v11    # "i":I
    .end local v12    # "j":I
    .end local v16    # "uri":Ljava/lang/String;
    :cond_47e
    const/4 v11, 0x1

    .restart local v11    # "i":I
    :goto_47f
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    move/from16 v17, v0

    move/from16 v0, v17

    if-ge v11, v0, :cond_527

    .line 1880
    const/4 v12, 0x0

    .restart local v12    # "j":I
    :goto_48a
    if-ge v12, v11, :cond_523

    .line 1882
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    move/from16 v17, v0

    if-eqz v17, :cond_4aa

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v17, v0

    aget-object v17, v17, v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v18, v0

    aget-object v18, v18, v11

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_4de

    :cond_4aa
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/xmlpull/mxp1/MXParser;->allStringsInterned:Z

    move/from16 v17, v0

    if-nez v17, :cond_51f

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeNameHash:[I

    move-object/from16 v17, v0

    aget v17, v17, v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeNameHash:[I

    move-object/from16 v18, v0

    aget v18, v18, v11

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_51f

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v17, v0

    aget-object v17, v17, v12

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v18, v0

    aget-object v18, v18, v11

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_51f

    .line 1889
    :cond_4de
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v17, v0

    aget-object v4, v17, v12

    .line 1890
    .restart local v4    # "attr1":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->attributeName:[Ljava/lang/String;

    move-object/from16 v17, v0

    aget-object v5, v17, v11

    .line 1891
    .restart local v5    # "attr2":Ljava/lang/String;
    new-instance v17, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v18, Ljava/lang/StringBuffer;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuffer;-><init>()V

    const-string v19, "duplicated attributes "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    const-string v19, " and "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    const/16 v19, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, p0

    move-object/from16 v3, v19

    invoke-direct {v0, v1, v2, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v17

    .line 1880
    .end local v4    # "attr1":Ljava/lang/String;
    .end local v5    # "attr2":Ljava/lang/String;
    :cond_51f
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_48a

    .line 1878
    :cond_523
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_47f

    .line 1898
    .end local v12    # "j":I
    :cond_527
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/xmlpull/mxp1/MXParser;->elNamespaceCount:[I

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    move/from16 v18, v0

    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    move/from16 v19, v0

    aput v19, v17, v18

    .line 1899
    move-object/from16 v0, p0

    iget v0, v0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    move/from16 v17, v0

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    .line 1900
    const/16 v17, 0x2

    move/from16 v0, v17

    move-object/from16 v1, p0

    iput v0, v1, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    return v17
.end method

.method protected parseXmlDecl(C)V
    .registers 9
    .param p1, "ch"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v6, 0x0

    .line 2554
    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/xmlpull/mxp1/MXParser;->preventBufferCompaction:Z

    .line 2555
    iput v4, p0, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    .line 2561
    invoke-virtual {p0, p1}, Lorg/xmlpull/mxp1/MXParser;->skipS(C)C

    move-result p1

    .line 2562
    sget-object v3, Lorg/xmlpull/mxp1/MXParser;->VERSION:[C

    invoke-virtual {p0, p1, v3}, Lorg/xmlpull/mxp1/MXParser;->requireInput(C[C)C

    move-result p1

    .line 2564
    invoke-virtual {p0, p1}, Lorg/xmlpull/mxp1/MXParser;->skipS(C)C

    move-result p1

    .line 2565
    const/16 v3, 0x3d

    if-eq p1, v3, :cond_36

    .line 2566
    new-instance v3, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "expected equals sign (=) after version and not "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, p1}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, p0, v6}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v3

    .line 2569
    :cond_36
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result p1

    .line 2570
    invoke-virtual {p0, p1}, Lorg/xmlpull/mxp1/MXParser;->skipS(C)C

    move-result p1

    .line 2571
    const/16 v3, 0x27

    if-eq p1, v3, :cond_63

    const/16 v3, 0x22

    if-eq p1, v3, :cond_63

    .line 2572
    new-instance v3, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "expected apostrophe (\') or quotation mark (\") after version and not "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, p1}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, p0, v6}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v3

    .line 2576
    :cond_63
    move v0, p1

    .line 2578
    .local v0, "quotChar":C
    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    .line 2579
    .local v2, "versionStart":I
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result p1

    .line 2581
    :goto_6a
    if-eq p1, v0, :cond_b6

    .line 2582
    const/16 v3, 0x61

    if-lt p1, v3, :cond_74

    const/16 v3, 0x7a

    if-le p1, v3, :cond_b1

    :cond_74
    const/16 v3, 0x41

    if-lt p1, v3, :cond_7c

    const/16 v3, 0x5a

    if-le p1, v3, :cond_b1

    :cond_7c
    const/16 v3, 0x30

    if-lt p1, v3, :cond_84

    const/16 v3, 0x39

    if-le p1, v3, :cond_b1

    :cond_84
    const/16 v3, 0x5f

    if-eq p1, v3, :cond_b1

    const/16 v3, 0x2e

    if-eq p1, v3, :cond_b1

    const/16 v3, 0x3a

    if-eq p1, v3, :cond_b1

    const/16 v3, 0x2d

    if-eq p1, v3, :cond_b1

    .line 2585
    new-instance v3, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string v5, "<?xml version value expected to be in ([a-zA-Z0-9_.:] | \'-\') not "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p0, p1}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, p0, v6}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v3

    .line 2589
    :cond_b1
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result p1

    .line 2590
    goto :goto_6a

    .line 2591
    :cond_b6
    iget v3, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v1, v3, -0x1

    .line 2592
    .local v1, "versionEnd":I
    invoke-virtual {p0, v2, v1}, Lorg/xmlpull/mxp1/MXParser;->parseXmlDeclWithVersion(II)V

    .line 2593
    iput-boolean v4, p0, Lorg/xmlpull/mxp1/MXParser;->preventBufferCompaction:Z

    .line 2594
    return-void
.end method

.method protected parseXmlDeclWithVersion(II)V
    .registers 16
    .param p1, "versionStart"    # I
    .param p2, "versionEnd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v12, 0x30

    const/16 v10, 0x2e

    const/16 v9, 0x27

    const/16 v8, 0x22

    const/4 v11, 0x0

    .line 2600
    iget-object v3, p0, Lorg/xmlpull/mxp1/MXParser;->inputEncoding:Ljava/lang/String;

    .line 2603
    .local v3, "oldEncoding":Ljava/lang/String;
    sub-int v6, p2, p1

    const/4 v7, 0x3

    if-ne v6, v7, :cond_28

    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    aget-char v6, v6, p1

    const/16 v7, 0x31

    if-ne v6, v7, :cond_28

    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    add-int/lit8 v7, p1, 0x1

    aget-char v6, v6, v7

    if-ne v6, v10, :cond_28

    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    add-int/lit8 v7, p1, 0x2

    aget-char v6, v6, v7

    if-eq v6, v12, :cond_54

    .line 2608
    :cond_28
    new-instance v6, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "only 1.0 is supported as <?xml version not \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    new-instance v8, Ljava/lang/String;

    iget-object v9, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    sub-int v10, p2, p1

    invoke-direct {v8, v9, p1, v10}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {p0, v8}, Lorg/xmlpull/mxp1/MXParser;->printable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v6

    .line 2612
    :cond_54
    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    sub-int v7, p2, p1

    invoke-virtual {p0, v6, p1, v7}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->xmlDeclVersion:Ljava/lang/String;

    .line 2615
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2616
    .local v0, "ch":C
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->skipS(C)C

    move-result v0

    .line 2617
    const/16 v6, 0x65

    if-ne v0, v6, :cond_150

    .line 2618
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2619
    sget-object v6, Lorg/xmlpull/mxp1/MXParser;->NCODING:[C

    invoke-virtual {p0, v0, v6}, Lorg/xmlpull/mxp1/MXParser;->requireInput(C[C)C

    move-result v0

    .line 2620
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->skipS(C)C

    move-result v0

    .line 2621
    const/16 v6, 0x3d

    if-eq v0, v6, :cond_99

    .line 2622
    new-instance v6, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected equals sign (=) after encoding and not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v6

    .line 2625
    :cond_99
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2626
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->skipS(C)C

    move-result v0

    .line 2627
    if-eq v0, v9, :cond_c2

    if-eq v0, v8, :cond_c2

    .line 2628
    new-instance v6, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected apostrophe (\') or quotation mark (\") after encoding and not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v6

    .line 2632
    :cond_c2
    move v4, v0

    .line 2633
    .local v4, "quotChar":C
    iget v2, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    .line 2634
    .local v2, "encodingStart":I
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2636
    const/16 v6, 0x61

    if-lt v0, v6, :cond_d1

    const/16 v6, 0x7a

    if-le v0, v6, :cond_f6

    :cond_d1
    const/16 v6, 0x41

    if-lt v0, v6, :cond_d9

    const/16 v6, 0x5a

    if-le v0, v6, :cond_f6

    .line 2638
    :cond_d9
    new-instance v6, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "<?xml encoding name expected to start with [A-Za-z] not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v6

    .line 2642
    :cond_f6
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2643
    :goto_fa
    if-eq v0, v4, :cond_13e

    .line 2644
    const/16 v6, 0x61

    if-lt v0, v6, :cond_104

    const/16 v6, 0x7a

    if-le v0, v6, :cond_139

    :cond_104
    const/16 v6, 0x41

    if-lt v0, v6, :cond_10c

    const/16 v6, 0x5a

    if-le v0, v6, :cond_139

    :cond_10c
    if-lt v0, v12, :cond_112

    const/16 v6, 0x39

    if-le v0, v6, :cond_139

    :cond_112
    if-eq v0, v10, :cond_139

    const/16 v6, 0x5f

    if-eq v0, v6, :cond_139

    const/16 v6, 0x2d

    if-eq v0, v6, :cond_139

    .line 2647
    new-instance v6, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "<?xml encoding value expected to be in ([A-Za-z0-9._] | \'-\') not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v6

    .line 2651
    :cond_139
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2652
    goto :goto_fa

    .line 2653
    :cond_13e
    iget v6, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    add-int/lit8 v1, v6, -0x1

    .line 2657
    .local v1, "encodingEnd":I
    iget-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->buf:[C

    sub-int v7, v1, v2

    invoke-virtual {p0, v6, v2, v7}, Lorg/xmlpull/mxp1/MXParser;->newString([CII)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->inputEncoding:Ljava/lang/String;

    .line 2658
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2661
    .end local v1    # "encodingEnd":I
    .end local v2    # "encodingStart":I
    .end local v4    # "quotChar":C
    :cond_150
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->skipS(C)C

    move-result v0

    .line 2663
    const/16 v6, 0x73

    if-ne v0, v6, :cond_226

    .line 2664
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2665
    sget-object v6, Lorg/xmlpull/mxp1/MXParser;->TANDALONE:[C

    invoke-virtual {p0, v0, v6}, Lorg/xmlpull/mxp1/MXParser;->requireInput(C[C)C

    move-result v0

    .line 2666
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->skipS(C)C

    move-result v0

    .line 2667
    const/16 v6, 0x3d

    if-eq v0, v6, :cond_187

    .line 2668
    new-instance v6, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected equals sign (=) after standalone and not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v6

    .line 2672
    :cond_187
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2673
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->skipS(C)C

    move-result v0

    .line 2674
    if-eq v0, v9, :cond_1b0

    if-eq v0, v8, :cond_1b0

    .line 2675
    new-instance v6, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected apostrophe (\') or quotation mark (\") after encoding and not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v6

    .line 2679
    :cond_1b0
    move v4, v0

    .line 2680
    .restart local v4    # "quotChar":C
    iget v5, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    .line 2681
    .local v5, "standaloneStart":I
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2682
    const/16 v6, 0x79

    if-ne v0, v6, :cond_1f2

    .line 2683
    sget-object v6, Lorg/xmlpull/mxp1/MXParser;->YES:[C

    invoke-virtual {p0, v0, v6}, Lorg/xmlpull/mxp1/MXParser;->requireInput(C[C)C

    move-result v0

    .line 2685
    new-instance v6, Ljava/lang/Boolean;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Ljava/lang/Boolean;-><init>(Z)V

    iput-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->xmlDeclStandalone:Ljava/lang/Boolean;

    .line 2695
    :goto_1c9
    if-eq v0, v4, :cond_222

    .line 2696
    new-instance v6, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string v8, " after standalone value not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v6

    .line 2686
    :cond_1f2
    const/16 v6, 0x6e

    if-ne v0, v6, :cond_205

    .line 2687
    sget-object v6, Lorg/xmlpull/mxp1/MXParser;->NO:[C

    invoke-virtual {p0, v0, v6}, Lorg/xmlpull/mxp1/MXParser;->requireInput(C[C)C

    move-result v0

    .line 2689
    new-instance v6, Ljava/lang/Boolean;

    const/4 v7, 0x0

    invoke-direct {v6, v7}, Ljava/lang/Boolean;-><init>(Z)V

    iput-object v6, p0, Lorg/xmlpull/mxp1/MXParser;->xmlDeclStandalone:Ljava/lang/Boolean;

    goto :goto_1c9

    .line 2691
    :cond_205
    new-instance v6, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected \'yes\' or \'no\' after standalone and not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v6

    .line 2700
    :cond_222
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2704
    .end local v4    # "quotChar":C
    .end local v5    # "standaloneStart":I
    :cond_226
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->skipS(C)C

    move-result v0

    .line 2705
    const/16 v6, 0x3f

    if-eq v0, v6, :cond_24b

    .line 2706
    new-instance v6, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected ?> as last part of <?xml not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v6

    .line 2710
    :cond_24b
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 2711
    const/16 v6, 0x3e

    if-eq v0, v6, :cond_270

    .line 2712
    new-instance v6, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "expected ?> as last part of <?xml not "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, p0, v11}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v6

    .line 2735
    :cond_270
    return-void
.end method

.method protected printable(C)Ljava/lang/String;
    .registers 4
    .param p1, "ch"    # C

    .prologue
    .line 3223
    const/16 v0, 0xa

    if-ne p1, v0, :cond_7

    .line 3224
    const-string v0, "\\n"

    .line 3234
    :goto_6
    return-object v0

    .line 3225
    :cond_7
    const/16 v0, 0xd

    if-ne p1, v0, :cond_e

    .line 3226
    const-string v0, "\\r"

    goto :goto_6

    .line 3227
    :cond_e
    const/16 v0, 0x9

    if-ne p1, v0, :cond_15

    .line 3228
    const-string v0, "\\t"

    goto :goto_6

    .line 3229
    :cond_15
    const/16 v0, 0x27

    if-ne p1, v0, :cond_1c

    .line 3230
    const-string v0, "\\\'"

    goto :goto_6

    .line 3231
    :cond_1c
    const/16 v0, 0x7f

    if-gt p1, v0, :cond_24

    const/16 v0, 0x20

    if-ge p1, v0, :cond_3c

    .line 3232
    :cond_24
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "\\u"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 3234
    :cond_3c
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method protected printable(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 3238
    if-nez p1, :cond_4

    const/4 v3, 0x0

    .line 3245
    :goto_3
    return-object v3

    .line 3239
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 3240
    .local v2, "sLen":I
    new-instance v0, Ljava/lang/StringBuffer;

    add-int/lit8 v3, v2, 0xa

    invoke-direct {v0, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 3241
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_10
    if-ge v1, v2, :cond_20

    .line 3242
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {p0, v3}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3241
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    .line 3244
    :cond_20
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    move-object v3, p1

    .line 3245
    goto :goto_3
.end method

.method public require(ILjava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "type"    # I
    .param p2, "namespace"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 974
    iget-boolean v0, p0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    if-nez v0, :cond_2f

    if-eqz p2, :cond_2f

    .line 975
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "processing namespaces must be enabled on parser (or factory) to have possible namespaces declared on elements"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, " (position:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getPositionDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 980
    :cond_2f
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getEventType()I

    move-result v0

    if-ne p1, v0, :cond_4d

    if-eqz p2, :cond_41

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getNamespace()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4d

    :cond_41
    if-eqz p3, :cond_19b

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19b

    .line 984
    :cond_4d
    new-instance v1, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "expected event "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    sget-object v2, Lorg/xmlpull/v1/XmlPullParser;->TYPES:[Ljava/lang/String;

    aget-object v2, v2, p1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    if-eqz p3, :cond_181

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, " with name \'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v3, "\'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_7d
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    if-eqz p2, :cond_185

    if-eqz p3, :cond_185

    const-string v0, " and"

    :goto_87
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    if-eqz p2, :cond_189

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, " with namespace \'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v3, "\'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_a6
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, " but got"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getEventType()I

    move-result v0

    if-eq p1, v0, :cond_18d

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, " "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    sget-object v3, Lorg/xmlpull/v1/XmlPullParser;->TYPES:[Ljava/lang/String;

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getEventType()I

    move-result v4

    aget-object v3, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_d1
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    if-eqz p3, :cond_191

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_191

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_191

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, " name \'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v3, "\'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_104
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    if-eqz p2, :cond_195

    if-eqz p3, :cond_195

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_195

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_195

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getNamespace()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_195

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getNamespace()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_195

    const-string v0, " and"

    :goto_12e
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    if-eqz p2, :cond_198

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getNamespace()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_198

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getNamespace()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_198

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, " namespace \'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getNamespace()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v3, "\'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_161
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, " (position:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->getPositionDescription()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_181
    const-string v0, ""

    goto/16 :goto_7d

    :cond_185
    const-string v0, ""

    goto/16 :goto_87

    :cond_189
    const-string v0, ""

    goto/16 :goto_a6

    :cond_18d
    const-string v0, ""

    goto/16 :goto_d1

    :cond_191
    const-string v0, ""

    goto/16 :goto_104

    :cond_195
    const-string v0, ""

    goto :goto_12e

    :cond_198
    const-string v0, ""

    goto :goto_161

    .line 1001
    :cond_19b
    return-void
.end method

.method protected requireInput(C[C)C
    .registers 7
    .param p1, "ch"    # C
    .param p2, "input"    # [C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3094
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p2

    if-ge v0, v1, :cond_4c

    .line 3096
    aget-char v1, p2, v0

    if-eq p1, v1, :cond_45

    .line 3097
    new-instance v1, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "expected "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    aget-char v3, p2, v0

    invoke-virtual {p0, v3}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, p2}, Ljava/lang/String;-><init>([C)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " and not "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0, p1}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, p0, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v1

    .line 3101
    :cond_45
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result p1

    .line 3094
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 3103
    :cond_4c
    return p1
.end method

.method protected requireNextS()C
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3109
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result v0

    .line 3110
    .local v0, "ch":C
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->isS(C)Z

    move-result v1

    if-nez v1, :cond_28

    .line 3111
    new-instance v1, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "white space is required and not "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->printable(C)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v2, p0, v3}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v1

    .line 3114
    :cond_28
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->skipS(C)C

    move-result v1

    return v1
.end method

.method protected reset()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 382
    iput-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->location:Ljava/lang/String;

    .line 383
    const/4 v0, 0x1

    iput v0, p0, Lorg/xmlpull/mxp1/MXParser;->lineNumber:I

    .line 384
    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->columnNumber:I

    .line 385
    iput-boolean v1, p0, Lorg/xmlpull/mxp1/MXParser;->seenRoot:Z

    .line 386
    iput-boolean v1, p0, Lorg/xmlpull/mxp1/MXParser;->reachedEnd:Z

    .line 387
    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    .line 388
    iput-boolean v1, p0, Lorg/xmlpull/mxp1/MXParser;->emptyElementTag:Z

    .line 390
    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->depth:I

    .line 392
    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->attributeCount:I

    .line 394
    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->namespaceEnd:I

    .line 396
    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->entityEnd:I

    .line 398
    iput-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->reader:Ljava/io/Reader;

    .line 399
    iput-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->inputEncoding:Ljava/lang/String;

    .line 401
    iput-boolean v1, p0, Lorg/xmlpull/mxp1/MXParser;->preventBufferCompaction:Z

    .line 402
    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->bufAbsoluteStart:I

    .line 403
    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->bufStart:I

    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->bufEnd:I

    .line 404
    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->posEnd:I

    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->posStart:I

    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->pos:I

    .line 406
    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->pcStart:I

    iput v1, p0, Lorg/xmlpull/mxp1/MXParser;->pcEnd:I

    .line 408
    iput-boolean v1, p0, Lorg/xmlpull/mxp1/MXParser;->usePC:Z

    .line 410
    iput-boolean v1, p0, Lorg/xmlpull/mxp1/MXParser;->seenStartTag:Z

    .line 411
    iput-boolean v1, p0, Lorg/xmlpull/mxp1/MXParser;->seenEndTag:Z

    .line 412
    iput-boolean v1, p0, Lorg/xmlpull/mxp1/MXParser;->pastEndTag:Z

    .line 413
    iput-boolean v1, p0, Lorg/xmlpull/mxp1/MXParser;->seenAmpersand:Z

    .line 414
    iput-boolean v1, p0, Lorg/xmlpull/mxp1/MXParser;->seenMarkup:Z

    .line 415
    iput-boolean v1, p0, Lorg/xmlpull/mxp1/MXParser;->seenDocdecl:Z

    .line 417
    iput-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->xmlDeclVersion:Ljava/lang/String;

    .line 418
    iput-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->xmlDeclStandalone:Ljava/lang/Boolean;

    .line 419
    iput-object v2, p0, Lorg/xmlpull/mxp1/MXParser;->xmlDeclContent:Ljava/lang/String;

    .line 421
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->resetStringCache()V

    .line 422
    return-void
.end method

.method protected resetStringCache()V
    .registers 1

    .prologue
    .line 65
    return-void
.end method

.method public setFeature(Ljava/lang/String;Z)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "state"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 440
    if-nez p1, :cond_a

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "feature name should not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 441
    :cond_a
    const-string v0, "http://xmlpull.org/v1/doc/features.html#process-namespaces"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 442
    iget v0, p0, Lorg/xmlpull/mxp1/MXParser;->eventType:I

    if-eqz v0, :cond_1f

    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v1, "namespace processing feature can only be changed before parsing"

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v0

    .line 444
    :cond_1f
    iput-boolean p2, p0, Lorg/xmlpull/mxp1/MXParser;->processNamespaces:Z

    .line 470
    :cond_21
    :goto_21
    return-void

    .line 449
    :cond_22
    const-string v0, "http://xmlpull.org/v1/doc/features.html#names-interned"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    .line 450
    if-eqz p2, :cond_21

    .line 451
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v1, "interning names in this implementation is not supported"

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 454
    :cond_34
    const-string v0, "http://xmlpull.org/v1/doc/features.html#process-docdecl"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    .line 455
    if-eqz p2, :cond_21

    .line 456
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v1, "processing DOCDECL is not supported"

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 461
    :cond_46
    const-string v0, "http://xmlpull.org/v1/doc/features.html#xml-roundtrip"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_51

    .line 466
    iput-boolean p2, p0, Lorg/xmlpull/mxp1/MXParser;->roundtripSupported:Z

    goto :goto_21

    .line 468
    :cond_51
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "unsupported feature "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setInput(Ljava/io/InputStream;Ljava/lang/String;)V
    .registers 8
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "inputEncoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 530
    if-nez p1, :cond_a

    .line 531
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "input stream can not be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 533
    :cond_a
    iput-object p1, p0, Lorg/xmlpull/mxp1/MXParser;->inputStream:Ljava/io/InputStream;

    .line 537
    if-eqz p2, :cond_19

    .line 538
    :try_start_e
    new-instance v0, Ljava/io/InputStreamReader;

    invoke-direct {v0, p1, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_13
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_e .. :try_end_13} :catch_21

    .line 550
    .local v0, "reader":Ljava/io/Reader;
    :goto_13
    invoke-virtual {p0, v0}, Lorg/xmlpull/mxp1/MXParser;->setInput(Ljava/io/Reader;)V

    .line 552
    iput-object p2, p0, Lorg/xmlpull/mxp1/MXParser;->inputEncoding:Ljava/lang/String;

    .line 553
    return-void

    .line 541
    .end local v0    # "reader":Ljava/io/Reader;
    :cond_19
    :try_start_19
    new-instance v0, Ljava/io/InputStreamReader;

    const-string v2, "UTF-8"

    invoke-direct {v0, p1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_20
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_19 .. :try_end_20} :catch_21

    .restart local v0    # "reader":Ljava/io/Reader;
    goto :goto_13

    .line 543
    .end local v0    # "reader":Ljava/io/Reader;
    :catch_21
    move-exception v1

    .line 544
    .local v1, "une":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "could not create reader for encoding "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, " : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, p0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setInput(Ljava/io/Reader;)V
    .registers 2
    .param p1, "in"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 523
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->reset()V

    .line 524
    iput-object p1, p0, Lorg/xmlpull/mxp1/MXParser;->reader:Ljava/io/Reader;

    .line 525
    return-void
.end method

.method public setProperty(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 497
    const-string v0, "http://xmlpull.org/v1/doc/properties.html#location"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 498
    check-cast p2, Ljava/lang/String;

    .end local p2    # "value":Ljava/lang/Object;
    iput-object p2, p0, Lorg/xmlpull/mxp1/MXParser;->location:Ljava/lang/String;

    .line 502
    return-void

    .line 500
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_d
    new-instance v0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "unsupported property: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected skipS(C)C
    .registers 3
    .param p1, "ch"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 3120
    :goto_0
    invoke-virtual {p0, p1}, Lorg/xmlpull/mxp1/MXParser;->isS(C)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->more()C

    move-result p1

    goto :goto_0

    .line 3121
    :cond_b
    return p1
.end method

.method public skipSubTree()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x2

    .line 1012
    invoke-virtual {p0, v3, v2, v2}, Lorg/xmlpull/mxp1/MXParser;->require(ILjava/lang/String;Ljava/lang/String;)V

    .line 1013
    const/4 v1, 0x1

    .line 1014
    .local v1, "level":I
    :cond_6
    :goto_6
    if-lez v1, :cond_17

    .line 1015
    invoke-virtual {p0}, Lorg/xmlpull/mxp1/MXParser;->next()I

    move-result v0

    .line 1016
    .local v0, "eventType":I
    const/4 v2, 0x3

    if-ne v0, v2, :cond_12

    .line 1017
    add-int/lit8 v1, v1, -0x1

    .line 1018
    goto :goto_6

    :cond_12
    if-ne v0, v3, :cond_6

    .line 1019
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    .line 1022
    .end local v0    # "eventType":I
    :cond_17
    return-void
.end method
